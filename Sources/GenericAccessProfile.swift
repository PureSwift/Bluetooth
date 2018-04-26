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
/// ​​Assigned numbers are used in GAP for inquiry response, EIR data type values, manufacturer-specific data,
/// advertising data, low energy UUIDs and appearance characteristics, and class of device.
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

public struct GAPFlags: GAPData {
    
    public static let length = 1
    
    public init?(byteValue: [UInt8]) {
        
        fatalError()
    }
    
    public var byteValue: [UInt8] {
        
        return []
    }
}

/**
 GAP Flag
 
 The Flags data type contains one bit Boolean flags. The Flags data type shall be included when any of the Flag bits are non-zero and the advertising packet is connectable, otherwise the Flags data type may be omitted. All 0x00 octets after the last non-zero octet shall be omitted from the value transmitted.
 
 - Note: If the Flags AD type is not present in a non-connectable advertisement, the Flags should be considered as unknown and no assumptions should be made by the scanner.
 
 Flags used over the LE physical channel are:
 
    • Limited Discoverable Mode
 
    • General Discoverable Mode
 
    • BR/EDR Not Supported
 
    • Simultaneous LE and BR/EDR to Same Device Capable (Controller)
 
    • Simultaneous LE and BR/EDR to Same Device Capable (Host)
 
 The LE Limited Discoverable Mode and LE General Discoverable Mode flags shall be ignored when received over the BR/EDR physical channel. The ‘BR/ EDR Not Supported’ flag shall be set to 0 when sent over the BR/EDR physical channel.
 
 The Flags field may be zero or more octets long. This allows the Flags field to be extended while using the minimum number of octets within the data packet.
 */
public enum GAPFlag: UInt8, BitMaskOption {
    
    /// LE Limited Discoverable Mode
    case lowEnergyLimitedDiscoverableMode = 0b01
    
    /// LE General Discoverable Mode
    case lowEnergyGeneralDiscoverableMode = 0b10
    
    /// BR/EDR Not Supported.
    ///
    /// Bit 37 of LMP Feature Mask Definitions  (Page 0)
    case notSupportedBREDR = 0b100
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Controller).
    ///
    /// Bit 49 of LMP Feature Mask Definitions (Page 0)
    case simultaneousController = 0b1000
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Host).
    ///
    /// Bit 66 of LMP Feature Mask Definitions (Page 1)
    case simultaneousHost = 0b10000
    
    public static let all: Set<GAPFlag> = [
        .lowEnergyLimitedDiscoverableMode,
        .lowEnergyGeneralDiscoverableMode,
        .notSupportedBREDR,
        .simultaneousController,
        .simultaneousHost
    ]
}

/**
 GAP Shortened Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 
 A shortened name shall only contain contiguous characters from the beginning of the full name. For example, if the device name is ‘BT_Device_Name’ then the shortened name could be ‘BT_Device’ or ‘BT_Dev’.
 */
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

/**
 GAP Complete Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 */
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
