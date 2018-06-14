//
//  GAPTxPowerLevel.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The TX Power Level data type indicates the transmitted power level of the packet containing the data type.
/// The TX Power Level should be the radiated power level.
///
/// Note: When the TX Power Level data type is not present, the TX power level of the packet is unknown.
public struct GAPTxPowerLevel: GAPData {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    internal static let min: GAPTxPowerLevel = -127
    
    internal static let max: GAPTxPowerLevel = 127
    
    public static let dataType: GAPDataType = .txPowerLevel
    
    public let powerLevel: Int8
    
    public init?(powerLevel: Int8) {
        
        guard GAPTxPowerLevel.min.powerLevel <= powerLevel,
            GAPTxPowerLevel.max.powerLevel >= powerLevel
            else { return nil }
        
        self.powerLevel = powerLevel
    }
    
    fileprivate init(unsafe value: Int8) {
        
        self.powerLevel = value
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let level = Int8(bitPattern: data[0])
        
        self.init(powerLevel: level)
    }
    
    public var data: Data {
        
        let byteValue = UInt8(bitPattern: powerLevel)
        
        return Data([byteValue])
    }
    
}

extension GAPTxPowerLevel: Equatable {
    
    public static func == (lhs: GAPTxPowerLevel, rhs: GAPTxPowerLevel) -> Bool {
        
        return lhs.powerLevel == rhs.powerLevel
    }
}

extension GAPTxPowerLevel: CustomStringConvertible {
    
    public var description: String {
        
        return powerLevel.description
    }
}

extension GAPTxPowerLevel: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int8) {
        
        self.init(unsafe: value)
    }
    
}
