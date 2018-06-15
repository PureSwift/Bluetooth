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
        ("testGAPShortLocalName", testGAPShortLocalName),
        ("testGAPCompleteLocalName", testGAPCompleteLocalName),
        ("testGAPCompleteListOf16BitServiceClassUUIDs", testGAPCompleteListOf16BitServiceClassUUIDs),
        ("testGAPCompleteListOf32BitServiceClassUUIDs", testGAPCompleteListOf32BitServiceClassUUIDs),
        ("testGAPCompleteListOf128BitServiceClassUUIDs", testGAPCompleteListOf128BitServiceClassUUIDs),
        ("testGAPIncompleteListOf16BitServiceClassUUIDs", testGAPIncompleteListOf16BitServiceClassUUIDs),
        ("testGAPIncompleteListOf32BitServiceClassUUIDs", testGAPIncompleteListOf32BitServiceClassUUIDs),
        ("testGAPIncompleteListOf128BitServiceClassUUIDs", testGAPIncompleteListOf128BitServiceClassUUIDs),
        ("testGAPTxPowerLevel", testGAPTxPowerLevel),
        ("testGAPClassOfDevice", testGAPClassOfDevice),
        ("testGAPSlaveConnectionIntervalRange", testGAPSlaveConnectionIntervalRange),
        ("testGAPServiceData16BitUUID", testGAPServiceData16BitUUID),
        ("testGAPServiceData32BitUUID", testGAPServiceData32BitUUID),
        ("testGAPServiceData128BitUUID", testGAPServiceData128BitUUID),
        ("testGAPPublicTargetAddress", testGAPPublicTargetAddress),
        ("testGAPRandomTargetAddress", testGAPRandomTargetAddress),
        ("testGAPAppearance", testGAPAppearance),
        ("testGAPAdvertisingInterval", testGAPAdvertisingInterval),
        ("testGAPLEDeviceAddress", testGAPLEDeviceAddress),
        ("testGAPLERole", testGAPLERole),
        ("testGAPURI", testGAPURI),
        ("testGAPLESupportedFeatures", testGAPLESupportedFeatures),
        ("testGAPLESecureConnectionsConfirmation", testGAPLESecureConnectionsConfirmation),
        ("testGAPLESecureConnectionsRandom", testGAPLESecureConnectionsRandom),
        ("testGAPChannelMapUpdateIndication", testGAPChannelMapUpdateIndication),
        ("testGAPTransportDiscoveryData", testGAPTransportDiscoveryData),
        ("testGAPMeshMessage", testGAPMeshMessage),
        ("testGAPMeshBeacon", testGAPMeshBeacon),
        ("testGAPManufacturerSpecificData", testGAPManufacturerSpecificData),
        ("testGAPPBADV", testGAPPBADV),
        ("testGAP3DInformation", testGAP3DInformation)
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
    
    func testGAPShortLocalName() {
        
        /**
         Length Data: 0X0C
         Local Name: BlueZ 5.43
         Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
         */
        let data = Data([0x0B, 0x08, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
        let name: GAPShortLocalName = "BlueZ 5.43"
        XCTAssertEqual(data.count, 0x0C)
        XCTAssertEqual(data.count, 12)
        
        var decoded = [GAPData]()
        XCTAssertNoThrow(decoded = try GAPDataDecoder.decode(data, types: [GAPShortLocalName.self], ignoreUnknownType: false))
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        
        guard let nameData = decoded.first as? GAPShortLocalName
            else { XCTFail(); return }
        
        XCTAssertEqual(nameData, name)
        XCTAssertEqual(GAPDataEncoder.encode([name]), data)
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
    
    func testGAPIncompleteListOf16BitServiceClassUUIDs() {
        
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
    
    func testGAPIncompleteListOf32BitServiceClassUUIDs() {
        
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
    
    func testGAPIncompleteListOf128BitServiceClassUUIDs() {
        
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
    
    func testGAPClassOfDevice() {
        
        let data = Data([0x04, 0x0d, 0x18, 0xf3, 0xff])
        XCTAssertEqual(data.count, 0x05)
        
        let device = GAPClassOfDevice(device: (0x18, 0xf3, 0xff))
        let expectedData: [GAPData] = [device]
        let types = expectedData.map { type(of: $0) }
        
        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
            else { XCTFail("Could not decode"); return }
        
        XCTAssert(decoded.isEmpty == false)
        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        
        XCTAssertEqual(decoded[0] as! GAPClassOfDevice, device)
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
    
    func testGAPServiceData32BitUUID() {
        
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
    
    func testGAPServiceData128BitUUID() {
        
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
    
    func testGAPAppearance() {
        
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
        XCTAssertEqual(GAPAppearanceData(appearance: 0xf5).data.count, GAPAppearanceData.length)
        
        XCTAssertEqual(GAPAppearanceData(appearance: 0).data, Data([0x00, 0x00]))
        XCTAssertEqual(GAPAppearanceData(appearance: GAPAppearance.Unknown.unknown).data, Data([0x00, 0x00]))
        XCTAssertEqual(GAPAppearanceData(data: Data([0x00, 0x00]))?.appearance, GAPAppearance.Unknown.unknown)
        
        XCTAssertEqual(GAPAppearanceData(appearance: 64).data.map { $0 }, Data([64, 0]).map { $0 })
        XCTAssertEqual(GAPAppearanceData(appearance: GAPAppearance.Phone.generic).data, Data([64, 0]))
        XCTAssertEqual(GAPAppearanceData(data: Data([64, 0]))?.appearance, GAPAppearance.Phone.generic)
        
        XCTAssertEqual(GAP.Appearance(category: .unknown), GAP.Appearance.Unknown.unknown)
        XCTAssertEqual(GAP.Appearance.Unknown.unknown.category, GAP.Appearance.Unknown.category)
        XCTAssertEqual(GAP.Appearance.Unknown.unknown.category, .unknown)
        XCTAssertEqual(GAP.Appearance.Unknown.unknown.category, 0)
        XCTAssertEqual(GAP.Appearance.Unknown.unknown.subcategory, 0)
        
        XCTAssertEqual(GAP.Appearance(category: .phone), GAP.Appearance.Phone.generic)
        XCTAssertEqual(GAP.Appearance.Phone.generic.category, GAP.Appearance.Phone.category)
        XCTAssertEqual(GAP.Appearance.Phone.generic.category, .phone)
        XCTAssertEqual(GAP.Appearance.Phone.generic.category, 1)
        XCTAssertEqual(GAP.Appearance.Phone.generic.subcategory, 0)
        
        XCTAssertEqual(GAP.Appearance(category: .computer), GAP.Appearance.Computer.generic)
        XCTAssertEqual(GAP.Appearance.Computer.generic.category, .computer)
        XCTAssertEqual(GAP.Appearance.Computer.generic.category, GAP.Appearance.Computer.category)
        XCTAssertEqual(GAP.Appearance.Computer.generic.category, 2)
        XCTAssertEqual(GAP.Appearance.Computer.generic.subcategory, 0)
        
        XCTAssertEqual(GAP.Appearance(category: .watch), GAP.Appearance.Watch.generic)
        XCTAssertEqual(GAP.Appearance.Watch.generic.category, .watch)
        XCTAssertEqual(GAP.Appearance.Watch.generic.category, GAP.Appearance.Watch.category)
        XCTAssertEqual(GAP.Appearance.Watch.generic.category, 3)
        XCTAssertEqual(GAP.Appearance.Watch.generic.subcategory, 0)
        
        XCTAssertEqual(GAP.Appearance(category: .watch, subcategory: 1), GAP.Appearance.Watch.sports)
        XCTAssertEqual(GAP.Appearance.Watch.sports.category, .watch)
        XCTAssertEqual(GAP.Appearance.Watch.sports.category, GAP.Appearance.Watch.category)
        XCTAssertEqual(GAP.Appearance.Watch.sports.category, 3)
        XCTAssertEqual(GAP.Appearance.Watch.sports.subcategory, 1)
    }
    
    func testGAPPublicTargetAddress() {
        
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
    
    func testGAPRandomTargetAddress() {
        
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
    
    func testGAPAdvertisingInterval() {
    
        XCTAssertNil(GAPAdvertisingInterval(data: Data([0x4f])))
        XCTAssertNil(GAPAdvertisingInterval(data: Data([0x4f, 0xf8, 0x30])))
        
        do {
            let data = Data([0xf8, 0x30])
            let advertisingInterval = GAPAdvertisingInterval(data: data)!
            
            XCTAssertEqual(advertisingInterval.data, data)
            XCTAssertEqual(advertisingInterval.data.count, GAPAdvertisingInterval.length)
            XCTAssertEqual(MemoryLayout.size(ofValue: advertisingInterval), GAPAdvertisingInterval.length)
        }
    }
    
    func testGAPLEDeviceAddress() {
        
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
    
    func testGAPLERole() {
        
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
    
    func testGAPURI() {
        
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
    
    func testGAPLESupportedFeatures() {
        
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
    
    func testGAPLESecureConnectionsConfirmation() {
        
        XCTAssertNil(GAPLESecureConnectionsConfirmation(data: Data([0x4f])))
        XCTAssertNil(GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0x4f, 0x4f])))
        
        do {
            let data = Data([0x4f, 0xf8])
            let confirmation = GAPLESecureConnectionsConfirmation(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: confirmation), 2)
            XCTAssertEqual(confirmation.data, data)
            XCTAssertEqual(confirmation.data.count, 2)
        }
        
        XCTAssertEqual(GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0xf8])), GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0xf8])))
        XCTAssertEqual(GAPLESecureConnectionsConfirmation(confirmation: 0xf5).data.count, GAPLESecureConnectionsConfirmation.length)
    }
    
    func testGAPLESecureConnectionsRandom() {
        
        XCTAssertNil(GAPLESecureConnectionsRandom(data: Data([0x4f])))
        XCTAssertNil(GAPLESecureConnectionsRandom(data: Data([0x4f, 0x4f, 0x4f])))
        
        do {
            let data = Data([0x4f, 0xf8])
            let random = GAPLESecureConnectionsRandom(data: data)!
            XCTAssertEqual(MemoryLayout.size(ofValue: random), 2)
            XCTAssertEqual(random.data, data)
            XCTAssertEqual(random.data.count, 2)
        }
        
        XCTAssertEqual(GAPLESecureConnectionsRandom(data: Data([0x4f, 0xf8])), GAPLESecureConnectionsRandom(data: Data([0x4f, 0xf8])))
        XCTAssertEqual(GAPLESecureConnectionsRandom(random: 0xf5).data.count, GAPLESecureConnectionsRandom.length)
    }
    
    func testGAPChannelMapUpdateIndication() {
        
        do {
            let data = Data([0x4d, 0x3e, 0x12, 0x3a, 0x18, 0x4d, 0x3e])
            let channelMap = GAPChannelMapUpdateIndication(channelMap: (0x4d, 0x3e, 0x12, 0x3a, 0x18), instant: (0x4d, 0x3e))
            XCTAssertEqual(channelMap.data.count, GAPChannelMapUpdateIndication.length)
            XCTAssertEqual(channelMap.data, data)
        }
    }
    
    func testGAPTransportDiscoveryData() {
        
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
    
    func testGAPMeshMessage() {
        
        XCTAssertNil(GAPMeshMessage(data: Data([])))
        XCTAssertNil(GAPMeshMessage(data: Data([0x4f])))
        XCTAssertNil(GAPMeshMessage(data: Data([0x4f, 0xf8, 0x30])))
        
        do {
            let data = Data([0xf8, 0x30])
            let message = GAPMeshMessage(data: data)!
            
            XCTAssertEqual(message.data, data)
            XCTAssertEqual(message.data.count, GAPMeshMessage.length)
            XCTAssertEqual(MemoryLayout.size(ofValue: message), GAPMeshMessage.length)
        }
    }
    
    func testGAPMeshBeacon() {
        
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
    
    func testGAPManufacturerSpecificData() {
        
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
    
    func testGAPPBADV() {
        
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
    
    func testGAP3DInformation() {
        
        XCTAssertNil(GAP3DInformation(data: Data([0x4f])))
        XCTAssertNil(GAP3DInformation(data: Data([])))
        
        do {
            let data = Data([0b01, 0x2e])
            let information = GAP3DInformation(data: data)
            XCTAssertEqual(information!.data, data)
        }
        
        do {
            let data = Data([0b100, 0x2e])
            let information = GAP3DInformation(data: data)
            XCTAssertEqual(information!.data, data)
        }
    }
}
