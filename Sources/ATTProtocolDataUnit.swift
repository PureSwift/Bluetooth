//
//  ATTProtocolDataUnit.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Protocol Definition

/// Data packet for the ATT protocol.
public protocol ATTProtocolDataUnit {
    
    /// The PDU's attribute opcode.
    static var attributeOpcode: ATT.Opcode { get }
    
    /// Converts PDU to raw bytes (little-endian).
    var byteValue: [UInt8] { get }
    
    /// Initializes PDU from raw bytes (little-endian).
    init?(byteValue: [UInt8])
}

// MARK: - Error Handling

/// The Error Response is used to state that a given request cannot be performed,
/// and to provide the reason.
///
/// - Note: The Write Command does not generate an Error Response.
public struct ATTErrorResponse: ATTProtocolDataUnit, Error {
    
    public static let attributeOpcode = ATT.Opcode.ErrorResponse
    public static let length = 5
    
    /// The request that generated this error response
    public var requestOpcode: ATT.Opcode
    
    /// The attribute handle that generated this error response.
    public var attributeHandle: UInt16
    
    /// The reason why the request has generated an error response.
    public var errorCode: ATT.Error
    
    public init(requestOpcode: ATT.Opcode, attributeHandle: UInt16, error: ATT.Error) {
        
        self.requestOpcode = requestOpcode
        self.attributeHandle = attributeHandle
        self.errorCode = error
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == ATTErrorResponse.length else { return nil }
        
        let attributeOpcodeByte     = byteValue[0]
        let requestOpcodeByte       = byteValue[1]
        let attributeHandleByte1    = byteValue[2]
        let attributeHandleByte2    = byteValue[3]
        let errorByte               = byteValue[4]
        
        guard attributeOpcodeByte == ATTErrorResponse.attributeOpcode.rawValue,
            let requestOpcode = ATTOpcode(rawValue: requestOpcodeByte),
            let errorCode = ATTError(rawValue: errorByte)
            else { return nil }
        
        self.requestOpcode = requestOpcode
        self.errorCode = errorCode
        self.attributeHandle = UInt16(bytes: (attributeHandleByte1, attributeHandleByte2)).littleEndian
    }
    
    public var byteValue: [UInt8] {
        
        var bytes = [UInt8](repeating: 0, count: ATTErrorResponse.length)
        
        bytes[0] = ATTErrorResponse.attributeOpcode.rawValue
        bytes[1] = requestOpcode.rawValue
        bytes[2] = attributeHandle.littleEndian.bytes.0
        bytes[3] = attributeHandle.littleEndian.bytes.1
        bytes[4] = errorCode.rawValue
        
        return bytes
    }
}

// MARK: - MTU Exchange

/// Exchange MTU Request
///
/// The *Exchange MTU Request* is used by the client to inform the server of the client’s maximum receive MTU
/// size and request the server to respond with its maximum receive MTU size.
///
/// - Note: This request shall only be sent once during a connection by the client. 
/// The *Client Rx MTU* parameter shall be set to the maximum size of the attribute protocol PDU that the client can receive.
public struct ATTMaximumTransmissionUnitRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.MaximumTransmissionUnitRequest
    public static let length = 3
    
    /// Client Rx MTU
    public var clientMTU: UInt16
    
    public init(clientMTU: UInt16 = 0) {
        
        self.clientMTU = clientMTU
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.clientMTU = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
    }
    
    public var byteValue: [UInt8] {
        
        var bytes = [UInt8](repeating: 0, count: type(of: self).length)
        
        bytes[0] = type(of: self).attributeOpcode.rawValue
        
        let mtuBytes = self.clientMTU.littleEndian.bytes
        
        bytes[1] = mtuBytes.0
        bytes[2] = mtuBytes.1
        
        return bytes
    }
}

///  Exchange MTU Response
///
/// The *Exchange MTU Response* is sent in reply to a received *Exchange MTU Request*.
public struct ATTMaximumTransmissionUnitResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.MaximumTransmissionUnitResponse
    public static let length = 3
    
    /// Server Rx MTU
    public var serverMTU: UInt16
    
    public init(serverMTU: UInt16 = 0) {
        
        self.serverMTU = serverMTU
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.serverMTU = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
    }
    
    public var byteValue: [UInt8] {
        
        var bytes = [UInt8](repeating: 0, count: type(of: self).length)
        
        bytes[0] = type(of: self).attributeOpcode.rawValue
        
        let mtuBytes = self.serverMTU.littleEndian.bytes
        
        bytes[1] = mtuBytes.0
        bytes[2] = mtuBytes.1
        
        return bytes
    }
}

// MARK: - Find Information

