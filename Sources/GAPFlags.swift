//
//  GAPFlags.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Flag
public struct GAPFlags: GAPData {
    
    public static let dataType: GAPDataType = .flags
    
    public var flags: BitMaskOptionSet<GAPFlag>
    
    public init(flags: BitMaskOptionSet<GAPFlag> = 0) {
        
        self.flags = flags
    }
    
    public init?(data: Data) {
        
        let bytes = Array(data)
        
        typealias RawValue = GAPFlag.RawValue
        
        let rawValue: RawValue
        
        switch bytes.count {
            
        case 1:
            
            rawValue = bytes[0]
            
        case 2:
            
            rawValue = RawValue(UInt16(littleEndian: UInt16(bytes: (bytes[0], bytes[1]))))
            
        case 4:
            
            rawValue = RawValue(UInt32(littleEndian: UInt32(bytes: (bytes[0], bytes[1], bytes[2], bytes[3]))))
            
        case 8:
            
            rawValue = RawValue(UInt64(littleEndian: UInt64(bytes: (bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], bytes[6], bytes[7]))))
            
        default:
            
            return nil
        }
        
        self.flags = BitMaskOptionSet<GAPFlag>(rawValue: rawValue)
    }
    
    public var data: Data {
        
        return Data([flags.rawValue])
    }
}

extension GAPFlags: Equatable {
    
    public static func == (lhs: GAPFlags, rhs: GAPFlags) -> Bool {
        
        return lhs.flags == rhs.flags
    }
}

extension GAPFlags: Hashable {
    
    public var hashValue: Int {
        
        return Int(flags.rawValue)
    }
}

extension GAPFlags: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral rawValue: GAPFlag.RawValue) {
        
        self.init(flags: BitMaskOptionSet<GAPFlag>(rawValue: rawValue))
    }
}

// MARK: - Supporting Types

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
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
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
