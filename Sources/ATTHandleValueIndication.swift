//
//  ATTHandleValueIndication.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Handle Value Indication
///
/// A server can send an indication of an attribute’s value.
public struct ATTHandleValueIndication: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATT.Opcode { return .handleValueIndication }
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: Data
    
    public init(handle: UInt16, value: Data) {
        
        self.handle = handle
        self.value = value
    }
}

public extension ATTHandleValueIndication {
    
    public init?(data: Data) {
        
        guard data.count >= 3,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.value = data.suffixCheckingBounds(from: 3)
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTHandleValueIndication: DataConvertible {
    
    var dataLength: Int {
        
        return 3 + value.count
    }
    
    static func += (data: inout Data, value: ATTHandleValueIndication) {
        
        data += attributeOpcode.rawValue
        data += value.handle.littleEndian
        data += value.value
    }
}
