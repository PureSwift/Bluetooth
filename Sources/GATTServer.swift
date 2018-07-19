//
//  GATTServer.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

public extension GATT {
    
    public typealias Server = GATTServer
}

public final class GATTServer {
    
    // MARK: - Properties
    
    public var log: ((String) -> ())?
    
    public var database = GATTDatabase()
    
    public var willRead: ((_ uuid: BluetoothUUID, _ handle: UInt16, _ value: Data, _ offset: Int) -> ATT.Error?)?
    
    public var willWrite: ((_ uuid: BluetoothUUID, _ handle: UInt16, _ value: Data, _ newValue: Data) -> ATT.Error?)?
    
    public var didWrite: ((_ uuid: BluetoothUUID, _ handle: UInt16, _ value: Data) -> Void)?
    
    public var writePending: (() -> ())? {
        
        get { return connection.writePending }
        
        set { connection.writePending = newValue }
    }
    
    public let maximumPreparedWrites: Int
    
    public var maximumTransmissionUnit: ATTMaximumTransmissionUnit {
        
        return connection.maximumTransmissionUnit
    }
    
    // Don't modify
    @_versioned
    internal let connection: ATTConnection
    
    private var preparedWrites = [PreparedWrite]()
    
    // MARK: - Initialization
    
    deinit {
        
        self.connection.unregisterAll()
    }
    
    public init(socket: L2CAPSocketProtocol,
                maximumTransmissionUnit: ATT.MaximumTransmissionUnit = .default,
                maximumPreparedWrites: Int = 50) {
        
        // set initial MTU and register handlers
        self.maximumPreparedWrites = maximumPreparedWrites
        self.connection = ATTConnection(socket: socket)
        self.connection.maximumTransmissionUnit = maximumTransmissionUnit
        self.registerATTHandlers()
    }
    
    // MARK: - Methods
    
    /// Performs the actual IO for sending data.
    public func read() throws {
        
        try connection.read()
    }
    
    /// Performs the actual IO for recieving data.
    public func write() throws -> Bool {
        
        return try connection.write()
    }
    
    /// Update the value of a characteristic attribute.
    public func writeValue(_ value: Data, forCharacteristic handle: UInt16) {
        
        database.write(value, forAttribute: handle)
        
        didWriteAttribute(handle)
    }
    
    /// Update the value of a characteristic attribute.
    public func writeValue(_ value: Data, forCharacteristic uuid: BluetoothUUID) {
        
        guard let attribute = database.first(where: { $0.uuid == uuid })
            else { fatalError("Invalid uuid \(uuid)") }
        
        writeValue(value, forCharacteristic: attribute.handle)
    }
    
    // MARK: - Private Methods
    
    @inline(__always)
    private func registerATTHandlers() {
        
        // Exchange MTU
        connection.register(exchangeMTU)
        
        // Read By Group Type
        connection.register(readByGroupType)
        
        // Read By Type
        connection.register(readByType)
        
        // Find Information
        connection.register(findInformation)
        
        // Find By Type Value
        connection.register(findByTypeValue)
        
        // Write Request
        connection.register(writeRequest)
        
        // Write Command
        connection.register(writeCommand)
        
        // Read Request
        connection.register(readRequest)
        
        // Read Blob Request
        connection.register(readBlobRequest)
        
        // Read Multiple Request
        connection.register(readMultipleRequest)
        
        // Prepare Write Request
        connection.register(prepareWriteRequest)
        
        // Execute Write Request
        connection.register(executeWriteRequest)
    }
    
    @inline(__always)
    private func errorResponse(_ opcode: ATT.Opcode, _ error: ATT.Error, _ handle: UInt16 = 0) {
        
        log?("Error \(error) - \(opcode) (\(handle))")
        
        guard let _ = connection.send(error: error, opcode: opcode, handle: handle)
            else { fatalError("Could not add error PDU to queue: \(opcode) \(error) \(handle)") }
    }
    
    @inline(__always)
    private func fatalErrorResponse(_ message: String, _ opcode: ATT.Opcode, _ handle: UInt16 = 0, line: UInt = #line) -> Never {
        
        errorResponse(opcode, .unlikelyError, handle)
        
        do { let _ = try connection.write() }
        
        catch { log?("Could not send .unlikelyError to client. (\(error))") }
        
        fatalError(message, line: line)
    }
    
