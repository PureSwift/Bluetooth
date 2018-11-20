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
    
    /// Minimum length.
    internal static let length = 1 + HandlesInformation.length
    
    /// A list of 1 or more Handle Informations.
    public var handles: [HandlesInformation]
    
    public init?(handles: [HandlesInformation]) {
        
        guard handles.isEmpty
            else { return nil }
        
        self.handles = handles
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let handleLength = HandlesInformation.length
        
        let handleBytesCount = data.count - 1
        
        guard handleBytesCount % handleLength == 0
            else { return nil }
        
        let handleCount = handleBytesCount / handleLength
        
        // preallocate handles for better performance
        var handles = [HandlesInformation]()
        handles.reserveCapacity(handleCount)
        
        for index in 0 ..< handleCount {
            
            let byteIndex = (index * handleLength) + 1
            
            let handleBytes = data.subdataNoCopy(in: byteIndex ..< byteIndex + handleLength)
            
            guard let handle = HandlesInformation(data: handleBytes)
                else { return nil }
            
            handles.append(handle)
        }
        
        self.init(handles: handles)
    }
    
    public var data: Data {
        
        // preallocate memory to avoid performance penalty by increasing buffer
        var data = Data(capacity: handles.count * HandlesInformation.length)
        data += type(of: self).attributeOpcode.rawValue
        handles.forEach { data += $0.data }
        
        return data
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
        
        internal static let length = 2 + 2
        
        /// Found Attribute Handle
        public var foundAttribute: UInt16
        
        /// Group End Handle
        public var groupEnd: UInt16
        
        public init(foundAttribute: UInt16,
                    groupEnd: UInt16) {
            
            self.foundAttribute = foundAttribute
            self.groupEnd = groupEnd
        }
        
        internal init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.foundAttribute = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            self.groupEnd = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        }
        
        internal var data: Data {
            
            var data = Data(capacity: type(of: self).length)
            data += foundAttribute.littleEndian
            data += groupEnd.littleEndian
            return data
        }
    }
}
