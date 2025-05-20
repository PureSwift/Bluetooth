//
//  GAPSecurityManagerOOBFlags.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif
import Bluetooth

/// The Security Manager Out of Band data type allows an out of band mechanism to be used by the Security Manager to communicate discovery information as well as other information related to the pairing process.
///
/// The Security Manager Out of Band data type size is 1 octet.
@frozen
public struct GAPSecurityManagerOOBFlags: GAPData, Equatable, Hashable {

    public static let dataType: GAPDataType = .securityManagerOutOfBandFlags

    public let flags: GAPSecurityManagerOOBFlag

    public init(flags: GAPSecurityManagerOOBFlag = .init(rawValue: 0)) {

        self.flags = flags
    }
}

public extension GAPSecurityManagerOOBFlags {

    init?<Data: DataContainer>(data: Data) {

        guard data.count == 1
        else { return nil }

        self.flags = GAPSecurityManagerOOBFlag(rawValue: data[0])
    }

    func append<Data: DataContainer>(to data: inout Data) {

        data += flags.rawValue
    }

    var dataLength: Int {

        return 1
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPSecurityManagerOOBFlags: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: GAPSecurityManagerOOBFlag...) {

        self.init(flags: GAPSecurityManagerOOBFlag(elements))
    }
}

// MARK: - CustomStringConvertible

extension GAPSecurityManagerOOBFlags: CustomStringConvertible {

    public var description: String {
        return flags.rawValue.description
    }
}

// MARK: - Supporting Types

/// The Security Manager Out of Band data type allows an out of band mechanism to be used by the Security Manager to communicate discovery information as well as other information related to the pairing process.
///
/// The Security Manager Out of Band data type size is 1 octet.
@frozen
@OptionSet<UInt8>
public struct GAPSecurityManagerOOBFlag: Sendable, Hashable {
    private enum Options: UInt8 {
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
    }

    public static let allCases: [GAPSecurityManagerOOBFlag] = [
        .oobFlagsField,
        .supportedLE,
        .simultaneousLEandBREDR,
        .addressType
    ]
}
