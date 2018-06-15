//
//  GAPSimplePairingHashC.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Specifies the Simple Pairing Hash C
/// Size: 16 octets
/// Format defined in [Vol. 2], Part H Section 7.2.2
public struct GAPSimplePairingHashC: GAPData {
    
    internal static let length = MemoryLayout<UUID>.size
    
    public static let dataType: GAPDataType = .simplePairingHashC
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        
        self.uuid = uuid
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let uuid = UUID(UInt128(littleEndian: UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))))
        
        self.init(uuid: uuid)
    }
    
    public var data: Data {
        
        return uuid.data
    }
}

extension GAPSimplePairingHashC: Equatable {
    
    public static func == (lhs: GAPSimplePairingHashC, rhs: GAPSimplePairingHashC) -> Bool {
        
        return lhs.uuid == rhs.uuid
    }
}

extension GAPSimplePairingHashC: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description
    }
}
