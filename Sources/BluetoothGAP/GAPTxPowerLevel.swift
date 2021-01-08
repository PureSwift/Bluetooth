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
@frozen
public struct GAPTxPowerLevel: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .txPowerLevel
    
    public let powerLevel: Int8
    
    public init?(powerLevel: Int8) {
        
        guard GAPTxPowerLevel.min.powerLevel <= powerLevel,
            GAPTxPowerLevel.max.powerLevel >= powerLevel
            else { return nil }
        
        self.powerLevel = powerLevel
    }
    
    fileprivate init(_ unsafe: Int8) {
        
        self.powerLevel = unsafe
    }
}

public extension GAPTxPowerLevel {
    
    internal static var min: GAPTxPowerLevel { return GAPTxPowerLevel(-127) }
    
    internal static var max: GAPTxPowerLevel { return GAPTxPowerLevel(127) }
}

public extension GAPTxPowerLevel {
    
    init?(data: Data) {
        
        guard data.count == 1
            else { return nil }
        
        let level = Int8(bitPattern: data[data.startIndex])
        
        self.init(powerLevel: level)
    }
    
    func append(to data: inout Data) {
        
        data += UInt8(bitPattern: powerLevel)
    }
    
    var dataLength: Int {
        
        return 1
    }
}

// MARK: - CustomStringConvertible

extension GAPTxPowerLevel: CustomStringConvertible {
    
    public var description: String {
        
        return powerLevel.description
    }
}