/// Find Information Request
///
/// The *Find Information Request* is used to obtain the mapping of attribute handles with their associated types. 
/// This allows a client to discover the list of attributes and their types on a server.
public struct ATTFindInformationRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.FindInformationRequest
    public static let length = 5
    
    public var startHandle: UInt16
    
    public var endHandle: UInt16
    
    public init(startHandle: UInt16 = 0, endHandle: UInt16 = 0) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        self.endHandle = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
    }
    
    public var byteValue: [UInt8] {
        
        var bytes = [UInt8](repeating: 0, count: type(of: self).length)
        
        bytes[0] = type(of: self).attributeOpcode.rawValue
        
        let startHandleBytes = self.startHandle.littleEndian.bytes
        let endHandleBytes = self.endHandle.littleEndian.bytes
        
        bytes[1] = startHandleBytes.0
        bytes[2] = startHandleBytes.1
        
        bytes[3] = endHandleBytes.0
        bytes[4] = endHandleBytes.1
        
        return bytes
    }
}

/// Find Information Response
///
/// The *Find Information Response* is sent in reply to a received *Find Information Request* 
/// and contains information about this server.
public struct ATTFindInformationResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.FindInformationRequest
    
    /// Length ranges from 6, to the maximum MTU size.
    public static let length = 8
    
    /// The information data whose format is determined by the Format field.
    public var data: Data
    
    public init(data: Data) {
        
        self.data = data
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTFindInformationResponse.length else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        let formatByte = byteValue[1]
        let remainderData = Array(byteValue.suffix(from: 2))
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue,
            let format = Format(rawValue: formatByte),
            let data = Data(byteValue: remainderData, format: format)
            else { return nil }
        
        self.data = data
    }
    
    public var byteValue: [UInt8] {
        
        // first 2 bytes are opcode and format
        return [type(of: self).attributeOpcode.rawValue, data.format.rawValue] + data.byteValue
    }
    
    public enum Format: UInt8 {
        
        /// A list of 1 or more handles with their 16-bit Bluetooth UUIDs.
        case bit16      = 0x01
        
        /// A list of 1 or more handles with their 128-bit UUIDs.
        case bit128     = 0x02
        
        public init(UUID: BluetoothUUID) {
            
            switch UUID {
            case .bit16(_): self = .bit16
            case .bit128(_): self = .bit128
            }
        }
        
        public var length: Int {
            
            switch self {
            case .bit16: return 2 + 2
            case .bit128: return 2 + 16
            }
        }
    }
    
    public enum Data {
        
        /// Handle and 16-bit Bluetooth UUID
        case bit16([(UInt16, UInt16)])
        
        /// Handle and 128-bit UUIDs
        case bit128([(UInt16, UUID)])
        
        /// The data's format.
        public var format: Format {
            
            switch self {
                
            case .bit16(_): return .bit16
            case .bit128(_): return .bit128
                
            }
        }
        
        public init?(byteValue: [UInt8], format: Format) {
            
            let pairLength = format.length
            
            guard byteValue.count % pairLength == 0 else { return nil }
            
            let pairCount = byteValue.count / pairLength
            
            var bit16Pairs: [(UInt16, UInt16)] = []
            
            var bit128Pairs: [(UInt16, UUID)] = []
            
            for pairIndex in 0 ..< pairCount {
                
                let byteIndex = pairIndex * pairLength
                
                let pairBytes = Array(byteValue[byteIndex ..< byteIndex + pairLength])
                
                let handle = UInt16(bytes: (pairBytes[0], pairBytes[1])).littleEndian
                
                switch format {
                    
                case .bit16:
                    
                    let uuid = UInt16(bytes: (pairBytes[2], pairBytes[3])).littleEndian
                    
                    bit16Pairs.append((handle, uuid))
                    
                case .bit128:
                    
                    let uuidBytes = Array(pairBytes[2 ... 17])
                    
                    #if _endian(little)
                    let data = Foundation.Data(bytes: uuidBytes)
                    #else
                    let data = Foundation.Data(bytes: uuidBytes.reversed()) // byteSwapped
                    #endif
                    
                    let uuid = UUID(data: data)!
                    
                    bit128Pairs.append((handle, uuid))
                }
            }
            
            switch format {
                
            case .bit16: self = .bit16(bit16Pairs)
                
            case .bit128: self = .bit128(bit128Pairs)
            }
        }
        
        public var byteValue: [UInt8] {
            
            var bytes = [UInt8]()
            
            switch self {
                
            case let .bit16(value):
                
                for pair in value {
                    
                    let handleBytes = pair.0.littleEndian.bytes
                    
                    let uuidBytes = pair.1.littleEndian.bytes
                    
                    bytes += [handleBytes.0, handleBytes.1, uuidBytes.0, uuidBytes.1]
                }
                
            case let .bit128(value):
                
                for pair in value {
                    
                    let handleBytes = pair.0.littleEndian.bytes
                    
                    let uuidBytes = BluetoothUUID.bit128(pair.1).littleEndian.data
                    
                    bytes += [handleBytes.0, handleBytes.1] + uuidBytes
                }
            }
            
            return bytes
        }
    }
}

