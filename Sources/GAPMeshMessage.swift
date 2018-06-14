//
//  GAPMeshMessage.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Any advertisement using the Mesh Message AD Type shall be non-connectable and
/// non-scannable undirected advertising events.
/// If a node receives a Mesh Message AD Type in a connectable advertisement or scannable advertising event,
/// the message shall be ignored.
///
/// - Note: Non-connectable advertisements are used since there is no need to include the Flags AD Type
/// in the advertising packets, thereby enabling two additional octets to be allocated to the Network PDU.
/// To lower the probability of packet collisions on all advertising channels,
/// it is recommended to randomize the gap between consecutive packets within an Advertising Event.
public struct GAPMeshMessage: GAPData {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .meshMessage
    
    public var message: UInt16
    
    public init(message: UInt16) {
        
        self.message = message
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let message = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(message: message)
    }
    
    public var data: Data {
        
        let value = message.littleEndian
        
        return Data([value.bytes.0, value.bytes.1])
    }
}

extension GAPMeshMessage: Equatable {
    
    public static func == (lhs: GAPMeshMessage, rhs: GAPMeshMessage) -> Bool {
        
        return lhs.message == rhs.message
    }
}

extension GAPMeshMessage: CustomStringConvertible {
    
    public var description: String {
        
        return message.description
    }
}
