//
//  ATTConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Manages a Bluetooth connection using the ATT protocol.
internal actor ATTConnection {
    
    // MARK: - Properties
    
    /// Actual number of bytes for PDU ATT exchange.
    public private(set) var maximumTransmissionUnit: ATTMaximumTransmissionUnit = .default
    
    public private(set) var isConnected = true
    
    internal let socket: L2CAPSocket
    
    internal let log: ((String) -> ())?
    
    internal let didDisconnect: ((Error?) async -> ())?
    
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
        
    // MARK: - Initialization
    
    public init(
        socket: L2CAPSocket,
        log: ((String) -> ())? = nil,
        didDisconnect: ((Error?) async -> ())? = nil
    ) async {
        self.socket = socket
        self.log = log
        self.didDisconnect = didDisconnect
        run()
    }
    
    // MARK: - Methods
    
    public func setMaximumTransmissionUnit(_ newValue: ATTMaximumTransmissionUnit) {
        self.maximumTransmissionUnit = newValue
    }
    
    private func run() {
        Task.detached(priority: .high) { [weak self] in
            guard let stream = self?.socket.event else { return }
            for await event in stream {
                await self?.socketEvent(event)
            }
            // socket closed
        }
    }
    
    /// Performs the actual IO for recieving data.
    internal func read() async throws {
        
        //log?("Attempt read")
        
        let bytesToRead = Int(self.maximumTransmissionUnit.rawValue)
        
        let recievedData = try await socket.recieve(bytesToRead)
        
        //log?("Recieved data (\(recievedData.count) bytes)")
        
        // valid PDU data length
        guard recievedData.count >= 1 // at least 1 byte for ATT opcode
            else { throw ATTConnectionError.garbageResponse(recievedData) }
        
        let opcodeByte = recievedData[0]
        
        // valid opcode
        guard let opcode = ATTOpcode(rawValue: opcodeByte)
            else { throw ATTConnectionError.garbageResponse(recievedData) }
        
        //log?("Recieved opcode \(opcode)")
        
        // Act on the received PDU based on the opcode type
        switch opcode.type {
        case .response:
            try await handle(response: recievedData, opcode: opcode)
        case .confirmation:
            try handle(confirmation: recievedData, opcode: opcode)
        case .request:
            try await handle(request: recievedData, opcode: opcode)
        case .command,
             .notification,
             .indication:
            // For all other opcodes notify the upper layer of the PDU and let them act on it.
            try await handle(notify: recievedData, opcode: opcode)
        }
    }
    
    /// Performs the actual IO for sending data.
    @discardableResult
    internal func write() async throws -> Bool {
        
        //log?("Attempt write")
        
        guard let sendOperation = pickNextSendOpcode()
            else { return false }
        
        //log?("Sending data... (\(sendOperation.data.count) bytes)")
        
        try await socket.send(sendOperation.data)
        let opcode = sendOperation.opcode
        
        //log?("Did write \(opcode)")
        
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
    
    private func socketEvent(_ event: L2CAPSocketEvent) async {
        switch event {
        case .pendingRead:
            #if DEBUG
            log?("Pending read")
            #endif
            do { try await read() }
            catch { log?("Unable to read. \(error)") }
        case let .read(byteCount):
            #if DEBUG
            log?("Did read \(byteCount) bytes")
            #endif
        case let .write(byteCount):
            #if DEBUG
            log?("Did write \(byteCount) bytes")
            #endif
            // try to write again
            do { try await write() }
            catch { log?("Unable to write. \(error)") }
        case let .close(error):
            #if DEBUG
            log?("Did close. \(error?.localizedDescription ?? "")")
            #endif
            isConnected = false
            await didDisconnect?(error)
        }
    }
    
    // write all pending PDUs
    private func writePending() {
        Task(priority: .high) { [weak self] in
            guard let self = self, await self.isConnected else { return }
            do { try await self.write() } // event will call write again
            catch { log?("Unable to write. \(error)") }
        }
    }
    
    /// Registers a callback for an opcode and returns the ID associated with that callback.
    @discardableResult
    public func register <T: ATTProtocolDataUnit> (_ callback: @escaping (T) async -> ()) -> UInt {
        
        let id = nextRegisterID
        
        // create notification
        let notify = ATTNotify(id: id, notify: callback)
        
        // increment ID
        nextRegisterID += 1
        
        // add to queue
        notifyList.append(notify)
        
        return id
    }
    
    /// Unregisters the callback associated with the specified identifier.
    ///
    /// - Returns: Whether the callback was unregistered.
    @discardableResult
    public func unregister(_ id: UInt) -> Bool {
        
        guard let index = notifyList.firstIndex(where: { $0.id == id })
            else { return false }
        notifyList.remove(at: index)
        return true
    }
    
    /// Registers all callbacks.
    public func unregisterAll() {
        notifyList.removeAll()
    }
    
    /// Adds a PDU to the queue to send.
    ///
    /// - Returns: Identifier of queued send operation or `nil` if the PDU cannot be sent.
    @discardableResult
    public func queue <T: ATTProtocolDataUnit> (
        _ pdu: T,
        response: (callback: (ATTProtocolDataUnit) -> (), ATTProtocolDataUnit.Type)? = nil
    ) -> UInt? {
        
        let attributeOpcode = T.attributeOpcode
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
        guard let encodedPDU = encode(pdu)
            else { return nil }
        
        let id = nextSendOpcodeID
        
        let sendOpcode = ATTSendOperation(
            id: id,
            opcode: attributeOpcode,
            data: encodedPDU,
            response: response
        )
        
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
        
        writePending()
        
        return sendOpcode.id
    }
    
    // MARK: - Private Methods
    
    private func encode <T: ATTProtocolDataUnit> (_ request: T) -> Data? {
        
        let data = request.data
        
        // actual PDU length
        let length = data.count
        
        /// MTU must be large enough to hold PDU. 
        guard length <= Int(maximumTransmissionUnit.rawValue)
            else { return nil }
        
        // TODO: Sign (encrypt) data
        
        return data
    }
    
    private func handle(response data: Data, opcode: ATTOpcode) async throws {
        
        // If no request is pending, then the response is unexpected. Disconnect the bearer.
        guard let sendOperation = self.pendingRequest else {
            throw ATTConnectionError.unexpectedResponse(data)
        }
        
        // If the received response doesn't match the pending request, or if the request is malformed, 
        // end the current request with failure.
        
        let requestOpcode: ATTOpcode
        
        // Retry for error response
        if opcode == .errorResponse {
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { throw ATTConnectionError.garbageResponse(data) }
            
            let (errorRequestOpcode, didRetry) = await handle(errorResponse: errorResponse)
            
            requestOpcode = errorRequestOpcode
            
            writePending()
            
            /// Return if error response caused a retry
            guard didRetry == false
                else { return }
            
        } else {
            
            guard let mappedRequestOpcode = opcode.request
                else { throw ATTConnectionError.unexpectedResponse(data) }
            
            requestOpcode = mappedRequestOpcode
        }
        
        // clear current pending request
        defer { self.pendingRequest = nil }
        
        /// Verify the recieved response belongs to the pending request
        guard sendOperation.opcode == requestOpcode else {
            throw ATTConnectionError.unexpectedResponse(data)
        }
        
        // success!
        try sendOperation.handle(data: data)
        
        writePending()
    }
    
    private func handle(confirmation data: Data, opcode: ATTOpcode) throws {
        
        // Disconnect the bearer if the confirmation is unexpected or the PDU is invalid.
        guard let sendOperation = pendingIndication
            else { throw ATTConnectionError.unexpectedResponse(data) }
        
        self.pendingIndication = nil
        
        // success!
        try sendOperation.handle(data: data)
        
        // send the remaining indications
        if indicationQueue.isEmpty == false {
            writePending()
        }
    }
    
    private func handle(request data: Data, opcode: ATTOpcode) async throws {
        
        /*
        * If a request is currently pending, then the sequential
        * protocol was violated. Disconnect the bearer, which will
        * promptly notify the upper layer via disconnect handlers.
        */
        
        // Received request while another is pending.
        guard incomingRequest == false
            else { throw ATTConnectionError.unexpectedResponse(data) }
        
        incomingRequest = true
        
        // notify
        try await handle(notify: data, opcode: opcode)
    }
    
    private func handle(notify data: Data, opcode: ATTOpcode) async throws {
        
        var foundPDU: ATTProtocolDataUnit?
        
        let oldList = notifyList
        for notify in oldList {
            
            // try next
            if type(of: notify).PDUType.attributeOpcode != opcode { continue }
            
            // attempt to deserialize
            guard let PDU = foundPDU ?? type(of: notify).PDUType.init(data: data)
                else { throw ATTConnectionError.garbageResponse(data) }
            
            foundPDU = PDU
            
            await notify.callback(PDU)
            
            // callback could remove all entries from notify list, if so, exit the loop
            if self.notifyList.isEmpty { break }
        }
        
        // If this was a request and no handler was registered for it, respond with "Not Supported"
        if foundPDU == nil && opcode.type == .request {
            let errorResponse = ATTErrorResponse(request: opcode, attributeHandle: 0x00, error: .requestNotSupported)
            let _ = queue(errorResponse)
        }
        
    }
    
    /// Handle the error reponse for a pending request and attempt to retry. 
    ///
    /// - Returns: The opcode of the request that errored 
    /// and whether the request will be sent again.
    private func handle(errorResponse: ATTErrorResponse) async -> (opcode: ATTOpcode, didRetry: Bool) {
        
        let opcode = errorResponse.request
        
        guard let pendingRequest = self.pendingRequest
            else { return (opcode, false)  }
        
        // Attempt to change security
        guard await changeSecurity(for: errorResponse.error)
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
            // can't send more indications until the last one is confirmed
            pendingIndication = sendOpcode
            return sendOpcode
        }
        
        return nil
    }
    
    /// Attempts to change security level based on an error response.
    private func changeSecurity(for error: ATTError) async -> Bool {
        
        let securityLevel: Bluetooth.SecurityLevel
        do { securityLevel = try await socket.securityLevel }
        catch {
            log?("Unable to get security level. \(error)")
            return false
        }
        
        // only change if security is Auto
        guard securityLevel == .sdp
            else { return false }
        
        // get security from IO
        var newSecurityLevel: Bluetooth.SecurityLevel
        
        if error == .insufficientEncryption,
           securityLevel < .medium {
            newSecurityLevel = .medium
        } else if error == .insufficientAuthentication {
            
            if (securityLevel < .medium) {
                newSecurityLevel = .medium
            } else if (securityLevel < .high) {
                newSecurityLevel = .high
            } else if (securityLevel < .fips) {
                newSecurityLevel = .fips
            } else {
                return false
            }
        } else {
            return false
        }
        
        // attempt to change security level on Socket IO
        do { try await socket.setSecurityLevel(newSecurityLevel) }
        catch {
            log?("Unable to set security level. \(error)")
            return false
        }
        
        return true
    }
}

