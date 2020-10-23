//
//  HCIVersion.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

// swiftlint:disable identifier_name

/// Bluetooth Host Controller Interface version.
public enum HCIVersion: UInt8, Equatable, Hashable {
    
    case v1_0b      = 0x00
    case v1_1       = 0x01
    case v1_2       = 0x02
    case v2_0       = 0x03
    case v2_1       = 0x04
    case v3_0       = 0x05
    case v4_0       = 0x06
    case v4_1       = 0x07
    case v4_2       = 0x08
    case v5_0       = 0x09
}

// swiftlint:enable identifier_name

// MARK: - CustomStringConvertible

extension HCIVersion: CustomStringConvertible {
    
    public var description: String {
        
        switch self {
        case .v1_0b:     return "1.0b"
        case .v1_1:      return "1.1"
        case .v1_2:      return "1.2"
        case .v2_0:      return "2.0"
        case .v2_1:      return "2.1"
        case .v3_0:      return "3.0"
        case .v4_0:      return "4.0"
        case .v4_1:      return "4.1"
        case .v4_2:      return "4.2"
        case .v5_0:      return "5.0"
        }
    }
}

// MARK: - Comparable

extension HCIVersion: Comparable {
    
    public static func < (lhs: HCIVersion, rhs: HCIVersion) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
}

// MARK: - Supporting Types

/// The Bluetooth type declares compatibilty with a Bluetooth specification version.
public protocol HCIVersioned {
    
    /// Returns whether the value is compatible with the specified Bluetooth specification verision.
    func isCompatible(with version: HCIVersion) -> Bool
}
