//
//  GAPLESecureConnectionsRandom.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Specifies the LE Secure Connections Random Value
/// Size: 16 octets
/// Format defined in [Vol 3], Part H, Section 2.3.5.6.4
public struct GAPLESecureConnectionsRandom: GAPData {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .lowEnergySecureConnectionsRandom
    
    public let random: UInt16
    
    public init(random: UInt16) {
        
        self.random = random
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let random = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(random: random)
    }
    
    public var data: Data {
        
        let value = random.littleEndian
        return Data(bytes: [value.bytes.0, value.bytes.1])
    }
}

extension GAPLESecureConnectionsRandom: Equatable {
    
    public static func == (lhs: GAPLESecureConnectionsRandom, rhs: GAPLESecureConnectionsRandom) -> Bool {
        
        return lhs.random == rhs.random
    }
}

extension GAPLESecureConnectionsRandom: CustomStringConvertible {
    
    public var description: String {
        
        return random.description
    }
}
