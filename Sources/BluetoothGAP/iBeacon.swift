//
//  iBeacon.swift
//  
//
//  Created by Alsey Coleman Miller on 10/22/20.
//

#if canImport(Foundation)
import Foundation
#endif
import Bluetooth

public extension AppleBeacon {
    
    init?<Data: DataContainer>(manufacturerData: GAPManufacturerSpecificData<Data>) {
        
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
        
        let uuid = UUID(UInt128(bigEndian: UInt128(data: data.subdata(in: 2 ..< 18))!))
        let major = UInt16(bigEndian: UInt16(bytes: (data[18], data[19])))
        let minor = UInt16(bigEndian: UInt16(bytes: (data[20], data[21])))
        let rssi = Int8(bitPattern: data[22])
        
        self.init(uuid: uuid, major: major, minor: minor, rssi: rssi)
    }
}

public extension GAPManufacturerSpecificData {
    
    init(beacon: AppleBeacon) {
        var additionalData = AdditionalData()
        additionalData.reserveCapacity(AppleBeacon.additionalDataLength)
        beacon.appendAdditionalManufacturerData(to: &additionalData)
        assert(additionalData.count == AppleBeacon.additionalDataLength)
        self.init(
            companyIdentifier: AppleBeacon.companyIdentifier,
            additionalData: additionalData
        )
    }
}

internal extension AppleBeacon {
        
    /// Apple iBeacon data type.
    static var appleDataType: UInt8 { 0x02 } // iBeacon
    
    /// The length of the TLV encoded data.
    static var length: UInt8 { 0x15 } // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
    
    static var additionalDataLength: Int { return Int(length) + 2 }
    /*
    static func from(advertisingData: LowEnergyAdvertisingData) -> (beacon: AppleBeacon, flags: GAPFlags)? {
        
        guard let (flags, manufacturerData) = try? GAPDataDecoder.decode(GAPFlags.self, AppleBeacon.ManufacturerData.self, from: advertisingData)
            else { return nil }
        
        return (manufacturerData.beacon, flags)
    }*/
    
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
        
        let encoder = GAPDataEncoder<LowEnergyAdvertisingData>()
        let manufacturerData = AppleBeacon.ManufacturerData(beacon) // storage on stack
        self = encoder.encode(flags, manufacturerData)
    }
}

internal extension AppleBeacon {
    
    struct ManufacturerData: GAPData {
        
        static var dataType: GAPDataType { .manufacturerSpecificData }
        
        internal let beacon: AppleBeacon
        
        init(_ beacon: AppleBeacon) {
            self.beacon = beacon
        }
        
        init?<Data>(data: Data) where Data : DataContainer {

            guard let manufacturerData = GAPManufacturerSpecificData<Data>(data: data),
                let beacon = AppleBeacon(manufacturerData: manufacturerData)
                else { return nil }
            
            self.init(beacon)
        }
        
        var dataLength: Int { return 2 + AppleBeacon.additionalDataLength }
        
        func append<Data>(to data: inout Data) where Data : DataContainer {
            data += self
        }
    }
}

extension AppleBeacon.ManufacturerData: DataConvertible {
    
    @usableFromInline
    static func += <Data>(data: inout Data, value: AppleBeacon.ManufacturerData) where Data : DataContainer {
        data += GAPManufacturerSpecificData<Data>(companyIdentifier: AppleBeacon.companyIdentifier)
        value.beacon.appendAdditionalManufacturerData(to: &data)
    }
}