/// Find By Type Value Request
///
/// The *Find By Type Value Request* is used to obtain the handles of attributes that have a 16-bit UUID attribute type 
/// and attribute value. This allows the range of handles associated with a given attribute to be discovered when
/// the attribute type determines the grouping of a set of attributes. 
///
/// - Note: Generic Attribute Profile defines grouping of attributes by attribute type.
public struct ATTFindByTypeRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.FindByTypeRequest
    
    /// Minimum length.
    public static let length = 1 + 2 + 2 + 2 + 0
    
    /// First requested handle number
    public var startHandle: UInt16
    
    /// Last requested handle number
    public var endHandle: UInt16
    
    /// 2 octet UUID to find.
    public var attributeType: UInt16
    
    /// Attribute value to find.
    public var attributeValue: [UInt8]
    
    public init(startHandle: UInt16 = 0, endHandle: UInt16 = 0, attributeType: UInt16 = 0, attributeValue: [UInt8] = []) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
        self.attributeValue = attributeValue
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTFindByTypeRequest.length else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        self.endHandle = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
        
        self.attributeType = UInt16(bytes: (byteValue[5], byteValue[6])).littleEndian
        
        /// if attributeValue is included
        if byteValue.count >= 7 {
            
            // rest of data is attribute
            self.attributeValue = Array(byteValue.suffix(from: 7))
            
        } else {
            
            self.attributeValue = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let startHandleBytes = self.startHandle.littleEndian.bytes
        
        let endHandleBytes = self.endHandle.littleEndian.bytes
        
        let attributeTypeBytes = self.attributeType.littleEndian.bytes
        
        return [type(of: self).attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1, attributeTypeBytes.0, attributeTypeBytes.1] + attributeValue
    }
}

/// Find By Type Value Response
///
/// The *Find By Type Value Response* is sent in reply to a received *Find By Type Value Request*
/// and contains information about this server.
public struct ATTFindByTypeResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.FindByTypeResponse
    
    /// Minimum length.
    public static let length = 1 + HandlesInformation.length
    
    /// A list of 1 or more Handle Informations.
    public var handlesInformationList: [HandlesInformation]
    
    public init(handlesInformationList: [HandlesInformation]) {
        
        assert(handlesInformationList.count >= 1, "Must have at least one HandlesInformation")
        
        self.handlesInformationList = handlesInformationList
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTFindByTypeResponse.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let handleLength = HandlesInformation.length
        
        let handleBytesCount = byteValue.count - 1
        
        guard handleBytesCount % handleLength == 0 else { return nil }
        
        let handleCount = handleBytesCount / handleLength
        
        // preallocate handles for better performance
        var handles = [HandlesInformation](repeating: HandlesInformation(), count: handleCount)
        
        for index in 0 ..< handleCount {
            
            let byteIndex = (index * handleLength) + 1
            
            let handleBytes = Array(byteValue[byteIndex ..< byteIndex + handleLength])
            
            guard let handle = HandlesInformation(byteValue: handleBytes)
                else { return nil }
            
            handles[index] = handle
        }
        
        self.handlesInformationList = handles
    }
    
    public var byteValue: [UInt8] {
        
        // complex algorithm for better performance
        let handlesDataByteCount = handlesInformationList.count * HandlesInformation.length
        
        // preallocate memory to avoid performance penalty by increasing buffer
        var handlesData = [UInt8](repeating: 0, count: handlesDataByteCount)
        
        for (handleIndex, handle) in handlesInformationList.enumerated() {
            
            let startByteIndex = handleIndex * HandlesInformation.length
            
            let byteRange = startByteIndex ..< startByteIndex + HandlesInformation.length
            
            handlesData.replaceSubrange(byteRange, with: handle.byteValue)
        }
        
        return [type(of: self).attributeOpcode.rawValue] + handlesData
    }
    
    /// Handles Information
    ///
    /// For each handle that matches the attribute type and attribute value in the *Find By Type Value Request*
    /// a *Handles Information* shall be returned. 
    /// The *Found Attribute Handle* shall be set to the handle of the attribute that has the exact attribute type 
    /// and attribute value from the *Find By Type Value Request*.
    public struct HandlesInformation {
        
        public static let length = 2 + 2
        
        /// Found Attribute Handle
        public var foundAttribute: UInt16
        
        /// Group End Handle
        public var groupEnd: UInt16
        
        public init(foundAttribute: UInt16 = 0, groupEnd: UInt16 = 0) {
            
            self.foundAttribute = foundAttribute
            self.groupEnd = groupEnd
        }
        
        public init?(byteValue: [UInt8]) {
         
            guard byteValue.count == HandlesInformation.length
                else { return nil }
            
            self.foundAttribute = UInt16(bytes: (byteValue[0], byteValue[1])).littleEndian
            self.groupEnd = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
        }
        
        public var byteValue: [UInt8] {
            
            let foundAttributeBytes = foundAttribute.littleEndian.bytes
            let groupEndBytes = groupEnd.littleEndian.bytes
            
            return [foundAttributeBytes.0, foundAttributeBytes.1, groupEndBytes.0, groupEndBytes.1]
        }
    }
}

