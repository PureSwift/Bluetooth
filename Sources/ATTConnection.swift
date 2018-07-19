//
//  ATTConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// Manages a Bluetooth connection using the ATT protocol.
public final class ATTConnection {
    
    // MARK: - Properties
    
    /// Actual number of bytes for PDU ATT exchange.
    public var maximumTransmissionUnit: ATTMaximumTransmissionUnit = .default
    
    public let socket: L2CAPSocketProtocol
    
    public var log: ((String) -> ())?
    
    public var writePending: (() -> ())?
    
    // MARK: - Private Properties
    
    /// There's a pending incoming request.
    private var incomingRequest = false
    
    /// IDs for registered callbacks.
    private var nextRegisterID: UInt = 0
    
    /// IDs for "send" ops.
    private var nextSendOpcodeID: UInt = 0
    
    /// Pending request state.
    private var pendingRequest: ATTSendOperation?
    
    /// Pending indication state.
    private var pendingIndication: ATTSendOperation?
    
    /// Queued ATT protocol requests
    private var requestQueue = [ATTSendOperation]()
    
    /// Queued ATT protocol indications
    private var indicationQueue = [ATTSendOperation]()
    
    /// Queue of PDUs ready to send
    private var writeQueue = [ATTSendOperation]()
    
    /// List of registered callbacks.
    private var notifyList = [ATTNotifyType]()
    
    /// List of disconnect handlers.
    private var disconnectList = [() -> ()]()
    
    // MARK: - Initialization
    
    public init(socket: L2CAPSocketProtocol) {
        
        self.socket = socket
    }
    
    // MARK: - Methods
    
    /// Performs the actual IO for recieving data.
    public func read() throws {
        
        log?("Attempt read")
        
        let recievedData = try socket.recieve(Int(maximumTransmissionUnit.rawValue))
        
        log?("Recieved data (\(recievedData.count) bytes)")
        
        // valid PDU data length
        guard recievedData.count >= ATT.minimumPDULength
            else { throw Error.garbageResponse(recievedData) }
        
        let opcodeByte = recievedData[0]
        
        // valid opcode
        guard let opcode = ATT.Opcode(rawValue: opcodeByte)
            else { throw Error.garbageResponse(recievedData) }
        
        log?("Recieved opcode \(opcode)")
        
        // Act on the received PDU based on the opcode type
        switch opcode.type {
            
        case .response:
            
            try handle(response: recievedData, opcode: opcode)
            
        case .confirmation:
            
            try handle(confirmation: recievedData, opcode: opcode)
            
        case .request:
            
            try handle(request: recievedData, opcode: opcode)
            
        case .command,
             .notification,
             .indication:
            
            // For all other opcodes notify the upper layer of the PDU and let them act on it.
            try handle(notify: recievedData, opcode: opcode)
        }
    }
    
    /// Performs the actual IO for sending data.
    public func write() throws -> Bool {
        
        log?("Attempt write")
        
        guard let sendOperation = pickNextSendOpcode()
            else { return false }
        
        assert(sendOperation.data.count <= Int(maximumTransmissionUnit.rawValue), "Trying to send \(sendOperation.data.count) bytes when MTU is \(maximumTransmissionUnit)")
        
        log?("Sending data... (\(sendOperation.data.count) bytes)")
        
        try socket.send(sendOperation.data)
        
        let opcode = sendOperation.opcode
        
        log?("Did write \(opcode)")
        
        /* Based on the operation type, set either the pending request or the
        * pending indication. If it came from the write queue, then there is
        * no need to keep it around.
        */
        switch opcode.type {
            
        case .request:
            
            pendingRequest = sendOperation
            
        case .indication:
            
            pendingRequest = sendOperation
            
        case .response:
            
            // Set `incomingRequest` to false to indicate that no request is pending
            incomingRequest = false
            
        case .command,
             .notification,
             .confirmation:
            
            break
        }
        
        return true
    }
    
