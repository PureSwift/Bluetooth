//
//  ATTMaximumTransmissionUnitRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Exchange MTU Request
///
/// The *Exchange MTU Request* is used by the client to inform the server of the client’s maximum receive MTU
/// size and request the server to respond with its maximum receive MTU size.
///
/// - Note: This request shall only be sent once during a connection by the client.
/// The *Client Rx MTU* parameter shall be set to the maximum size of the attribute protocol PDU that the client can receive.
@frozen
public struct ATTMaximumTransmissionUnitRequest: ATTProtocolDataUnit, Equatable {
    
    /// 0x02 = Exchange MTU Request
    public static var attributeOpcode: ATTOpcode { return .maximumTransmissionUnitRequest }
    
    /// Client Rx MTU
    ///
    /// Client receive MTU size
    public var clientMTU: UInt16
    
    public init(clientMTU: UInt16) {
        
        self.clientMTU = clientMTU
    }
}

public extension ATTMaximumTransmissionUnitRequest {
    
    internal static var length: Int { return 3 }
    
    init?(data: Data) {
        
        guard data.count == type(of: self).length,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        let clientMTU = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.clientMTU = clientMTU
    }
    
    var data: Data {
        
       return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTMaximumTransmissionUnitRequest: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTMaximumTransmissionUnitRequest) {
        
        data += attributeOpcode.rawValue
        data += value.clientMTU.littleEndian
    }
}