// MARK: - Supporting Types

/// ATT Connection Error
public enum ATTConnectionError: Error {
    
    /// The recieved data could not be parsed correctly.
    case garbageResponse(Data)
    
    /// Response is unexpected.
    case unexpectedResponse(Data)
}

internal typealias AnyATTResponse = Result<ATTProtocolDataUnit, ATTErrorResponse>

internal typealias ATTResponse<Success: ATTProtocolDataUnit> = Result<Success, ATTErrorResponse>

internal extension Result where Success: ATTProtocolDataUnit, Failure == ATTErrorResponse {
    
    init(_ response: ATTProtocolDataUnit) {
        
        assert(Success.self != ATTErrorResponse.self)
        assert(Success.attributeOpcode.type == .response ||
               Success.attributeOpcode.type == .confirmation)
        
        if let error = response as? Failure {
            assert(type(of: response).attributeOpcode == .errorResponse)
            self = .failure(error)
        } else if let value = response as? Success {
            assert(type(of: response).attributeOpcode == Success.attributeOpcode)
            self = .success(value)
        } else {
            fatalError("Invalid response \(type(of: response).attributeOpcode)")
        }
    }
}

internal final class ATTSendOperation {
    
    /// The operation identifier.
    let id: UInt
    
    /// The request data.
    let data: Data
    
