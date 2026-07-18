//
//  GATTDatabaseCoverageTests.swift
//  Bluetooth
//
//  Exercises the GATTDatabase value-type API directly (mutation, subscripting,
//  iteration, and service reconstruction) that the end-to-end GATTServer tests
//  do not reach.
//

import Testing
import Foundation
@testable import BluetoothGATT
import Bluetooth

@Suite struct GATTDatabaseCoverageTests {

    typealias Service = GATTAttribute<Data>.Service
    typealias Characteristic = GATTAttribute<Data>.Characteristic
    typealias Descriptor = GATTAttribute<Data>.Descriptor
    typealias Include = GATTAttribute<Data>.Include

    static let batteryServiceUUID = BluetoothUUID.bit16(0x180F)
    static let batteryLevelUUID = BluetoothUUID.bit16(0x2A19)
    static let deviceInformationUUID = BluetoothUUID.bit16(0x180A)
    static let manufacturerNameUUID = BluetoothUUID.bit16(0x2A29)
    static let modelNumberUUID = BluetoothUUID.bit16(0x2A24)

    static let batteryService = Service(
        uuid: batteryServiceUUID,
        isPrimary: true,
        characteristics: [
            Characteristic(
                uuid: batteryLevelUUID,
                value: Data([0x63]),
                permissions: [.read],
                properties: [.read, .notify],
                descriptors: [
                    Descriptor(GATTClientCharacteristicConfiguration(), permissions: [.read, .write])
                ]
            )
        ]
    )

    static let deviceInformationService = Service(
        uuid: deviceInformationUUID,
        isPrimary: true,
        characteristics: [
            Characteristic(
                uuid: manufacturerNameUUID,
                value: Data("PureSwift".utf8),
                permissions: [.read],
                properties: [.read]
            ),
            Characteristic(
                uuid: modelNumberUUID,
                value: Data("1.0".utf8),
                permissions: [.read],
                properties: [.read]
            )
        ]
    )

    @Test func emptyDatabase() {
        var database = GATTDatabase<Data>()
        #expect(database.isEmpty)
        #expect(database.count == 0)
        #expect(database.first == nil)
        #expect(database.last == nil)
        #expect(database.contains(handle: 0x0001) == false)
        #expect(Array(database).isEmpty)

        // ExpressibleByArrayLiteral
        database = []
        #expect(database.isEmpty)
    }

    @Test func addAndReconstructServices() {
        var database = GATTDatabase<Data>()
        let batteryHandle = database.add(service: Self.batteryService)
        let deviceHandle = database.add(service: Self.deviceInformationService)

        #expect(database.isEmpty == false)
        #expect(batteryHandle == 0x0001)
        #expect(deviceHandle > batteryHandle)
        #expect(database.count == Array(database).count)
        #expect(database.first?.handle == 0x0001)
        #expect(database.last?.handle == UInt16(database.count))
        #expect(database.contains(handle: batteryHandle))
        #expect(database.contains(handle: 0xFFFF) == false)

        // reconstruct services from the flat attribute list
        let services = database.attributeGroups.compactMap { $0.service }
        #expect(services.count == 2)
        let battery = services.first { $0.uuid == Self.batteryServiceUUID }
        #expect(battery != nil)
        #expect(battery?.isPrimary == true)
        #expect(battery?.characteristics.count == 1)
        #expect(battery?.characteristics.first?.uuid == Self.batteryLevelUUID)
        #expect(battery?.characteristics.first?.descriptors.isEmpty == false)
    }

    @Test func initWithServices() {
        let database = GATTDatabase(services: [Self.batteryService, Self.deviceInformationService])
        #expect(database.isEmpty == false)
        #expect(database.count > 0)
        // service handle ranges
        let range0 = database.serviceHandles(at: 0)
        let range1 = database.serviceHandles(at: 1)
        #expect(range0.start < range0.end)
        #expect(range1.start > range0.end)
    }

    @Test func subscriptByIndexAndHandle() {
        let database = GATTDatabase(services: [Self.batteryService, Self.deviceInformationService])

        // index subscript matches the flattened attribute list
        for index in 0..<database.count {
            let byIndex = database[index]
            let byHandle = database[handle: byIndex.handle]
            #expect(byIndex == byHandle)
        }

        // slice (RandomAccessCollection)
        let slice = database[0..<2]
        #expect(slice.count == 2)
        #expect(slice.first == database.first)
    }

    @Test func writeAttributeValue() {
        var database = GATTDatabase(services: [Self.batteryService])
        // find the battery level value attribute
        let valueAttribute = database.first { $0.uuid == Self.batteryLevelUUID }
        let handle = try! #require(valueAttribute?.handle)

        let newValue = Data([0x2A])
        database.write(newValue, forAttribute: handle)
        #expect(database[handle: handle].value == newValue)
    }

    @Test func removeService() {
        var database = GATTDatabase(services: [Self.batteryService, Self.deviceInformationService])
        let countBefore = database.count
        let deviceHandle = database.attributeGroups
            .first { $0.service?.uuid == Self.deviceInformationUUID }!
            .serviceAttribute.handle

        database.remove(service: deviceHandle)
        #expect(database.count < countBefore)
        #expect(database.attributeGroups.contains { $0.service?.uuid == Self.deviceInformationUUID } == false)
        #expect(database.attributeGroups.contains { $0.service?.uuid == Self.batteryServiceUUID })

        database.removeAll()
        #expect(database.isEmpty)
    }

    @Test func includedService() {
        let secondary = Service(
            uuid: Self.batteryServiceUUID,
            isPrimary: false,
            characteristics: [
                Characteristic(uuid: Self.batteryLevelUUID, value: Data([0x50]), properties: [.read])
            ]
        )
        var database = GATTDatabase<Data>()
        let secondaryHandle = database.add(service: secondary)
        let secondaryRange = database.serviceHandles(at: 0)

        let primary = Service(
            uuid: Self.deviceInformationUUID,
            isPrimary: true,
            characteristics: [],
            includedServices: [
                Include(
                    serviceHandle: secondaryHandle,
                    endGroupHandle: secondaryRange.end,
                    serviceUUID: Self.batteryServiceUUID
                )
            ]
        )
        database.add(service: primary)

        // the primary service group should include the include declaration
        let primaryGroup = database.attributeGroups.first { $0.service?.uuid == Self.deviceInformationUUID }
        #expect(primaryGroup != nil)
        let reconstructed = primaryGroup?.service
        #expect(reconstructed?.includedServices.isEmpty == false)
        #expect(reconstructed?.includedServices.first?.serviceUUID == Self.batteryServiceUUID)
    }

    @Test func iteration() {
        let database = GATTDatabase(services: [Self.batteryService])
        var handles = [UInt16]()
        for attribute in database {
            handles.append(attribute.handle)
        }
        #expect(handles == handles.sorted())
        #expect(handles.count == database.count)
        #expect(database.startIndex == 0)
        #expect(database.endIndex == database.count)
        #expect(database.index(after: 0) == 1)
    }
}
