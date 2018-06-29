//
//  GATTSystemID.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 System ID
 
 The SYSTEM ID characteristic consists of a structure with two fields. The first field are the LSOs and the second field contains the MSOs. This is a 64-bit structure which consists of a 40-bit manufacturer-defined identifier concatenated with a 24 bit unique Organizationally Unique Identifier (OUI). The OUI is issued by the [IEEE Registration Authority](http://standards.ieee.org/regauth/index.html) and is required to be used in accordance with IEEE Standard 802-2001.6 while the least significant 40 bits are manufacturer defined.
 
 [System ID](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.system_id.xml)
 */
public struct GATTSystemID: GATTCharacteristic, RawRepresentable {
    
    public static var uuid: BluetoothUUID { return .systemId }
    
    internal static let length = MemoryLayout<UInt64>.size
    
    public var rawValue: UInt64
    
    public init(rawValue: UInt64) {
        
        self.rawValue = rawValue
    }
    
    public init(manufacturerIdentifier: UInt40,
                organizationallyUniqueIdentifier: UInt24) {
        
        let manufacturerIdentifierBytes = manufacturerIdentifier.bigEndian.bytes
        
        let organizationallyUniqueIdentifierBytes = organizationallyUniqueIdentifier.bigEndian.bytes
        
        self.rawValue = UInt64(bigEndian: UInt64(bytes: (organizationallyUniqueIdentifierBytes.0,
                                                        organizationallyUniqueIdentifierBytes.1,
                                                        organizationallyUniqueIdentifierBytes.2,
                                                        manufacturerIdentifierBytes.0,
                                                        manufacturerIdentifierBytes.1,
                                                        manufacturerIdentifierBytes.2,
                                                        manufacturerIdentifierBytes.3,
                                                        manufacturerIdentifierBytes.4
                                                        )))
    }
    
    public var manufacturerIdentifier: UInt40 {
        
        let bytes = rawValue.bigEndian.bytes
        
        return UInt40(bigEndian: UInt40(bytes: (bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
    
    public var organizationallyUniqueIdentifier: UInt24 {
        
        let bytes = rawValue.bigEndian.bytes
        
        return UInt24(bigEndian: UInt24(bytes: (bytes.0, bytes.1, bytes.2)))
    }
    
    /// Initialize a System ID based on a Bluetooth Device Address.
    public init(address: Bluetooth.Address) {
        
        /**
         If System ID generated based on a Bluetooth Device Address, it is required to be done as follows. System ID and the Bluetooth Device Address have a very similar structure: a Bluetooth Device Address is 48 bits in length and consists of a 24 bit Company Assigned Identifier (manufacturer defined identifier) concatenated with a 24 bit Company Identifier (OUI). In order to encapsulate a Bluetooth Device Address as System ID, the Company Identifier is concatenated with 0xFFFE followed by the Company Assigned Identifier of the Bluetooth Address.
         
         Example:
         If the system ID is based of a Bluetooth Device Address with a Company Identifier (OUI) is 0x123456 and the Company Assigned Identifier is 0x9ABCDE, then the System Identifier is required to be 0x123456FFFE9ABCDE
         */
        
        let manufacturerIdentifierPrefix = UInt16(0xFFFE).bigEndian.bytes
        
        let addressBytes = address.bigEndian.bytes
        
        self.rawValue = UInt64(bigEndian: UInt64(bytes: (addressBytes.0,
                                                         addressBytes.1,
                                                         addressBytes.2,
                                                         manufacturerIdentifierPrefix.0,
                                                         manufacturerIdentifierPrefix.1,
                                                         addressBytes.3,
                                                         addressBytes.4,
                                                         addressBytes.5)))
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let rawValue = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
        
        self.init(rawValue: rawValue)
    }
    
    public var data: Data {
        
        let bytes = rawValue.littleEndian.bytes
        
        return Data([
            bytes.0,
            bytes.1,
            bytes.2,
            bytes.3,
            bytes.4,
            bytes.5,
            bytes.6,
            bytes.7
            ])
    }
}

// MARK: - Equatable

extension GATTSystemID: Equatable {
    
    public static func == (lhs: GATTSystemID, rhs: GATTSystemID) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: - Hashable

extension GATTSystemID: Hashable {
    
    public var hashValue: Int {
        
        return rawValue.hashValue
    }
}

// MARK: - CustomStringConvertible

extension GATTSystemID: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.toHexadecimal()
    }
}
