//
//  ATTFindByTypeResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Find By Type Value Response
///
/// The *Find By Type Value Response* is sent in reply to a received *Find By Type Value Request*
/// and contains information about this server.
public struct ATTFindByTypeResponse: ATTProtocolDataUnit, Equatable {
    
    public static let attributeOpcode = ATT.Opcode.findByTypeResponse
    
    /// A list of 1 or more Handle Informations.
    public var handles: [HandlesInformation]
    
    public init?(handles: [HandlesInformation]) {
        
        guard handles.isEmpty == false
            else { return nil }
        
        self.handles = handles
    }
    
    internal init(_ handles: [HandlesInformation]) {
        
        assert(handles.isEmpty == false, "Must have at least one HandlesInformation")
        self.handles = handles
    }
}

public extension ATTFindByTypeResponse {
    
    /// Minimum length.
    internal static var minimumLength: Int { return 1 + HandlesInformation.length }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let handleLength = HandlesInformation.length
        
        let handleBytesCount = data.count - 1
        
        guard handleBytesCount % handleLength == 0
            else { return nil }
        
        let handleCount = handleBytesCount / handleLength
        
        let handleIndices = (0 ..< handleCount)
        let handles = handleIndices.map { (index: Int) -> HandlesInformation in
            
            let byteIndex = (index * handleLength) + 1
            return HandlesInformation(data.subdataNoCopy(in: byteIndex ..< byteIndex + handleLength))
        }
        
        self.init(handles: handles)
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTFindByTypeResponse: DataConvertible {
    
    var dataLength: Int {
        
        return 1 + (handles.count * HandlesInformation.length)
    }
    
    static func += (data: inout Data, value: ATTFindByTypeResponse) {
        
        data += self.attributeOpcode.rawValue
        value.handles.forEach { data += $0 }
    }
}

public extension ATTFindByTypeResponse {
    
    /// Handles Information
    ///
    /// For each handle that matches the attribute type and attribute value in the *Find By Type Value Request*
    /// a *Handles Information* shall be returned.
    /// The *Found Attribute Handle* shall be set to the handle of the attribute that has the exact attribute type
    /// and attribute value from the *Find By Type Value Request*.
    public struct HandlesInformation: Equatable {
        
        /// Found Attribute Handle
        public var foundAttribute: UInt16
        
        /// Group End Handle
        public var groupEnd: UInt16
        
        public init(foundAttribute: UInt16,
                    groupEnd: UInt16) {
            
            self.foundAttribute = foundAttribute
            self.groupEnd = groupEnd
        }
    }
}

internal extension ATTFindByTypeResponse.HandlesInformation {
    
    internal static var length: Int { return 2 + 2 }
    
    internal init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(data)
    }
    
    fileprivate init(_ data: Data) {
        
        self.foundAttribute = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.groupEnd = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
    }
}

extension ATTFindByTypeResponse.HandlesInformation: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: ATTFindByTypeResponse.HandlesInformation) {
        
        data += value.foundAttribute.littleEndian
        data += value.groupEnd.littleEndian
    }
}