    /// Respond to a client-initiated PDU message.
    @inline(__always)
    private func respond <T: ATTProtocolDataUnit> (_ response: T) {
        
        log?("Response: \(response)")
        
        guard let _ = connection.send(response)
            else { fatalError("Could not add PDU to queue: \(response)") }
    }
    
    /// Send a server-initiated PDU message.
    @inline(__always)
    private func send (_ indication: ATTHandleValueIndication, response: @escaping (ATTResponse<ATTHandleValueConfirmation>) -> ()) {
        
        log?("Indication: \(indication)")
        
        let callback: (AnyATTResponse) -> () = { response(ATTResponse<ATTHandleValueConfirmation>($0)) }
        
        guard let _ = connection.send(indication, response: (callback, ATTHandleValueIndication.self))
            else { fatalError("Could not add PDU to queue: \(indication)") }
    }
    
    /// Send a server-initiated PDU message.
    @inline(__always)
    private func send (_ notification: ATTHandleValueNotification) {
        
        log?("Notification: \(notification)")
        
        guard let _ = connection.send(notification)
            else { fatalError("Could not add PDU to queue: \(notification)") }
    }
    
    private func checkPermissions(_ permissions: BitMaskOptionSet<ATT.AttributePermission>,
                                  _ attribute: GATTDatabase.Attribute) -> ATT.Error? {
        
        guard attribute.permissions != permissions else { return nil }
        
        // check permissions
        
        if permissions.contains(.read) && !attribute.permissions.contains(.read) {
            
            return .readNotPermitted
        }
        
        if permissions.contains(.write) && !attribute.permissions.contains(.write) {
            
            return .writeNotPermitted
        }
        
        // check security
        
        let security = connection.socket.securityLevel
        
        if attribute.permissions.contains(.readAuthentication)
            || attribute.permissions.contains(.writeAuthentication)
            && security < .high {
            
            return .insufficientAuthentication
        }
        
        if attribute.permissions.contains(.readEncrypt)
            || attribute.permissions.contains(.writeEncrypt)
            && security < .medium {
            
            return .insufficientEncryption
        }
        
        return nil
    }
    
    /// Handler for Write Request and Command
    private func handleWriteRequest(opcode: ATT.Opcode, handle: UInt16, value: Data, shouldRespond: Bool) {
        
        /// Conditionally respond
        @inline(__always)
        func doResponse( _ block: @autoclosure() -> ()) {
            
            if shouldRespond { block() }
        }
        
        log?("Write \(shouldRespond ? "Request" : "Command") (\(handle)) \(value)")
        
        // no attributes, impossible to write
        guard database.attributes.isEmpty == false
            else { doResponse(errorResponse(opcode, .invalidHandle, handle)); return }
        
        // validate handle
        guard database.contains(handle: handle)
            else { errorResponse(opcode, .invalidHandle, handle); return }
        
        // get attribute
        let attribute = database[handle: handle]
        
        // validate permissions
        if let error = checkPermissions([.write, .writeAuthentication, .writeEncrypt], attribute) {
            
            doResponse(errorResponse(opcode, error, handle))
            return
        }
        
        // validate application errors with write callback
        if let error = willWrite?(attribute.uuid, handle, attribute.value, value) {
            
            doResponse(errorResponse(opcode, error, handle))
            return
        }
        
        database.write(value, forAttribute: handle)
        
        doResponse(respond(ATTWriteResponse()))
        
        didWriteAttribute(handle)
    }
    
