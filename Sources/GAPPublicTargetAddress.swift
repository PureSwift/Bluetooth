//
//  GAPPublicTargetAddress.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Public Target Address data type defines the address of one or more intended recipients of an advertisement when one or more devices were bonded using a public address.
/// This data type is intended to be used to avoid a situation where a bonded device unnecessarily responds to an advertisement intended for another bonded device.
///
/// Size: Multiples of 6 octets
/// The format of each 6 octet address is the same as the Public Device Address defined in Vol. 6, Part B, Section 1.3.
///
/// The public device address is divided into the following two fields:
/// company_assigned field is contained in the 24 least significant bits
/// company_id field is contained in the 24 most significant bits
public struct GAPPublicTargetAddress: GAPData, Equatable {
    
    internal static let addressLength = MemoryLayout<UInt8>.size * 6
    
    public static let dataType: GAPDataType = .publicTargetAddress
    
    public let addresses: [BluetoothAddress]
    
    public init(addresses: [BluetoothAddress]) {
        
        self.addresses = addresses
    }
    
    public init?(data: Data) {
        
        guard data.count % type(of: self).addressLength == 0
            else { return nil }
        
        var index = 0
        var addresses = [BluetoothAddress]()
        addresses.reserveCapacity(data.count / type(of: self).addressLength )
        
        while index < data.count {
            
            let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[index], data[index+1], data[index+2], data[index+3], data[index+4], data[index+5])))
            addresses.append(address)
            
            index += type(of: self).addressLength
        }
        
        self.init(addresses: addresses)
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GAPPublicTargetAddress: DataConvertible {
    
    var dataLength: Int {
        
        return addresses.count * BluetoothAddress.length
    }
    
    static func += <T: DataContainer> (data: inout T, value: GAPPublicTargetAddress) {
        
        value.addresses.forEach { data += $0.littleEndian }
    }
}

// MARK: - CustomStringConvertible

extension GAPPublicTargetAddress: CustomStringConvertible {
    
    public var description: String {
        
        return addresses.description
    }
}
