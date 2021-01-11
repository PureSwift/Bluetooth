//
//  ATTMaximumTransmissionUnitResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

///  Exchange MTU Response
///
/// The *Exchange MTU Response* is sent in reply to a received *Exchange MTU Request*.
@frozen
public struct ATTMaximumTransmissionUnitResponse: ATTProtocolDataUnit, Equatable {
    
    /// 0x03 = Exchange MTU Response
    public static var attributeOpcode: ATTOpcode { return .maximumTransmissionUnitResponse }
    
    /// Server Rx MTU
    ///
    /// Attribute server receive MTU size
    public var serverMTU: UInt16
    
    public init(serverMTU: UInt16) {
        
        self.serverMTU = serverMTU
    }
}

public extension ATTMaximumTransmissionUnitResponse {
    
    internal static var length: Int { return 3 }
    
    init?(data: Data) {
        
        guard data.count == type(of: self).length,
            type(of: self).validateOpcode(data)
            else { return nil }
                
        self.serverMTU = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTMaximumTransmissionUnitResponse: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTMaximumTransmissionUnitResponse) {
        
        data += attributeOpcode.rawValue
        data += value.serverMTU.littleEndian
    }
}