// MARK: - Reading Attributes

/// Read By Type Request
///
/// The *Read By Type Request* is used to obtain the values of attributes where the
/// attribute type is known but the handle is not known.
public struct ATTReadByTypeRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadByTypeRequest
    
    /// First requested handle number
    public var startHandle: UInt16
    
    /// Last requested handle number
    public var endHandle: UInt16
    
    /// 2 or 16 octet UUID
    public var attributeType: BluetoothUUID
    
    public init(startHandle: UInt16, endHandle: UInt16, attributeType: BluetoothUUID) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard let length = Length(rawValue: byteValue.count)
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        self.endHandle = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
        
        switch length {
            
        case .UUID16:
            
            let value = UInt16(bytes: (byteValue[5], byteValue[6])).littleEndian
            
            self.attributeType = .bit16(value)
            
        case .UUID128:
            
            self.attributeType = BluetoothUUID(littleEndian:
                BluetoothUUID(data: Data([byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9], byteValue[10], byteValue[11], byteValue[12], byteValue[13], byteValue[14], byteValue[15], byteValue[16], byteValue[17], byteValue[18], byteValue[19], byteValue[20]]))!)
        }
    }
    
    public var byteValue: [UInt8] {
        
        let startHandleBytes = startHandle.littleEndian.bytes
        
        let endHandleBytes = endHandle.littleEndian.bytes
        
        return [type(of: self).attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1] + [UInt8](attributeType.littleEndian.data)
    }
    
    private enum Length: Int {
        
        case UUID16     = 7
        case UUID128    = 21
        
        init(UUID: BluetoothUUID) {
            
            switch UUID {
                
            case .bit16(_): self = .UUID16
            case .bit128(_): self = .UUID128
            }
        }
    }
}

/// Read By Type Response
///
/// The *Read By Type Response* is sent in reply to a received *Read By Type Request*
/// and contains the handles and values of the attributes that have been read.
public struct ATTReadByTypeResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadByTypeResponse
    
    /// Minimum length
    public static let length = 1 + 1 + AttributeData.length
    
    /// A list of Attribute Data.
    public let data: [AttributeData]
    
    public init?(data: [AttributeData]) {
        
        // must have at least one attribute data
        guard data.count > 0 else { return nil }
        
        let length = data[0].value.count
        
        // length must be at least 3 bytes
        guard length >= AttributeData.length else { return nil }
        
        // validate the length of each pair
        for pair in data {
            
            guard pair.value.count == length
                else { return nil }
        }
        
        self.data = data
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTReadByTypeResponse.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let attributeDataLength = Int(byteValue[1])
        
        let attributeDataByteCount = byteValue.count - 2
        
        guard attributeDataByteCount % attributeDataLength == 0 else { return nil }
        
        let attributeDataCount = attributeDataByteCount / attributeDataLength
        
        var attributeData = [AttributeData](repeating: AttributeData(), count: attributeDataCount)
        
        for index in 0 ..< attributeDataCount  {
            
            let byteIndex = 2 + (index * attributeDataLength)
            
            let dataBytes = Array(byteValue[byteIndex ..< byteIndex + attributeDataLength])
            
            guard let data = AttributeData(byteValue: dataBytes)
                else { return nil }
            
            attributeData[index] = data
        }
        
        self.data = attributeData
    }
    
    public var byteValue: [UInt8] {
        
        let valueLength = UInt8(2 + data[0].value.count)
        
        var bytes = [type(of: self).attributeOpcode.rawValue, valueLength]
        
        for attributeData in data {
            
            bytes += attributeData.byteValue
        }
        
        return bytes
    }
    
    /// Attribute handle and value pair.
    public struct AttributeData {
        
        /// Minimum length.
        public static let length = 2
        
        /// Attribute Handle
        public var handle: UInt16
        
        /// Attribute Value
        public var value: [UInt8]
        
        public init(handle: UInt16 = 0, value: [UInt8] = []) {
            
            self.handle = handle
            self.value = value
        }
        
        public init?(byteValue: [UInt8] = []) {
            
            guard byteValue.count >= AttributeData.length
                else { return nil }
            
            self.handle = UInt16(bytes: (byteValue[0], byteValue[1])).littleEndian
            
            if byteValue.count > AttributeData.length {
                
                let startingIndex = AttributeData.length
                
                self.value = Array(byteValue.suffix(from: startingIndex))
                
            } else {
                
                self.value = []
            }
        }
        
        public var byteValue: [UInt8] {
            
            let handleBytes = handle.littleEndian.bytes
            
            return [handleBytes.0, handleBytes.1] + value
        }
    }
}

