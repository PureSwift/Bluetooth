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
    var data: Data { get }
    
    /// Initializes PDU from raw bytes (little-endian).
    init?(data: Data)
}

/// Read Request
///
/// The *Read Request* is used to request the server to read the value of an attribute 
/// and return its value in a *Read Response*.
public struct ATTReadRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readRequest
    internal static let length = 1 + 2
    
    public var handle: UInt16
    
    public init(handle: UInt16 = 0) {
        
        self.handle = handle
    }
    
    public init?(data: Data) {
        
        guard data.count == ATTReadRequest.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == ATTReadRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (data[1], data[2])).littleEndian
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([ATTReadRequest.attributeOpcode.rawValue, handleBytes.0, handleBytes.1])
    }
}

/// Read Response
///
/// The *Read Response* is sent in reply to a received *Read Request* and contains
/// the value of the attribute that has been read.
///
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
public struct ATTReadResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readResponse
    
    /// Minimum length
    internal static let length = 1 + 0
    
    /// The value of the attribute with the handle given.
    public var attributeValue: Data
    
    public init(attributeValue: Data) {
        
        self.attributeValue = attributeValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        if data.count > type(of: self).length {
            
            self.attributeValue = Data(data.suffix(from: 1))
            
        } else {
            
            self.attributeValue = Data()
        }
    }
    
    public var data: Data {
        
        return Data([ATTReadResponse.attributeOpcode.rawValue]) + attributeValue
    }
}

/// Read Blob Request
///
/// The *Read Blob Request* is used to request the server to read part of the value of an attribute
/// at a given offset and return a specific part of the value in a *Read Blob Response*.
public struct ATTReadBlobRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readBlobRequest
    internal static let length = 1 + 2 + 2
    
    /// The handle of the attribute to be read.
    public var handle: UInt16
    
    /// The offset of the first octet to be read.
    public var offset: UInt16
    
    public init(handle: UInt16,
                offset: UInt16) {
        
        self.handle = handle
        self.offset = offset
    }
    
    public init?(data: Data) {
        
        guard data.count == ATTReadBlobRequest.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == ATTReadBlobRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        let offsetBytes = offset.littleEndian.bytes
        
        return Data([ATTReadBlobRequest.attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1])
    }
}

/// Read Blob Response
///
/// The *Read Blob Response* is sent in reply to a received *Read Blob Request*
/// and contains part of the value of the attribute that has been read.
public struct ATTReadBlobResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readBlobResponse
    
    /// Minimum length
    internal static let length = 1 + 0
    
    /// Part of the value of the attribute with the handle given. 
    ///
    ///
    /// The part attribute value shall be set to part of the value of the attribute identified 
    /// by the attribute handle and the value offset in the request.
    public var partAttributeValue: Data
    
    public init(partAttributeValue: Data) {
        
        self.partAttributeValue = partAttributeValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= ATTReadBlobResponse.length
        else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == ATTReadBlobResponse.attributeOpcode.rawValue
            else { return nil }
        
        if data.count > ATTReadBlobResponse.length {
                
            self.partAttributeValue = Data(data.suffix(from: 1))
                
        } else {
            
            self.partAttributeValue = Data()
        }
    }
    
    public var data: Data {
        
        return Data([ATTReadBlobResponse.attributeOpcode.rawValue]) + partAttributeValue
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
    
    public static let attributeOpcode = ATT.Opcode.readMultipleRequest
    
    /// Minimum length
    internal static let length = 1 + 4
    
    public var handles: [UInt16]
    
    public init?(handles: [UInt16]) {
        
        guard handles.count >= 2
            else { return nil }
        
        self.handles = handles
    }
    
    public init?(data: Data) {
        
        let type = ATTReadBlobResponse.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        let handleCount = (data.count - 1) / 2
        
        guard (data.count - 1) % 2 == 0
            else { return nil }
        
        // preallocate handle buffer
        var handles = [UInt16](repeating: 0, count: handleCount)
        
        for index in 0 ..< handleCount {
            
            let handleIndex = 1 + (index * 2)
            
            let handle = UInt16(bytes: (data[handleIndex], data[handleIndex + 1])).littleEndian
            
            handles[index] = handle
        }
        
        self.handles = handles
    }
    
    public var data: Data {
        
        let type = ATTReadBlobResponse.self
        
        var handlesBytes = Data(repeating: 0, count: handles.count * 2)
        
        for handle in handles {
            
            let handleBytes = handle.littleEndian.bytes
            
            let handleByteIndex = handles.count * 2
            
            handlesBytes[handleByteIndex] = handleBytes.0
            
            handlesBytes[handleByteIndex + 1] = handleBytes.1
        }
        
        return Data([type.attributeOpcode.rawValue]) + handlesBytes
    }
}