    private func didWriteAttribute(_ attributeHandle: UInt16) {
        
        let (group, attribute) = database.attributeGroup(for: attributeHandle)
        
        guard let service = group.service,
            let characteristic = service.characteristics.first(where: { $0.uuid == attribute.uuid })
            else { return }
        
        // inform delegate
        didWrite?(attribute.uuid, attribute.handle, attribute.value)
        
        // Client configuration
        if let clientConfigurationDescriptor = characteristic.descriptors.first(where: { $0.uuid == .clientCharacteristicConfiguration }) {
            
            guard let descriptor = GATTClientCharacteristicConfiguration(data: clientConfigurationDescriptor.value)
                else { return }
            
            // notify
            if descriptor.configuration.contains(.notify) {
                
                // If the attribue value is longer than (ATT_MTU-3) octets,
                // then only the first (ATT_MTU-3) octets of this attribute value
                // can be sent in a notification.
                let dataSize = Int(connection.maximumTransmissionUnit.rawValue) - ATTHandleValueNotification.length
                
                let value: Data
                
                if attribute.value.count > dataSize {
                    
                    value = Data(attribute.value.prefix(dataSize))
                    
                } else {
                    
                    value = attribute.value
                }
                
                let notification = ATTHandleValueNotification(handle: attributeHandle, value: value)
                
                send(notification)
            }
            
            // indicate
            if descriptor.configuration.contains(.indicate) {
                
                /// If the attribue value is longer than (ATT_MTU-3) octets,
                /// then only the first (ATT_MTU-3) octets of this attribute value
                /// can be sent in a indication.
                let dataSize = Int(connection.maximumTransmissionUnit.rawValue) - ATTHandleValueIndication.length
                
                let value: Data
                
                if attribute.value.count > dataSize {
                    
                    value = Data(attribute.value.prefix(dataSize))
                    
                } else {
                    
                    value = attribute.value
                }
                
                let indication = ATTHandleValueIndication(handle: attributeHandle, value: value)
                
                send(indication) { [unowned self] (confirmation) in
                    
                    self.log?("Confirmation: \(confirmation)")
                }
            }
        }
    }
    
    private func handleReadRequest(opcode: ATT.Opcode,
                                   handle: UInt16,
                                   offset: UInt16 = 0,
                                   isBlob: Bool = false) -> Data? {
        
        // no attributes
        guard database.attributes.isEmpty == false
            else { errorResponse(opcode, .invalidHandle, handle); return nil }
        
        // validate handle
        guard database.contains(handle: handle)
            else { errorResponse(opcode, .invalidHandle, handle); return nil }
        
        // get attribute
        let attribute = database[handle: handle]
        
        // validate permissions
        if let error = checkPermissions([.read, .readAuthentication, .readEncrypt], attribute) {
            
            errorResponse(opcode, error, handle)
            return nil
        }
        
        // Verify attribute value size for blob reading
        //
        // If the Characteristic Value is not longer than (ATT_MTU – 1) an Error Response with
        // the Error Code set to Attribute Not Long shall be received on the first Read Blob Request.
        guard isBlob == false || attribute.value.count > (Int(connection.maximumTransmissionUnit.rawValue) - 1)
            else { errorResponse(opcode, .attributeNotLong, handle); return nil }
        
        // check boundary
        guard offset <= UInt16(attribute.value.count)
            else { errorResponse(opcode, .invalidOffset, handle); return nil }
        
        var value: Data
        
        // Guard against invalid access if offset equals to value length
        if offset == UInt16(attribute.value.count) {
            
            value = Data()
            
        } else if offset > 0 {
            
            value = Data(attribute.value.suffix(from: Int(offset)))
            
        } else {
            
            value = attribute.value
        }
        
        // adjust value for MTU
        value = Data(value.prefix(Int(connection.maximumTransmissionUnit.rawValue) - 1))
        
        // validate application errors with read callback
        if let error = willRead?(attribute.uuid, handle, value, Int(offset)) {
            
            errorResponse(opcode, error, handle)
            return nil
        }
        
        return value
    }
    
    // MARK: Callbacks
    
    private func exchangeMTU(pdu: ATTMaximumTransmissionUnitRequest) {
        
        let serverMTU = connection.maximumTransmissionUnit.rawValue
        
        let finalMTU = ATTMaximumTransmissionUnit(server: serverMTU, client: pdu.clientMTU)
        
        // Respond with the server MTU (not final MTU)
        connection.send(ATTMaximumTransmissionUnitResponse(serverMTU: serverMTU))
        
        // Set MTU to minimum
        connection.maximumTransmissionUnit = finalMTU
        
        log?("MTU Exchange (\(pdu.clientMTU) -> \(finalMTU))")
    }
    