/// Read Request
///
/// The *Read Request* is used to request the server to read the value of an attribute 
/// and return its value in a *Read Response*.
public struct ATTReadRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadRequest
    public static let length = 1 + 2
    
    public var handle: UInt16
    
    public init(handle: UInt16 = 0) {
        
        self.handle = handle
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == ATTReadRequest.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == ATTReadRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
    }
    
    public var byteValue: [UInt8] {
        
        let handleBytes = handle.littleEndian.bytes
        
        return [ATTReadRequest.attributeOpcode.rawValue, handleBytes.0, handleBytes.1]
    }
}

/// Read Response
///
/// The *Read Response* is sent in reply to a received *Read Request* and contains
/// the value of the attribute that has been read.
///
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
public struct ATTReadResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadResponse
    
    /// Minimum length
    public static let length = 1 + 0
    
    /// The value of the attribute with the handle given.
    public var attributeValue: [UInt8]
    
    public init(attributeValue: [UInt8] = []) {
        
        self.attributeValue = attributeValue
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTReadRequest.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == ATTReadResponse.attributeOpcode.rawValue
            else { return nil }
        
        if byteValue.count > ATTReadRequest.length {
            
            self.attributeValue = Array(byteValue.suffix(from: 1))
            
        } else {
            
            self.attributeValue = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        return [ATTReadResponse.attributeOpcode.rawValue] + attributeValue
    }
}

/// Read Blob Request
///
/// The *Read Blob Request* is used to request the server to read part of the value of an attribute
/// at a given offset and return a specific part of the value in a *Read Blob Response*.
public struct ATTReadBlobRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadBlobRequest
    public static let length = 1 + 2 + 2
    
    /// The handle of the attribute to be read.
    public var handle: UInt16
    
    /// The offset of the first octet to be read.
    public var offset: UInt16
    
    public init(handle: UInt16 = 0, offset: UInt16 = 0) {
        
        self.handle = handle
        self.offset = offset
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == ATTReadBlobRequest.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == ATTReadBlobRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        self.offset = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
    }
    
    public var byteValue: [UInt8] {
        
        let handleBytes = handle.littleEndian.bytes
        
        let offsetBytes = offset.littleEndian.bytes
        
        return [ATTReadBlobRequest.attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1]
    }
}

/// Read Blob Response
///
/// The *Read Blob Response* is sent in reply to a received *Read Blob Request*
/// and contains part of the value of the attribute that has been read.
public struct ATTReadBlobResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadBlobResponse
    
    /// Minimum length
    public static let length = 1 + 0
    
    /// Part of the value of the attribute with the handle given. 
    ///
    ///
    /// The part attribute value shall be set to part of the value of the attribute identified 
    /// by the attribute handle and the value offset in the request.
    public var partAttributeValue: [UInt8]
    
    public init(partAttributeValue: [UInt8] = []) {
        
        self.partAttributeValue = partAttributeValue
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTReadBlobResponse.length
        else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == ATTReadBlobResponse.attributeOpcode.rawValue
            else { return nil }
        
        if byteValue.count > ATTReadBlobResponse.length {
                
            self.partAttributeValue = Array(byteValue.suffix(from: 1))
                
        } else {
            
            self.partAttributeValue = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        return [ATTReadBlobResponse.attributeOpcode.rawValue] + partAttributeValue
    }
}

/// Read Multiple Request
///
/// The *Read Multiple Request* is used to request the server to read two or more values
/// of a set of attributes and return their values in a *Read Multiple Response*.
///
/// Only values that have a known fixed size can be read, with the exception of the last value that can have a variable length.
/// The knowledge of whether attributes have a known fixed size is defined in a higher layer specification.
public struct ATTReadMultipleRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadMultipleRequest
    
    /// Minimum length
    public static let length = 1 + 4
    
    public var handles: [UInt16]
    
    public init?(handles: [UInt16]) {
        
        guard handles.count >= 2
            else { return nil }
        
        self.handles = handles
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTReadBlobResponse.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        let handleCount = (byteValue.count - 1) / 2
        
        guard (byteValue.count - 1) % 2 == 0
            else { return nil }
        
        // preallocate handle buffer
        var handles = [UInt16](repeating: 0, count: handleCount)
        
        for index in 0 ..< handleCount {
            
            let handleIndex = 1 + (index * 2)
            
            let handle = UInt16(bytes: (byteValue[handleIndex], byteValue[handleIndex + 1])).littleEndian
            
            handles[index] = handle
        }
        
        self.handles = handles
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTReadBlobResponse.self
        
        var handlesBytes = [UInt8](repeating: 0, count: handles.count * 2)
        
        for handle in handles {
            
            let handleBytes = handle.littleEndian.bytes
            
            let handleByteIndex = handles.count * 2
            
            handlesBytes[handleByteIndex] = handleBytes.0
            
            handlesBytes[handleByteIndex + 1] = handleBytes.1
        }
        
        return [type.attributeOpcode.rawValue] + handlesBytes
    }
}

