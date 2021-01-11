//
//  GAPRandomTargetAddress.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Random Target Address data type defines the address of one or more intended recipients of an advertisement when one or more devices were bonded using a random address.
/// This data type is intended to be used to avoid a situation where a bonded device unnecessarily responds to an advertisement intended for another bonded device.
///
/// Size: Multiples of 6 octets
/// The format of each 6 octet address is the same as the Random Device Address defined in Vol. 6, Part B, Section 1.3.
/// The Random Target Address value shall be the enumerated value as defined by Bluetooth Assigned Numbers.
@frozen
public struct GAPRandomTargetAddress: GAPData, Equatable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8)
    
    public static let dataType: GAPDataType = .randomTargetAddress
    
    public let addresses: [BluetoothAddress]
    
    public init(addresses: [BluetoothAddress]) {
        
        self.addresses = addresses
    }
}

public extension GAPRandomTargetAddress {
    
    init?(data: Data) {
        
        guard data.count % BluetoothAddress.length == 0
            else { return nil }
        
        let count = data.count / BluetoothAddress.length
        
        let addresses: [BluetoothAddress] = (0 ..< count).map {
            let index = $0 * BluetoothAddress.length
            return BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[index], data[index+1], data[index+2], data[index+3], data[index+4], data[index+5])))
        }
        
        self.init(addresses: addresses)
    }
    
    var dataLength: Int {
        
        return addresses.count * BluetoothAddress.length
    }
    
    func append(to data: inout Data) {
        
        addresses.forEach { data += $0.littleEndian }
    }
}

// MARK: - CustomStringConvertible

extension GAPRandomTargetAddress: CustomStringConvertible {
    
    public var description: String {
        
        return addresses.description
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPRandomTargetAddress: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: BluetoothAddress...) {
        
        self.init(addresses: elements)
    }
}
