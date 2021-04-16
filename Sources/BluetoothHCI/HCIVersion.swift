//
//  HCIVersion.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

// swiftlint:disable identifier_name

/// Bluetooth Host Controller Interface version.
///
/// SeeAlso:
@frozen
public enum HCIVersion: UInt8, Equatable, Hashable {
    
    case v1_0b      = 0
    case v1_1       = 1
    case v1_2       = 2
    case v2_0       = 3
    case v2_1       = 4
    case v3_0       = 5
    case v4_0       = 6
    case v4_1       = 7
    case v4_2       = 8
    case v5_0       = 9
    case v5_1       = 10
    case v5_2       = 11
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
        case .v5_1:      return "5.1"
        case .v5_2:      return "5.2"
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