/// Read Multiple Response
///
/// The read response is sent in reply to a received *Read Multiple Request* and
/// contains the values of the attributes that have been read.
public struct ATTReadMultipleResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadMultipleResponse
    
    /// Minimum length
    public static let length = 1 + 0
    
    public var values: [UInt8]
    
    public init(values: [UInt8] = []) {
        
        self.values = values
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTReadMultipleResponse.self
            
        guard byteValue.count >= type.length
            else { return nil }
            
        let attributeOpcodeByte = byteValue[0]
            
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
            
        if byteValue.count > 1 {
            
            self.values = Array(byteValue.suffix(from: 1))
            
        } else {
            
            self.values = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTReadBlobResponse.self
        
        return [type.attributeOpcode.rawValue] + values
    }
}


/// Read by Group Type Request
///
/// The *Read By Group Type Request* is used to obtain the values of attributes where the attribute type is known,
/// the type of a grouping attribute as defined by a higher layer specification, but the handle is not known.
public struct ATTReadByGroupTypeRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadByGroupTypeRequest
    
    /// First requested handle number.
    public var startHandle: UInt16
    
    /// Last requested handle number.
    public var endHandle: UInt16
    
    /// Attribute Group Type
    ///
    /// 2 or 16 octet UUID
    public var type: BluetoothUUID
    
    public init(startHandle: UInt16, endHandle: UInt16, type: BluetoothUUID) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.type = type
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard let length = Length(rawValue: byteValue.count)
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == ATTReadByGroupTypeRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        self.endHandle = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
        
        switch length {
            
        case .UUID16:
            
            let value = UInt16(bytes: (byteValue[5], byteValue[6])).littleEndian
        
        self.type = .bit16(value)
            
        case .UUID128:
            
        self.type = BluetoothUUID(littleEndian:
            BluetoothUUID(data: Data(byteValue[5 ... 20]))!)
        }
    }
    
    public var byteValue: [UInt8] {
        
        let startHandleBytes = startHandle.littleEndian.bytes
        
        let endHandleBytes = endHandle.littleEndian.bytes
        
        return [ATTReadByGroupTypeRequest.attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1] + [UInt8](type.littleEndian.data)
    }
    
    private enum Length: Int {
        
        case UUID16     = 7
        case UUID128    = 21
        
        init(UUID: BluetoothUUID) {
            
            switch UUID {
            
        case .bit16(_): self = .UUID16
        case .bit128(_): self = .UUID128
            }
        }
    }
}

/// Read By Group Type Response
///
/// The *Read By Group Type Response* is sent in reply to a received *Read By Group Type Request*
/// and contains the handles and values of the attributes that have been read.
/// 
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
public struct ATTReadByGroupTypeResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ReadByGroupTypeResponse
    
    /// Minimum length
    public static let length = 1 + 1 + 4
    
    /// A list of Attribute Data
    public let data: [AttributeData]
    
    public init?(data: [AttributeData]) {
        
        // must have at least one item
        guard let valueLength = data.first?.value.count
            else { return nil }
        
        for attributeData in data {
            
            // all items must have same length
            guard attributeData.value.count == valueLength
                else { return nil }
        }
        
        self.data = data
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTReadByGroupTypeResponse.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        let length = Int(byteValue[1])
        
        let attributeDataBytesCount = byteValue.count - 2
        
        let attributeCount = attributeDataBytesCount / length
        
        guard attributeDataBytesCount % length == 0
            else { return nil }
        
        var attributeDataList = [AttributeData](repeating: AttributeData(), count: attributeCount)
        
        for index in 0 ..< attributeCount {
                
            let byteIndex = 2 + (index * length)

            let data = Array(byteValue[byteIndex ..< byteIndex + length])
                
            guard let attributeData = AttributeData(byteValue: data)
                else { return nil }
                
            attributeDataList[index] = attributeData
        }
        
        self.data = attributeDataList
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTReadByGroupTypeResponse.self
        
        let length = UInt8(data[0].value.count + 4)
        
        var attributeDataBytes = [UInt8]()
        
        for attributeData in data {
            
            attributeDataBytes += attributeData.byteValue
        }
        
        return [type.attributeOpcode.rawValue, length] + attributeDataBytes
    }
    
    public struct AttributeData {
        
        /// Minimum length
        public static let length = 4
        
        /// Attribute Handle
        public var attributeHandle: UInt16
        
        /// End Group Handle
        public var endGroupHandle: UInt16
        
        /// Attribute Value
        public var value: [UInt8]
        
        public init(attributeHandle: UInt16 = 0, endGroupHandle: UInt16 = 0, value: [UInt8] = []) {
            
            self.attributeHandle = attributeHandle
            self.endGroupHandle = endGroupHandle
            self.value = value
        }
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count >= AttributeData.length
                else { return nil }
            
            self.attributeHandle = UInt16(bytes: (byteValue[0], byteValue[1])).littleEndian
            self.endGroupHandle = UInt16(bytes: (byteValue[2], byteValue[3])).littleEndian
            
            if byteValue.count > 4 {
                
                self.value = Array(byteValue.suffix(from: 4))
                
            } else {
                
                self.value = []
            }
        }
        
        public var byteValue: [UInt8] {
            
            let attributeHandleBytes = attributeHandle.littleEndian.bytes
            
            let endGroupHandleBytes = endGroupHandle.littleEndian.bytes
            
            return [attributeHandleBytes.0, attributeHandleBytes.1, endGroupHandleBytes.0, endGroupHandleBytes.1] + value
        }
    }
}

