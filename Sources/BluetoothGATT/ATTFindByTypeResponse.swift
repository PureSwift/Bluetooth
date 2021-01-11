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
@frozen
public struct ATTFindByTypeResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .findByTypeResponse }
    
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
    
    init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        let handleLength = HandlesInformation.length
        
        let handleBytesCount = data.count - 1
        
        guard handleBytesCount % handleLength == 0
            else { return nil }
        
        let handleCount = handleBytesCount / handleLength
        
        let handleIndices = (0 ..< handleCount)
        let handles = handleIndices.map { (index: Int) -> HandlesInformation in
            
            let byteIndex = 1 + (index * handleLength)
            return HandlesInformation(data.subdataNoCopy(in: byteIndex ..< byteIndex + handleLength))
        }
        
        self.init(handles: handles)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTFindByTypeResponse: DataConvertible {
    
    var dataLength: Int {
        
        return 1 + (handles.count * HandlesInformation.length)
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindByTypeResponse) {
        
        data += attributeOpcode.rawValue
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
    struct HandlesInformation: Equatable {
        
        /// Found Attribute Handle
        public let foundAttribute: UInt16
        
        /// Group End Handle
        public let groupEnd: UInt16
        
        public init(foundAttribute: UInt16,
                    groupEnd: UInt16) {
            
            self.foundAttribute = foundAttribute
            self.groupEnd = groupEnd
        }
    }
}

internal extension ATTFindByTypeResponse.HandlesInformation {
    
    static var length: Int { return 2 + 2 }
    
    init(_ data: Data) {
        
        self.foundAttribute = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.groupEnd = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
    }
}

extension ATTFindByTypeResponse.HandlesInformation: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindByTypeResponse.HandlesInformation) {
        
        data += value.foundAttribute.littleEndian
        data += value.groupEnd.littleEndian
    }
}