    /// Registers a callback for an opcode and returns the ID associated with that callback.
    @discardableResult
    public func register <T: ATTProtocolDataUnit> (_ callback: @escaping (T) -> ()) -> UInt {
        
        let identifier = nextRegisterID
        
        // create notification
        let notify = ATTNotify(identifier: identifier, notify: callback)
        
        // increment ID
        nextRegisterID += 1
        
        // add to queue
        notifyList.append(notify)
        
        return identifier
    }
    
    /// Unregisters the callback associated with the specified identifier.
    ///
    /// - Returns: Whether the callback was unregistered.
    @discardableResult
    public func unregister(_ identifier: UInt) -> Bool {
        
        guard let index = notifyList.index(where: { $0.identifier == identifier })
            else { return false }
        
        notifyList.remove(at: index)
        
        return true
    }
    
    /// Registers all callbacks.
    public func unregisterAll() {
        
        notifyList.removeAll()
        
        disconnectList.removeAll()
    }
    
    /// Sends an error.
    public func send(error: ATT.Error, opcode: ATTOpcode, handle: UInt16 = 0, response: ((ATTErrorResponse) -> ())? = nil) -> UInt? {
        
        let error = ATTErrorResponse(request: opcode, attributeHandle: handle, error: error)
        
        return self.send(error) // no callback for responses
    }
    
    /// Adds a PDU to the queue to send.
    ///
    /// - Returns: Identifier of queued send operation or `nil` if the PDU cannot be sent.
    @discardableResult
    public func send <PDU: ATTProtocolDataUnit> (_ pdu: PDU, response: (callback: (AnyResponse) -> (), ATTProtocolDataUnit.Type)? = nil) -> UInt? {
        
        let attributeOpcode = PDU.attributeOpcode
        
        let type = attributeOpcode.type
        
        // Only request and indication PDUs should have response callbacks. 
        switch type {
            
        case .request,
             .indication: // Indication handles confirmation
            
            guard response != nil
                else { return nil }
            
        case .response,
             .command,
             .confirmation,
             .notification:
            
            guard response == nil
                else { return nil }
        }
        
        /// unable to encode PDU
        guard let encodedPDU = encode(PDU: pdu)
            else { return nil }
        
        let identifier = nextSendOpcodeID
        
        let sendOpcode = ATTSendOperation(identifier: identifier,
                                          opcode: attributeOpcode,
                                          data: encodedPDU,
                                          response: response)
        
        // increment ID
        nextSendOpcodeID += 1
        
        // Add the op to the correct queue based on its type
        switch type {
            
        case .request:
            
            requestQueue.append(sendOpcode)
            
        case .indication:
            
            indicationQueue.append(sendOpcode)
            
        case .response,
             .command,
             .confirmation,
             .notification:
            
            writeQueue.append(sendOpcode)
        }
        
        writePending?()
        
        return sendOpcode.identifier
    }
    
    /*
    public func cancel(_ identifier: UInt) {
        
        writePending?()
    }
    
    public func cancelAll() {
        
        writePending?()
    }*/
    
    // MARK: - Private Methods
    
    private func encode <T: ATTProtocolDataUnit> (PDU: T) -> Data? {
        
        let data = PDU.data
        
        // actual PDU length
        let length = data.count
        
        /// MTU must be large enough to hold PDU. 
        guard length <= Int(maximumTransmissionUnit.rawValue) else { return nil }
        
        // TODO: Sign (encrypt) data
        
        return data
    }
    
