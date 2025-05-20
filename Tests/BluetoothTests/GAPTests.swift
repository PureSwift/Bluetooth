//
//  GAPTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGAP)
import Testing
import Foundation
import Bluetooth
@testable import BluetoothGAP

@Suite struct GAPTests {

    @Test func dataType() {

        #expect(GAPDataType.flags.description == "Flags")
        #expect(GAPDataType.incompleteListOf16BitServiceClassUUIDs.description == "Incomplete List of 16-bit Service Class UUIDs")
        #expect(GAPDataType(rawValue: 0).description == "GAP Data Type (0)")
    }

    @Test func flags() {

        let flags: GAPFlags = [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR]

        #expect(flags == 0b00000110)
        #expect(flags == [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR])
        #expect(flags.description == "[.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR]")

        let allCases: [GAPFlags] = [
            .lowEnergyLimitedDiscoverableMode,
            .lowEnergyGeneralDiscoverableMode,
            .notSupportedBREDR,
            .simultaneousController,
            .simultaneousHost
        ]

        let allFlags = allCases.sorted(by: { $0.rawValue < $1.rawValue })
        allFlags.forEach { #expect(!$0.description.isEmpty) }
    }

    @Test func bit16UUIDList() {

        #expect(
            GAPUUIDList<UInt16>(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])) == nil,
            "Can only initialize from multiples of 2 bytes")

        #expect(GAPUUIDList<UInt16>(data: Data())?.uuids ?? [] == [], "Should initialize from empty data")

        do {
            // 16 bit UUIDs: 0X1803 0X1804 0X1802
            let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18])

            guard let list = GAPUUIDList<UInt16>(data: data)
            else {
                Issue.record("Could not parse from data")
                return
            }

            #expect(Data(list) == data)
            #expect(list.uuids == [0x1803, 0x1804, 0x1802])
            #expect(list.uuids.map { BluetoothUUID.bit16($0) } == [BluetoothUUID.Service.linkLoss, BluetoothUUID.Service.txPower, BluetoothUUID.Service.immediateAlert])
        }
    }

    @Test func bit32UUIDList() {

        #expect(
            GAPUUIDList<UInt32>(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])) == nil,
            "Can only initialize from multiples of 4 bytes")

        #expect(GAPUUIDList<UInt32>(data: Data())?.uuids ?? [] == [], "Should initialize from empty data")

        // 32 bit UUIDs: 0x18041803 0x06041802
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06])

        guard let list = GAPUUIDList<UInt32>(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(Data(list) == data)
        #expect(list.uuids == [0x1804_1803, 0x0604_1802])
    }

    @Test func bit128UUIDList() {

        #expect(
            GAPUUIDList<UInt128>(data: Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06])) == nil,
            "Can only initialize from multiples of 16 bytes")

        #expect(GAPUUIDList<UInt128>(data: Data())?.uuids ?? [] == [], "Should initialize from empty data")

        // 128 bit UUIDs: 0x18041803 0x06041802 0x18041803 0x18030602
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18])

        guard let list = GAPUUIDList<UInt128>(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(Data(list) == data)
        //XCTAssertEqual(list.uuids.map { $0.description }, [UUID(bytes: (0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18))])
    }

    @Test func shortLocalName() throws {

        /**
         Length Data: 0X0C
         Local Name: BlueZ 5.43
         Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
         */
        let data = Data([0x0B, 0x08, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
        let name: GAPShortLocalName = "BlueZ 5.43"
        #expect(data.count == 0x0C)
        #expect(data.count == 12)
        #expect(name.description == "BlueZ 5.43")

        var decoded = [GAPData]()
        decoded = try GAPDataDecoder.decode(data, types: [GAPShortLocalName.self], ignoreUnknownType: false)

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 1)

        guard let nameData = decoded.first as? GAPShortLocalName
        else {
            Issue.record()
            return
        }

        #expect(nameData == name)
        #expect(GAPDataEncoder.encode([name]) == data)
    }

    @Test func completeLocalName() throws {

        /**
         Length Data: 0X0C
         Local Name: BlueZ 5.43
         Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
         */
        let data = Data([0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
        let name: GAPCompleteLocalName = "BlueZ 5.43"
        #expect(data.count == 0x0C)
        #expect(data.count == 12)
        #expect(name.description == "BlueZ 5.43")

        var decoded = [GAPData]()
        decoded = try GAPDataDecoder.decode(data, types: [GAPCompleteLocalName.self], ignoreUnknownType: false)

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 1)

        let nameData = try #require(decoded.first as? GAPCompleteLocalName)

        #expect(nameData == name)
        #expect(GAPDataEncoder.encode([name]) == data)
    }

    @Test func completeListOf16BitServiceClassUUIDs() {

        /**
         Length Data: 0X16
         Flags: 0X1A
         16 bit UUIDs: 0X1803 0X1804 0X1802
         Local Name: Proximity
         Data: 02 01 1A 07 03 03 18 04 18 02 18 0A 09 50 72 6F 78 69 6D 69 74 79
         */

        let data = Data([0x02, 0x01, 0x1A, 0x07, 0x03, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79])
        #expect(data.count == 0x16)

        let flags: GAPFlags = 0x1A
        let uuidList: GAPCompleteListOf16BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802]
        let localName: GAPCompleteLocalName = "Proximity"

        #expect(uuidList.description == "[1803 (Link Loss), 1804 (Tx Power), 1802 (Immediate Alert)]")

        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }

        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
        else {
            Issue.record("Could not decode")
            return
        }

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 3)
        #expect(GAPDataEncoder.encode(expectedData) == data)

        #expect(decoded[0] as! GAPFlags == flags)
        #expect(decoded[1] as! GAPCompleteListOf16BitServiceClassUUIDs == uuidList)
        #expect(decoded[2] as! GAPCompleteLocalName == localName)
    }

    @Test func incompleteListOf16BitServiceClassUUIDs() {

        /**
         Length Data: 0X16
         Flags: 0X1A
         16 bit UUIDs: 0X1803 0X1804 0X1802
         Local Name: Proximity
         Data: 02 01 1A 07 03 03 18 04 18 02 18 0A 09 50 72 6F 78 69 6D 69 74 79
         */

        let data = Data([0x02, 0x01, 0x1A, 0x07, 0x02, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79])
        #expect(data.count == 0x16)

        let flags: GAPFlags = 0x1A
        let uuidList: GAPIncompleteListOf16BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802]
        let localName: GAPCompleteLocalName = "Proximity"

        #expect(uuidList.description == "[1803 (Link Loss), 1804 (Tx Power), 1802 (Immediate Alert)]")

        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }

        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
        else {
            Issue.record("Could not decode")
            return
        }

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 3)
        #expect(GAPDataEncoder.encode(expectedData) == data)

        #expect(decoded[0] as! GAPFlags == flags)
        #expect(decoded[1] as! GAPIncompleteListOf16BitServiceClassUUIDs == uuidList)
        #expect(decoded[2] as! GAPCompleteLocalName == localName)
    }

    @Test func completeListOf32BitServiceClassUUIDs() {

        /**
         Length Data: 0x2E
         Flags: 0x1A
         32 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Freedom
         Data: 02 01 1A 21 05 03 18 00 00 04 18 00 00 02 18 00 00 07 01 00 00 F4 01 00 00 F5 01 00 00 F6 01 00 00 F7 01 00 00 08 09 46 72 65 65 64 6f 6d
         */

        let data = Data([0x02, 0x01, 0x1A, 0x21, 0x05, 0x03, 0x18, 0x00, 0x00, 0x04, 0x18, 0x00, 0x00, 0x02, 0x18, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xF5, 0x01, 0x00, 0x00, 0xF6, 0x01, 0x00, 0x00, 0xF7, 0x01, 0x00, 0x00, 0x08, 0x09, 0x46, 0x72, 0x65, 0x65, 0x64, 0x6f, 0x6d])
        #expect(data.count == 0x2E)

        let flags: GAPFlags = 0x1A
        let uuidList: GAPCompleteListOf32BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802, 0x0107, 0x01F4, 0x01F5, 0x01F6, 0x01F7]
        let localName: GAPCompleteLocalName = "Freedom"

        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }

        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
        else {
            Issue.record("Could not decode")
            return
        }

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 3)
        #expect(GAPDataEncoder.encode(expectedData) == data)

        #expect(decoded[0] as! GAPFlags == flags)
        #expect(decoded[1] as! GAPCompleteListOf32BitServiceClassUUIDs == uuidList)
        #expect(decoded[2] as! GAPCompleteLocalName == localName)
    }

    @Test func incompleteListOf32BitServiceClassUUIDs() {

        /**
         Length Data: 0x2E
         Flags: 0x1A
         32 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Freedom
         Data: 02 01 1A 21 05 03 18 00 00 04 18 00 00 02 18 00 00 07 01 00 00 F4 01 00 00 F5 01 00 00 F6 01 00 00 F7 01 00 00 08 09 46 72 65 65 64 6f 6d
         */

        let data = Data([0x02, 0x01, 0x1A, 0x21, 0x04, 0x03, 0x18, 0x00, 0x00, 0x04, 0x18, 0x00, 0x00, 0x02, 0x18, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xF5, 0x01, 0x00, 0x00, 0xF6, 0x01, 0x00, 0x00, 0xF7, 0x01, 0x00, 0x00, 0x08, 0x09, 0x46, 0x72, 0x65, 0x65, 0x64, 0x6f, 0x6d])
        #expect(data.count == 0x2E)

        let flags: GAPFlags = 0x1A
        let uuidList: GAPIncompleteListOf32BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802, 0x0107, 0x01F4, 0x01F5, 0x01F6, 0x01F7]
        let localName: GAPCompleteLocalName = "Freedom"

        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }

        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
        else {
            Issue.record("Could not decode")
            return
        }

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 3)
        #expect(GAPDataEncoder.encode(expectedData) == data)

        #expect(decoded[0] as! GAPFlags == flags)
        #expect(decoded[1] as! GAPIncompleteListOf32BitServiceClassUUIDs == uuidList)
        #expect(decoded[2] as! GAPCompleteLocalName == localName)
    }

    @Test func completeListOf128BitServiceClassUUIDs() {

        /**
         Length Data: 0x23
         Flags: 0x1A
         128 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Test 128bits
         Data: 02 01 1a 11 07 03 18 04 18 02 18 04 06 03 18 04 18 02 06 03 18 0d 09 54 65 73 74 20 31 32 38 62 69 74 73
         */

        let data = Data([0x02, 0x01, 0x1a, 0x11, 0x07, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18, 0x0d, 0x09, 0x54, 0x65, 0x73, 0x74, 0x20, 0x31, 0x32, 0x38, 0x62, 0x69, 0x74, 0x73])
        #expect(data.count == 0x23)

        let flags: GAPFlags = 0x1A
        let uuidList: GAPCompleteListOf128BitServiceClassUUIDs = [UUID(bytes: (0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18))]
        let localName: GAPCompleteLocalName = "Test 128bits"

        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }

        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
        else {
            Issue.record("Could not decode")
            return
        }

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 3)
        //            XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
        //
        //            XCTAssertEqual(decoded[0] as! GAPFlags, flags)
        //            XCTAssertEqual(decoded[1] as! GAPCompleteListOf128BitServiceClassUUIDs, uuidList)
        //            XCTAssertEqual(decoded[2] as! GAPCompleteLocalName, localName)
    }

    @Test func incompleteListOf128BitServiceClassUUIDs() {

        /**
         Length Data: 0x23
         Flags: 0x1A
         128 bit UUIDs: 0x1803 0x1804 0x1802 0x0107 0x01F4 0x01F5 0x01F6 0x01F7
         Local Name: Test 128bits
         Data: 02 01 1a 11 07 03 18 04 18 02 18 04 06 03 18 04 18 02 06 03 18 0d 09 54 65 73 74 20 31 32 38 62 69 74 73
         */

        let data = Data([0x02, 0x01, 0x1a, 0x11, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18, 0x0d, 0x09, 0x54, 0x65, 0x73, 0x74, 0x20, 0x31, 0x32, 0x38, 0x62, 0x69, 0x74, 0x73])
        #expect(data.count == 0x23)

        let flags: GAPFlags = 0x1A
        let uuidList: GAPIncompleteListOf128BitServiceClassUUIDs = [UUID(bytes: (0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0x18))]
        let localName: GAPCompleteLocalName = "Test 128bits"

        let expectedData: [GAPData] = [flags, uuidList, localName]
        let types = expectedData.map { type(of: $0) }

        guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
        else {
            Issue.record("Could not decode")
            return
        }

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 3)
    }

    @Test func txPowerLevel() throws {

        let data = Data([0x02, 0x0A, 0x7F])

        #expect(data.count == 3)

        let decoder = GAPDataDecoder<Data>()

        let txPowerLevel = GAPTxPowerLevel(powerLevel: 127)!

        let decoded = try decoder.decode(from: data)

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 1)
        #expect(GAPDataEncoder.encode(txPowerLevel) == data)
        #expect(decoded[0] as? GAPTxPowerLevel == txPowerLevel)
    }

    @Test func classOfDevice() throws {

        let data = Data([0x04, 0x0d, 0x18, 0xf3, 0xff])
        #expect(data.count == 5)

        let encoder = GAPDataEncoder<Data>.self
        let decoder = GAPDataDecoder<Data>()

        let device = GAPClassOfDevice(device: (0x18, 0xf3, 0xff))

        let decoded = try decoder.decode(from: data)

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 1)
        #expect(encoder.encode(device) == data)

        #expect(decoded[0] as? GAPClassOfDevice == device)
    }

    @Test func slaveConnectionIntervalRange() {

        let data = Data([0x05, 0x12, 0x06, 0x00, 0x80, 0x0c])
        #expect(data.count == 0x06)

        let encoder = GAPDataEncoder<Data>.self
        let decoder = GAPDataDecoder<Data>()

        #expect(GAPSlaveConnectionIntervalRange(range: (0xFFF4, 0xFFF1)) == nil)
        #expect(GAPSlaveConnectionIntervalRange(range: (GAPSlaveConnectionIntervalRange.min, GAPSlaveConnectionIntervalRange.min)) != nil)
        #expect(GAPSlaveConnectionIntervalRange(range: (GAPSlaveConnectionIntervalRange.max, GAPSlaveConnectionIntervalRange.max)) != nil)

        let intervalRange = GAPSlaveConnectionIntervalRange(range: (GAPSlaveConnectionIntervalRange.min, GAPSlaveConnectionIntervalRange.max))!

        guard let decoded = try? decoder.decode(from: data)
        else {
            Issue.record("Could not decode")
            return
        }

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 1)
        #expect(encoder.encode(intervalRange) == data)

        #expect(decoded[0] as? GAPSlaveConnectionIntervalRange == intervalRange)
    }

    @Test func serviceData16BitUUID() {

        #expect(GAPServiceData16BitUUID<Data>(data: Data([0x4f])) == nil)

        do {
            let data = Data([0x4f, 0x30])
            let serviceData = GAPServiceData16BitUUID<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: serviceData.uuid) == 2)
            #expect(serviceData.serviceData.count == 0)
            #expect(serviceData.data == data)
            #expect(serviceData.data.count == 2)
        }

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let serviceData = GAPServiceData16BitUUID<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: serviceData.uuid) == 2)
            #expect(serviceData.serviceData.count == 3)
            #expect(serviceData.data == data)
            #expect(serviceData.data.count == 5)
        }

        #expect(GAPServiceData16BitUUID<Data>(data: Data([0x4f, 0x45, 0xff])) == GAPServiceData16BitUUID<Data>(data: Data([0x4f, 0x45, 0xff])))
    }

    @Test func serviceData32BitUUID() {

        #expect(GAPServiceData32BitUUID<Data>(data: Data([0x4f])) == nil)

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30])
            let serviceData = GAPServiceData32BitUUID<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: serviceData.uuid) == 4)
            #expect(serviceData.serviceData.count == 0)
            #expect(serviceData.data == data)
            #expect(serviceData.data.count == 4)
        }

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let serviceData = GAPServiceData32BitUUID<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: serviceData.uuid) == 4)
            #expect(serviceData.serviceData.count == 1)
            #expect(serviceData.data == data)
            #expect(serviceData.data.count == 5)
        }

        #expect(GAPServiceData16BitUUID<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])) == GAPServiceData16BitUUID<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])))
    }

    @Test func serviceData128BitUUID() {

        #expect(GAPServiceData128BitUUID<Data>(data: Data([0x4f])) == nil)

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56])
            let serviceData = GAPServiceData128BitUUID<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: serviceData.uuid) == 16)
            #expect(serviceData.serviceData.count == 0)
            #expect(serviceData.data == data)
            #expect(serviceData.data.count == 16)
        }

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56, 0x4f, 0x30, 0x4f, 0x56])
            let serviceData = GAPServiceData128BitUUID<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: serviceData.uuid) == 16)
            #expect(serviceData.serviceData.count == 4)
            #expect(serviceData.data == data)
            #expect(serviceData.data.count == 20)
        }

        #expect(GAPServiceData128BitUUID<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56, 0x4f, 0x30, 0x4f, 0x56])) == GAPServiceData128BitUUID<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x56, 0x4f, 0x30, 0x4f, 0x56])))
    }

    @Test func appearance() {

        #expect(GAPAppearanceData(data: Data([])) == nil)
        #expect(GAPAppearanceData(data: Data([0x00])) == nil)
        #expect(GAPAppearanceData(data: Data([0x00, 0x00, 0x00])) == nil)
        #expect(GAPAppearanceData(data: Data([0x4f, 0x4f, 0x4f])) == nil)
        #expect(GAPAppearanceData(data: Data([0x00, 0x00, 0x00, 0x00])) == nil)

        do {
            let data = Data([0x4f, 0xf8])
            let appearance = GAPAppearanceData(data: data)!
            #expect(MemoryLayout.size(ofValue: appearance) == 2)
            #expect(appearance.data == data)
            #expect(appearance.data.count == 2)
        }

        #expect(GAPAppearanceData(data: Data([0x4f, 0xf8])) == GAPAppearanceData(data: Data([0x4f, 0xf8])))
        #expect(GAPAppearanceData(appearance: 0xf5).data.count == 2)

        #expect(GAPAppearanceData(appearance: 0).data == Data([0x00, 0x00]))
        #expect(GAPAppearanceData(appearance: GAPAppearance.Unknown.unknown).data == Data([0x00, 0x00]))
        #expect(GAPAppearanceData(data: Data([0x00, 0x00]))?.appearance == GAPAppearance.Unknown.unknown)

        #expect(GAPAppearanceData(appearance: 64).data.map { $0 } == Data([64, 0]).map { $0 })
        #expect(GAPAppearanceData(appearance: GAPAppearance.Phone.generic).data == Data([64, 0]))
        #expect(GAPAppearanceData(data: Data([64, 0]))?.appearance == GAPAppearance.Phone.generic)

        #expect(GAPAppearance(category: .unknown) == GAPAppearance.Unknown.unknown)
        #expect(GAPAppearance.Unknown.unknown.category == GAPAppearance.Unknown.category)
        #expect(GAPAppearance.Unknown.unknown.category == .unknown)
        #expect(GAPAppearance.Unknown.unknown.category == 0)
        #expect(GAPAppearance.Unknown.unknown.subcategory == 0)

        #expect(GAPAppearance(category: .phone) == GAPAppearance.Phone.generic)
        #expect(GAPAppearance.Phone.generic.category == GAPAppearance.Phone.category)
        #expect(GAPAppearance.Phone.generic.category == .phone)
        #expect(GAPAppearance.Phone.generic.category == 1)
        #expect(GAPAppearance.Phone.generic.subcategory == 0)

        #expect(GAPAppearance(category: .computer) == GAPAppearance.Computer.generic)
        #expect(GAPAppearance.Computer.generic.category == .computer)
        #expect(GAPAppearance.Computer.generic.category == GAPAppearance.Computer.category)
        #expect(GAPAppearance.Computer.generic.category == 2)
        #expect(GAPAppearance.Computer.generic.subcategory == 0)

        #expect(GAPAppearance(category: .watch) == GAPAppearance.Watch.generic)
        #expect(GAPAppearance.Watch.generic.category == .watch)
        #expect(GAPAppearance.Watch.generic.category == GAPAppearance.Watch.category)
        #expect(GAPAppearance.Watch.generic.category == 3)
        #expect(GAPAppearance.Watch.generic.subcategory == 0)

        #expect(GAPAppearance(category: .watch, subcategory: 1) == GAPAppearance.Watch.sports)
        #expect(GAPAppearance.Watch.sports.category == .watch)
        #expect(GAPAppearance.Watch.sports.category == GAPAppearance.Watch.category)
        #expect(GAPAppearance.Watch.sports.category == 3)
        #expect(GAPAppearance.Watch.sports.subcategory == 1)
    }

    @Test func publicTargetAddress() {

        #expect(GAPPublicTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b])) == nil)
        #expect(GAPPublicTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b, 0xf8, 0xf8])) == nil)

        do {
            let data = Data([0xf8, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0xf8, 0x91, 0x7e])
            let targetAddress = GAPPublicTargetAddress(data: data)!

            #expect(targetAddress.data == data)
            #expect(targetAddress.addresses.count == 2)
            #expect(targetAddress.data.count == 12)
        }

    }

    @Test func randomTargetAddress() {

        #expect(GAPRandomTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b])) == nil)
        #expect(GAPRandomTargetAddress(data: Data([0x4f, 0xf8, 0x91, 0x7e, 0x8b, 0xf8, 0xf8])) == nil)

        do {
            let data = Data([0xf8, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0xf8, 0x91, 0x7e])
            let targetAddress = GAPRandomTargetAddress(data: data)!

            #expect(targetAddress.data == data)
            #expect(targetAddress.addresses.count == 2)
            #expect(targetAddress.data.count == 12)
        }
    }

    @Test func advertisingInterval() {

        #expect(GAPAdvertisingInterval(data: Data([0x00])) == nil)
        #expect(GAPAdvertisingInterval(data: Data([0x00, 0x00, 0x00])) == nil)

        let data = Data([0x01, 0x00])
        guard let advertisingInterval = GAPAdvertisingInterval(data: data)
        else {
            Issue.record()
            return
        }

        #expect(advertisingInterval.data == data)
        #expect(advertisingInterval.data.count == advertisingInterval.dataLength)
        #expect(MemoryLayout.size(ofValue: advertisingInterval) == 2)
        #expect(advertisingInterval == 1)
        #expect(advertisingInterval.miliseconds == 0.0625)
        #expect(advertisingInterval.description == "0.0625ms")
    }

    @Test func lEDeviceAddress() {

        #expect(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x30, 0xff])) == nil)
        #expect(GAPLEDeviceAddress(data: Data([0x4f, 0xf8, 0x30])) == nil)
        #expect(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x02])) == nil)
        #expect(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x01])) != nil)
        #expect(GAPLEDeviceAddress(data: Data([0x4f, 0x4f, 0xf8, 0x30, 0x4f, 0xf8, 0x00])) != nil)

        do {
            let data = Data([0x4f, 0x4f, 0xf8, 0x30, 0xf8, 0x30, 0x01])
            let deviceAddress = GAPLEDeviceAddress(data: data)!

            #expect(deviceAddress.data == data)
            #expect(deviceAddress.data.count == GAPLEDeviceAddress.length)
            #expect(deviceAddress.type == .random)
        }

        do {
            let data = Data([0x4f, 0x4f, 0xf8, 0x30, 0xf8, 0x30, 0x00])
            let deviceAddress = GAPLEDeviceAddress(data: data)!

            #expect(deviceAddress.data == data)
            #expect(deviceAddress.data.count == GAPLEDeviceAddress.length)
            #expect(deviceAddress.type == .public)
        }

        #expect(GAPLEDeviceAddress(address: .zero, type: .public).data.count == GAPLEDeviceAddress.length)
        #expect(GAPLEDeviceAddress(address: .zero, type: .random).data.count == GAPLEDeviceAddress.length)
    }

    @Test func lERole() {

        #expect(GAPLERole(data: Data([])) == nil)
        #expect(GAPLERole(data: Data([0x4f])) == nil)
        #expect(GAPLERole(data: Data([0x04])) == nil)
        #expect(GAPLERole(data: Data([0xFF])) == nil)

        #expect(GAPLERole(data: Data([0x00])) == .onlyPeripheralRoleSupported)
        #expect(GAPLERole(data: Data([0x01])) == .onlyCentralRoleSupported)
        #expect(GAPLERole(data: Data([0x02])) == .bothSupportedPeripheralPreferred)
        #expect(GAPLERole(data: Data([0x03])) == .bothSupportedCentralPreferred)

        #expect(GAPLERole.onlyPeripheralRoleSupported.data == Data([0x00]))
        #expect(GAPLERole.onlyCentralRoleSupported.data == Data([0x01]))
        #expect(GAPLERole.bothSupportedPeripheralPreferred.data == Data([0x02]))
        #expect(GAPLERole.bothSupportedCentralPreferred.data == Data([0x03]))

        #expect(GAPLERole.onlyPeripheralRoleSupported.supported == [.peripheral])
        #expect(GAPLERole.onlyCentralRoleSupported.supported == [.central])
        #expect(GAPLERole.bothSupportedPeripheralPreferred.supported == [.central, .peripheral])
        #expect(GAPLERole.bothSupportedCentralPreferred.supported == [.central, .peripheral])

        #expect(GAPLERole.onlyPeripheralRoleSupported.preferred == .peripheral)
        #expect(GAPLERole.onlyCentralRoleSupported.preferred == .central)
        #expect(GAPLERole.bothSupportedPeripheralPreferred.preferred == .peripheral)
        #expect(GAPLERole.bothSupportedCentralPreferred.preferred == .central)
    }

    @Test func url() throws {

        let uriString = "/my/uri/string"
        let data = Data([15, 0x24, 47, 109, 121, 47, 117, 114, 105, 47, 115, 116, 114, 105, 110, 103])
        let uri = GAPURI(uri: uriString)
        let expectedData: [GAPData] = [uri]
        let types = expectedData.map { type(of: $0) }

        let decoded = try GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)

        #expect(decoded.isEmpty == false)
        #expect(decoded.count == 1)
        #expect(GAPDataEncoder.encode(expectedData) == data)

        #expect(decoded[0] as? GAPURI == uri)
        #expect((decoded[0] as? GAPURI)?.description == uriString)
    }

    @Test func indoorPositioning() {

        #expect(GAPIndoorPositioning.dataType.rawValue == 0x25)

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

            #expect(indoorPositioning.data.count == indoorPositioning.dataLength)

            guard let decoded = GAPIndoorPositioning(data: indoorPositioning.data)
            else {
                Issue.record("Could not decode")
                return
            }

            #expect(decoded == indoorPositioning)

            if let coordinate = indoorPositioning.coordinates {
                #expect(coordinate.dataLength == 4)
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
    @Test func lESecureConnectionsConfirmation() {

        #expect(GAPLESecureConnectionsConfirmation(data: Data([0x4f])) == nil)
        #expect(GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0x4f, 0x4f])) == nil)

        do {
            let data = Data([0x4f, 0xf8])
            let confirmation = GAPLESecureConnectionsConfirmation(data: data)!
            #expect(MemoryLayout.size(ofValue: confirmation) == 2)
            #expect(confirmation.data == data)
            #expect(confirmation.data.count == 2)
            #expect(confirmation.data.count == confirmation.dataLength)
        }

        #expect(GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0xf8])) == GAPLESecureConnectionsConfirmation(data: Data([0x4f, 0xf8])))
        #expect(GAPLESecureConnectionsConfirmation(confirmation: 0xf5).data.count == 2)
    }

    @Test func lESecureConnectionsRandom() {

        #expect(GAPLESecureConnectionsRandom(data: Data([0x4f])) == nil)
        #expect(GAPLESecureConnectionsRandom(data: Data([0x4f, 0x4f, 0x4f])) == nil)

        do {
            let data = Data([0x4f, 0xf8])
            let random = GAPLESecureConnectionsRandom(data: data)!
            #expect(MemoryLayout.size(ofValue: random) == 2)
            #expect(random.data == data)
            #expect(random.data.count == 2)
            #expect(random.data.count == random.dataLength)
        }

        #expect(GAPLESecureConnectionsRandom(data: Data([0x4f, 0xf8])) == GAPLESecureConnectionsRandom(data: Data([0x4f, 0xf8])))
        #expect(GAPLESecureConnectionsRandom(random: 0xf5).data.count == 2)
    }

    @Test func channelMapUpdateIndication() {

        do {
            let data = Data([0x4d, 0x3e, 0x12, 0x3a, 0x18, 0x4d, 0x3e])
            let channelMap = GAPChannelMapUpdateIndication(channelMap: (0x4d, 0x3e, 0x12, 0x3a, 0x18), instant: (0x4d, 0x3e))
            #expect(channelMap.data.count == GAPChannelMapUpdateIndication.length)
            #expect(channelMap.data == data)
        }
    }

    @Test func transportDiscoveryData() {

        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01, 0x01])
            let transport = GAPTransportDiscoveryData<Data>(data: data)
            #expect(transport!.data == data)
        }

        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01, 0x01, 0x4d, 0b1011, 0x04, 0x02, 0x02, 0x02, 0x02])
            let transport = GAPTransportDiscoveryData<Data>(data: data)
            #expect(transport!.data == data)
        }

        do {
            let data = Data([0x05])
            let transport = GAPTransportDiscoveryData<Data>(data: data)
            #expect(transport == nil)
        }

        do {
            let data = Data([])
            let transport = GAPTransportDiscoveryData<Data>(data: data)
            #expect(transport == nil)
        }

        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01])
            let transport = GAPTransportDiscoveryData<Data>(data: data)
            #expect(transport == nil)
        }

        do {
            let data = Data([0x05, 0x4d, 0b10000])
            let transport = GAPTransportDiscoveryData<Data>(data: data)
            #expect(transport == nil)
        }

        do {
            let data = Data([0x05, 0x4d, 0b10000, 0x03, 0x01, 0x01, 0x01])
            #expect(GAPTransportDiscoveryData<Data>(data: data) == GAPTransportDiscoveryData<Data>(data: data))
        }
    }

    @Test func meshMessage() {

        #expect(GAPMeshMessage(data: Data([])) == nil)
        #expect(GAPMeshMessage(data: Data([0x4f])) == nil)
        #expect(GAPMeshMessage(data: Data([0x4f, 0xf8, 0x30])) == nil)

        do {
            let data = Data([0xf8, 0x30])
            let message = GAPMeshMessage(data: data)!

            #expect(message.data == data)
            #expect(message.data.count == 2)
            #expect(message.data.count == message.dataLength)
            #expect(MemoryLayout.size(ofValue: message) == 2)
        }
    }

    @Test func meshBeacon() {

        #expect(GAPMeshBeacon(data: Data([])) == nil)
        #expect(GAPMeshBeacon(data: Data([0x02, 0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10, 0x4f, 0xf8, 0x30, 0x45])) == nil)
        #expect(GAPMeshBeacon(data: Data([0x02, 0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10])) == nil)

        // Unprovisioned Device
        do {
            let data = Data([0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10, 0x4f, 0xf8, 0x30, 0x45])
            let beacon = GAPMeshBeacon(data: data)!
            #expect(beacon.data == data)
        }

        do {
            let data = Data([0x00, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10])
            let beacon = GAPMeshBeacon(data: data)!
            #expect(beacon.data == data)
        }

        // Secure Network
        do {
            let data = Data([0x01, 0xFF, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03, 0xFF, 0b00, 0b10, 0x4f, 0xf8, 0x30])
            let beacon = GAPMeshBeacon(data: data)!
            #expect(beacon.data == data)
        }

    }

    @Test func manufacturerSpecificData() {

        #expect(GAPManufacturerSpecificData<Data>(data: Data()) == nil)
        #expect(GAPManufacturerSpecificData<Data>(data: Data([0x4f])) == nil)

        do {
            let data = Data([0x4f, 0x30])
            let manufacturerData = GAPManufacturerSpecificData<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: manufacturerData.companyIdentifier) == 2)
            #expect(manufacturerData.data == data)
            #expect(manufacturerData.data.count == 2)
        }

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let manufacturerData = GAPManufacturerSpecificData<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: manufacturerData.companyIdentifier) == 2)
            #expect(manufacturerData.additionalData.count == 3)
            #expect(manufacturerData.data == data)
            #expect(manufacturerData.data.count == 5)
        }

        #expect(GAPManufacturerSpecificData<Data>(data: Data([0x4f, 0x45, 0xff])) == GAPManufacturerSpecificData<Data>(data: Data([0x4f, 0x45, 0xff])))
    }

    @Test func pBADV() {

        #expect(GAPPBADV<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x4f, 0x30, 0x4f, 0x30, 0x12])) == nil)
        #expect(GAPPBADV<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f])) == nil)
        #expect(GAPPBADV<Data>(data: Data([])) == nil)

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38])
            let pbadv = GAPPBADV<Data>(data: data)!
            #expect(MemoryLayout.size(ofValue: pbadv.linkID) == 4)
            #expect(pbadv.data == data)
            #expect(pbadv.data.count == 6)
        }

        do {
            let data = Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38, 0x4f, 0x30, 0x4f, 0x30, 0x4f])
            let pbadv = GAPPBADV<Data>(data: data)!
            #expect(pbadv.genericProvisioningPDU.count == 6)
            #expect(pbadv.data == data)
            #expect(pbadv.data.count == 11)
        }

        #expect(GAPPBADV<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38])) == GAPPBADV<Data>(data: Data([0x4f, 0x30, 0x4f, 0x30, 0x4f, 0x38])))
    }

    @Test func test3DInformation() {

        #expect(GAP3DInformation(data: Data([])) == nil)
        #expect(GAP3DInformation(data: Data([0x00])) == nil)
        #expect(GAP3DInformation(data: Data([0x00, 0x00, 0x01])) == nil)

        do {
            let data = Data([0b00, 0x00])
            guard let information = GAP3DInformation(data: data)
            else {
                Issue.record()
                return
            }
            #expect(information.data == data)
            #expect(information.flags == [])
            #expect(information.pathLossThreshold == 0)
        }

        do {
            let data = Data([0b11, 0x01])
            guard let information = GAP3DInformation(data: data)
            else {
                Issue.record()
                return
            }
            #expect(information.data == data)
            #expect(information.flags == [.associationNotification, .batteryLevelReporting])
            #expect(information.pathLossThreshold == 1)
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

internal extension GAPDataDecoder {

    static func decode(
        _ data: Data,
        types: [GAPData.Type],
        ignoreUnknownType: Bool = true
    ) throws -> [GAPData] {
        var decoder = GAPDataDecoder<Data>()
        decoder.types = types
        decoder.ignoreUnknownType = ignoreUnknownType
        return try decoder.decode(from: data)
    }
}
#endif
