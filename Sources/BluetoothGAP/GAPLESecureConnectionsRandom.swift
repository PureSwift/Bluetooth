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
@frozen
public struct GAPLESecureConnectionsRandom: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .lowEnergySecureConnectionsRandom
    
    public let random: UInt16
    
    public init(random: UInt16) {
        
        self.random = random
    }
}

public extension GAPLESecureConnectionsRandom {
    
    init?(data: Data) {
        
        guard data.count == 2
            else { return nil }
        
        let random = UInt16(littleEndian: UInt16(bytes: (data[0],
                                                         data[1])))
        
        self.init(random: random)
    }
    
    func append(to data: inout Data) {
        
        data += random.littleEndian
    }
    
    var dataLength: Int {
        
        return 2
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GAPLESecureConnectionsRandom: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(random: value)
    }
}

// MARK: - CustomStringConvertible

extension GAPLESecureConnectionsRandom: CustomStringConvertible {
    
    public var description: String {
        
        return random.description
    }
}
