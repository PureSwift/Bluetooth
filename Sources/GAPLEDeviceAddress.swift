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
    
    public static var dataType: GAPDataType { return .lowEnergyDeviceAddress }
    
    public let address: BluetoothAddress
    
    public let type: GAPLEDeviceAddressType
    
    public init(address: BluetoothAddress,
                type: GAPLEDeviceAddressType = .public) {
        
        self.address = address
        self.type = type
    }
}

public extension GAPLEDeviceAddress {
    
    internal static var length: Int { return 7 }
    
    public init?(data: Data) {
        
        guard data.count == Swift.type(of: self).length,
            let type = GAPLEDeviceAddressType(rawValue: data[6])
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.init(address: address, type: type)
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GAPLEDeviceAddress: DataConvertible {
    
    var dataLength: Int {
        
        return Swift.type(of: self).length
    }
    
    static func += (data: inout Data, value: GAPLEDeviceAddress) {
        
        data += value.address.littleEndian
        data += value.type.rawValue
    }
}

// MARK: - Supporting Types

/// GAP LE Device Address Type.
public enum GAPLEDeviceAddressType: UInt8 {
    
    /// Public Device Address
    case `public` = 0x00
    
    /// Random Device Address
    case random = 0x01
}
