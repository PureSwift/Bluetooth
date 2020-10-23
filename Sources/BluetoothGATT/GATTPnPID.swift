//
//  GATTPnPID.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 PnP ID
 
 [PnP ID](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.pnp_id.xml)
 
 The PnP_ID characteristic returns its value when read using the GATT Characteristic Value Read procedure.
 
 The PnP_ID characteristic is a set of values that used to create a device ID value that is unique for this device. Included in the characteristic is a Vendor ID Source field, a Vendor ID field, a Product ID field and a Product Version field. These values are used to identify all devices of a given type/model/version using numbers.
 
 - Note:
 
    The fields in the above table are in the order of LSO to MSO. Where LSO = Least Significant Octet and MSO = Most Significant Octet
 */
public struct GATTPnPID: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .pnpId }
    
    internal static let length = 7
    
    public let vendorIdSource: VendorIDSource
    
    public let vendorId: UInt16
    
    public let productId: UInt16
    
    public let productVersion: UInt16
    
    public init(vendorIdSource: VendorIDSource, vendorId: UInt16, productId: UInt16, productVersion: UInt16) {
        
        self.vendorIdSource = vendorIdSource
        self.vendorId = vendorId
        self.productId = productId
        self.productVersion = productVersion
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let vendorIdSource = VendorIDSource(rawValue: data[0])
            else { return nil }
        
        let vendorId = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let productId = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        let productVersion = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
        
        self.init(vendorIdSource: vendorIdSource, vendorId: vendorId, productId: productId, productVersion: productVersion)
    }
    
    public var data: Data {
        
        let vendorIdBytes = vendorId.littleEndian.bytes
        
        let productIdBytes = productId.littleEndian.bytes
        
        let productVersionBytes = productVersion.littleEndian.bytes
        
        return Data([vendorIdSource.rawValue, vendorIdBytes.0, vendorIdBytes.1, productIdBytes.0, productIdBytes.1, productVersionBytes.0, productVersionBytes.1])
    }
}

extension GATTPnPID {
    
    public enum VendorIDSource: UInt8 {
        
        /// Bluetooth SIG assigned Company Identifier value from the Assigned Numbers document
        case fromAssignedNumbersDocument = 0x01
        
        /// USB Implementer’s Forum assigned Vendor ID value
        case fromVendorIDValue = 0x02
    }
}

extension GATTPnPID: Equatable {
    
    public static func == (lhs: GATTPnPID, rhs: GATTPnPID) -> Bool {
        
        return lhs.vendorIdSource == rhs.vendorIdSource &&
                lhs.vendorId == rhs.vendorId &&
                lhs.productId == rhs.productId &&
                lhs.productVersion == rhs.productVersion
    }
}

extension GATTPnPID: CustomStringConvertible {
    
    public var description: String {
        
        return "\(vendorIdSource) \(vendorId) \(productId) \(productVersion)"
    }
}

extension GATTPnPID.VendorIDSource: Equatable {
    
    public static func == (lhs: GATTPnPID.VendorIDSource, rhs: GATTPnPID.VendorIDSource) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTPnPID.VendorIDSource: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
