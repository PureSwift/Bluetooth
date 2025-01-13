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
public enum HCIVersion: UInt8, Equatable, Hashable, Sendable {

    /// Bluetooth® Core Specification 1.0b (Withdrawn)
    case v1_0b = 0x00

    /// Bluetooth® Core Specification 1.1 (Withdrawn)
    case v1_1 = 0x01

    /// Bluetooth® Core Specification 1.2 (Withdrawn)
    case v1_2 = 0x02

    /// Bluetooth® Core Specification 2.0+EDR (Withdrawn)
    case v2_0 = 0x03

    /// Bluetooth® Core Specification 2.1+EDR (Withdrawn)
    case v2_1 = 0x04

    /// Bluetooth® Core Specification 3.0+HS (Withdrawn)
    case v3_0 = 0x05

    /// Bluetooth® Core Specification 4.0 (Withdrawn)
    case v4_0 = 0x06

    /// Bluetooth® Core Specification 4.1 (Deprecated)
    case v4_1 = 0x07

    /// Bluetooth® Core Specification 4.2
    case v4_2 = 0x08

    /// Bluetooth® Core Specification 5.0
    case v5_0 = 0x09

    /// Bluetooth® Core Specification 5.1
    case v5_1 = 0x0A

    ///Bluetooth® Core Specification 5.2
    case v5_2 = 0x0B

    /// Bluetooth® Core Specification 5.3
    case v5_3 = 0x0C

    /// Bluetooth® Core Specification 5.4
    case v5_4 = 0x0D

    /// Bluetooth® Core Specification 6.0
    case v6_0 = 0x0E
}

// swiftlint:enable identifier_name

// MARK: - CustomStringConvertible

extension HCIVersion: CustomStringConvertible {

    public var description: String {

        switch self {
        case .v1_0b: return "1.0b"
        case .v1_1: return "1.1"
        case .v1_2: return "1.2"
        case .v2_0: return "2.0"
        case .v2_1: return "2.1"
        case .v3_0: return "3.0"
        case .v4_0: return "4.0"
        case .v4_1: return "4.1"
        case .v4_2: return "4.2"
        case .v5_0: return "5.0"
        case .v5_1: return "5.1"
        case .v5_2: return "5.2"
        case .v5_3: return "5.3"
        case .v5_4: return "5.4"
        case .v6_0: return "6.0"
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
