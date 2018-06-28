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
 
 The SYSTEM ID characteristic consists of a structure with two fields. The first field are the LSOs and the second field contains the MSOs. This is a 64-bit structure which consists of a 40-bit manufacturer-defined identifier concatenated with a 24 bit unique Organizationally Unique Identifier (OUI). The OUI is issued by the IEEE Registration Authority (http://standards.ieee.org/regauth/index.html) and is required to be used in accordance with IEEE Standard 802-2001.6 while the least significant 40 bits are manufacturer defined.
 
 If System ID generated based on a Bluetooth Device Address, it is required to be done as follows. System ID and the Bluetooth Device Address have a very similar structure: a Bluetooth Device Address is 48 bits in length and consists of a 24 bit Company Assigned Identifier (manufacturer defined identifier) concatenated with a 24 bit Company Identifier (OUI). In order to encapsulate a Bluetooth Device Address as System ID, the Company Identifier is concatenated with 0xFFFE followed by the Company Assigned Identifier of the Bluetooth Address. For more guidelines related to EUI-64, refer to http://standards.ieee.org/develop/regauth/tut/eui64.pdf.
 
 [System ID](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.system_id.xml)
 
 - Note:
 
    The fields in the above table are in the order of LSO to MSO. Where LSO = Least Significant Octet and MSO = Most Significant Octet.
 */
public struct GATTSystemID: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .systemId }
    
    internal static let length = UInt40.length + UInt24.length
    
    public var manufacturerIdentifier: UInt40
    
    public var organizationallyUniqueIdentifier: UInt24
    
    public init(manufacturerIdentifier: UInt40,
                organizationallyUniqueIdentifier: UInt24) {
        
        self.manufacturerIdentifier = manufacturerIdentifier
        self.organizationallyUniqueIdentifier = organizationallyUniqueIdentifier
    }
    
    /*
    public init(address: Bluetooth.Address, organizationallyUniqueIdentifier: UInt24) {
        
        
    }*/
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let manufacturerIdentifier = UInt40(littleEndian: UInt40(bytes: (data[0], data[1], data[2], data[3], data[4])))
        
        let organizationallyUniqueIdentifier = UInt24(littleEndian: UInt24(bytes: (data[5], data[6], data[7])))
        
        self.init(manufacturerIdentifier: manufacturerIdentifier,
                  organizationallyUniqueIdentifier: organizationallyUniqueIdentifier)
    }
    
    public var data: Data {
        
        let manufacturerBytes = manufacturerIdentifier.littleEndian.bytes
        
        let organizationallyUniqueBytes = organizationallyUniqueIdentifier.littleEndian.bytes
        
        return Data([
            manufacturerBytes.0,
            manufacturerBytes.1,
            manufacturerBytes.2,
            manufacturerBytes.3,
            manufacturerBytes.4,
            organizationallyUniqueBytes.0,
            organizationallyUniqueBytes.1,
            organizationallyUniqueBytes.2
            ])
    }
}

// MARK: - Equatable

extension GATTSystemID: Equatable {
    
    public static func == (lhs: GATTSystemID, rhs: GATTSystemID) -> Bool {
        
        return lhs.manufacturerIdentifier == rhs.manufacturerIdentifier
            && lhs.organizationallyUniqueIdentifier == rhs.organizationallyUniqueIdentifier
    }
}

// MARK: - Hashable

extension GATTSystemID: Hashable {
    
    public var hashValue: Int {
        
        let manufacturerIdentifierBytes = manufacturerIdentifier.bigEndian.bytes
        
        let organizationallyUniqueIdentifierBytes = organizationallyUniqueIdentifier.bigEndian.bytes
        
        return UInt64(bigEndian: UInt64(bytes: (manufacturerIdentifierBytes.0,
                                                manufacturerIdentifierBytes.1,
                                                manufacturerIdentifierBytes.2,
                                                manufacturerIdentifierBytes.3,
                                                manufacturerIdentifierBytes.4,
                                                organizationallyUniqueIdentifierBytes.0,
                                                organizationallyUniqueIdentifierBytes.1,
                                                organizationallyUniqueIdentifierBytes.2))).hashValue
    }
}

// MARK: - CustomStringConvertible

extension GATTSystemID: CustomStringConvertible {
    
    public var description: String {
        
        return manufacturerIdentifier.description + organizationallyUniqueIdentifier.description
    }
}