// MARK: - Writing Attributes

/// Write Request
///
/// The *Write Request* is used to request the server to write the value of an attribute
/// and acknowledge that this has been achieved in a *Write Response*.
public struct ATTWriteRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.WriteRequest
    
    /// Minimum length
    public static let length = 3
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The value to be written to the attribute.
    public var value: [UInt8]
    
    public init(handle: UInt16 = 0, value: [UInt8] = []) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTWriteRequest.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        if byteValue.count > ATTWriteRequest.length {
            
            self.value = Array(byteValue.suffix(from: 3))
            
        } else {
            
            self.value = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTWriteRequest.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return [type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1] + value
    }
}

/// Write Response
/// 
/// The *Write Response* is sent in reply to a valid *Write Request*
/// and acknowledges that the attribute has been successfully written.
public struct ATTWriteResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.WriteResponse
    public static let length = 1
    
    public init() { }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTWriteResponse.self
        
        guard byteValue.count == type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTWriteResponse.self
        
        return [type.attributeOpcode.rawValue]
    }
}

/// Write Command
///
/// The *Write Command* is used to request the server to write the value of an attribute, typically into a control-point attribute.
public struct ATTWriteCommand: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.WriteCommand
    
    /// Minimum length
    public static let length = 3
    
    /// The handle of the attribute to be set.
    public var handle: UInt16
    
    /// The value of be written to the attribute.
    public var value: [UInt8]
    
    public init(handle: UInt16 = 0, value: [UInt8] = []) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTWriteCommand.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        if byteValue.count > type.length {
            
            self.value = Array(byteValue.suffix(from: 3))
            
        } else {
            
            self.value = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTWriteCommand.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return [type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1] + value
    }
}

/// Signed Write Command
///
/// The Signed Write Command is used to request the server to write the value of an attribute with an authentication signature, 
/// typically into a control-point attribute.
public struct ATTSignedWriteCommand: ATTProtocolDataUnit {
    
    public typealias Signature = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static let attributeOpcode = ATT.Opcode.SignedWriteCommand
    
    /// Minimum length
    public static let length = 1 + 2 + 0 + 12
    
    /// The handle of the attribute to be set.
    public var handle: UInt16
    
    /// The value to be written to the attribute
    public var value: [UInt8]
    
    /// Authentication signature for the Attribute Upload, Attribute Handle and Attribute Value Parameters.
    public var signature: Signature
    
    public init(handle: UInt16, value: [UInt8], signature: Signature) {
        
        self.handle = handle
        self.value = value
        self.signature = signature
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTSignedWriteCommand.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        if byteValue.count > type.length {
            
            self.value = Array(byteValue[3 ..< byteValue.count - 12])
            
        } else {
            
            self.value = []
        }
        
        self.signature = (byteValue[byteValue.count - 12], byteValue[byteValue.count - 11], byteValue[byteValue.count - 10], byteValue[byteValue.count - 9], byteValue[byteValue.count - 8], byteValue[byteValue.count - 7], byteValue[byteValue.count - 6], byteValue[byteValue.count - 5], byteValue[byteValue.count - 4], byteValue[byteValue.count - 3], byteValue[byteValue.count - 2], byteValue[byteValue.count - 1])
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTSignedWriteCommand.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return [type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1] + value + [signature.0, signature.1, signature.2, signature.3, signature.4, signature.5, signature.6, signature.7, signature.8, signature.9, signature.10, signature.11]
    }
}

// MARK: - Queued Writes