    private func readByGroupType(pdu: ATTReadByGroupTypeRequest) {
        
        typealias AttributeData = ATTReadByGroupTypeResponse.AttributeData
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Read by Group Type (\(pdu.startHandle) - \(pdu.endHandle))")
        
        // validate handles
        guard pdu.startHandle != 0 && pdu.endHandle != 0
            else { errorResponse(opcode, .invalidHandle); return }
        
        guard pdu.startHandle <= pdu.endHandle
            else { errorResponse(opcode, .invalidHandle, pdu.startHandle); return }
        
        // GATT defines that only the Primary Service and Secondary Service group types 
        // can be used for the "Read By Group Type" request. Return an error if any other group type is given.
        guard pdu.type == GATT.UUID.primaryService.uuid || pdu.type == GATT.UUID.secondaryService.uuid
            else { errorResponse(opcode, .unsupportedGroupType, pdu.startHandle); return }
        
        let data = database.readByGroupType(handle: (pdu.startHandle, pdu.endHandle), type: pdu.type)
        
        guard data.isEmpty == false
            else { errorResponse(opcode, .attributeNotFound, pdu.startHandle); return }
        
        var attributeData = [AttributeData]()
        attributeData.reserveCapacity(data.count)
        
        for (index, attribute) in data.enumerated() {
            
            let value = attribute.uuid.littleEndian.data
            
            if index > 0 {
                
                let lastAttribute = data[index - 1]
                
                guard value.count == lastAttribute.uuid.littleEndian.data.count
                    else { break } // stop appending
            }
            
            attributeData.append(AttributeData(attributeHandle: attribute.start,
                                               endGroupHandle: attribute.end,
                                               value: value))
        }
        
        var limitedAttributes = [attributeData[0]]
        
        var response = ATTReadByGroupTypeResponse(limitedAttributes)
        
        // limit for MTU if first handle is too large
        if response.data.count > Int(connection.maximumTransmissionUnit.rawValue) {
            
            let maxLength = min(min(Int(connection.maximumTransmissionUnit.rawValue) - 6, 251), limitedAttributes[0].value.count)
            
            limitedAttributes[0].value = Data(limitedAttributes[0].value.prefix(maxLength))
            
            response = ATTReadByGroupTypeResponse(limitedAttributes)
            
        } else {
            
            // limit for MTU for subsequential attribute handles
            for data in attributeData[1 ..< attributeData.count] {
                
                limitedAttributes.append(data)
                
                guard let limitedResponse = ATTReadByGroupTypeResponse(attributeData: limitedAttributes)
                    else { fatalErrorResponse("Could not create ATTReadByGroupTypeResponse. Attribute Data: \(attributeData)", opcode, pdu.startHandle) }
                
                guard limitedResponse.data.count <= Int(connection.maximumTransmissionUnit.rawValue) else { break }
                
                response = limitedResponse
            }
        }
        
        assert(response.data.count <= Int(connection.maximumTransmissionUnit.rawValue),
               "Response \(response.data.count) bytes > MTU (\(connection.maximumTransmissionUnit))")
        
        respond(response)
    }
    