/// Read Multiple Response
///
/// The read response is sent in reply to a received *Read Multiple Request* and
/// contains the values of the attributes that have been read.
public struct ATTReadMultipleResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readMultipleResponse
    
    /// Minimum length
    internal static let length = 1 + 0
    
    public var values: Data
    
    public init(values: Data) {
        
        self.values = values
    }
    
    public init?(data: Data) {
        
        let type = ATTReadMultipleResponse.self
            
        guard data.count >= type.length
            else { return nil }
            
        let attributeOpcodeByte = data[0]
            
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
            
        if data.count > 1 {
            
            self.values = Data(data.suffix(from: 1))
            
        } else {
            
            self.values = Data()
        }
    }
    
    public var data: Data {
        
        let type = ATTReadBlobResponse.self
        
        return Data([type.attributeOpcode.rawValue]) + values
    }
}

/// Read by Group Type Request
///
/// The *Read By Group Type Request* is used to obtain the values of attributes where the attribute type is known,
/// the type of a grouping attribute as defined by a higher layer specification, but the handle is not known.
public struct ATTReadByGroupTypeRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readByGroupTypeRequest
    
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
    
    public init?(data: Data) {
        
        guard let length = Length(rawValue: data.count)
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == ATTReadByGroupTypeRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (data[1], data[2])).littleEndian
        
        self.endHandle = UInt16(bytes: (data[3], data[4])).littleEndian
        
        switch length {
            
        case .UUID16:
            
            let value = UInt16(bytes: (data[5], data[6])).littleEndian
        
        self.type = .bit16(value)
            
        case .UUID128:
            
        self.type = BluetoothUUID(littleEndian:
            BluetoothUUID(data: Data(data[5 ... 20]))!)
        }
    }
    
    public var data: Data {
        
        let startHandleBytes = startHandle.littleEndian.bytes
        let endHandleBytes = endHandle.littleEndian.bytes
        
        return Data([ATTReadByGroupTypeRequest.attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1]) + Data(type.littleEndian.data)
    }
    
    private enum Length: Int {
        
        case UUID16     = 7
        case UUID128    = 21
        
        init?(uuid: BluetoothUUID) {
            
            switch uuid {
            
            case .bit16: self = .UUID16
            case .bit32: return nil
            case .bit128: self = .UUID128
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
    
    public static let attributeOpcode = ATT.Opcode.readByGroupTypeResponse
    
    /// Minimum length
    internal static let length = 1 + 1 + 4
    
    /// A list of Attribute Data
    public let attributeData: [AttributeData]
    
    public init?(attributeData attributeDataList: [AttributeData]) {
        
        // must have at least one item
        guard let valueLength = attributeDataList.first?.value.count
            else { return nil }
        
        for attributeData in attributeDataList {
            
            // all items must have same length
            guard attributeData.value.count == valueLength
                else { return nil }
        }
        
        self.attributeData = attributeDataList
    }
    
    internal init(_ unsafe: [AttributeData]) {
        
        self.attributeData = unsafe
        
        assert(ATTReadByGroupTypeResponse(attributeData: unsafe) != nil)
    }
    
    public init?(data: Data) {
        
        let type = ATTReadByGroupTypeResponse.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        let length = Int(data[1])
        
        let attributeDataBytesCount = data.count - 2
        
        let attributeCount = attributeDataBytesCount / length
        
        guard attributeDataBytesCount % length == 0
            else { return nil }
        
        var attributeDataList = [AttributeData]()
        attributeDataList.reserveCapacity(attributeCount)
        
        for index in 0 ..< attributeCount {
                
            let byteIndex = 2 + (index * length)

            let attributeBytes = Data(data[byteIndex ..< byteIndex + length])
                
            guard let attributeData = AttributeData(data: attributeBytes)
                else { return nil }
                
            attributeDataList.append(attributeData)
        }
        
        self.attributeData = attributeDataList
        
        assert(length == (attributeData[0].data.count))
    }
    
    public var data: Data {
        
        let type = ATTReadByGroupTypeResponse.self
        
        let length = UInt8(attributeData[0].value.count + 4)
        
        var attributeDataBytes = Data()
        
        for attribute in attributeData {
            
            attributeDataBytes += attribute.data
        }
        
        return Data([type.attributeOpcode.rawValue, length]) + attributeDataBytes
    }
    
    public struct AttributeData {
        
        /// Minimum length
        internal static let length = 4
        
        /// Attribute Handle
        public var attributeHandle: UInt16
        
        /// End Group Handle
        public var endGroupHandle: UInt16
        
        /// Attribute Value
        public var value: Data
        
        public init(attributeHandle: UInt16,
                    endGroupHandle: UInt16,
                    value: Data) {
            
            self.attributeHandle = attributeHandle
            self.endGroupHandle = endGroupHandle
            self.value = value
        }
        
        public init?(data: Data) {
            
            guard data.count >= AttributeData.length
                else { return nil }
            
            self.attributeHandle = UInt16(bytes: (data[0], data[1])).littleEndian
            self.endGroupHandle = UInt16(bytes: (data[2], data[3])).littleEndian
            
            if data.count > type(of: self).length {
                
                self.value = Data(data.suffix(from: type(of: self).length))
                
            } else {
                
                self.value = Data()
            }
        }
        
        public var data: Data {
            
            let attributeHandleBytes = attributeHandle.littleEndian.bytes
            
            let endGroupHandleBytes = endGroupHandle.littleEndian.bytes
            
            return Data([attributeHandleBytes.0, attributeHandleBytes.1, endGroupHandleBytes.0, endGroupHandleBytes.1]) + value
        }
    }
}

// MARK: - Writing Attributes

/// Write Request
///
/// The *Write Request* is used to request the server to write the value of an attribute
/// and acknowledge that this has been achieved in a *Write Response*.
public struct ATTWriteRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.writeRequest
    
    /// Minimum length
    internal static let length = 3
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The value to be written to the attribute.
    public var value: Data
    
    public init(handle: UInt16, value: Data) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        if data.count > type(of: self).length {
            
            self.value = Data(data.suffix(from: 3))
            
        } else {
            
            self.value = Data()
        }
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, handleBytes.0, handleBytes.1]) + value
    }
}

