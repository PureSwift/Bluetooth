//
//  GAPTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
import Bluetooth
@testable import BluetoothGAP

final class GAPTests: XCTestCase {
    
    func testDataType() {
        
        XCTAssertEqual(GAPDataType.flags.description, "Flags")
        XCTAssertEqual(GAPDataType.incompleteListOf16BitServiceClassUUIDs.description, "Incomplete List of 16-bit Service Class UUIDs")
        XCTAssertEqual(GAPDataType(rawValue: 0).description, "GAP Data Type (0)")
    }
    
    func testFlags() {
        
        let flags: GAPFlags = [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR]
        
        XCTAssertEqual(flags, 0b00000110)
        XCTAssertEqual(flags.flags, [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR])
        XCTAssertEqual(flags.description, "[LE General Discoverable Mode, BR/EDR Not Supported]")
        
        let allFlags = Array(GAPFlag.allCases).sorted(by: { $0.rawValue < $1.rawValue })
        allFlags.forEach { XCTAssertFalse($0.description.isEmpty) }
    }
    
    func testBit16UUIDList() {
        
        XCTAssertNil(GAPUUIDList<UInt16>(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])),
                     "Can only initialize from multiples of 2 bytes")
        
        XCTAssertEqual(GAPUUIDList<UInt16>(data: Data())?.uuids ?? [], [], "Should initialize from empty data")
        
        do {
            // 16 bit UUIDs: 0X1803 0X1804 0X1802
            let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18])
            
            guard let list = GAPUUIDList<UInt16>(data: data)
                else { XCTFail("Could not parse from data"); return }
            
            XCTAssertEqual(list.data, data)
            XCTAssertEqual(list.uuids, [0x1803, 0x1804, 0x1802])
            XCTAssertEqual(list.uuids.map { BluetoothUUID.bit16($0) }, [.linkLoss, .txPower, .immediateAlert])
        }
    }
    
    func testBit32UUIDList() {
        
        XCTAssertNil(GAPUUIDList<UInt32>(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])),
                     "Can only initialize from multiples of 4 bytes")
        
        XCTAssertEqual(GAPUUIDList<UInt32>(data: Data())?.uuids ?? [], [], "Should initialize from empty data")
        
        // 32 bit UUIDs: 0x18041803 0x06041802
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06])
        
        guard let list = GAPUUIDList<UInt32>(data: data)
            else { XCTFail("Could not parse from data"); return }
        
        XCTAssertEqual(list.data, data)
        XCTAssertEqual(list.uuids, [0x18041803, 0x06041802])
    }
    
    func testBit128UUIDList() {
        
        XCTAssertNil(GAPUUIDList<UInt128>(data: Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06])),
                     "Can only initialize from multiples of 16 bytes")
        
        XCTAssertEqual(GAPUUIDList<UInt128>(data: Data())?.uuids ?? [], [], "Should initialize from empty data")
        
        // 128 bit UUIDs: 0x18041803 0x06041802 0x18041803 0x18030602
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18])
        
        guard let list = GAPUUIDList<UInt128>(data: data)
            else { XCTFail("Could not parse from data"); return }
        
        XCTAssertEqual(list.data, data)
        //XCTAssertEqual(list.uuids.map { $0.description }, [UUID(bytes: (0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18))])
    }
    
    func testShortLocalName() {
        
        /**
         Length Data: 0X0C
         Local Name: BlueZ 5.43
         Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
         */
        let data = Data([0x0B, 0x08, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
        let name: GAPShortLocalName = "BlueZ 5.43"
        XCTAssertEqual(data.count, 0x0C)
        XCTAssertEqual(data.count, 12)
        XCTAssertEqual(name.description, "BlueZ 5.43")
        
        var decoded = [GAPData]()
        XCTAssertNoThrow(decoded = try GAPDataDecoder.decode(data, types: [GAPShortLocalName.self], ignoreUnknownType: false))
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        
        guard let nameData = decoded.first as? GAPShortLocalName
            else { XCTFail(); return }
        
        XCTAssertEqual(nameData, name)
        XCTAssertEqual(GAPDataEncoder.encode([name]), data)
    }
    
    func testCompleteLocalName() {
        
        /**
         Length Data: 0X0C
         Local Name: BlueZ 5.43
         Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
         */
        let data = Data([0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
        let name: GAPCompleteLocalName = "BlueZ 5.43"
        XCTAssertEqual(data.count, 0x0C)
        XCTAssertEqual(data.count, 12)
        XCTAssertEqual(name.description, "BlueZ 5.43")
        
        var decoded = [GAPData]()
        XCTAssertNoThrow(decoded = try GAPDataDecoder.decode(data, types: [GAPCompleteLocalName.self], ignoreUnknownType: false))
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        
        guard let nameData = decoded.first as? GAPCompleteLocalName
            else { XCTFail(); return }
        
        XCTAssertEqual(nameData, name)
        XCTAssertEqual(GAPDataEncoder.encode([name]), data)
    }
    
    func testCompleteListOf16BitServiceClassUUIDs() {
        
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
        
        XCTAssertEqual(uuidList.description, "[1803 (Link Loss), 1804 (Tx Power), 1802 (Immediate Alert)]")
        
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
    
    func testIncompleteListOf16BitServiceClassUUIDs() {
        
        /**
         Length Data: 0X16
         Flags: 0X1A
         16 bit UUIDs: 0X1803 0X1804 0X1802
         Local Name: Proximity
         Data: 02 01 1A 07 03 03 18 04 18 02 18 0A 09 50 72 6F 78 69 6D 69 74 79
         */
        
        let data = Data([0x02, 0x01, 0x1A, 0x07, 0x02, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79])
        XCTAssertEqual(data.count, 0x16)
        
        let flags: GAPFlags = 0x1A
        let uuidList: GAPIncompleteListOf16BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802]
        let localName: GAPCompleteLocalName = "Proximity"
        
        XCTAssertEqual(uuidList.description, "[1803 (Link Loss), 1804 (Tx Power), 1802 (Immediate Alert)]")
        
        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 3)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as! GAPFlags, flags)
        XCTAssertEqual(decoded[1] as! GAPIncompleteListOf16BitServiceClassUUIDs, uuidList)
        XCTAssertEqual(decoded[2] as! GAPCompleteLocalName, localName)
    }
    
    func testCompleteListOf32BitServiceClassUUIDs() {
        
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
    
    func testIncompleteListOf32BitServiceClassUUIDs() {
        
        /**
         Length Data: 0x2E
         Flags: 0x1A
         32 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Freedom
         Data: 02 01 1A 21 05 03 18 00 00 04 18 00 00 02 18 00 00 07 01 00 00 F4 01 00 00 F5 01 00 00 F6 01 00 00 F7 01 00 00 08 09 46 72 65 65 64 6f 6d
         */
        
        let data = Data([0x02, 0x01, 0x1A, 0x21, 0x04, 0x03, 0x18, 0x00, 0x00, 0x04, 0x18, 0x00, 0x00, 0x02, 0x18, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xF5, 0x01, 0x00, 0x00, 0xF6, 0x01, 0x00, 0x00, 0xF7, 0x01, 0x00, 0x00, 0x08, 0x09, 0x46, 0x72, 0x65, 0x65, 0x64, 0x6f, 0x6d])
        XCTAssertEqual(data.count, 0x2E)
        
        let flags: GAPFlags = 0x1A
        let uuidList: GAPIncompleteListOf32BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802, 0x0107, 0x01F4, 0x01F5, 0x01F6, 0x01F7]
        let localName: GAPCompleteLocalName = "Freedom"
        
        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 3)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as! GAPFlags, flags)
        XCTAssertEqual(decoded[1] as! GAPIncompleteListOf32BitServiceClassUUIDs, uuidList)
        XCTAssertEqual(decoded[2] as! GAPCompleteLocalName, localName)
    }
    
    func testCompleteListOf128BitServiceClassUUIDs() {
        
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
    
    func testIncompleteListOf128BitServiceClassUUIDs() {
        
        /**
         Length Data: 0x23
         Flags: 0x1A
         128 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Test 128bits
         Data: 02 01 1a 11 07 03 18 04 18 02 18 04 06 03 18 04 18 02 06 03 18 0d 09 54 65 73 74 20 31 32 38 62 69 74 73
         */
        
        let data = Data([0x02, 0x01, 0x1a, 0x11, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18, 0x0d, 0x09, 0x54, 0x65, 0x73, 0x74, 0x20, 0x31, 0x32, 0x38, 0x62, 0x69, 0x74, 0x73])
        XCTAssertEqual(data.count, 0x23)
        
        let flags: GAPFlags = 0x1A
        let uuidList: GAPIncompleteListOf128BitServiceClassUUIDs = [UUID(bytes: (0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18))]
        let localName: GAPCompleteLocalName = "Test 128bits"
        
        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 3)
    }
    
    func testTxPowerLevel() {
        
        let data = Data([0x02, 0x0A, 0x7F])
        
        XCTAssertEqual(data.count, 3)
        
        let encoder = GAPDataEncoder()
        let decoder = GAPDataDecoder()
        
        let txPowerLevel = GAPTxPowerLevel(powerLevel: 127)!
        
        guard let decoded = try? decoder.decode(data)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(encoder.encode(txPowerLevel), data)
        
        XCTAssertEqual(decoded[0] as? GAPTxPowerLevel, txPowerLevel)
    }
    
    func testClassOfDevice() {
        
        let data = Data([0x04, 0x0d, 0x18, 0xf3, 0xff])
        XCTAssertEqual(data.count, 5)
        
        let encoder = GAPDataEncoder()
        let decoder = GAPDataDecoder()
        
        let device = GAPClassOfDevice(device: (0x18, 0xf3, 0xff))
        
        guard let decoded = try? decoder.decode(data)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(encoder.encode(device), data)
        
        XCTAssertEqual(decoded[0] as? GAPClassOfDevice, device)
    }
    
    func testSlaveConnectionIntervalRange() {
        
        let data = Data([0x05, 0x12, 0x06, 0x00, 0x80, 0x0c])
        XCTAssertEqual(data.count, 0x06)
        
        let encoder = GAPDataEncoder()
        let decoder = GAPDataDecoder()
        
        XCTAssertNil(GAPSlaveConnectionIntervalRange(range: (0xFFF4, 0xFFF1)))
        XCTAssertNotNil(GAPSlaveConnectionIntervalRange(range: (GAPSlaveConnectionIntervalRange.min, GAPSlaveConnectionIntervalRange.min)))
        XCTAssertNotNil(GAPSlaveConnectionIntervalRange(range: (GAPSlaveConnectionIntervalRange.max, GAPSlaveConnectionIntervalRange.max)))
        
        let intervalRange = GAPSlaveConnectionIntervalRange(range: (GAPSlaveConnectionIntervalRange.min, GAPSlaveConnectionIntervalRange.max))!
        
        guard let decoded = try? decoder.decode(data)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(encoder.encode(intervalRange), data)
        
        XCTAssertEqual(decoded[0] as? GAPSlaveConnectionIntervalRange, intervalRange)
    }
    
    func testServiceData16BitUUID() {
        
        XCTAssertNil(GAPServiceData16BitUUID(data: Data([0x4f])))
        
        do {
            let data = Data([0x4f, 0x30])
            let serviceData = GAPServiceData16BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 2)
            XCTAssertEqual(serviceData.serviceData.count, 0)
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
    
    func testServiceData32BitUUID() {
        
        XCTAssertNil(GAPServiceData32BitUUID(data: Data([0x4f])))
        
        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30])
            let serviceData = GAPServiceData32BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 4)
            XCTAssertEqual(serviceData.serviceData.count, 0)
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
    
    func testServiceData128BitUUID() {
        
        XCTAssertNil(GAPServiceData128BitUUID(data: Data([0x4f])))

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56])
            let serviceData = GAPServiceData128BitUUID(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: serviceData.uuid), 16)
            XCTAssertEqual(serviceData.serviceData.count, 0)
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
    
    func testAppearance() {
        
        XCTAssertNil(GAPAppearanceData(data: Data([])))
        XCTAssertNil(GAPAppearanceData(data: Data([0x00])))
        XCTAssertNil(GAPAppearanceData(data: Data([0x00, 0x00, 0x00])))
        XCTAssertNil(GAPAppearanceData(data: Data([0x4f, 0x4f, 0x4f])))
        XCTAssertNil(GAPAppearanceData(data: Data([0x00, 0x00, 0x00, 0x00])))
        
        do {
            let data = Data([0x4f, 0xf8])
            let appearance = GAPAppearanceData(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: appearance), 2)
            XCTAssertEqual(appearance.data, data)
            XCTAssertEqual(appearance.data.count, 2)
        }
        
        XCTAssertEqual(GAPAppearanceData(data: Data([0x4f, 0xf8])), GAPAppearanceData(data: Data([0x4f, 0xf8])))
        XCTAssertEqual(GAPAppearanceData(appearance: 0xf5).data.count, 2)
        
        XCTAssertEqual(GAPAppearanceData(appearance: 0).data, Data([0x00, 0x00]))
        XCTAssertEqual(GAPAppearanceData(appearance: GAPAppearance.Unknown.unknown).data, Data([0x00, 0x00]))
        XCTAssertEqual(GAPAppearanceData(data: Data([0x00, 0x00]))?.appearance, GAPAppearance.Unknown.unknown)
        
        XCTAssertEqual(GAPAppearanceData(appearance: 64).data.map { $0 }, Data([64, 0]).map { $0 })
        XCTAssertEqual(GAPAppearanceData(appearance: GAPAppearance.Phone.generic).data, Data([64, 0]))
        XCTAssertEqual(GAPAppearanceData(data: Data([64, 0]))?.appearance, GAPAppearance.Phone.generic)
        
        XCTAssertEqual(GAPAppearance(category: .unknown), GAPAppearance.Unknown.unknown)
        XCTAssertEqual(GAPAppearance.Unknown.unknown.category, GAPAppearance.Unknown.category)
        XCTAssertEqual(GAPAppearance.Unknown.unknown.category, .unknown)
        XCTAssertEqual(GAPAppearance.Unknown.unknown.category, 0)
        XCTAssertEqual(GAPAppearance.Unknown.unknown.subcategory, 0)
        
        XCTAssertEqual(GAPAppearance(category: .phone), GAPAppearance.Phone.generic)
        XCTAssertEqual(GAPAppearance.Phone.generic.category, GAPAppearance.Phone.category)
        XCTAssertEqual(GAPAppearance.Phone.generic.category, .phone)
        XCTAssertEqual(GAPAppearance.Phone.generic.category, 1)
        XCTAssertEqual(GAPAppearance.Phone.generic.subcategory, 0)
        
        XCTAssertEqual(GAPAppearance(category: .computer), GAPAppearance.Computer.generic)
        XCTAssertEqual(GAPAppearance.Computer.generic.category, .computer)
        XCTAssertEqual(GAPAppearance.Computer.generic.category, GAPAppearance.Computer.category)
        XCTAssertEqual(GAPAppearance.Computer.generic.category, 2)
        XCTAssertEqual(GAPAppearance.Computer.generic.subcategory, 0)
        
        XCTAssertEqual(GAPAppearance(category: .watch), GAPAppearance.Watch.generic)
        XCTAssertEqual(GAPAppearance.Watch.generic.category, .watch)
        XCTAssertEqual(GAPAppearance.Watch.generic.category, GAPAppearance.Watch.category)
        XCTAssertEqual(GAPAppearance.Watch.generic.category, 3)
        XCTAssertEqual(GAPAppearance.Watch.generic.subcategory, 0)
        
        XCTAssertEqual(GAPAppearance(category: .watch, subcategory: 1), GAPAppearance.Watch.sports)
        XCTAssertEqual(GAPAppearance.Watch.sports.category, .watch)
        XCTAssertEqual(GAPAppearance.Watch.sports.category, GAPAppearance.Watch.category)
        XCTAssertEqual(GAPAppearance.Watch.sports.category, 3)
        XCTAssertEqual(GAPAppearance.Watch.sports.subcategory, 1)
    }
    
    func testPublicTargetAddress() {
        
        XCTAssertNil(GAPPublicTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b])))
        XCTAssertNil(GAPPublicTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b, 0xf8, 0xf8])))
        
        do {
            let data = Data([0xf8, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0xf8, 0x91, 0x7e])
            let targetAddress = GAPPublicTargetAddress(data: data)!
            
            XCTAssertEqual(targetAddress.data, data)
            XCTAssertEqual(targetAddress.addresses.count, 2)
            XCTAssertEqual(targetAddress.data.count, 12)
        }
        
    }
    
    func testRandomTargetAddress() {
        
        XCTAssertNil(GAPRandomTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b])))
        XCTAssertNil(GAPRandomTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b, 0xf8, 0xf8])))
        
        do {
            let data = Data([0xf8, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0xf8, 0x91, 0x7e])
            let targetAddress = GAPRandomTargetAddress(data: data)!
            
            XCTAssertEqual(targetAddress.data, data)
            XCTAssertEqual(targetAddress.addresses.count, 2)
            XCTAssertEqual(targetAddress.data.count, 12)
        }
    }
    
    func testAdvertisingInterval() {
    
        XCTAssertNil(GAPAdvertisingInterval(data: Data([0x00])))
        XCTAssertNil(GAPAdvertisingInterval(data: Data([0x00, 0x00, 0x00])))
        
        let data = Data([0x01, 0x00])
        guard let advertisingInterval = GAPAdvertisingInterval(data: data)
            else { XCTFail(); return }
        
        XCTAssertEqual(advertisingInterval.data, data)
        XCTAssertEqual(advertisingInterval.data.count, advertisingInterval.dataLength)
        XCTAssertEqual(MemoryLayout.size(ofValue: advertisingInterval), 2)
        XCTAssertEqual(advertisingInterval, 1)
        XCTAssertEqual(advertisingInterval.miliseconds, 0.0625)
        XCTAssertEqual(advertisingInterval.description, "0.0625ms")
    }
    
    func testLEDeviceAddress() {
        
        XCTAssertNil(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x30, 0xff])))
        XCTAssertNil(GAPLEDeviceAddress(data: Data([0x4f, 0xf8, 0x30])))
        XCTAssertNil(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x02])))
        XCTAssertNotNil(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x01])))
        XCTAssertNotNil(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x00])))
        
        do {
            let data = Data([0x4f, 0x4f, 0xf8, 0x30, 0xf8, 0x30, 0x01])
            let deviceAddress = GAPLEDeviceAddress(data: data)!
            
            XCTAssertEqual(deviceAddress.data, data)
            XCTAssertEqual(deviceAddress.data.count, GAPLEDeviceAddress.length)
            XCTAssertEqual(deviceAddress.type, .random)
        }
        
        do {
            let data = Data([0x4f, 0x4f, 0xf8, 0x30, 0xf8, 0x30, 0x00])
            let deviceAddress = GAPLEDeviceAddress(data: data)!
            
            XCTAssertEqual(deviceAddress.data, data)
            XCTAssertEqual(deviceAddress.data.count, GAPLEDeviceAddress.length)
            XCTAssertEqual(deviceAddress.type, .public)
        }
        
        XCTAssertEqual(GAPLEDeviceAddress(address: .zero, type: .public).data.count, GAPLEDeviceAddress.length)
        XCTAssertEqual(GAPLEDeviceAddress(address: .zero, type: .random).data.count, GAPLEDeviceAddress.length)
    }
    
    func testLERole() {
        
        XCTAssertNil(GAPLERole(data: Data([])))
        XCTAssertNil(GAPLERole(data: Data([0x4f])))
        XCTAssertNil(GAPLERole(data: Data([0x04])))
        XCTAssertNil(GAPLERole(data: Data([0xFF])))
        
        XCTAssertEqual(GAPLERole(data: Data([0x00])), .onlyPeripheralRoleSupported)
        XCTAssertEqual(GAPLERole(data: Data([0x01])), .onlyCentralRoleSupported)
        XCTAssertEqual(GAPLERole(data: Data([0x02])), .bothSupportedPeripheralPreferred)
        XCTAssertEqual(GAPLERole(data: Data([0x03])), .bothSupportedCentralPreferred)
        
        XCTAssertEqual(GAPLERole.onlyPeripheralRoleSupported.data, Data([0x00]))
        XCTAssertEqual(GAPLERole.onlyCentralRoleSupported.data, Data([0x01]))
        XCTAssertEqual(GAPLERole.bothSupportedPeripheralPreferred.data, Data([0x02]))
        XCTAssertEqual(GAPLERole.bothSupportedCentralPreferred.data, Data([0x03]))
        
        XCTAssertEqual(GAPLERole.onlyPeripheralRoleSupported.supported, [.peripheral])
        XCTAssertEqual(GAPLERole.onlyCentralRoleSupported.supported, [.central])
        XCTAssertEqual(GAPLERole.bothSupportedPeripheralPreferred.supported, [.central, .peripheral])
        XCTAssertEqual(GAPLERole.bothSupportedCentralPreferred.supported, [.central, .peripheral])
        
        XCTAssertEqual(GAPLERole.onlyPeripheralRoleSupported.preferred, .peripheral)
        XCTAssertEqual(GAPLERole.onlyCentralRoleSupported.preferred, .central)
        XCTAssertEqual(GAPLERole.bothSupportedPeripheralPreferred.preferred, .peripheral)
        XCTAssertEqual(GAPLERole.bothSupportedCentralPreferred.preferred, .central)
    }
    
    func testURI() {
        
        let uriString = "/my/uri/string"
        let data = Data([15, 0x24, 47, 109, 121, 47, 117, 114, 105, 47, 115, 116, 114, 105, 110, 103])
        let uri = GAPURI(uri: URL(string: uriString)!)
        let expectedData: [GAPData] = [uri]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as! GAPURI, uri)
        XCTAssertEqual((decoded[0] as! GAPURI).description, uriString)
    }
    
    func testIndoorPositioning() {
        
        XCTAssertEqual(GAPIndoorPositioning.dataType.rawValue, 0x25)
        
        let values: [GAPIndoorPositioning] = [
            GAPIndoorPositioning(),
            GAPIndoorPositioning(isLocationNamePresent: true),
            GAPIndoorPositioning(
                coordinates: .local(north: 200, east: 500),
                floorNumber: 100
            ),
            GAPIndoorPositioning(
                coordinates: .global(latitude: 1200, longitude: 600),
                txPower: .max,
                altitude: 1000,
                uncertainty: .max,
                isLocationNamePresent: true
            ),
            GAPIndoorPositioning(
                coordinates: .global(latitude: 1000, longitude: 200),
                txPower: .min
            ),
            GAPIndoorPositioning(
                txPower: .min,
                altitude: 1000
            )
        ]
        
        for indoorPositioning in values {
            
            XCTAssertEqual(indoorPositioning.data.count, indoorPositioning.dataLength)
            
            guard let decoded = GAPIndoorPositioning(data: indoorPositioning.data)
                else { XCTFail("Could not decode"); return }
            
            XCTAssertEqual(decoded, indoorPositioning)
            
            if let coordinate = indoorPositioning.coordinates {
                XCTAssertEqual(coordinate.dataLength, 4)
            }
        }
    }
    
    /*
    func testLESupportedFeatures() {
        
        do {
            let supportedFeatures = GAPLESupportedFeatures(supportedFeatures: Data([0x00, 0x00, 0x4d, 0x00, 0x00]))
            XCTAssertEqual(supportedFeatures.data.count, 3)
            XCTAssertEqual(supportedFeatures.data, Data([0x00, 0x00, 0x4d]))
        }
        
        do {
            let supportedFeatures = GAPLESupportedFeatures(supportedFeatures: Data([0x3d, 0x12, 0x00]))
            XCTAssertEqual(supportedFeatures.data.count, 2)
            XCTAssertEqual(supportedFeatures.data, Data([0x3d, 0x12]))
        }
        
        do {
            let supportedFeatures = GAPLESupportedFeatures(supportedFeatures: Data([0x3d, 0x12, 0x00, 0x00, 0xff, 0x4e]))
            XCTAssertEqual(supportedFeatures.data.count, 4)
            XCTAssertEqual(supportedFeatures.data, Data([0x3d, 0x12, 0xff, 0x4e]))
        }
        
        do {
            let supportedFeatures = GAPLESupportedFeatures(supportedFeatures: Data([0x3d, 0x12, 0x4d, 0x4e, 0x4e]))
            XCTAssertEqual(supportedFeatures.data.count, 5)
            XCTAssertEqual(supportedFeatures.data, Data([0x3d, 0x12, 0x4d, 0x4e, 0x4e]))
        }
    }
    */
    func testLESecureConnectionsConfirmation() {
        
        XCTAssertNil(GAPLESecureConnectionsConfirmation(data: Data([0x4f])))
        XCTAssertNil(GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0x4f, 0x4f])))
        
        do {
            let data = Data([0x4f, 0xf8])
            let confirmation = GAPLESecureConnectionsConfirmation(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: confirmation), 2)
            XCTAssertEqual(confirmation.data, data)
            XCTAssertEqual(confirmation.data.count, 2)
            XCTAssertEqual(confirmation.data.count, confirmation.dataLength)
        }
        
        XCTAssertEqual(GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0xf8])), GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0xf8])))
        XCTAssertEqual(GAPLESecureConnectionsConfirmation(confirmation: 0xf5).data.count, 2)
    }
    
    func testLESecureConnectionsRandom() {
        
        XCTAssertNil(GAPLESecureConnectionsRandom(data: Data([0x4f])))
        XCTAssertNil(GAPLESecureConnectionsRandom(data: Data([0x4f, 0x4f, 0x4f])))
        
        do {
            let data = Data([0x4f, 0xf8])
            let random = GAPLESecureConnectionsRandom(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: random), 2)
            XCTAssertEqual(random.data, data)
            XCTAssertEqual(random.data.count, 2)
            XCTAssertEqual(random.data.count, random.dataLength)
        }
        
        XCTAssertEqual(GAPLESecureConnectionsRandom(data: Data([0x4f, 0xf8])), GAPLESecureConnectionsRandom(data: Data([0x4f, 0xf8])))
        XCTAssertEqual(GAPLESecureConnectionsRandom(random: 0xf5).data.count, 2)
    }
    
    func testChannelMapUpdateIndication() {
        
        do {
            let data = Data([0x4d, 0x3e, 0x12, 0x3a, 0x18, 0x4d, 0x3e])
            let channelMap = GAPChannelMapUpdateIndication(channelMap: (0x4d, 0x3e, 0x12, 0x3a, 0x18), instant: (0x4d, 0x3e))
            XCTAssertEqual(channelMap.data.count, GAPChannelMapUpdateIndication.length)
            XCTAssertEqual(channelMap.data, data)
        }
    }
    
    func testTransportDiscoveryData() {
        
        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01, 0x01])
            let transport = GAPTransportDiscoveryData(data: data)
            XCTAssertEqual(transport!.data, data)
        }
        
        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01, 0x01, 0x4d, 0b1011, 0x04, 0x02, 0x02, 0x02, 0x02])
            let transport = GAPTransportDiscoveryData(data: data)
            XCTAssertEqual(transport!.data, data)
        }
        
        do {
            let data = Data([0x05])
            let transport = GAPTransportDiscoveryData(data: data)
            XCTAssertNil(transport)
        }
        
        do {
            let data = Data([])
            let transport = GAPTransportDiscoveryData(data: data)
            XCTAssertNil(transport)
        }
        
        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01])
            let transport = GAPTransportDiscoveryData(data: data)
            XCTAssertNil(transport)
        }
        
        do {
            let data = Data([0x05, 0x4d, 0b10000])
            let transport = GAPTransportDiscoveryData(data: data)
            XCTAssertNil(transport)
        }
        
        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01, 0x01])
            XCTAssertEqual(GAPTransportDiscoveryData(data: data), GAPTransportDiscoveryData(data: data))
        }
    }
    
    func testMeshMessage() {
        
        XCTAssertNil(GAPMeshMessage(data: Data([])))
        XCTAssertNil(GAPMeshMessage(data: Data([0x4f])))
        XCTAssertNil(GAPMeshMessage(data: Data([0x4f, 0xf8, 0x30])))
        
        do {
            let data = Data([0xf8, 0x30])
            let message = GAPMeshMessage(data: data)!
            
            XCTAssertEqual(message.data, data)
            XCTAssertEqual(message.data.count, 2)
            XCTAssertEqual(message.data.count, message.dataLength)
            XCTAssertEqual(MemoryLayout.size(ofValue: message), 2)
        }
    }
    
    func testMeshBeacon() {
        
        XCTAssertNil(GAPMeshBeacon(data: Data([])))
        XCTAssertNil(GAPMeshBeacon(data: Data([0x02, 0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10, 0x4f, 0xf8, 0x30, 0x45])))
        XCTAssertNil(GAPMeshBeacon(data: Data([0x02, 0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10])))
        
        // Unprovisioned Device
        do {
            let data = Data([0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10, 0x4f, 0xf8, 0x30, 0x45])
            let beacon = GAPMeshBeacon(data: data)!
            XCTAssertEqual(beacon.data, data)
        }
        
        do {
            let data = Data([0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10])
            let beacon = GAPMeshBeacon(data: data)!
            XCTAssertEqual(beacon.data, data)
        }
        
        // Secure Network
        do {
            let data = Data([0x01, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10, 0x4f, 0xf8, 0x30])
            let beacon = GAPMeshBeacon(data: data)!
            XCTAssertEqual(beacon.data, data)
        }
        
    }
    
    func testManufacturerSpecificData() {
        
        XCTAssertNil(GAPManufacturerSpecificData(data: Data()))
        XCTAssertNil(GAPManufacturerSpecificData(data: Data([0x4f])))
        
        do {
            let data = Data([0x4f, 0x30])
            let manufacturerData = GAPManufacturerSpecificData(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: manufacturerData.companyIdentifier), 2)
            XCTAssertEqual(manufacturerData.data, data)
            XCTAssertEqual(manufacturerData.data.count, 2)
        }
        
        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let manufacturerData = GAPManufacturerSpecificData(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: manufacturerData.companyIdentifier), 2)
            XCTAssertEqual(manufacturerData.additionalData.count, 3)
            XCTAssertEqual(manufacturerData.data, data)
            XCTAssertEqual(manufacturerData.data.count, 5)
        }
        
        XCTAssertEqual(GAPManufacturerSpecificData(data: Data([0x4f, 0x45, 0xff])),
                       GAPManufacturerSpecificData(data: Data([0x4f, 0x45, 0xff])))
    }
    
    func testPBADV() {
        
        XCTAssertNil(GAPPBADV(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x12])))
        XCTAssertNil(GAPPBADV(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])))
        XCTAssertNil(GAPPBADV(data: Data([])))
        
        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38])
            let pbadv = GAPPBADV(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: pbadv.linkID), 4)
            XCTAssertEqual(pbadv.data, data)
            XCTAssertEqual(pbadv.data.count, 6)
        }
        
        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38, 0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let pbadv = GAPPBADV(data: data)!
            XCTAssertEqual(pbadv.genericProvisioningPDU.count, 6)
            XCTAssertEqual(pbadv.data, data)
            XCTAssertEqual(pbadv.data.count, 11)
        }
        
        XCTAssertEqual(GAPPBADV(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38])),
                       GAPPBADV(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38])))
    }
    
    func test3DInformation() {
        
        XCTAssertNil(GAP3DInformation(data: Data([])))
        XCTAssertNil(GAP3DInformation(data: Data([0x00])))
        XCTAssertNil(GAP3DInformation(data: Data([0x00, 0x00, 0x01])))
        
        do {
            let data = Data([0b00, 0x00])
            guard let information = GAP3DInformation(data: data)
                else { XCTFail(); return }
            XCTAssertEqual(information.data, data)
            XCTAssertEqual(information.flags, [])
            XCTAssertEqual(information.pathLossThreshold, 0)
        }
        
        do {
            let data = Data([0b11, 0x01])
            guard let information = GAP3DInformation(data: data)
                else { XCTFail(); return }
            XCTAssertEqual(information.data, data)
            XCTAssertEqual(information.flags, [.associationNotification, .batteryLevelReporting])
            XCTAssertEqual(information.pathLossThreshold, 1)
        }
    }
}

internal extension GAPData {
    
    var data: Data {
        
        var data = Data(capacity: dataLength)
        append(to: &data)
        return data
    }
}

internal extension GAPUUIDList {
    
    var data: Data {
        
        return Data(self)
    }
}

internal extension GAPDataEncoder {
    
    static func encode(_ encodables: [GAPData]) -> Data {
        
        let encoder = GAPDataEncoder()
        return encoder.encode(encodables)
    }
}

internal extension GAPDataDecoder {
    
    static func decode(_ data: Data,
                        types: [GAPData.Type],
                        ignoreUnknownType: Bool = true) throws -> [GAPData] {
        
        var decoder = GAPDataDecoder()
        decoder.types = types
        decoder.ignoreUnknownType = ignoreUnknownType
        return try decoder.decode(data)
    }
}