    private func readByType(pdu: ATTReadByTypeRequest) {
        
        typealias AttributeData = ATTReadByTypeResponse.AttributeData
        
        let opcode = type(of: pdu).attributeOpcode
        
        if let log = self.log {
            
            let typeText: String
            
            if let gatt = GATT.UUID(uuid: pdu.attributeType) {
                
                typeText = "\(gatt)"
                
            } else {
                
                typeText = "\(pdu.attributeType)"
            }
            
            log("Read by Type (\(typeText)) (\(pdu.startHandle) - \(pdu.endHandle))")
        }
        
        guard pdu.startHandle != 0 && pdu.endHandle != 0
            else { errorResponse(opcode, .invalidHandle); return }
        
        guard pdu.startHandle <= pdu.endHandle
            else { errorResponse(opcode, .invalidHandle, pdu.startHandle); return }
        
        let attributes = database.readByType(handle: (pdu.startHandle, pdu.endHandle), type: pdu.attributeType)
        
        guard attributes.isEmpty == false
            else { errorResponse(opcode, .attributeNotFound, pdu.startHandle); return }
        
        let attributeData = attributes.map { AttributeData(handle: $0.handle, value: $0.value) }
        
        var limitedAttributes = [attributeData[0]]
        
        var response = ATTReadByTypeResponse(limitedAttributes)
        
        // limit for MTU if first handle is too large
        if response.data.count > Int(connection.maximumTransmissionUnit.rawValue) {
            
            let maxLength = min(min(Int(connection.maximumTransmissionUnit.rawValue) - 4, 253), limitedAttributes[0].value.count)
            
            limitedAttributes[0].value = Data(limitedAttributes[0].value.prefix(maxLength))
            
            response = ATTReadByTypeResponse(limitedAttributes)
            
        } else {
            
            // limit for MTU for subsequential attribute handles
            for data in attributeData[1 ..< attributeData.count] {
                
                limitedAttributes.append(data)
                
                guard let limitedResponse = ATTReadByTypeResponse(attributeData: limitedAttributes)
                    else { fatalErrorResponse("Could not create ATTReadByTypeResponse. Attribute Data: \(attributeData)", opcode, pdu.startHandle) }
                
                guard limitedResponse.data.count <= Int(connection.maximumTransmissionUnit.rawValue) else { break }
                
                response = limitedResponse
            }
        }
        
        assert(response.data.count <= Int(connection.maximumTransmissionUnit.rawValue),
               "Response \(response.data.count) bytes > MTU (\(connection.maximumTransmissionUnit))")
        
        respond(response)
    }
    
    private func findInformation(pdu: ATTFindInformationRequest) {
        
        typealias AttributeData = ATTFindInformationResponse.AttributeData
        
        typealias Format = ATTFindInformationResponse.Format
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Find Information (\(pdu.startHandle) - \(pdu.endHandle))")
        
        guard pdu.startHandle != 0 && pdu.endHandle != 0
            else { errorResponse(opcode, .invalidHandle); return }
        
        guard pdu.startHandle <= pdu.endHandle
            else { errorResponse(opcode, .invalidHandle, pdu.startHandle); return }
        
        let attributes = database.findInformation(handle: (pdu.startHandle, pdu.endHandle))
        
        guard attributes.isEmpty == false
            else { errorResponse(opcode, .attributeNotFound, pdu.startHandle); return }
        
        guard let format = Format(uuid: attributes[0].uuid)
            else { errorResponse(opcode, .unlikelyError, pdu.startHandle); return }
        
        var bit16Pairs = [(UInt16, UInt16)]()
        
        var bit128Pairs = [(UInt16, UInt128)]()
        
        for (index, attribute) in attributes.enumerated() {
            
            // truncate if bigger than MTU
            let encodedLength = 2 + ((index + 1) * format.length)
            
            guard encodedLength <= Int(connection.maximumTransmissionUnit.rawValue)
                else { break }
            
            var mismatchedType = false
            
            // encode attribute
            switch (attribute.uuid, format) {
                
            case let (.bit16(type), .bit16):
                
                bit16Pairs.append((attribute.handle, type))
                
            case let (.bit128(type), .bit128):
                
                bit128Pairs.append((attribute.handle, type))
                
            default:
                
                mismatchedType = true // mismatching types
            }
            
            // stop enumerating
            guard mismatchedType == false
                else { break }
        }
        
        let attributeData: AttributeData
        
        switch format {
        case .bit16: attributeData = .bit16(bit16Pairs)
        case .bit128: attributeData = .bit128(bit128Pairs)
        }
        
        let response = ATTFindInformationResponse(attributeData: attributeData)
        
        respond(response)
    }
    