/// Write Response
/// 
/// The *Write Response* is sent in reply to a valid *Write Request*
/// and acknowledges that the attribute has been successfully written.
public struct ATTWriteResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.writeResponse
    internal static let length = 1
    
    public init() { }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
    }
    
    public var data: Data {
        
        return Data([type(of: self).attributeOpcode.rawValue])
    }
}

/// Write Command
///
/// The *Write Command* is used to request the server to write the value of an attribute, typically into a control-point attribute.
public struct ATTWriteCommand: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.writeCommand
    
    /// Minimum length
    internal static let length = 3
    
    /// The handle of the attribute to be set.
    public var handle: UInt16
    
    /// The value of be written to the attribute.
    public var value: Data
    
    public init(handle: UInt16,
                value: Data) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (data[1], data[2])).littleEndian
        
        if data.count > type(of: self).length {
            
            self.value = Data(data.suffix(from: 3))
            
        } else {
            
            self.value = Data()
        }
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, handleBytes.0, handleBytes.1]) + value
    }
}

/// Signed Write Command
///
/// The Signed Write Command is used to request the server to write the value of an attribute with an authentication signature, 
/// typically into a control-point attribute.
public struct ATTSignedWriteCommand: ATTProtocolDataUnit {
    
    public typealias Signature = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static let attributeOpcode = ATT.Opcode.signedWriteCommand
    
    /// Minimum length
    internal static let length = 1 + 2 + 0 + 12
    
    /// The handle of the attribute to be set.
    public var handle: UInt16
    
    /// The value to be written to the attribute
    public var value: Data
    
    /// Authentication signature for the Attribute Upload, Attribute Handle and Attribute Value Parameters.
    public var signature: Signature
    
    public init(handle: UInt16, value: Data, signature: Signature) {
        
        self.handle = handle
        self.value = value
        self.signature = signature
    }
    
    public init?(data: Data) {
        
        let type = ATTSignedWriteCommand.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        if data.count > type.length {
            
            self.value = Data(data[3 ..< data.count - 12])
            
        } else {
            
            self.value = Data()
        }
        
        self.signature = (data[data.count - 12], data[data.count - 11], data[data.count - 10], data[data.count - 9], data[data.count - 8], data[data.count - 7], data[data.count - 6], data[data.count - 5], data[data.count - 4], data[data.count - 3], data[data.count - 2], data[data.count - 1])
    }
    
    public var data: Data {
        
        let type = ATTSignedWriteCommand.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1])
            + value
            + Data([signature.0, signature.1, signature.2, signature.3, signature.4, signature.5, signature.6, signature.7, signature.8, signature.9, signature.10, signature.11])
    }
}

// MARK: - Queued Writes

