//
//  GAPLEDeviceAddress.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The LE Bluetooth Device Address data type defines the device address of the local device
/// and the address type on the LE transport.
///
/// Size: 7 octets.
/// The format of the 6 least significant Octets is the same as the Device Address
/// defined in [Vol. 6], Part B, Section 1.3.
/// The least significant bit of the most significant octet defines if the Device Address
/// is a Public Address or a Random Address.
/// - Note:
/// LSB = 1 Then Random Device Address. LSB = 0 Then Public Device Address.
/// Bits 1 to 7 in the most significant octet are reserved for future use.
public struct GAPLEDeviceAddress: GAPData {
    
    internal static let length = 7
    
    public static let dataType: GAPDataType = .lowEnergyDeviceAddress
    
    public let address: Address
    
    public let type: GAPLEDeviceAddressType
    
    public init(address: Address, type: GAPLEDeviceAddressType) {
        
        self.address = address
        self.type = type
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length,
            let type = GAPLEDeviceAddressType(rawValue: data[6])
            else { return nil }
        
        let address = Address(bytes: (data[0], data[1], data[2], data[3], data[4], data[5]))
        
        self.init(address: address, type: type)
    }
    
    public var data: Data {
        
        return address.data + Data([type.rawValue])
    }
}

/// GAP LE Device Address Type.
public enum GAPLEDeviceAddressType: UInt8 {
    
    /// Public Device Address
    case `public` = 0x00
    
    /// Random Device Address
    case random = 0x01
}
