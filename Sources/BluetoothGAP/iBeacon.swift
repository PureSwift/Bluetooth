//
//  iBeacon.swift
//  
//
//  Created by Alsey Coleman Miller on 10/22/20.
//

import Foundation
import Bluetooth

public extension AppleBeacon {
    
    init?(manufactererData: GAPManufacturerSpecificData) {
        
        let data = manufactererData.additionalData
        
        guard manufactererData.companyIdentifier == type(of: self).companyIdentifier,
            data.count == type(of: self).additionalDataLength
            else { return nil }
        
        let dataType = data[0]
        
        guard dataType == type(of: self).appleDataType
            else { return nil }
        
        let length = data[1]
        
        guard length == type(of: self).length
            else { return nil }
        
        let uuid = UUID(UInt128(bigEndian: UInt128(data: data.subdataNoCopy(in: 2 ..< 18))!))
        let major = UInt16(bigEndian: UInt16(bytes: (data[18], data[19])))
        let minor = UInt16(bigEndian: UInt16(bytes: (data[20], data[21])))
        let rssi = Int8(bitPattern: data[22])
        
        self.init(uuid: uuid, major: major, minor: minor, rssi: rssi)
    }
    
    var manufactererData: GAPManufacturerSpecificData {
        
        var additionalData = Data(capacity: type(of: self).additionalDataLength)
        appendAdditionalManufactererData(to: &additionalData)
        assert(additionalData.count == type(of: self).additionalDataLength)
        
        let manufactererData = GAPManufacturerSpecificData(
            companyIdentifier: type(of: self).companyIdentifier,
            additionalData: additionalData
        )
        
        return manufactererData
    }
}

internal extension AppleBeacon {
        
    /// Apple iBeacon data type.
    static var appleDataType: UInt8 { return 0x02 } // iBeacon
    
    /// The length of the TLV encoded data.
    static var length: UInt8 { return 0x15 } // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
    
    static var additionalDataLength: Int { return Int(length) + 2 }
    
    static func from(advertisingData: LowEnergyAdvertisingData) -> (beacon: AppleBeacon, flags: GAPFlags)? {
        
        let decoder = GAPDataDecoder()
        
        guard let decodedGapData = try? decoder.decode(advertisingData),
            decodedGapData.count == 2,
            let flags = decodedGapData[0] as? GAPFlags,
            let manufactererData = decodedGapData[1] as? GAPManufacturerSpecificData,
            let beacon = AppleBeacon(manufactererData: manufactererData)
            else { return nil }
        
        return (beacon, flags)
    }
    
    func appendAdditionalManufactererData <T: DataContainer> (to data: inout T) {
        
        data += type(of: self).appleDataType // tlvPrefix
        data += type(of: self).length
        data += BluetoothUUID(uuid: uuid).bigEndian // uuidBytes
        data += major.bigEndian
        data += minor.bigEndian
        data += UInt8(bitPattern: rssi)
    }
}

public extension LowEnergyAdvertisingData {
    
    init(beacon: AppleBeacon,
         flags: GAPFlags = [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR]) {
        
        let encoder = GAPDataEncoder()
        // swiftlint:disable force_try
        self = try! encoder.encodeAdvertisingData(flags, beacon.manufactererData)
        // swiftlint:enable force_try
    }
}