/// Prepare Write Request
///
/// The *Prepare Write Request* is used to request the server to prepare to write the value of an attribute. 
/// The server will respond to this request with a *Prepare Write Response*, 
/// so that the client can verify that the value was received correctly.
public struct ATTPrepareWriteRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.preparedWriteRequest
    
    /// Minimum length
    internal static let length = 1 + 2 + 2 + 0
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written. 
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: Data
    
    public init(handle: UInt16,
                offset: UInt16,
                partValue: Data) {
        
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        if data.count > type(of: self).length {
            
            self.partValue = Data(data.suffix(from: type(of: self).length))
            
        } else {
            
            self.partValue = Data()
        }
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        let offsetBytes = offset.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1]) + partValue
    }
}

/// Prepare Write Response
/// The *Prepare Write Response* is sent in response to a received *Prepare Write Request*
/// and acknowledges that the value has been successfully received and placed in the prepare write queue.
public struct ATTPrepareWriteResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.preparedWriteResponse
    
    /// Minimum length
    internal static let length = 1 + 2 + 2 + 0
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written.
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: Data
    
    public init(handle: UInt16,
                offset: UInt16,
                partValue: Data) {
        
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
            
        let attributeOpcodeByte = data[0]
            
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
            
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
            
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
            
        if data.count > type(of: self).length {
                
            self.partValue = Data(data.suffix(from: type(of: self).length))
                
        } else {
                
            self.partValue = Data()
        }
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        let offsetBytes = offset.littleEndian.bytes
                
        return Data([type(of: self).attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1]) + partValue
    }
}

/// Execute Write Request
///
/// The *Execute Write Request* is used to request the server to write or cancel the write 
/// of all the prepared values currently held in the prepare queue from this client. 
/// This request shall be handled by the server as an atomic operation.
public struct ATTExecuteWriteRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.executeWriteRequest
    internal static let length = 1 + 1
    
    public var flag: Flag
    
    public init(flag: Flag) {
        
        self.flag = flag
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        let flagByte = data[1]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue,
            let flag = Flag(rawValue: flagByte)
            else { return nil }
        
        self.flag = flag
    }
    
    public var data: Data {
        
        let attributeOpcode = type(of: self).attributeOpcode
        
        return Data([attributeOpcode.rawValue, flag.rawValue])
    }
    
    public enum Flag: UInt8 {
        
        /// Cancel all prepared writes.
        case cancel = 0x00
        
        /// Immediately write all pending prepared values.
        case write  = 0x01
    }
}

/// The *Execute Write Response* is sent in response to a received *Execute Write Request*.
public struct ATTExecuteWriteResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.executeWriteResponse
    internal static let length = 1
    
    public init() { }
    
    public init?(data: Data) {
        
        let type = ATTExecuteWriteResponse.self
        
        guard data.count == type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
    }
    
    public var data: Data {
        
        let attributeOpcode = type(of: self).attributeOpcode
        
        return Data([attributeOpcode.rawValue])
    }
}

// MARK: - Server Initiated

/// Handle Value Notification
/// 
/// A server can send a notification of an attribute’s value at any time.
public struct ATTHandleValueNotification: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.handleValueNotification
    
    /// minimum length
    internal static let length = 1 + 2 + 0
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: Data
    
    public init(handle: UInt16, value: Data) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(data: Data) {
        
        let minimumLength = type(of: self).length
        
        guard data.count >= minimumLength
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (data[1], data[2])).littleEndian
        
        if data.count > minimumLength {
            
            self.value = Data(data.suffix(from: 3))
            
        } else {
            
            self.value = Data()
        }
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, handleBytes.0, handleBytes.1]) + value
    }
}

/// Handle Value Indication
///
/// A server can send an indication of an attribute’s value.
public struct ATTHandleValueIndication: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.handleValueIndication
    
    /// Minimum length
    internal static let length = 1 + 2 + 0
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: Data
    
    public init(handle: UInt16, value: Data) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(data: Data) {
        
        let type = ATTHandleValueIndication.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (data[1], data[2])).littleEndian
        
        if data.count > type.length {
            
            self.value = Data(data.suffix(from: 3))
            
        } else {
            
            self.value = Data()
        }
    }
    
    public var data: Data {
        
        let type = ATTHandleValueIndication.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1]) + value
    }
}

/// Handle Value Confirmation
///
/// The *Handle Value Confirmation* is sent in response to a received *Handle Value Indication*
/// and confirms that the client has received an indication of the given attribute.
public struct ATTHandleValueConfirmation: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.handleValueConfirmation
    
    internal static let length = 1
    
    public init() { }
    
    public init?(data: Data) {
        
        let type = ATTHandleValueConfirmation.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
    }
    
    public var data: Data {
        
        return Data([ATTHandleValueConfirmation.attributeOpcode.rawValue])
    }
}
