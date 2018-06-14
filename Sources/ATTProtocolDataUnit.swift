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
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
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
