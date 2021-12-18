//
//  iBeacon.swift
//  
//
//  Created by Alsey Coleman Miller on 10/22/20.
//

import Foundation
import Bluetooth

public extension AppleBeacon {
    
    init?(manufacturerData: GAPManufacturerSpecificData) {
        
        let data = manufacturerData.additionalData
        
        guard manufacturerData.companyIdentifier == type(of: self).companyIdentifier,
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
    
    var manufacturerData: GAPManufacturerSpecificData {
        
        var additionalData = Data(capacity: type(of: self).additionalDataLength)
        appendAdditionalManufacturerData(to: &additionalData)
        assert(additionalData.count == type(of: self).additionalDataLength)
        
        let manufacturerData = GAPManufacturerSpecificData(
            companyIdentifier: type(of: self).companyIdentifier,
            additionalData: additionalData
        )
        
        return manufacturerData
    }
}

internal extension AppleBeacon {
        
    /// Apple iBeacon data type.
    static var appleDataType: UInt8 { return 0x02 } // iBeacon
    
    /// The length of the TLV encoded data.
    static var length: UInt8 { return 0x15 } // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
    
    static var additionalDataLength: Int { return Int(length) + 2 }
    
    static func from(advertisingData: LowEnergyAdvertisingData) -> (beacon: AppleBeacon, flags: GAPFlags)? {
        
        guard let (flags, manufacturerData) = try? GAPDataDecoder.decode(GAPFlags.self, AppleBeacon.ManufacturerData.self, from: advertisingData)
            else { return nil }
        
        return (manufacturerData.beacon, flags)
    }
    
    func appendAdditionalManufacturerData <T: DataContainer> (to data: inout T) {
        
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
        let manufacturerData = AppleBeacon.ManufacturerData(beacon) // storage on stack
        do { self = try encoder.encodeAdvertisingData(flags, manufacturerData) }
        catch { fatalError("Unable to encode iBeacon advertisement: \(error)") }
    }
}

internal extension AppleBeacon {
    
    struct ManufacturerData: GAPData {
        
        static var dataType: GAPDataType { return .manufacturerSpecificData }
        
        internal let beacon: AppleBeacon
        
        init(_ beacon: AppleBeacon) {
            self.beacon = beacon
        }
        
        init?(data: Data) {
            
            guard let manufacturerData = GAPManufacturerSpecificData(data: data),
                let beacon = AppleBeacon(manufacturerData: manufacturerData)
                else { return nil }
            
            self.init(beacon)
        }
        
        init?(data slice: Slice<LowEnergyAdvertisingData>) {
            
            guard let manufacturerData = GAPManufacturerSpecificData(data: slice),
                let beacon = AppleBeacon(manufacturerData: manufacturerData)
                else { return nil }
            
            self.init(beacon)
        }
        
        var dataLength: Int { return 2 + AppleBeacon.additionalDataLength }
        
        /// Append data representation into buffer.
        func append(to data: inout Data) {
            data += self
        }
        
        /// Append data representation into buffer.
        func append(to data: inout LowEnergyAdvertisingData) {
            data += self
        }
    }
}

extension AppleBeacon.ManufacturerData: DataConvertible {
    
    @usableFromInline
    static func += <T>(data: inout T, value: AppleBeacon.ManufacturerData) where T : DataContainer {
        
        data += GAPManufacturerSpecificData(companyIdentifier: AppleBeacon.companyIdentifier)
        value.beacon.appendAdditionalManufacturerData(to: &data)
    }
}
