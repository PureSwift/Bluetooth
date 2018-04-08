//
//  ATTMaximumTransmissionUnit.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/8/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// ATT Maximum Transmission Unit
public struct ATTMaximumTransmissionUnit: RawRepresentable {
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16) {
        
        guard rawValue <= ATTMaximumTransmissionUnit.max.rawValue,
            rawValue >= ATTMaximumTransmissionUnit.min.rawValue
            else { return nil }
        
        self.rawValue = rawValue
        
        assert(isValid)
    }
    
    fileprivate init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

private extension ATTMaximumTransmissionUnit {
    
    var isValid: Bool {
        
        return (ATTMaximumTransmissionUnit.min.rawValue ... ATTMaximumTransmissionUnit.max.rawValue).contains(rawValue)
    }
}

public extension ATTMaximumTransmissionUnit {
    
    static var `default`: ATTMaximumTransmissionUnit { return ATTMaximumTransmissionUnit(23) }
    
    static var min: ATTMaximumTransmissionUnit { return .default }
    
    static var max: ATTMaximumTransmissionUnit { return ATTMaximumTransmissionUnit(517) }
    
    init(server: UInt16,
         client: UInt16) {
        
        let mtu = Swift.min(Swift.max(Swift.min(client, server), ATTMaximumTransmissionUnit.default.rawValue), ATTMaximumTransmissionUnit.max.rawValue)
        
        self.init(mtu)
        
        assert(isValid)
    }
}

// MARK: - Equatable

extension ATTMaximumTransmissionUnit: Equatable {
    
    public static func == (lhs: ATTMaximumTransmissionUnit, rhs: ATTMaximumTransmissionUnit) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: - Hashable

extension ATTMaximumTransmissionUnit: Hashable {
    
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

// MARK: - CustomStringConvertible

extension ATTMaximumTransmissionUnit: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

// MARK: - Comparable

extension ATTMaximumTransmissionUnit: Comparable {
    
    public static func < (lhs: ATTMaximumTransmissionUnit, rhs: ATTMaximumTransmissionUnit) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
}