    private func handle(response data: Data, opcode: ATT.Opcode) throws {
        
        // If no request is pending, then the response is unexpected. Disconnect the bearer.
        guard let sendOperation = self.pendingRequest else {
            
            throw Error.unexpectedResponse(data)
        }
        
        // If the received response doesn't match the pending request, or if the request is malformed, 
        // end the current request with failure.
        
        let requestOpcode: ATTOpcode
        
        // Retry for error response
        if opcode == .errorResponse {
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { throw Error.garbageResponse(data) }
            
            let (errorRequestOpcode, didRetry) = handle(errorResponse: errorResponse)
            
            requestOpcode = errorRequestOpcode
            
            writePending?()
            
            /// Return if error response caused a retry
            guard didRetry == false
                else { return }
            
        } else {
            
            guard let mappedRequestOpcode = opcode.request
                else { throw Error.unexpectedResponse(data) }
            
            requestOpcode = mappedRequestOpcode
        }
        
        // clear current pending request
        defer { self.pendingRequest = nil }
        
        /// Verify the recieved response belongs to the pending request
        guard sendOperation.opcode == requestOpcode else {
            
            throw Error.unexpectedResponse(data)
        }
        
        // success!
        try sendOperation.handle(data: data)
        
        writePending?()
    }
    
    private func handle(confirmation data: Data, opcode: ATT.Opcode) throws {
        
        // Disconnect the bearer if the confirmation is unexpected or the PDU is invalid.
        guard let sendOperation = pendingIndication
            else { throw Error.unexpectedResponse(data) }
        
        self.pendingIndication = nil
        
        // success!
        try sendOperation.handle(data: data)
        
        writePending?()
    }
    
    private func handle(request data: Data, opcode: ATT.Opcode) throws {
        
        /*
        * If a request is currently pending, then the sequential
        * protocol was violated. Disconnect the bearer, which will
        * promptly notify the upper layer via disconnect handlers.
        */
        
        // Received request while another is pending.
        guard incomingRequest == false
            else { throw Error.unexpectedResponse(data) }
        
        incomingRequest = true
        
        // notify
        try handle(notify: data, opcode: opcode)
    }
    
    private func handle(notify data: Data, opcode: ATT.Opcode) throws {
        
        var foundPDU: ATTProtocolDataUnit?
        
        for notify in notifyList {
            
            // try next
            if type(of: notify).PDUType.attributeOpcode != opcode { continue }
            
            // attempt to deserialize
            guard let PDU = foundPDU ?? type(of: notify).PDUType.init(data: data)
                else { throw Error.garbageResponse(data) }
            
            foundPDU = PDU
            
            notify.callback(PDU)
            
            // callback could remove all entries from notify list, if so, exit the loop
            if self.notifyList.isEmpty { break }
        }
        
        // If this was a request and no handler was registered for it, respond with "Not Supported"
        if foundPDU == nil && opcode.type == .request {
            
            let errorResponse = ATTErrorResponse(request: opcode, attributeHandle: 0x00, error: .requestNotSupported)
            
            let _ = send(errorResponse)
        }
        
    }
    
    /// Handle the error reponse for a pending request and attempt to retry. 
    ///
    /// - Returns: The opcode of the request that errored 
    /// and whether the request will be sent again.
    private func handle(errorResponse: ATTErrorResponse) -> (opcode: ATTOpcode, didRetry: Bool) {
        
        let opcode = errorResponse.request
        
        guard let pendingRequest = self.pendingRequest
            else { return (opcode, false)  }
        
        // Attempt to change security
        guard changeSecurity(for: errorResponse.error)
            else { return (opcode, false) }
        
        //print("Retrying operation \(pendingRequest)")
        
        self.pendingRequest = nil
        
        // Push operation back to request queue
        requestQueue.insert(pendingRequest, at: 0)
        
        return (opcode, true)
    }
    
    private func pickNextSendOpcode() -> ATTSendOperation? {
        
        // See if any operations are already in the write queue
        if let sendOpcode = writeQueue.popFirst() {
            
            return sendOpcode
        }
        
        // If there is no pending request, pick an operation from the request queue.
        if pendingRequest == nil,
            let sendOpcode = requestQueue.popFirst() {
            
            return sendOpcode
        }
        
        // There is either a request pending or no requests queued. 
        // If there is no pending indication, pick an operation from the indication queue.
        if pendingIndication == nil,
            let sendOpcode = indicationQueue.popFirst() {
            
            return sendOpcode
        }
        
        return nil
    }
    
