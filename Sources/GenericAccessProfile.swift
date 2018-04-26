//
//  GenericAccessProfile.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/**
 Generic Access Profile
 
 - SeeAlso:
 [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
 */
public enum GAP {
    
    public typealias DataType = GAPDataType
}

// MARK: - Generic Access Profile Data Type

/// Generic Access Profile Data Type
///
/// ​​Assigned numbers are used in GAP for inquiry response, EIR data type values, manufacturer-specific data, advertising data,
/// low energy UUIDs and appearance characteristics, and class of device.
///
/// - SeeAlso:
/// [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
public enum GAPDataType: UInt8 {
    
    /// Flags
    ///
    /// **Reference**:
    ///
    /// Bluetooth Core Specification Vol. 3, Part C, section 8.1.3 (v2.1 + EDR, 3.0 + HS and 4.0)
    ///
    /// Bluetooth Core Specification Vol. 3, Part C, sections 11.1.3 and 18.1 (v4.0)
    ///
    /// Core Specification Supplement, Part A, section 1.3
    case flags = 0x01
    
    /// Incomplete List of 16-bit Service Class UUIDs
    case incompleteListOf16BitServiceClassUUIDs = 0x02
    
    /// Complete List of 16-bit Service Class UUIDs
    case completeListOf16CitServiceClassUUIDs = 0x03
    
    /// Incomplete List of 32-bit Service Class UUIDs
    case incompleteListOf32BitServiceClassUUIDs = 0x04
    
    /// Complete List of 32-bit Service Class UUIDs
    case completeListOf32CitServiceClassUUIDs = 0x05
    
    /// Incomplete List of 128-bit Service Class UUIDs
    case incompleteListOf128BitServiceClassUUIDs = 0x06
    
    /// Complete List of 128-bit Service Class UUIDs
    case completeListOf128BitServiceClassUUIDs = 0x07
    
    /// Shortened Local Name
    case shortLocalName = 0x08
    
    /// Complete Local Name
    case completeLocalName = 0x09
    
    // FIXME: Add all GAP data types
    
    /// All data types.
    public static let all: Set<GAPDataType> = Set(((0x01 ... 0x3D) + [0xFF]).flatMap(GAPDataType.init))
}

// MARK: - Generic Access Profile Data

/// Generic Access Profile Data
public protocol GAPData {
    
    static var dataType: GAPDataType { get }
    
    init?(byteValue: [UInt8])
    
    var byteValue: [UInt8] { get }
}

/// GAP Complete Local Name
public struct GAPShortLocalName: GAPData, RawRepresentable {
    
    public static let dataType: GAPDataType = .shortLocalName
    
    public let rawValue: String
    
    public init(rawValue: String) {
        
        self.rawValue = rawValue
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard let rawValue = String(bytes: byteValue, encoding: .utf8)
            else { return nil }
        
        self.init(rawValue: rawValue)
    }
    
    public var byteValue: [UInt8] {
        
        return [UInt8](rawValue.utf8)
    }
}

/// GAP Complete Local Name
public struct GAPCompleteLocalName: GAPData, RawRepresentable {
    
    public static let dataType: GAPDataType = .completeLocalName
    
    public let rawValue: String
    
    public init(rawValue: String) {
        
        self.rawValue = rawValue
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard let rawValue = String(bytes: byteValue, encoding: .utf8)
            else { return nil }
        
        self.init(rawValue: rawValue)
    }
    
    public var byteValue: [UInt8] {
        
        return [UInt8](rawValue.utf8)
    }
}