    /// The sent opcode
    let opcode: ATTOpcode
    
    /// The response callback.
    let response: (callback: (ATTProtocolDataUnit) -> (), responseType: ATTProtocolDataUnit.Type)?
    
    fileprivate init(
        id: UInt,
        opcode: ATTOpcode,
        data: Data,
        response: (callback: (ATTProtocolDataUnit) -> (),
                   responseType: ATTProtocolDataUnit.Type)? = nil
    ) {
        self.id = id
        self.opcode = opcode
        self.data = data
        self.response = response
    }
    
    func handle(data: Data) throws {
        
        guard let responseInfo = self.response
            else { throw ATTConnectionError.unexpectedResponse(data) }
        
        guard let opcode = data.first.flatMap(ATTOpcode.init(rawValue:))
            else { throw ATTConnectionError.garbageResponse(data) }
        
        if opcode == .errorResponse {
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { throw ATTConnectionError.garbageResponse(data) }
            
            responseInfo.callback(errorResponse)
            
        } else if opcode == responseInfo.responseType.attributeOpcode {
            
            guard let response = responseInfo.responseType.init(data: data)
                else { throw ATTConnectionError.garbageResponse(data) }
            
            responseInfo.callback(response)
            
        } else {
            // other ATT response
            throw ATTConnectionError.garbageResponse(data)
        }
    }
}

internal protocol ATTNotifyType {
    
    static var PDUType: ATTProtocolDataUnit.Type { get }
    
    var id: UInt { get }
    
    var callback: (ATTProtocolDataUnit) async -> () { get }
}

internal struct ATTNotify<PDU: ATTProtocolDataUnit>: ATTNotifyType {
    
    static var PDUType: ATTProtocolDataUnit.Type { return PDU.self }
    
    let id: UInt
    
    let notify: (PDU) async -> ()
    
    var callback: (ATTProtocolDataUnit) async -> () { return { await self.notify($0 as! PDU) } }
    
    init(id: UInt, notify: @escaping (PDU) async -> ()) {
        
        self.id = id
        self.notify = notify
    }
}