    /// Attempts to change security level based on an error response.
    private func changeSecurity(for error: ATTError) -> Bool {
        
        // only change if security is Auto
        guard self.socket.securityLevel == .sdp
            else { return false }
        
        // get security from IO
        var security = self.socket.securityLevel
        
        if error == .insufficientEncryption,
            security < .medium {
            
            security = .medium
            
        } else if error == .insufficientAuthentication {
            
            if (security < .medium) {
                security = .medium
            } else if (security < .high) {
                security = .high
            } else if (security < .fips) {
                security = .fips
            } else {
                return false
            }
        } else {
            return false
        }
        
        // attempt to change security level on Socket IO
        do { try self.socket.setSecurityLevel(security) }
        catch { return false }
        
        return true
    }
}

// MARK: - Supporting Types

public extension ATTConnection {
    public typealias Error = ATTConnectionError
}

/// ATT Connection Error
public enum ATTConnectionError: Error {
    
    /// The recieved data could not be parsed correctly.
    case garbageResponse(Data)
    
    /// Response is unexpected.
    case unexpectedResponse(Data)
}

public extension ATTConnection {
    
    typealias AnyResponse = AnyATTResponse
}

public enum AnyATTResponse {
    
    case error(ATTErrorResponse)
    case value(ATTProtocolDataUnit)
}

public enum ATTResponse <Value: ATTProtocolDataUnit> {
    
    case error(ATTErrorResponse)
    case value(Value)
    
    internal init(_ anyResponse: AnyATTResponse) {
        
        // validate types
        assert(Value.self != ATTErrorResponse.self)
        assert(Value.attributeOpcode.type == .response)
        
        switch anyResponse {
        case let .error(error):
            self = .error(error)
        case let .value(value):
            // swiftlint:disable force_cast
            let specializedValue = value as! Value
            // swiftlint:enable all
            self = .value(specializedValue)
        }
    }
}

// MARK: - Private Supporting Types

fileprivate final class ATTSendOperation {
    
    typealias Response = ATTConnection.AnyResponse
    
    /// The operation identifier.
    let identifier: UInt
    
    /// The request data.
    let data: Data
    
    /// The sent opcode
    let opcode: ATTOpcode
    
    /// The response callback.
    let response: (callback: (Response) -> (), responseType: ATTProtocolDataUnit.Type)?
    
    fileprivate init(identifier: UInt,
                     opcode: ATT.Opcode,
                     data: Data,
                     response: (callback: (Response) -> (), responseType: ATTProtocolDataUnit.Type)? = nil) {
        
        self.identifier = identifier
        self.opcode = opcode
        self.data = data
        self.response = response
    }
    
    func handle(data: Data) throws {
        
        guard let responseInfo = self.response
            else { throw ATTConnectionError.unexpectedResponse(data) }
        
        guard let opcode = data.first
            else { throw ATTConnectionError.garbageResponse(data) }
        
        if opcode == ATT.Opcode.errorResponse.rawValue {
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { throw ATTConnectionError.garbageResponse(data) }
            
            responseInfo.callback(.error(errorResponse))
            
        } else {
            
            guard let response = responseInfo.responseType.init(data: data)
                else { throw ATTConnectionError.garbageResponse(data) }
            
            responseInfo.callback(.value(response))
        }
    }
}

private protocol ATTNotifyType {
    
    static var PDUType: ATTProtocolDataUnit.Type { get }
    
    var identifier: UInt { get }
    
    var callback: (ATTProtocolDataUnit) -> () { get }
}

private struct ATTNotify<PDU: ATTProtocolDataUnit>: ATTNotifyType {
    
    static var PDUType: ATTProtocolDataUnit.Type { return PDU.self }
    
    let identifier: UInt
    
    let notify: (PDU) -> ()
    
    var callback: (ATTProtocolDataUnit) -> () { return { self.notify($0 as! PDU) } }
    
    init(identifier: UInt, notify: @escaping (PDU) -> ()) {
        
        self.identifier = identifier
        self.notify = notify
    }
}
