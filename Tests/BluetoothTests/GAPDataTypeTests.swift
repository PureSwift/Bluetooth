//
//  GAPDataTypeTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 7/17/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

#if canImport(BluetoothGAP)
import Testing
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
import Bluetooth
@testable import BluetoothGAP

@Suite struct GAPDataTypeTests {

    @Test func listOf16BitServiceSolicitationUUIDs() {

        #expect(GAPListOf16BitServiceSolicitationUUIDs.dataType == .listOf16BitServiceSolicitationUUIDs)

        #expect(
            GAPListOf16BitServiceSolicitationUUIDs(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])) == nil,
            "Can only initialize from multiples of 2 bytes")

        #expect(GAPListOf16BitServiceSolicitationUUIDs(data: Data())?.uuids ?? [] == [], "Should initialize from empty data")
        #expect(GAPListOf16BitServiceSolicitationUUIDs().uuids == [])
        #expect(GAPListOf16BitServiceSolicitationUUIDs().data == Data())
        #expect(GAPListOf16BitServiceSolicitationUUIDs().dataLength == 0)

        // 16 bit UUIDs: 0x1803 0x1804 0x1802
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18])

        guard let list = GAPListOf16BitServiceSolicitationUUIDs(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(list.uuids == [0x1803, 0x1804, 0x1802])
        #expect(list.data == data)
        #expect(list.dataLength == data.count)
        #expect(list == [0x1803, 0x1804, 0x1802])
        #expect(list == GAPListOf16BitServiceSolicitationUUIDs(uuids: [0x1803, 0x1804, 0x1802]))
        #expect(list != GAPListOf16BitServiceSolicitationUUIDs(uuids: [0x1803]))
        #expect(list.description.isEmpty == false)
    }

    @Test func listOf32BitServiceSolicitationUUIDs() {

        #expect(GAPListOf32BitServiceSolicitationUUIDs.dataType == .listOf32BitServiceSolicitationUUIDs)

        #expect(
            GAPListOf32BitServiceSolicitationUUIDs(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])) == nil,
            "Can only initialize from multiples of 4 bytes")

        #expect(GAPListOf32BitServiceSolicitationUUIDs(data: Data())?.uuids ?? [] == [], "Should initialize from empty data")
        #expect(GAPListOf32BitServiceSolicitationUUIDs().uuids == [])
        #expect(GAPListOf32BitServiceSolicitationUUIDs().data == Data())
        #expect(GAPListOf32BitServiceSolicitationUUIDs().dataLength == 0)

        // 32 bit UUIDs: 0x18041803 0x06041802
        let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06])

        guard let list = GAPListOf32BitServiceSolicitationUUIDs(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(list.uuids == [0x1804_1803, 0x0604_1802])
        #expect(list.data == data)
        #expect(list.dataLength == data.count)
        #expect(list == [0x1804_1803, 0x0604_1802])
        #expect(list == GAPListOf32BitServiceSolicitationUUIDs(uuids: [0x1804_1803, 0x0604_1802]))
        #expect(list != GAPListOf32BitServiceSolicitationUUIDs(uuids: [0x1804_1803]))
        #expect(list.description.isEmpty == false)
    }

    @Test func listOf128BitServiceSolicitationUUIDs() {

        #expect(GAPListOf128BitServiceSolicitationUUIDs.dataType == .listOf128BitServiceSolicitationUUIDs)

        #expect(
            GAPListOf128BitServiceSolicitationUUIDs(data: Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x04, 0x06, 0x03, 0x18, 0x04, 0x18, 0x02, 0x06, 0x03])) == nil,
            "Can only initialize from multiples of 16 bytes")

        #expect(GAPListOf128BitServiceSolicitationUUIDs(data: Data())?.uuids ?? [] == [], "Should initialize from empty data")
        #expect(GAPListOf128BitServiceSolicitationUUIDs().uuids == [])
        #expect(GAPListOf128BitServiceSolicitationUUIDs().data == Data())
        #expect(GAPListOf128BitServiceSolicitationUUIDs().dataLength == 0)

        // 128 bit UUID (little endian)
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F])
        let uuid = UUID(bytes: (0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00))

        guard let list = GAPListOf128BitServiceSolicitationUUIDs(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(list.uuids == [uuid])
        #expect(list.data == data)
        #expect(list.dataLength == data.count)
        #expect(list == [uuid])
        #expect(list == GAPListOf128BitServiceSolicitationUUIDs(uuids: [uuid]))
        #expect(list != GAPListOf128BitServiceSolicitationUUIDs(uuids: []))
        #expect(list.description.isEmpty == false)
    }

    @Test func securityManagerOOBFlags() {

        #expect(GAPSecurityManagerOOBFlags.dataType == .securityManagerOutOfBandFlags)

        #expect(GAPSecurityManagerOOBFlags(data: Data()) == nil, "Can only initialize from 1 byte")
        #expect(GAPSecurityManagerOOBFlags(data: Data([0x01, 0x02])) == nil, "Can only initialize from 1 byte")

        #expect(GAPSecurityManagerOOBFlags().flags == [])
        #expect(GAPSecurityManagerOOBFlags().data == Data([0x00]))
        #expect(GAPSecurityManagerOOBFlags().dataLength == 1)

        let data = Data([0b1111])

        guard let flags = GAPSecurityManagerOOBFlags(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(flags.flags.rawValue == 0b1111)
        #expect(flags.flags.contains(.oobFlagsField))
        #expect(flags.flags.contains(.supportedLE))
        #expect(flags.flags.contains(.simultaneousLEandBREDR))
        #expect(flags.flags.contains(.addressType))
        #expect(flags.data == data)
        #expect(flags.dataLength == data.count)
        #expect(flags == [.oobFlagsField, .supportedLE, .simultaneousLEandBREDR, .addressType])
        #expect(flags != GAPSecurityManagerOOBFlags())
        #expect(flags.hashValue == GAPSecurityManagerOOBFlags(flags: GAPSecurityManagerOOBFlag(rawValue: 0b1111)).hashValue)
        #expect(flags.description.isEmpty == false)

        let singleFlag: GAPSecurityManagerOOBFlags = [.oobFlagsField]
        #expect(singleFlag.flags.rawValue == 0b01)
        #expect(singleFlag.flags.contains(.supportedLE) == false)
        #expect(singleFlag.data == Data([0b01]))

        #expect(GAPSecurityManagerOOBFlag.allCases.count == 4)
        GAPSecurityManagerOOBFlag.allCases.forEach { #expect(GAPSecurityManagerOOBFlag(rawValue: $0.rawValue) == $0) }
    }

    @Test func securityManagerTKValue() {

        #expect(GAPSecurityManagerTKValue.dataType == .securityManagerTKValue)

        #expect(GAPSecurityManagerTKValue(data: Data()) == nil, "Can only initialize from 16 bytes")
        #expect(GAPSecurityManagerTKValue(data: Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E])) == nil, "Can only initialize from 16 bytes")

        // 128 bit value (little endian)
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F])
        let uuid = UUID(bytes: (0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00))

        guard let value = GAPSecurityManagerTKValue(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(value.uuid == uuid)
        #expect(value.data == data)
        #expect(value.dataLength == data.count)
        #expect(value == GAPSecurityManagerTKValue(uuid: uuid))
        #expect(value != GAPSecurityManagerTKValue(uuid: UUID(bytes: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00))))
        #expect(value.hashValue == GAPSecurityManagerTKValue(uuid: uuid).hashValue)
        #expect(value.description == uuid.description)
    }

    @Test func simplePairingHashC() {

        #expect(GAPSimplePairingHashC.dataType == .simplePairingHashC)

        #expect(GAPSimplePairingHashC(data: Data()) == nil, "Can only initialize from 16 bytes")
        #expect(GAPSimplePairingHashC(data: Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E])) == nil, "Can only initialize from 16 bytes")

        // 128 bit value (little endian)
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F])
        let uuid = UUID(bytes: (0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00))

        guard let hash = GAPSimplePairingHashC(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(hash.uuid == uuid)
        #expect(hash.data == data)
        #expect(hash.dataLength == data.count)
        #expect(hash == GAPSimplePairingHashC(uuid: uuid))
        #expect(hash != GAPSimplePairingHashC(uuid: UUID(bytes: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00))))
        #expect(hash.hashValue == GAPSimplePairingHashC(uuid: uuid).hashValue)
        #expect(hash.description == uuid.description)
    }

    @Test func simplePairingRandomizerR() {

        #expect(GAPSimplePairingRandomizerR.dataType == .simplePairingRandomizerR)

        #expect(GAPSimplePairingRandomizerR(data: Data()) == nil, "Can only initialize from 16 bytes")
        #expect(GAPSimplePairingRandomizerR(data: Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E])) == nil, "Can only initialize from 16 bytes")

        // 128 bit value (little endian)
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F])
        let uuid = UUID(bytes: (0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00))

        guard let randomizer = GAPSimplePairingRandomizerR(data: data)
        else {
            Issue.record("Could not parse from data")
            return
        }

        #expect(randomizer.uuid == uuid)
        #expect(randomizer.data == data)
        #expect(randomizer.dataLength == data.count)
        #expect(randomizer == GAPSimplePairingRandomizerR(uuid: uuid))
        #expect(randomizer != GAPSimplePairingRandomizerR(uuid: UUID(bytes: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00))))
        #expect(randomizer.hashValue == GAPSimplePairingRandomizerR(uuid: uuid).hashValue)
        #expect(randomizer.description == uuid.description)
    }
}
#endif
