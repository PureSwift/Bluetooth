//
//  GAPTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GAPTests: XCTestCase {
    
    static let allTests = [
        ("testBit16UUIDList", testBit16UUIDList),
        ("testBit32UUIDList", testBit32UUIDList),
        ("testBit128UUIDList", testBit128UUIDList),
        ("testDataType", testDataType),
        ("testGAPCompleteLocalName", testGAPCompleteLocalName),
        ("testGAPCompleteListOf16BitServiceClassUUIDs", testGAPCompleteListOf16BitServiceClassUUIDs),
        ("testGAPCompleteListOf32BitServiceClassUUIDs", testGAPCompleteListOf32BitServiceClassUUIDs),
        ("testGAPCompleteListOf128BitServiceClassUUIDs", testGAPCompleteListOf128BitServiceClassUUIDs),
        ("testGAPTxPowerLevel", testGAPTxPowerLevel),
        ("testGAPSlaveConnectionIntervalRange", testGAPSlaveConnectionIntervalRange),
        ("testGAPServiceData16BitUUID", testGAPServiceData16BitUUID),
        ("testGAPServiceData32BitUUID", testGAPServiceData32BitUUID),
        ("testGAPServiceData128BitUUID", testGAPServiceData128BitUUID),
        ("testGAPAppearance", testGAPAppearance),
        ("testGAPPublicTargetAddress", testGAPPublicTargetAddress),
        ("testGAPRandomTargetAddress", testGAPRandomTargetAddress),
        ("testGAPAdvertisingInterval", testGAPAdvertisingInterval)
    ]
    
    func testDataType() {
        
        XCTAssertEqual(GAPDataType.flags.description, "Flags")
        XCTAssertEqual(GAPDataType(rawValue: 0).description, "Data Type (0)")
    }
    
    func testBit16UUIDList() {
        
        XCTAssertNil(Bit16UUIDList(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])),
                     "Can only initialize from multiples of 2 bytes")
        
        XCTAssertEqual(Bit16UUIDList(data: Data())?.uuids ?? [], [], "Should initialize from empty data")
        
        do {
            
            // 16 bit UUIDs: 0X1803 0X1804 0X1802
            let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18])
            
            guard let list = Bit16UUIDList(data: data)
                else { XCTFail("Could not parse from data"); return }
            
            XCTAssertEqual(list.data, data)
            XCTAssertEqual(list.uuids, [0x1803, 0x1804, 0x1802])
            XCTAssertEqual(list.uuids.map { BluetoothUUID.bit16($0) }, [.linkLoss, .txPower, .immediateAlert])

        }
    }
    
    func testBit32UUIDList() {
        
        XCTAssertNil(Bit32UUIDList(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])),
                     "Can only initialize from multiples of 4 bytes")
        
        XCTAssertEqual(Bit32UUIDList(data: Data())?.uuids ?? [], [], "Should initialize from empty data")
        
        // 32 bit UUIDs: 0x18041803 0x06041802
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06])
        
        guard let list = Bit32UUIDList(data: data)
            else { XCTFail("Could not parse from data"); return }
        
        XCTAssertEqual(list.data, data)
        XCTAssertEqual(list.uuids, [0x18041803, 0x06041802])
    }
    
    func testBit128UUIDList() {
        
        XCTAssertNil(Bit128UUIDList(data: Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06])),
                     "Can only initialize from multiples of 16 bytes")
        
        XCTAssertEqual(Bit128UUIDList(data: Data())?.uuids ?? [], [], "Should initialize from empty data")
        
        // 128 bit UUIDs: 0x18041803 0x06041802 0x18041803 0x18030602
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18])
        
        guard let list = Bit128UUIDList(data: data)
            else { XCTFail("Could not parse from data"); return }
        
        XCTAssertEqual(list.data, data)
        //XCTAssertEqual(list.uuids.map { $0.description }, [UUID(bytes: (0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18))])
    }
    
    func testGAPCompleteLocalName() {
        
        /**
         Length Data: 0X0C
         Local Name: BlueZ 5.43
         Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
         */
        let data = Data([0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
        let name: GAPCompleteLocalName = "BlueZ 5.43"
        XCTAssertEqual(data.count, 0x0C)
        XCTAssertEqual(data.count, 12)
        
        var decoded = [GAPData]()
        XCTAssertNoThrow(decoded = try GAPDataDecoder.decode(data, types: [GAPCompleteLocalName.self], ignoreUnknownType: false))
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        
        guard let nameData = decoded.first as? GAPCompleteLocalName
            else { XCTFail(); return }
        
        XCTAssertEqual(nameData, name)
        XCTAssertEqual(GAPDataEncoder.encode([name]), data)
    }
    
    func testGAPCompleteListOf16BitServiceClassUUIDs() {
        
        /**
         Length Data: 0X16
         Flags: 0X1A
         16 bit UUIDs: 0X1803 0X1804 0X1802
         Local Name: Proximity
         Data: 02 01 1A 07 03 03 18 04 18 02 18 0A 09 50 72 6F 78 69 6D 69 74 79
         */
        
        let data = Data([0x02, 0x01, 0x1A, 0x07, 0x03, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79])
        XCTAssertEqual(data.count, 0x16)
        
        let flags: GAPFlags = 0x1A
        let uuidList: GAPCompleteListOf16BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802]
        let localName: GAPCompleteLocalName = "Proximity"
        
        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 3)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as! GAPFlags, flags)
        XCTAssertEqual(decoded[1] as! GAPCompleteListOf16BitServiceClassUUIDs, uuidList)
        XCTAssertEqual(decoded[2] as! GAPCompleteLocalName, localName)
    }
    
    func testGAPCompleteListOf32BitServiceClassUUIDs() {
        
        /**
         Length Data: 0x2E
         Flags: 0x1A
         32 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Freedom
         Data: 02 01 1A 21 05 03 18 00 00 04 18 00 00 02 18 00 00 07 01 00 00 F4 01 00 00 F5 01 00 00 F6 01 00 00 F7 01 00 00 08 09 46 72 65 65 64 6f 6d
         */
        
        let data = Data([0x02, 0x01, 0x1A, 0x21, 0x05, 0x03, 0x18, 0x00, 0x00, 0x04, 0x18, 0x00, 0x00, 0x02, 0x18, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xF5, 0x01, 0x00, 0x00, 0xF6, 0x01, 0x00, 0x00, 0xF7, 0x01, 0x00, 0x00, 0x08, 0x09, 0x46, 0x72, 0x65, 0x65, 0x64, 0x6f, 0x6d])
        XCTAssertEqual(data.count, 0x2E)
        
        let flags: GAPFlags = 0x1A
        let uuidList: GAPCompleteListOf32BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802, 0x0107, 0x01F4, 0x01F5, 0x01F6, 0x01F7]
        let localName: GAPCompleteLocalName = "Freedom"
        
        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 3)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as! GAPFlags, flags)
        XCTAssertEqual(decoded[1] as! GAPCompleteListOf32BitServiceClassUUIDs, uuidList)
        XCTAssertEqual(decoded[2] as! GAPCompleteLocalName, localName)
    }
    
    func testGAPCompleteListOf128BitServiceClassUUIDs() {
        
        /**
         Length Data: 0x23
         Flags: 0x1A
         128 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Test 128bits
         Data: 02 01 1a 11 07 03 18 04 18 02 18 04 06 03 18 04 18 02 06 03 18 0d 09 54 65 73 74 20 31 32 38 62 69 74 73
         */
        
        let data = Data([0x02, 0x01, 0x1a, 0x11, 0x07, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18, 0x0d, 0x09, 0x54, 0x65, 0x73, 0x74, 0x20, 0x31, 0x32, 0x38, 0x62, 0x69, 0x74, 0x73])
        XCTAssertEqual(data.count, 0x23)
        
        let flags: GAPFlags = 0x1A
        let uuidList: GAPCompleteListOf128BitServiceClassUUIDs = [UUID(bytes: (0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18))]
        let localName: GAPCompleteLocalName = "Test 128bits"
        
        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 3)
        //            XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        //
        //            XCTAssertEqual(decoded[0] as! GAPFlags, flags)
        //            XCTAssertEqual(decoded[1] as! GAPCompleteListOf128BitServiceClassUUIDs, uuidList)
        //            XCTAssertEqual(decoded[2] as! GAPCompleteLocalName, localName)
    }
    
    func testGAPTxPowerLevel() {
        
        let data = Data([0x02, 0x0A, 0x7F])
        
        XCTAssertEqual(data.count, 0x03)
        
        let txPowerLevel: GAPTxPowerLevel = 127
        let expectedData: [GAPData] = [txPowerLevel]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as! GAPTxPowerLevel, txPowerLevel)
    }
    
    func testGAPSlaveConnectionIntervalRange() {
        
        let data = Data([0x05, 0x12, 0x06, 0x00, 0x80, 0x0c])
        
        XCTAssertEqual(data.count, 0x06)
        
        XCTAssertNil(GAPSlaveConnectionIntervalRange(intervalRange: (0xFFF4, 0xFFF1)))
        XCTAssertNotNil(GAPSlaveConnectionIntervalRange(intervalRange: (GAPSlaveConnectionIntervalRange.min, GAPSlaveConnectionIntervalRange.min)))
        XCTAssertNotNil(GAPSlaveConnectionIntervalRange(intervalRange: (GAPSlaveConnectionIntervalRange.max, GAPSlaveConnectionIntervalRange.max)))
        
        let intervalRange = GAPSlaveConnectionIntervalRange(intervalRange: (GAPSlaveConnectionIntervalRange.min, GAPSlaveConnectionIntervalRange.max))
        let expectedData: [GAPData] = [intervalRange!]
        
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as? GAPSlaveConnectionIntervalRange, intervalRange)
    }
    
    func testGAPServiceData16BitUUID() {
        
        XCTAssertNil(GAPServiceData16BitUUID(data: Data([0x4f])))
        
        do {
            let data = Data([0x4f, 0x30])
            let serviceData = GAPServiceData16BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 2)
            XCTAssertEqual(serviceData.data, data)
            XCTAssertEqual(serviceData.data.count, 2)
        }
        
        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let serviceData = GAPServiceData16BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 2)
            XCTAssertEqual(serviceData.serviceData.count, 3)
            XCTAssertEqual(serviceData.data, data)
            XCTAssertEqual(serviceData.data.count, 5)
        }
        
        XCTAssertEqual(GAPServiceData16BitUUID(data: Data([0x4f, 0x45, 0xff])),
                       GAPServiceData16BitUUID(data: Data([0x4f, 0x45, 0xff])))
    }
    
    func testGAPServiceData32BitUUID() {
        
        XCTAssertNil(GAPServiceData32BitUUID(data: Data([0x4f])))
        
        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30])
            let serviceData = GAPServiceData32BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 4)
            XCTAssertEqual(serviceData.data, data)
            XCTAssertEqual(serviceData.data.count, 4)
        }
        
        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let serviceData = GAPServiceData32BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 4)
            XCTAssertEqual(serviceData.serviceData.count, 1)
            XCTAssertEqual(serviceData.data, data)
            XCTAssertEqual(serviceData.data.count, 5)
        }
        
        XCTAssertEqual(GAPServiceData16BitUUID(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])),
                       GAPServiceData16BitUUID(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])))
    }
    
    func testGAPServiceData128BitUUID() {
        
        XCTAssertNil(GAPServiceData128BitUUID(data: Data([0x4f])))

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56])
            let serviceData = GAPServiceData128BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 16)
            XCTAssertEqual(serviceData.data, data)
            XCTAssertEqual(serviceData.data.count, 16)
        }

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56, 0x4f, 0x30, 0x4f, 0x56])
            let serviceData = GAPServiceData128BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 16)
            XCTAssertEqual(serviceData.serviceData.count, 4)
            XCTAssertEqual(serviceData.data, data)
            XCTAssertEqual(serviceData.data.count, 20)
        }

        XCTAssertEqual(GAPServiceData128BitUUID(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56, 0x4f, 0x30, 0x4f, 0x56])),
                       GAPServiceData128BitUUID(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56, 0x4f, 0x30, 0x4f, 0x56])))
    }
    
    func testGAPAppearance() {
        
        XCTAssertNil(GAPAppearance(data: Data([0x4f])))
        XCTAssertNil(GAPAppearance(data: Data([0x4f, 0x4f, 0x4f])))
        
        do {
            let data = Data([0x4f, 0xf8])
            let appearance = GAPAppearance(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: appearance), 2)
            XCTAssertEqual(appearance.data, data)
            XCTAssertEqual(appearance.data.count, 2)
        }
        
        XCTAssertEqual(GAPAppearance(data: Data([0x4f, 0xf8])), GAPAppearance(data: Data([0x4f, 0xf8])))
    }
    
    func testGAPPublicTargetAddress() {
        
        XCTAssertNil(GAPPublicTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b])))
        XCTAssertNil(GAPPublicTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b, 0xf8, 0xf8])))
        
        do {
            let data = Data([0xf8, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0xf8, 0x91, 0x7e])
            let targetAddress = GAPPublicTargetAddress(data: data)!
            
            XCTAssertEqual(targetAddress.data, data)
            XCTAssertEqual(targetAddress.targetAddresses.count, 2)
            XCTAssertEqual(targetAddress.data.count, 12)
        }
        
    }
    
    func testGAPRandomTargetAddress() {
        
        XCTAssertNil(GAPRandomTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b])))
        XCTAssertNil(GAPRandomTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b, 0xf8, 0xf8])))
        
        do {
            let data = Data([0xf8, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0xf8, 0x91, 0x7e])
            let targetAddress = GAPRandomTargetAddress(data: data)!
            
            XCTAssertEqual(targetAddress.data, data)
            XCTAssertEqual(targetAddress.targetAddresses.count, 2)
            XCTAssertEqual(targetAddress.data.count, 12)
        }
        
    }
    
    func testGAPAdvertisingInterval() {
    
        XCTAssertNil(GAPAdvertisingInterval(data: Data([0x4f])))
        XCTAssertNil(GAPAdvertisingInterval(data: Data([0x4f, 0xf8, 0x30])))
        
        do {
            let data = Data([0xf8, 0x30])
            let advertisingInterval = GAPAdvertisingInterval(data: data)!
            
            XCTAssertEqual(advertisingInterval.data, data)
            XCTAssertEqual(MemoryLayout.size(ofValue: advertisingInterval), 2)
            XCTAssertEqual(advertisingInterval.data.count, 2)
        }
    }
}
