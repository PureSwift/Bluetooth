//
//  GAPSecurityManagerOOBFlags.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 The Security Manager Out of Band data type allows an out of band mechanism to be used by the Security Manager to communicate discovery information as well as other information related to the pairing process.
 
 The Security Manager Out of Band data type size is 1 octet.
 */
public struct GAPSecurityManagerOOBFlags: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .securityManagerOutOfBandFlags
    
    public let flags: BitMaskOptionSet<GAPSecurityManagerOOBFlag>
    
    public init(flags: BitMaskOptionSet<GAPSecurityManagerOOBFlag> = 0) {
        
        self.flags = flags
    }
}

public extension GAPSecurityManagerOOBFlags {
    
    init? <T: DataContainer> (data: T) {
        
        guard data.count == 1
            else { return nil }
        
        self.flags = BitMaskOptionSet<GAPSecurityManagerOOBFlag>(rawValue: data[data.startIndex])
    }
    
    static func += <T: DataContainer> (data: inout T, value: Self) {
        
        data += flags.rawValue
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPSecurityManagerOOBFlags: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: GAPSecurityManagerOOBFlag...) {
        
        self.init(flags: BitMaskOptionSet<GAPSecurityManagerOOBFlag>(elements))
    }
}

// MARK: - CustomStringConvertible

extension GAPSecurityManagerOOBFlags: CustomStringConvertible {
    
    public var description: String {
        
        return flags.description
    }
}

// MARK: - Supporting Types

/**
 The Security Manager Out of Band data type allows an out of band mechanism to be used by the Security Manager to communicate discovery information as well as other information related to the pairing process.
 
 The Security Manager Out of Band data type size is 1 octet.
 */
public enum GAPSecurityManagerOOBFlag: UInt8, BitMaskOption {
    
    /// OOB Flags Field
    ///
    /// 0 = OOB data not present, 1 = OOB data present
    case oobFlagsField = 0b01
    
    /// LE supported (Host)
    ///
    /// bit 65 of LMP Extended Feature bits (Page 1)
    case supportedLE = 0b10
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Host)
    ///
    /// bit 66 of LMP Extended Feature bits (Page 1)
    case simultaneousLEandBREDR = 0b100
    
    /// Address type
    ///
    /// 0 = Public Address, 1 = Random Address
    case addressType = 0b1000
    
    public static let allCases: Set<GAPSecurityManagerOOBFlag> = [
        .oobFlagsField,
        .supportedLE,
        .simultaneousLEandBREDR,
        .addressType
    ]
}
