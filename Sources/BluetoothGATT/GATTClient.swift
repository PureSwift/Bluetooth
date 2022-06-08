//
//  GATTClient.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

#if swift(>=5.6)
/// GATT Client
public actor GATTClient {
    
    // MARK: - Properties
    
    public let log: ((String) -> ())?
        
    public var maximumTransmissionUnit: ATTMaximumTransmissionUnit {
        get async {
            return await self.connection.maximumTransmissionUnit
        }
    }
    
    public let preferredMaximumTransmissionUnit: ATTMaximumTransmissionUnit
    
    internal private(set) var didExchangeMTU = false
    
    /// Whether the client is currently writing a long value.
    internal private(set) var inLongWrite: Bool = false
    
    /// Notications
    internal private(set) var notifications = [UInt16: Notification]()
    
    /// Indications
    internal private(set) var indications = [UInt16: Notification]()
    
    internal let connection: ATTConnection
    
    private var sendContinuations = [UInt: @Sendable (Swift.Error) -> ()]()
    
    private var sendID: UInt = 0
    
    // MARK: - Initialization
    
    deinit {
        let continuations = self.sendContinuations.values
        continuations.forEach { continuation in
            continuation(CancellationError())
        }
    }
    
    public init(
        socket: L2CAPSocket,
        maximumTransmissionUnit: ATTMaximumTransmissionUnit = .default,
        log: ((String) -> ())? = nil,
        didDisconnect: ((Swift.Error?) async -> ())? = nil
    ) async {
        self.connection = await ATTConnection(
            socket: socket,
            log: log,
            didDisconnect: didDisconnect
        )
        self.preferredMaximumTransmissionUnit = maximumTransmissionUnit
        self.log = log
        // setup notifications and indications
        await self.registerATTHandlers()
    }
    
    // MARK: Requests
    
    /// Discover All Primary Services
    ///
    /// This sub-procedure is used by a client to discover all the primary services on a server.
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/DiscoverAllPrimaryServices.png)
    ///
    /// - Parameter completion: The completion closure.
    public func discoverAllPrimaryServices() async throws -> [Service] {
        // The Attribute Protocol Read By Group Type Request shall be used with
        // the Attribute Type parameter set to the UUID for «Primary Service».
        // The Starting Handle shall be set to 0x0001 and the Ending Handle shall be set to 0xFFFF.
        try await discoverServices(
            start: 0x0001,
            end: 0xFFFF,
            primary: true
        )
    }
    
    /// Discover Primary Service by Service UUID
    /// 
    /// This sub-procedure is used by a client to discover a specific primary service on a server
    /// when only the Service UUID is known. The specific primary service may exist multiple times on a server. 
    /// The primary service being discovered is identified by the service UUID.
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/DiscoverPrimaryServiceByServiceUUID.png)
    ///
    /// - Parameter uuid: The UUID of the service to find.
    /// - Parameter completion: The completion closure.
    public func discoverPrimaryServices(
        by uuid: BluetoothUUID
    ) async throws -> [Service] {
        // The Attribute Protocol Find By Type Value Request shall be used with the Attribute Type
        // parameter set to the UUID for «Primary Service» and the Attribute Value set to the 16-bit
        // Bluetooth UUID or 128-bit UUID for the specific primary service. 
        // The Starting Handle shall be set to 0x0001 and the Ending Handle shall be set to 0xFFFF.
        return try await discoverServices(
            uuid: uuid,
            start: 0x0001,
            end: 0xFFFF,
            primary: true
        )
    }
    
    /// Discover All Characteristics of a Service
    /// 
    /// This sub-procedure is used by a client to find all the characteristic declarations within 
    /// a service definition on a server when only the service handle range is known.
    /// The service specified is identified by the service handle range.
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/DiscoverAllCharacteristics.png)
    ///
    /// - Parameter service: The service.
    /// - Parameter completion: The completion closure.
    public func discoverAllCharacteristics(of service: Service) async throws -> [Characteristic] {
        // The Attribute Protocol Read By Type Request shall be used with the Attribute Type
        // parameter set to the UUID for «Characteristic» The Starting Handle shall be set to 
        // starting handle of the specified service and the Ending Handle shall be set to the 
        // ending handle of the specified service.
        return try await discoverCharacteristics(service: service)
    }
    
    /// Discover Characteristics by UUID
    /// 
    /// This sub-procedure is used by a client to discover service characteristics on a server when 
    /// only the service handle ranges are known and the characteristic UUID is known. 
    /// The specific service may exist multiple times on a server. 
    /// The characteristic being discovered is identified by the characteristic UUID.
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/DiscoverCharacteristicsByUUID.png)
    ///
    /// - Parameter service: The service of the characteristics to find.
    /// - Parameter uuid: The UUID of the characteristics to find.
    /// - Parameter completion: The completion closure.
    public func discoverCharacteristics(
        of service: Service,
        by uuid: BluetoothUUID
    ) async throws -> [Characteristic] {
        // The Attribute Protocol Read By Type Request is used to perform the beginning of the sub-procedure.
        // The Attribute Type is set to the UUID for «Characteristic» and the Starting Handle and Ending Handle
        // parameters shall be set to the service handle range.
        return try await discoverCharacteristics(uuid: uuid, service: service)
    }
    
    /// Read Characteristic Value
    ///
    /// This sub-procedure is used to read a Characteristic Value from a server when the client knows
    /// the Characteristic Value Handle.
    ///
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/ReadCharacteristicValue.png)
    public func readCharacteristic(_ characteristic: Characteristic) async throws -> Data {
        // read value and try to read blob if too big
        return try await readAttributeValue(characteristic.handle.value)
    }
    
    /// Read Using Characteristic UUID
    ///
    /// This sub-procedure is used to read a Characteristic Value from a server when the client
    /// only knows the characteristic UUID and does not know the handle of the characteristic.
    ///
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/ReadUsingCharacteristicUUID.png)
    public func readCharacteristics(
        using uuid: BluetoothUUID,
        handleRange: (start: UInt16, end: UInt16) = (.min, .max)
    ) async throws -> [UInt16: Data] {
        precondition(handleRange.start < handleRange.end)
        // The Attribute Protocol Read By Type Request is used to perform the sub-procedure.
        // The Attribute Type is set to the known characteristic UUID and the Starting Handle and Ending Handle parameters
        // shall be set to the range over which this read is to be performed. This is typically the handle range for the service in which the characteristic belongs.
        let request = ATTReadByTypeRequest(
            startHandle: handleRange.start,
            endHandle: handleRange.end,
            attributeType: uuid
        )
        let response = try await send(request, response: ATTReadByTypeResponse.self)
            .mapError({ GATTClientError.errorResponse($0) })
            .get()
        // parse response
        var attributeData = [UInt16: Data](minimumCapacity: response.attributeData.count)
        for attribute in response.attributeData {
            attributeData[attribute.handle] = attribute.value
        }
        return attributeData
    }
    
    /// Read Multiple Characteristic Values
    ///
    /// This sub-procedure is used to read multiple Characteristic Values from a server when the client
    /// knows the Characteristic Value Handles.
    ///
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/ReadMultipleCharacteristicValues.png)
    ///
    /// - Note: A client should not use this request for attributes when the Set Of Values parameter could be `(ATT_MTU–1)`
    /// as it will not be possible to determine if the last attribute value is complete, or if it overflowed.
    public func readCharacteristics(
        _ characteristics: [Characteristic]
    ) async throws -> Data {
        // The Attribute Protocol Read Multiple Request is used with the Set Of Handles parameter set to the Characteristic Value Handles.
        // The Read Multiple Response returns the Characteristic Values in the Set Of Values parameter.
        let handles = characteristics.map { $0.handle.value }
        assert(handles.count > 1)
        guard let request = ATTReadMultipleRequest(handles: handles)
            else { fatalError("Must provide at least 2 characteristics") }
        let response = try await send(request, response: ATTReadMultipleResponse.self)
            .mapError({ GATTClientError.errorResponse($0) })
            .get()
        return response.values
    }
    
    /**
     Write Characteristic
     
     Uses the appropriate procecedure to write the characteristic value.
     */
    public func writeCharacteristic(
        _ characteristic: Characteristic,
        data: Data,
        withResponse: Bool = true
    ) async throws {
        try await writeAttribute(
            characteristic.handle.value,
            data: data,
            withResponse: withResponse
        )
    }
    
    /**
     Discover All Characteristic Descriptors
     
     This sub-procedure is used by a client to find all the characteristic descriptor’s Attribute Handles and Attribute Types within a characteristic definition when only the characteristic handle range is known. The characteristic specified is identified by the characteristic handle range.
     
     ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/DiscoverAllCharacteristicDescriptors.png)
     */
    public func discoverDescriptors(
        of characteristic: Characteristic,
        service: (declaration: Service, characteristics: [Characteristic])
    ) async throws -> [Descriptor] {
        
        /**
         The Attribute Protocol Find Information Request shall be used with the Starting Handle set
         to the handle of the specified characteristic value + 1 and the Ending Handle set to the
         ending handle of the specified characteristic.
         */
        let start = characteristic.handle.value + 1
        let end = endHandle(for: characteristic, service: service)
        var operation = DescriptorDiscoveryOperation(
            start: start,
            end: end
        )
        try await discoverDescriptors(&operation)
        return operation.foundDescriptors
    }
    
    /// Read Characteristic Descriptor
    ///
    /// This sub-procedure is used to read a characteristic descriptor from a server when the client knows
    /// the characteristic descriptor declaration’s Attribute handle.
    ///
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/ReadCharacteristicValue.png)
    public func readDescriptor(_ descriptor: Descriptor) async throws -> Data {
        
        /**
         The Attribute Protocol Read Request is used for this sub-procedure. The Read Request is used with the Attribute Handle parameter set to the characteristic descriptor handle. The Read Response returns the characteristic descriptor value in the Attribute Value parameter.
         
         An Error Response shall be sent by the server in response to the Read Request if insufficient authentication, insufficient authorization, insufficient encryption key size is used by the client, or if a read operation is not permitted on the Characteristic Value. The Error Code parameter is set accordingly.
         */
        
        // read value and try to read blob if too big
        return try await readAttributeValue(descriptor.handle)
    }
    
    /**
     Write Descriptor
     
     Uses the appropriate procecedure to write the characteristic descriptor value.
     */
    public func writeDescriptor(
        _ descriptor: Descriptor,
        data: Data,
        withResponse: Bool = true
    ) async throws {
        try await writeAttribute(
            descriptor.handle,
            data: data,
            withResponse: withResponse
        )
    }
    
    /**
     Notifications
     
     This sub-procedure is used when a server is configured to notify a Characteristic Value to a client without expecting any Attribute Protocol layer acknowledgment that the notification was successfully received.
     
     ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/Notifications.png)
     */
    public func clientCharacteristicConfiguration(
        _ characteristic: Characteristic,
        notification: Notification?,
        indication: Notification?,
        descriptors: [Descriptor]
    ) async throws {
        
        guard let descriptor = descriptors.first(where: { $0.uuid == .clientCharacteristicConfiguration })
            else { throw GATTClientError.clientCharacteristicConfigurationNotAllowed(characteristic) }
        
        var clientConfiguration = GATTClientCharacteristicConfiguration()
        if notification != nil {
            clientConfiguration.configuration.insert(.notify)
        }
        if indication != nil {
            clientConfiguration.configuration.insert(.indicate)
        }
        
        // write client configuration descriptor
        try await writeDescriptor(descriptor, data: clientConfiguration.data)
        
        // store callbacks
        self.notifications[characteristic.handle.value] = notification
        self.indications[characteristic.handle.value] = indication
    }
    
    // MARK: - Private Methods
    
    private func registerATTHandlers() async  {
        
        // value notifications / indications
        await connection.register { [unowned self] in
            self.notification($0)
        }
        await connection.register { [unowned self] in
            await self.indication($0)
        }
    }
    
    private func send <Request: ATTProtocolDataUnit, Response: ATTProtocolDataUnit> (
        _ request: Request,
        response: Response.Type
    ) async throws -> ATTResponse<Response> {
        assert(Response.attributeOpcode != .errorResponse)
        assert(Response.attributeOpcode.type == .response)
        assert(Request.attributeOpcode.type != .response)
        // queue request
        log?("Request: \(request)")
        sendID += 1
        let id = sendID
        return try await withCheckedThrowingContinuation { [unowned self] continuation in
            Task {
                let responseType: ATTProtocolDataUnit.Type = response
                // callback if no I/O errors or disconnect
                let callback: (ATTProtocolDataUnit) -> () = {
                    self.log?("Response: \($0)")
                    self.sendContinuations[id] = nil
                    continuation.resume(returning: ATTResponse<Response>($0))
                }
                guard let _ = await self.connection.queue(request, response: (callback, responseType))
                    else { fatalError("Could not add PDU to queue: \(request)") }
                // store continuation in case it doesnt get called
                self.sendContinuations[id] = { error in
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func send<Request: ATTProtocolDataUnit>(_ request: Request) async {
        log?("Request: \(request)")
        assert(Request.attributeOpcode.type != .response)
        guard let _ = await connection.queue(request)
            else { fatalError("Could not add PDU to queue: \(request)") }
    }
    
    private func endHandle(
        for characteristic: Characteristic,
        service: (declaration: Service, characteristics: [Characteristic])
    ) -> UInt16 {
        
        // calculate ending handle of characteristic
        let end: UInt16
        
        guard let index = service.characteristics.firstIndex(where: { $0.handle.declaration == characteristic.handle.declaration })
            else { fatalError("Invalid characteristics \(service.characteristics.map { $0.uuid })") }
        
        let nextIndex = index + 1
        
        // get start handle of next characteristic
        if nextIndex < service.characteristics.count {
            let nextCharacteristic = service.characteristics[nextIndex]
            end = nextCharacteristic.handle.declaration - 1
        } else {
            // use service end handle
            end = service.declaration.end
        }
        // FIXME: Handle descriptors
        
        return end
    }
    
    // MARK: Requests
    
    /// Exchange MTU (should only be called once if not using default MTU)
    internal func exchangeMTU() async throws {
        assert(didExchangeMTU == false)
        let clientMTU = preferredMaximumTransmissionUnit
        let request = ATTMaximumTransmissionUnitRequest(clientMTU: clientMTU.rawValue)
        let response = try await send(request, response: ATTMaximumTransmissionUnitResponse.self)
        await exchangeMTUResponse(response)
    }
    
    private func discoverServices(
        uuid: BluetoothUUID? = nil,
        start: UInt16 = 0x0001,
        end: UInt16 = 0xffff,
        primary: Bool = true
    ) async throws -> [Service] {
        // queue MTU exchange if not default value
        if didExchangeMTU == false, preferredMaximumTransmissionUnit > .default {
            try await self.exchangeMTU()
        }
        // request services
        let attributeType = GATTUUID(primaryService: primary)
        var operation = ServiceDiscoveryOperation(
            uuid: uuid,
            start: start,
            end: end,
            type: attributeType
        )
        if let uuid = uuid {
            let request = ATTFindByTypeRequest(
                startHandle: start,
                endHandle: end,
                attributeType: attributeType.rawValue,
                attributeValue: uuid.littleEndian.data
            )
            let response = try await send(request, response: ATTFindByTypeResponse.self)
            try await findByTypeResponse(response, &operation)
        } else {
            let request = ATTReadByGroupTypeRequest(
                startHandle: start,
                endHandle: end,
                type: attributeType.uuid
            )
            let response = try await send(request, response: ATTReadByGroupTypeResponse.self)
            try await readByGroupTypeResponse(response, &operation)
        }
        return operation.foundServices
    }
    
    private func discoverCharacteristics(
        uuid: BluetoothUUID? = nil,
        service: Service
    ) async throws -> [Characteristic] {
        let attributeType = GATTUUID.characteristic
        var operation = CharacteristicDiscoveryOperation(
            uuid: uuid,
            start: service.handle,
            end: service.end,
            type: attributeType
        )
        let request = ATTReadByTypeRequest(
            startHandle: service.handle,
            endHandle: service.end,
            attributeType: attributeType.uuid
        )
        let response = try await send(request, response: ATTReadByTypeResponse.self)
        try await readByTypeResponse(response, &operation)
        return operation.foundCharacteristics
    }
    
    private func discoverDescriptors(_ operation: inout DescriptorDiscoveryOperation) async throws {
        assert(operation.start <= operation.end, "Invalid range")
        let request = ATTFindInformationRequest(startHandle: operation.start, endHandle: operation.end)
        let response = try await send(request, response: ATTFindInformationResponse.self)
        try await findInformationResponse(response, &operation)
    }
    
    /// Read Characteristic Value
    ///
    /// This sub-procedure is used to read a Characteristic Value from a server when the client knows
    /// the Characteristic Value Handle.
    ///
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/ReadCharacteristicValue.png)
    private func readAttributeValue(_ handle: UInt16) async throws -> Data {
        // The Attribute Protocol Read Request is used with the
        // Attribute Handle parameter set to the Characteristic Value Handle.
        // The Read Response returns the Characteristic Value in the Attribute Value parameter.
        // read value and try to read blob if too big
        var operation = ReadOperation(handle: handle)
        let request = ATTReadRequest(handle: handle)
        let response = try await send(request, response: ATTReadResponse.self)
        try await readResponse(response, &operation)
        return operation.data
    }
    
    /// Read Long Characteristic Value
    ///
    /// This sub-procedure is used to read a Characteristic Value from a server when the client knows
    /// the Characteristic Value Handle and the length of the Characteristic Value is longer than can
    /// be sent in a single Read Response Attribute Protocol message.
    ///
    /// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/ReadLongCharacteristicValues.png)
    @inline(__always)
    private func readLongAttributeValue(_ operation: inout ReadOperation) async throws {
        
        // The Attribute Protocol Read Blob Request is used to perform this sub-procedure.
        // The Attribute Handle shall be set to the Characteristic Value Handle of the Characteristic Value to be read.
        // The Value Offset parameter shall be the offset within the Characteristic Value to be read. To read the
        // complete Characteristic Value the offset should be set to 0x00 for the first Read Blob Request.
        // The offset for subsequent Read Blob Requests is the next octet that has yet to be read.
        // The Read Blob Request is repeated until the Read Blob Response’s Part Attribute Value parameter is shorter than (ATT_MTU-1).
        
        let request = ATTReadBlobRequest(
            handle: operation.handle,
            offset: operation.offset
        )
        let response = try await send(request, response: ATTReadBlobResponse.self)
        try await readBlobResponse(response, &operation)
    }
    
    private func writeAttribute(
        _ handle: UInt16,
        data: Data,
        withResponse: Bool
    ) async throws {
        // short value
        let shortValueLength = await Int(maximumTransmissionUnit.rawValue) - 3 // ATT_MTU - 3
        if data.count <= shortValueLength {
            if withResponse {
                try await writeAttributeValue(handle, data: data)
            } else {
                try await writeAttributeCommand(handle, data: data)
            }
        } else {
            try await writeLongAttributeValue(
                handle,
                data: data,
                reliableWrites: withResponse
            )
        }
    }
    
    private func writeAttributeCommand(_ attribute: UInt16, data: Data) async throws {
        let length = await Int(maximumTransmissionUnit.rawValue) - 3
        let data = Data(data.prefix(length))
        let command = ATTWriteCommand(handle: attribute, value: data)
        await send(command)
    }
    
    /// Write attribute request.
    private func writeAttributeValue(
        _ attribute: UInt16,
        data: Data
    ) async throws {
        let length = await Int(maximumTransmissionUnit.rawValue) - 3
        let data = Data(data.prefix(length))
        let request = ATTWriteRequest(handle: attribute, value: data)
        let response = try await send(request, response: ATTWriteResponse.self)
        /**
         Write Response
         
         A Write Response shall be sent by the server if the write of the Characteristic Value succeeded.
         
         An Error Response shall be sent by the server in response to the Write Request if insufficient authentication, insufficient authorization, insufficient encryption key size is used by the client, or if a write operation is not permitted on the Characteristic Value. The Error Code parameter is set as specified in the Attribute Protocol. If the Characteristic Value that is written is the wrong size, or has an invalid value as defined by the profile, then the value shall not be written and an Error Response shall be sent with the Error Code set to Application Error by the server.
         */
        let _ = try response
            .mapError({ GATTClientError.errorResponse($0) })
            .get()
    }
    
    private func writeLongAttributeValue(
        _ attribute: UInt16,
        data: Data,
        reliableWrites: Bool = false
    ) async throws {
        
        // The Attribute Protocol Prepare Write Request and Execute Write Request are used to perform this sub-procedure.
        // The Attribute Handle parameter shall be set to the Characteristic Value Handle of the Characteristic Value to be written.
        // The Part Attribute Value parameter shall be set to the part of the Attribute Value that is being written.
        // The Value Offset parameter shall be the offset within the Characteristic Value to be written.
        // To write the complete Characteristic Value the offset should be set to 0x0000 for the first Prepare Write Request.
        // The offset for subsequent Prepare Write Requests is the next octet that has yet to be written.
        // The Prepare Write Request is repeated until the complete Characteristic Value has been transferred,
        // after which an Executive Write Request is used to write the complete value.
        
        guard inLongWrite == false
            else { throw GATTClientError.inLongWrite }
        
        let partLength = await Int(maximumTransmissionUnit.rawValue) - 5
        let firstValuePart = Data(data.prefix(partLength))
        
        let request = ATTPrepareWriteRequest(
            handle: attribute,
            offset: 0x00,
            partValue: firstValuePart
        )
        
        var operation = WriteOperation(
            handle: attribute,
            data: data,
            reliableWrites: reliableWrites,
            lastRequest: request
        )
        
        let response = try await send(request, response: ATTPrepareWriteResponse.self)
        try await prepareWriteResponse(response, &operation)
    }
    
    /**
     Signed Write Without Response
     
     This sub-procedure is used to write a Characteristic Value to a server when the client knows the Characteristic Value Handle and the ATT Bearer is not encrypted. This sub-procedure shall only be used if the Characteristic Properties authenticated bit is enabled and the client and server device share a bond.
     
     If the authenticated Characteristic Value that is written is the wrong size, has an invalid value as defined by the profile, or the signed value does not authenticate the client, then the write shall not succeed and no error shall be gener- ated by the server.
     
     ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/SignedWriteWithoutResponse.png)
     
     - Note: On BR/EDR, the ATT Bearer is always encrypted, due to the use of Security Mode 4, therefore this sub-procedure shall not be used.
     */
    private func writeSignedCharacteristicCommand(
        _ characteristic: Characteristic,
        data: Data
    ) async throws {
        
        // This sub-procedure only writes the first (ATT_MTU – 15) octets of an Attribute Value.
        // This sub-procedure cannot be used to write a long Attribute.
        
        // The Attribute Protocol Write Command is used for this sub-procedure.
        // The Attribute Handle parameter shall be set to the Characteristic Value Handle.
        // The Attribute Value parameter shall be set to the new Characteristic Value authenticated by signing the value.
        
        // If a connection is already encrypted with LE security mode 1, level 2 or level 3 as defined in [Vol 3] Part C,
        // Section 10.2 then, a Write Without Response as defined in Section 4.9.1 shall be used instead of
        // a Signed Write Without Response.
        
        let dataLength = await Int(maximumTransmissionUnit.rawValue) - 15
        let data = Data(data.prefix(dataLength))
        
        // TODO: Sign Data
        
        let pdu = ATTWriteCommand(handle: characteristic.handle.value, value: data)
        await send(pdu)
    }
    
    // MARK: - Callbacks
    
    private func exchangeMTUResponse(_ response: ATTResponse<ATTMaximumTransmissionUnitResponse>) async {
        assert(didExchangeMTU == false)
        switch response {
        case let .failure(errorResponse):
            log?("Could not exchange MTU: \(errorResponse)")
        case let .success(pdu):
            let clientMTU = preferredMaximumTransmissionUnit
            let finalMTU = ATTMaximumTransmissionUnit(server: pdu.serverMTU, client: clientMTU.rawValue)
            log?("MTU Exchange (\(clientMTU) -> \(finalMTU))")
            await self.connection.setMaximumTransmissionUnit(finalMTU)
            self.didExchangeMTU = true
        }
    }
    
    private func readByGroupTypeResponse(
        _ response: ATTResponse<ATTReadByGroupTypeResponse>,
        _ operation: inout ServiceDiscoveryOperation
    ) async throws {
        
        // Read By Group Type Response returns a list of Attribute Handle, End Group Handle, and Attribute Value tuples
        // corresponding to the services supported by the server. Each Attribute Value contained in the response is the 
        // Service UUID of a service supported by the server. The Attribute Handle is the handle for the service declaration.
        // The End Group Handle is the handle of the last attribute within the service definition. 
        // The Read By Group Type Request shall be called again with the Starting Handle set to one greater than the 
        // last End Group Handle in the Read By Group Type Response.
        
        switch response {
        case let .failure(errorResponse):
            guard errorResponse.error != .attributeNotFound else {
                return
            }
            throw Error.errorResponse(errorResponse)
        case let .success(response):
            // store PDU values
            for serviceData in response.attributeData {
                guard let littleEndianServiceUUID = BluetoothUUID(data: serviceData.value) else {
                    throw Error.invalidResponse(response)
                }
                let serviceUUID = BluetoothUUID(littleEndian: littleEndianServiceUUID)
                let service = Service(
                    uuid: serviceUUID,
                    isPrimary: operation.type == .primaryService,
                    handle: serviceData.attributeHandle,
                    end: serviceData.endGroupHandle
                )
                operation.foundServices.append(service)
            }
            
            // get more if possible
            let lastEnd = response.attributeData.last?.endGroupHandle ?? 0x00
            
            // prevent infinite loop
            guard lastEnd >= operation.start else {
                throw Error.invalidResponse(response)
            }
            
            guard lastEnd < .max // End of database
                else { return }
            
            operation.start = lastEnd + 1
            
            if lastEnd < operation.end {
                let request = ATTReadByGroupTypeRequest(
                    startHandle: operation.start,
                    endHandle: operation.end,
                    type: operation.type.uuid
                )
                let response = try await send(request, response: ATTReadByGroupTypeResponse.self)
                try await readByGroupTypeResponse(response, &operation)
            }
        }
    }
    
    private func findByTypeResponse(
        _ response: ATTResponse<ATTFindByTypeResponse>,
        _ operation: inout ServiceDiscoveryOperation
    ) async throws {
        // Find By Type Value Response returns a list of Attribute Handle ranges.
        // The Attribute Handle range is the starting handle and the ending handle of the service definition.
        // If the Attribute Handle range for the Service UUID being searched is returned and the End Found Handle 
        // is not 0xFFFF, the Find By Type Value Request may be called again with the Starting Handle set to one 
        // greater than the last Attribute Handle range in the Find By Type Value Response.
        switch response {
        case let .failure(errorResponse):
            guard errorResponse.error != .attributeNotFound else {
                return
            }
            throw GATTClientError.errorResponse(errorResponse)
        case let .success(response):
            guard let serviceUUID = operation.uuid
                else { fatalError("Should have UUID specified") }
            
            // pre-allocate array
            operation.foundServices.reserveCapacity(operation.foundServices.count + response.handles.count)
            
            // store PDU values
            for serviceData in response.handles {
                let service = Service(
                    uuid: serviceUUID,
                    isPrimary: operation.type == .primaryService,
                    handle: serviceData.foundAttribute,
                    end: serviceData.groupEnd
                )
                operation.foundServices.append(service)
            }
            
            // get more if possible
            let lastEnd = response.handles.last?.groupEnd ?? 0x00
            
            guard lastEnd < .max // End of database
                else { return }
            
            operation.start = lastEnd + 1
            
            // need to continue scanning
            if lastEnd < operation.end {
                let request = ATTFindByTypeRequest(
                    startHandle: operation.start,
                    endHandle: operation.end,
                    attributeType: operation.type.rawValue,
                    attributeValue: serviceUUID.littleEndian.data
                )
                let response = try await send(request, response: ATTFindByTypeResponse.self)
                try await findByTypeResponse(response, &operation)
            }
        }
    }
    
    private func findInformationResponse(
        _ response: ATTResponse<ATTFindInformationResponse>,
        _ operation: inout DescriptorDiscoveryOperation
    ) async throws {
        
        /**
         Two possible responses can be sent from the server for the Find Information Request: Find Information Response and Error Response.
         
         Error Response is returned if an error occurred on the server.
         
         Find Information Response returns a list of Attribute Handle and Attribute Value pairs corresponding to the characteristic descriptors in the characteristic definition. The Attribute Handle is the handle for the characteristic descriptor declaration. The Attribute Value is the Characteristic Descriptor UUID.
         
         The Find Information Request shall be called again with the Starting Handle set to one greater than the last Attribute Handle in the Find Information Response.
         
         The sub-procedure is complete when the Error Response is received and the Error Code is set to Attribute Not Found or the Find Information Response has an Attribute Handle that is equal to the Ending Handle of the request.
         
         It is permitted to end the sub-procedure early if a desired Characteristic Descriptor is found prior to discovering all the characteristic descriptors of the specified characteristic.
         */
        
        switch response {
        case let .failure(errorResponse):
            guard errorResponse.error != .attributeNotFound else {
                return
            }
            throw GATTClientError.errorResponse(errorResponse)
        case let .success(pdu):
            
            // pre-allocate array
            //operation.foundDescriptors.reserveCapacity(operation.foundDescriptors.count + pdu.data.count)
            
            let foundData: [Descriptor]
            
            switch pdu.attributeData {
            case let .bit16(values):
                foundData = values.map { Descriptor(uuid: .bit16($0.uuid), handle: $0.handle) }
            case let .bit128(values):
                foundData = values.map { Descriptor(uuid: .bit128($0.uuid), handle: $0.handle) }
            }
            
            operation.foundDescriptors += foundData
            
            // get more if possible
            let lastHandle = foundData.last?.handle ?? 0x00
            
            // prevent infinite loop
            guard lastHandle >= operation.start
                else { throw Error.invalidResponse(pdu) }
            
            guard lastHandle < .max // End of database
                else { return }
            
            let start = lastHandle + 1
            
            // need to continue discovery
            if lastHandle != 0, start < operation.end {
                operation.start = start
                try await discoverDescriptors(&operation)
            }
        }
    }
    
    private func readByTypeResponse(
        _ response: ATTResponse<ATTReadByTypeResponse>,
        _ operation: inout CharacteristicDiscoveryOperation
    ) async throws {
        
        typealias DeclarationAttribute = GATTDatabase.CharacteristicDeclarationAttribute
        typealias Attribute = GATTDatabase.Attribute
        
        // Read By Type Response returns a list of Attribute Handle and Attribute Value pairs corresponding to the
        // characteristics in the service definition. The Attribute Handle is the handle for the characteristic declaration. 
        // The Attribute Value is the Characteristic Properties, Characteristic Value Handle and Characteristic UUID. 
        // The Read By Type Request shall be called again with the Starting Handle set to one greater than the last 
        // Attribute Handle in the Read By Type Response.
        
        switch response {
        case let .failure(errorResponse):
            guard errorResponse.error != .attributeNotFound else {
                return
            }
            throw GATTClientError.errorResponse(errorResponse)
        case let .success(pdu):
            
            // pre-allocate array
            //operation.foundCharacteristics.reserveCapacity(operation.foundCharacteristics.count + pdu.data.count)
            
            // parse pdu data
            for characteristicData in pdu.attributeData {
                
                let handle = characteristicData.handle
                
                let attribute = Attribute(
                    handle: handle,
                    uuid: .characteristic,
                    value: Data(characteristicData.value),
                    permissions: [.read]
                )
                
                guard let declaration = DeclarationAttribute(attribute: attribute)
                    else { throw Error.invalidResponse(pdu) }
                
                let characteristic = Characteristic(uuid: declaration.uuid,
                                                    properties: declaration.properties,
                                                    handle: (handle, declaration.valueHandle))
                
                operation.foundCharacteristics.append(characteristic)
                
                // if we specified a UUID to be searched,
                // then call completion if it matches
                if let operationUUID = operation.uuid {
                    guard characteristic.uuid != operationUUID
                        else { return }
                }
            }
            
            // get more if possible
            let lastEnd = pdu.attributeData.last?.handle ?? 0x00
            
            // prevent infinite loop
            guard lastEnd >= operation.start
                else { throw Error.invalidResponse(pdu) }
            
            operation.start = lastEnd + 1
            
            // need to continue discovery
            if lastEnd != 0, operation.start < operation.end {
                let request = ATTReadByTypeRequest(
                    startHandle: operation.start,
                    endHandle: operation.end,
                    attributeType: operation.type.uuid
                )
                let response = try await send(request, response: ATTReadByTypeResponse.self)
                try await readByTypeResponse(response, &operation)
            }
        }
    }
    
    /// Read Characteristic (or Descriptor) Value Response
    private func readResponse(
        _ response: ATTResponse<ATTReadResponse>,
        _ operation: inout ReadOperation
    ) async throws {
        
        // The Read Response only contains a Characteristic Value that is less than or equal to (ATT_MTU – 1) octets in length.
        // If the Characteristic Value is greater than (ATT_MTU – 1) octets in length, the Read Long Characteristic Value procedure
        // may be used if the rest of the Characteristic Value is required.
        
        switch response {
        case let .failure(responseError):
            guard responseError.error != .invalidOffset || operation.data.isEmpty else {
                assert(responseError.error == .invalidOffset && operation.data.isEmpty == false)
                return
            }
            throw GATTClientError.errorResponse(responseError)
        case let .success(response):
            operation.data = response.attributeValue
            // short value
            let expectedLength = await Int(maximumTransmissionUnit.rawValue) - 1
            guard response.attributeValue.count >= expectedLength else {
                assert(response.attributeValue.count < expectedLength)
                return
            }
            // read blob
            try await readLongAttributeValue(&operation)
        }
    }
    
    /// Read Blob Response
    private func readBlobResponse(
        _ response: ATTResponse<ATTReadBlobResponse>,
        _ operation: inout ReadOperation
    ) async throws {
        
        // For each Read Blob Request a Read Blob Response is received with a portion of the Characteristic Value contained in the Part Attribute Value parameter.
        switch response {
        case let .failure(responseError):
            guard responseError.error != .invalidOffset || operation.data.isEmpty else {
                assert(responseError.error == .invalidOffset && operation.data.isEmpty == false)
                return
            }
            throw GATTClientError.errorResponse(responseError)
        case let .success(response):
            operation.data += response.partAttributeValue
            // keep on reading long value
            let expectedLength = await Int(maximumTransmissionUnit.rawValue) - 1
            guard response.partAttributeValue.count >= expectedLength else {
                // no more value
                assert(response.partAttributeValue.count < expectedLength)
                return
            }
            // read blob
            try await readLongAttributeValue(&operation)
        }
    }
    
    /**
     Prepare Write Response
     
     An Error Response shall be sent by the server in response to the Prepare Write Request if insufficient authentication, insufficient authorization, insufficient encryption key size is used by the client, or if a write operation is not permitted on the Characteristic Value. The Error Code parameter is set as specified in the Attribute Protocol. If the Attribute Value that is written is the wrong size, or has an invalid value as defined by the profile, then the write shall not succeed and an Error Response shall be sent with the Error Code set to Application Error by the server.
     */
    private func prepareWriteResponse(
        _ response: ATTResponse<ATTPrepareWriteResponse>,
        _ operation: inout WriteOperation
    ) async throws {
        
        switch response {
        case let .failure(errorResponse):
            inLongWrite = false
            throw GATTClientError.errorResponse(errorResponse)
        case let .success(pdu):
            // append recieved data
            operation.receivedData += pdu.partValue
            
            // verify data sent
            if operation.reliableWrites {
                
                guard pdu.handle == operation.lastRequest.handle,
                    pdu.offset == operation.lastRequest.offset,
                    pdu.partValue == operation.lastRequest.partValue else {
                        inLongWrite = false
                        throw GATTClientError.invalidResponse(pdu)
                    }
            }
            
            let offset = Int(operation.lastRequest.offset) + operation.lastRequest.partValue.count
            
            // prepare write responses
            if offset < operation.data.count {
                
                // write next part
                let maxLength = await Int(maximumTransmissionUnit.rawValue) - 5
                let endIndex = min(offset + maxLength, operation.data.count)
                let attributeValuePart = operation.data.subdataNoCopy(in: offset ..< endIndex)
                
                let request = ATTPrepareWriteRequest(
                    handle: operation.lastRequest.handle,
                    offset: UInt16(offset),
                    partValue: attributeValuePart
                )
                
                operation.lastRequest = request
                operation.sentData += attributeValuePart
                
                let response = try await send(request, response: ATTPrepareWriteResponse.self)
                try await prepareWriteResponse(response, &operation)
                
            } else {
                
                assert(offset == operation.data.count)
                assert(operation.receivedData == operation.sentData)
                
                // all data sent
                let request = ATTExecuteWriteRequest.write
                let response = try await send(request, response: ATTExecuteWriteResponse.self)
                try executeWriteResponse(response)
            }
        }
    }
    
    private func executeWriteResponse(
        _ response: ATTResponse<ATTExecuteWriteResponse>
    ) throws {
        
        inLongWrite = false
        switch response {
        case let .failure(errorResponse):
            throw GATTClientError.errorResponse(errorResponse)
        case .success:
            return
        }
    }
    
    private func notification(_ notification: ATTHandleValueNotification) {
        guard let handler = notifications[notification.handle] else {
            log?("Recieved notification for unregistered handle \(notification.handle)")
            return
        }
        // callback
        handler(notification.value)
    }
    
    private func indication(_ indication: ATTHandleValueIndication) async {
        let confirmation = ATTHandleValueConfirmation()
        // send acknowledgement
        await send(confirmation)
        // callback
        guard let handler = indications[indication.handle] else {
            log?("Recieved indication for unregistered handle \(indication.handle)")
            return
        }
        handler(indication.value)
    }
}

// MARK: - Supporting Types

public extension GATTClient {
    
    typealias Error = GATTClientError
        
    typealias Notification = (Data) -> ()
}

public enum GATTClientError: Error {
    
    /// The GATT server responded with an error response.
    case errorResponse(ATTErrorResponse)
    
    /// The GATT server responded with a PDU that has invalid values.
    case invalidResponse(ATTProtocolDataUnit)
    
    /// Already writing long value.
    case inLongWrite
    
    /// Characteristic missing client configuration descriptor.
    case clientCharacteristicConfigurationNotAllowed(GATTClient.Characteristic)
}

// MARK: CustomNSError

#if canImport(Darwin)

extension GATTClientError: CustomNSError {
    
    public enum UserInfoKey: String {
        
        case response = "org.pureswift.Bluetooth.GATTClientError.response"
        case characteristic = "org.pureswift.Bluetooth.GATTClientError.characteristic"
    }
    
    public static var errorDomain: String {
        return "org.pureswift.Bluetooth.GATTClientError"
    }
    
    public var errorUserInfo: [String: Any] {
        
        var userInfo = [String: Any]()
        
        switch self {
            
        case let .errorResponse(response):
            
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString(
                "GATT Server responded with an error response (\(response.error)).",
                comment: "org.pureswift.Bluetooth.GATTClientError.errorResponse"
            )
            userInfo[NSUnderlyingErrorKey] = response as NSError
            userInfo[UserInfoKey.response.rawValue] = response
            
        case let .invalidResponse(response):
            
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString(
                "GATT Server responded with an invalid response (\(type(of: response).attributeOpcode).",
                comment: "org.pureswift.Bluetooth.GATTClientError.invalidResponse"
            )
            userInfo[UserInfoKey.response.rawValue] = response
            
        case .inLongWrite:
            
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString(
                "GATT Client already in long write.",
                comment: "org.pureswift.Bluetooth.GATTClientError.inLongWrite"
            )
            
        case let .clientCharacteristicConfigurationNotAllowed(characteristic):
            
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString(
                "Characteristic \(characteristic.uuid) doesn't allow for client characteristic configuration.",
                comment: "org.pureswift.Bluetooth.GATTClientError.clientCharacteristicConfigurationNotAllowed"
            )
            userInfo[UserInfoKey.characteristic.rawValue] = characteristic
        }
        
        return userInfo
    }
}

#endif

internal typealias GATTClientResponse <Value> = Result<Value, GATTClientError>

public extension GATTClient {
    
    /// A discovered service.
    struct Service {
        
        public let uuid: BluetoothUUID
        
        public let isPrimary: Bool
        
        public let handle: UInt16
        
        public let end: UInt16
    }
    
    /// A discovered characteristic.
    struct Characteristic {
        
        public typealias Property = GATTCharacteristicProperty
        
        public let uuid: BluetoothUUID
        
        public let properties: BitMaskOptionSet<Property>
        
        public let handle: (declaration: UInt16, value: UInt16)
    }
    
    /// A discovered descriptor
    struct Descriptor {
        
        public let uuid: BluetoothUUID
        
        public let handle: UInt16
    }
}


internal extension GATTClient {
    
    struct ServiceDiscoveryOperation {
        
        let uuid: BluetoothUUID?
        
        var start: UInt16 {
            didSet { assert(start <= end, "Start Handle should always be less than or equal to End handle") }
        }
        
        let end: UInt16
        
        let type: GATTUUID
        
        var foundServices = [Service]()
    }
    
    struct CharacteristicDiscoveryOperation {
        
        let uuid: BluetoothUUID?
        
        var start: UInt16 {
            didSet { assert(start <= end, "Start Handle should always be less than or equal to End handle") }
        }
        
        let end: UInt16
        
        let type: GATTUUID
        
        var foundCharacteristics = [Characteristic]()
    }

    struct DescriptorDiscoveryOperation {
        
        var start: UInt16 {
            didSet { assert(start <= end, "Start Handle should always be less than or equal to End handle") }
        }
        
        let end: UInt16
        
        var foundDescriptors = [GATTClient.Descriptor]()
    }
    
    struct ReadOperation {
        
        let handle: UInt16
        
        var data = Data()
                
        var offset: UInt16 {
            return UInt16(data.count)
        }
        
        init(handle: UInt16) {
            self.handle = handle
        }
    }
    
    struct WriteOperation {
                
        let handle: UInt16
                
        let reliableWrites: Bool
        
        let data: Data
        
        var sentData: Data
        
        var receivedData: Data
        
        var lastRequest: ATTPrepareWriteRequest
        
        init(handle: UInt16,
             data: Data,
             reliableWrites: Bool,
             lastRequest: ATTPrepareWriteRequest) {
            
            precondition(data.isEmpty == false)
            
            self.handle = handle
            self.data = data
            self.reliableWrites = reliableWrites
            self.lastRequest = lastRequest
            self.sentData = lastRequest.partValue
            self.receivedData = Data()
        }
    }
}
#endif
