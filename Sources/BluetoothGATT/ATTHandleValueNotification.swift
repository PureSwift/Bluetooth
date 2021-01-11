//
//  ATTHandleValueNotification.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Handle Value Notification
///
/// A server can send a notification of an attribute’s value at any time.
@frozen
public struct ATTHandleValueNotification: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .handleValueNotification }
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: Data
    
    public init(handle: UInt16, value: Data) {
        
        self.handle = handle
        self.value = value
    }
}

public extension ATTHandleValueNotification {
        
    init?(data: Data) {
        
        guard data.count >= 3,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.value = data.suffixCheckingBounds(from: 3)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

public extension ATTHandleValueNotification {
    
    init(attribute: GATTDatabase.Attribute, maximumTransmissionUnit: ATTMaximumTransmissionUnit) {
        
        // If the attribue value is longer than (ATT_MTU-3) octets,
        // then only the first (ATT_MTU-3) octets of this attribute value
        // can be sent in a notification.
        let dataSize = Int(maximumTransmissionUnit.rawValue) - 3
        
        let value: Data
        
        if attribute.value.count > dataSize {
            
            value = Data(attribute.value.prefix(dataSize))
            
        } else {
            
            value = attribute.value
        }
        
        self.init(handle: attribute.handle, value: value)
    }
}

// MARK: - DataConvertible

extension ATTHandleValueNotification: DataConvertible {
    
    var dataLength: Int {
        
        return 3 + value.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTHandleValueNotification) {
        
        data += attributeOpcode.rawValue
        data += value.handle.littleEndian
        data += value.value
    }
}