    private func findByTypeValue(pdu: ATTFindByTypeRequest) {
        
        typealias Handle = ATTFindByTypeResponse.HandlesInformation
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Find By Type Value (\(pdu.startHandle) - \(pdu.endHandle)) (\(pdu.attributeType))")
        
        guard pdu.startHandle != 0 && pdu.endHandle != 0
            else { errorResponse(opcode, .invalidHandle); return }
        
        guard pdu.startHandle <= pdu.endHandle
            else { errorResponse(opcode, .invalidHandle, pdu.startHandle); return }
        
        let handles = database.findByTypeValue(handle: (pdu.startHandle, pdu.endHandle), type: pdu.attributeType, value: pdu.attributeValue)
        
        guard handles.isEmpty == false
            else { errorResponse(opcode, .attributeNotFound, pdu.startHandle); return }
        
        let handlesInformation = handles.map { Handle(foundAttribute: $0.0, groupEnd: $0.1) }
        
        let response = ATTFindByTypeResponse(handlesInformationList: handlesInformation)
        
        respond(response)
    }
    
    private func writeRequest(pdu: ATTWriteRequest) {
        
        let opcode = type(of: pdu).attributeOpcode
        
        handleWriteRequest(opcode: opcode, handle: pdu.handle, value: pdu.value, shouldRespond: true)
    }
    
    private func writeCommand(pdu: ATTWriteCommand) {
        
        let opcode = type(of: pdu).attributeOpcode
        
        handleWriteRequest(opcode: opcode, handle: pdu.handle, value: pdu.value, shouldRespond: false)
    }
    
    private func readRequest(pdu: ATTReadRequest) {
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Read (\(pdu.handle))")
        
        if let value = handleReadRequest(opcode: opcode, handle: pdu.handle) {
            
            respond(ATTReadResponse(attributeValue: value))
        }
    }
    
    private func readBlobRequest(pdu: ATTReadBlobRequest) {
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Read Blob (\(pdu.handle))")
        
        if let value = handleReadRequest(opcode: opcode, handle: pdu.handle, offset: pdu.offset, isBlob: true) {
            
            respond(ATTReadBlobResponse(partAttributeValue: value))
        }
    }
    
    private func readMultipleRequest(pdu: ATTReadMultipleRequest) {
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Read Multiple Request \(pdu.handles)")
        
        // no attributes, impossible to read
        guard database.attributes.isEmpty == false
            else { errorResponse(opcode, .invalidHandle, pdu.handles[0]); return }
        
        var values = Data()
        
        for handle in pdu.handles {
            
            // validate handle
            guard database.contains(handle: handle)
                else { errorResponse(opcode, .invalidHandle, handle); return }
            
            // get attribute
            let attribute = database[handle: handle]
            
            // validate application errors with read callback
            if let error = willRead?(attribute.uuid, handle, attribute.value, 0) {
                
                errorResponse(opcode, error, handle)
                return
            }
            
            values += attribute.value
        }
        
        let response = ATTReadMultipleResponse(values: values)
        
        respond(response)
    }
    
    private func prepareWriteRequest(pdu: ATTPrepareWriteRequest) {
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Prepare Write Request (\(pdu.handle))")
        
        // no attributes, impossible to write
        guard database.attributes.isEmpty == false
            else { errorResponse(opcode, .invalidHandle, pdu.handle); return }
        
        // validate handle
        guard database.contains(handle: pdu.handle)
            else { errorResponse(opcode, .invalidHandle, pdu.handle); return }
        
        // validate that the prepared writes queue is not full
        guard preparedWrites.count <= maximumPreparedWrites
            else { errorResponse(opcode, .prepareQueueFull); return }
        
        // get attribute
        let attribute = database[handle: pdu.handle]
        
        // validate permissions
        if let error = checkPermissions([.write, .writeAuthentication, .writeEncrypt], attribute) {
            
            errorResponse(opcode, error, pdu.handle)
            return
        }
        
        // The Attribute Value validation is done when an Execute Write Request is received.
        // Hence, any Invalid Offset or Invalid Attribute Value Length errors are generated 
        // when an Execute Write Request is received.
        
        // add queued write
        let preparedWrite = PreparedWrite(handle: pdu.handle, value: pdu.partValue, offset: pdu.offset)
        
        preparedWrites.append(preparedWrite)
        
        let response = ATTPrepareWriteResponse(handle: pdu.handle, offset: pdu.offset, partValue: pdu.partValue)
        
        respond(response)
    }
    
