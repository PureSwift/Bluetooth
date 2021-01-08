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
@frozen
public struct GAPMeshMessage: GAPData, Equatable, Hashable {
    
    public static var dataType: GAPDataType { return .meshMessage }
    
    public var message: UInt16
    
    public init(message: UInt16) {
        
        self.message = message
    }
}

public extension GAPMeshMessage {
    
    init?(data: Data) {
        
        guard data.count == MemoryLayout<UInt16>.size
            else { return nil }
        
        let message = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(message: message)
    }
    
    func append(to data: inout Data) {
        
        data += message.littleEndian
    }
    
    var dataLength: Int {
        
        return MemoryLayout<UInt16>.size
    }
}

// MARK: - CustomStringConvertible

extension GAPMeshMessage: CustomStringConvertible {
    
    public var description: String {
        
        return message.description
    }
}