/// Prepare Write Request
///
/// The *Prepare Write Request* is used to request the server to prepare to write the value of an attribute. 
/// The server will respond to this request with a *Prepare Write Response*, 
/// so that the client can verify that the value was received correctly.
public struct ATTPrepareWriteRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.PreparedWriteRequest
    
    /// Minimum length
    public static let length = 1 + 2 + 2 + 0
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written. 
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: [UInt8]
    
    public init(handle: UInt16 = 0, offset: UInt16 = 0, partValue: [UInt8] = []) {
        
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTPrepareWriteRequest.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        self.offset = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
        
        if byteValue.count > type.length {
            
            self.partValue = Array(byteValue.suffix(from: 5))
            
        } else {
            
            self.partValue = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTPrepareWriteRequest.self
        
        let handleBytes = handle.littleEndian.bytes
        
        let offsetBytes = offset.littleEndian.bytes
        
        return [type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1] + partValue
    }
}

/// Prepare Write Response
/// The *Prepare Write Response* is sent in response to a received *Prepare Write Request*
/// and acknowledges that the value has been successfully received and placed in the prepare write queue.
public struct ATTPrepareWriteResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.PreparedWriteResponse
    
    /// Minimum length
    public static let length = 1 + 2 + 2 + 0
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written.
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: [UInt8]
    
    public init(handle: UInt16 = 0, offset: UInt16 = 0, partValue: [UInt8] = []) {
        
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
    
    public init?(byteValue: [UInt8]) {
            
        let type = ATTPrepareWriteResponse.self
            
        guard byteValue.count >= type.length
            else { return nil }
            
        let attributeOpcodeByte = byteValue[0]
            
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
            
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
            
        self.offset = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
            
        if byteValue.count > type.length {
                
            self.partValue = Array(byteValue.suffix(from: 5))
                
        } else {
                
            self.partValue = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTPrepareWriteResponse.self
                
        let handleBytes = handle.littleEndian.bytes
                
        let offsetBytes = offset.littleEndian.bytes
                
        return [type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1] + partValue
    }
}

/// Execute Write Request
///
/// The *Execute Write Request* is used to request the server to write or cancel the write 
/// of all the prepared values currently held in the prepare queue from this client. 
/// This request shall be handled by the server as an atomic operation.
public struct ATTExecuteWriteRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ExecuteWriteRequest
    public static let length = 1 + 1
    
    public var flag: Flag
    
    public init(flag: Flag = Flag()) {
        
        self.flag = flag
    }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTExecuteWriteRequest.self
        
        guard byteValue.count == type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        let flagByte = byteValue[1]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue,
            let flag = Flag(rawValue: flagByte)
            else { return nil }
        
        self.flag = flag
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTPrepareWriteResponse.self
        
        return [type.attributeOpcode.rawValue, flag.rawValue]
    }
    
    public enum Flag: UInt8 {
        
        /// Cancel all prepared writes.
        case Cancel = 0x00
        
        /// Immediately write all pending prepared values.
        case Write  = 0x01
            
        public init() { self = .Cancel }
    }
}

/// The *Execute Write Response* is sent in response to a received *Execute Write Request*.
public struct ATTExecuteWriteResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.ExecuteWriteResponse
    public static let length = 1
    
    public init() { }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTExecuteWriteResponse.self
        
        guard byteValue.count == type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
    }
    
    public var byteValue: [UInt8] {
        
        return [ATT.Opcode.ExecuteWriteResponse.rawValue]
    }
}

// MARK: - Server Initiated

/// Handle Value Notification
/// 
/// A server can send a notification of an attribute’s value at any time.
public struct ATTHandleValueNotification: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.HandleValueNotification
    
    /// minimum length
    public static let length = 1 + 2 + 0
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: [UInt8]
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTHandleValueNotification.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        if byteValue.count > type.length {
            
            self.value = Array(byteValue.suffix(from: 3))
            
        } else {
            
            self.value = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTHandleValueNotification.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return [type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1] + value
    }
}

/// Handle Value Indication
///
/// A server can send an indication of an attribute’s value.
public struct ATTHandleValueIndication: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.HandleValueIndication
    
    /// Minimum length
    public static let length = 1 + 2 + 0
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: [UInt8]
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTHandleValueIndication.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        if byteValue.count > type.length {
            
            self.value = Array(byteValue.suffix(from: 3))
            
        } else {
            
            self.value = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTHandleValueIndication.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return [type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1] + value
    }
}

/// Handle Value Confirmation
///
/// The *Handle Value Confirmation* is sent in response to a received *Handle Value Indication*
/// and confirms that the client has received an indication of the given attribute.
public struct ATTHandleValueConfirmation: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.HandleValueConfirmation
    public static let length = 1
    
    public init() { }
    
    public init?(byteValue: [UInt8]) {
        
        let type = ATTHandleValueConfirmation.self
        
        guard byteValue.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
    }
    
    public var byteValue: [UInt8] {
        
        let type = ATTHandleValueConfirmation.self
        
        return [type.attributeOpcode.rawValue]
    }
}


