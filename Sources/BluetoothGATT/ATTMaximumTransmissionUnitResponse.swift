//
//  ATTMaximumTransmissionUnitResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

///  Exchange MTU Response
///
/// The *Exchange MTU Response* is sent in reply to a received *Exchange MTU Request*.
@frozen
public struct ATTMaximumTransmissionUnitResponse: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
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

// MARK: - DataConvertible

extension ATTMaximumTransmissionUnitResponse: DataConvertible {
    
    public static var length: Int { 3 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length,
            Self.validateOpcode(data)
            else { return nil }
                
        self.serverMTU = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.serverMTU.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