    private func executeWriteRequest(pdu: ATTExecuteWriteRequest) {
        
        let opcode = type(of: pdu).attributeOpcode
        
        log?("Execute Write Request (\(pdu.flag))")
        
        let preparedWrites = self.preparedWrites
        self.preparedWrites = []
        
        var newValues = [UInt16: Data]()
        
        switch pdu.flag {
            
        case .cancel:
            
            break // queue always cleared
            
        case .write:
            
            // validate
            for write in preparedWrites {
                
                let previousValue = newValues[write.handle] ?? Data()
                
                let newValue = previousValue + write.value
                
                // validate offset?
                newValues[write.handle] = newValue
            }
            
            // validate new values
            for (handle, newValue) in newValues {
                
                let attribute = database[handle: handle]
                
                // validate application errors with write callback
                if let error = willWrite?(attribute.uuid, handle, attribute.value, newValue) {
                    
                    errorResponse(opcode, error, handle)
                    return
                }
            }
            
            // write new values
            for (handle, newValue) in newValues {
                
                database.write(newValue, forAttribute: handle)
            }
        }
        
        respond(ATTExecuteWriteResponse())
        
        for handle in newValues.keys {
            
            didWriteAttribute(handle)
        }
    }
}

// MARK: - Supporting Types

private extension GATTServer {
    
    struct PreparedWrite {
        
        let handle: UInt16
        
        let value: Data
        
        let offset: UInt16
    }
}

// MARK: - GATTDatabase Extensions

internal extension GATTDatabase {
    
    /// Find the enclosing Service attribute group for the specified handle
    func attributeGroup(for handle: UInt16) -> (group: AttributeGroup, attribute: Attribute) {
        
        for group in attributeGroups {
            
            for attribute in group.attributes {
                
                guard attribute.handle != handle
                    else { return (group, attribute) }
            }
        }
        
        fatalError("Invalid handle \(handle)")
    }
    
    /// Used for Service discovery. Should return tuples with the Service start handle, end handle and UUID.
    func readByGroupType(handle: (start: UInt16, end: UInt16), type: BluetoothUUID) -> [(start: UInt16, end: UInt16, uuid: BluetoothUUID)] {
        
        let handleRange = handle.end < UInt16.max ? Range(handle.start ... handle.end) : Range(handle.start ..< handle.end)
        
        var data: [(start: UInt16, end: UInt16, uuid: BluetoothUUID)] = []
        
        for group in attributeGroups {
            
            guard group.serviceAttribute.uuid == type else { continue }
            
            let groupRange = Range(group.startHandle ... group.endHandle)
            
            guard groupRange.isSubset(handleRange) else { continue }
            
            let serviceUUID = BluetoothUUID(littleEndian: BluetoothUUID(data: Data(group.serviceAttribute.value))!)
            
            data.append((group.startHandle, group.endHandle, serviceUUID))
        }
        
        return data
    }
    
    func readByType(handle: (start: UInt16, end: UInt16), type: BluetoothUUID) -> [Attribute] {
        
        let range = handle.end < UInt16.max ? Range(handle.start ... handle.end) : Range(handle.start ..< handle.end)
        
        return attributes.filter { range.contains($0.handle) && $0.uuid == type }
    }
    
    func findInformation(handle: (start: UInt16, end: UInt16)) -> [Attribute] {
        
        let range = handle.end < UInt16.max ? Range(handle.start ... handle.end) : Range(handle.start ..< handle.end)
        
        return attributes.filter { range.contains($0.handle) }
    }
    
    func findByTypeValue(handle: (start: UInt16, end: UInt16), type: UInt16, value: Data) -> [(UInt16, UInt16)] {
        
        let range = handle.end < UInt16.max ? Range(handle.start ... handle.end) : Range(handle.start ..< handle.end)
        
        var results = [(UInt16, UInt16)]()
        
        for group in attributeGroups {
            
            for attribute in group.attributes {
                
                let match = range.contains(attribute.handle)
                    && attribute.uuid == .bit16(type)
                    && attribute.value == value
                
                guard match else { continue }
                
                results.append((group.startHandle, group.endHandle))
            }
        }
        
        return results
    }
}
