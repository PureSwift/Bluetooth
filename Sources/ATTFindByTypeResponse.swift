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
public struct ATTFindByTypeResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.findByTypeResponse
    
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
}

public extension ATTFindByTypeResponse {
    
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
            
            self.foundAttribute = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            self.groupEnd = UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3])))
        }
        
        public var byteValue: [UInt8] {
            
            let foundAttributeBytes = foundAttribute.littleEndian.bytes
            let groupEndBytes = groupEnd.littleEndian.bytes
            
            return [foundAttributeBytes.0, foundAttributeBytes.1, groupEndBytes.0, groupEndBytes.1]
        }
    }
}
