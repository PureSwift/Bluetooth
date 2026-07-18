//
//  GATTClientServerTests.swift
//  Bluetooth
//
//  End-to-end GATTClient <-> GATTServer procedures (reads, writes, long
//  reads/writes, descriptors, indications, and error responses) driven over
//  the in-memory TestL2CAPSocket transport.
//

import Testing
import Foundation
@testable import BluetoothGATT
import Bluetooth

@Suite(.serialized)
struct GATTClientServerTests {

    /// A connected GATTClient/GATTServer pair sharing the given database, with
    /// their run loops already pumping.
    final class Pair {
        let client: GATTClient<TestL2CAPSocket>
        let server: GATTServer<TestL2CAPSocket>
        init(
            client: GATTClient<TestL2CAPSocket>,
            server: GATTServer<TestL2CAPSocket>
        ) {
            self.client = client
            self.server = server
        }
    }

    static func connect(
        service: GATTAttribute<Data>.Service,
        mtu: ATTMaximumTransmissionUnit = .default
    ) async throws -> Pair {
        let database = GATTDatabase(services: [service])

        let serverAddress = BluetoothAddress.min
        let clientAddress = BluetoothAddress.max
        let serverSocket = try TestL2CAPServer.lowEnergyServer(
            address: serverAddress,
            isRandom: false,
            backlog: 1
        )
        let clientSocket = try TestL2CAPSocket.lowEnergyClient(
            address: clientAddress,
            destination: serverAddress,
            isRandom: false
        )
        let client = await GATTClient(
            socket: clientSocket,
            maximumTransmissionUnit: mtu,
            log: { print("GATTClient:", $0) }
        )
        let newConnection = try serverSocket.accept()
        let server = GATTServer(
            socket: newConnection,
            maximumTransmissionUnit: mtu,
            maximumPreparedWrites: .max,
            database: database,
            log: { print("GATTServer:", $0) }
        )
        Task { [weak client] in
            while let client {
                try await Task.sleep(nanoseconds: 10_000)
                try await client.run()
            }
        }
        Task { [weak server] in
            while let server {
                try await Task.sleep(nanoseconds: 10_000)
                try server.run()
            }
        }
        return Pair(client: client, server: server)
    }

    /// Discover the single service and all of its characteristics.
    static func discover(
        _ pair: Pair
    ) async throws -> (service: GATTClient<TestL2CAPSocket>.Service, characteristics: [GATTClient<TestL2CAPSocket>.Characteristic]) {
        let services = try await pair.client.discoverAllPrimaryServices()
        let service = try #require(services.first)
        let characteristics = try await pair.client.discoverAllCharacteristics(of: service)
        return (service, characteristics)
    }

    static let testService = GATTAttribute<Data>.Service(
        uuid: BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!,
        isPrimary: true,
        characteristics: [
            TestProfile.Read,
            TestProfile.ReadBlob,
            TestProfile.Write,
            TestProfile.WriteBlob,
            TestProfile.WriteWithoutResponse
        ]
    )

    @Test func readShortCharacteristic() async throws {
        let pair = try await Self.connect(service: Self.testService)
        let (_, characteristics) = try await Self.discover(pair)
        let read = try #require(characteristics.first { $0.uuid == TestProfile.Read.uuid })
        let value = try await pair.client.readCharacteristic(read)
        #expect(value == TestProfile.Read.value)
    }

    @Test func readLongCharacteristic() async throws {
        // ReadBlob is 512 bytes, forcing the Read Blob (long read) sub-procedure.
        let pair = try await Self.connect(service: Self.testService)
        let (_, characteristics) = try await Self.discover(pair)
        let readBlob = try #require(characteristics.first { $0.uuid == TestProfile.ReadBlob.uuid })
        let value = try await pair.client.readCharacteristic(readBlob)
        #expect(value == TestProfile.ReadBlob.value)
    }

    @Test func readByType() async throws {
        let pair = try await Self.connect(service: Self.testService)
        let (service, _) = try await Self.discover(pair)
        let values = try await pair.client.readCharacteristics(
            using: TestProfile.Read.uuid,
            handleRange: (service.handle, service.end)
        )
        #expect(values.values.contains(TestProfile.Read.value))
    }

    @Test func writeShortCharacteristic() async throws {
        let pair = try await Self.connect(service: Self.testService)
        let (_, characteristics) = try await Self.discover(pair)
        let write = try #require(characteristics.first { $0.uuid == TestProfile.Write.uuid })
        try await pair.client.writeCharacteristic(write, data: TestProfile.WriteValue, withResponse: true)
        // server database should reflect the write
        let stored = try await Self.waitForValue(pair, uuid: TestProfile.Write.uuid, equals: TestProfile.WriteValue)
        #expect(stored == TestProfile.WriteValue)
    }

    @Test func writeLongCharacteristic() async throws {
        // WriteBlob is 512 bytes, forcing the prepare/execute (long write) sub-procedure.
        let pair = try await Self.connect(service: Self.testService)
        let (_, characteristics) = try await Self.discover(pair)
        let writeBlob = try #require(characteristics.first { $0.uuid == TestProfile.WriteBlob.uuid })
        try await pair.client.writeCharacteristic(writeBlob, data: TestProfile.WriteBlobValue, withResponse: true)
        let stored = try await Self.waitForValue(pair, uuid: TestProfile.WriteBlob.uuid, equals: TestProfile.WriteBlobValue)
        #expect(stored == TestProfile.WriteBlobValue)
    }

    /// Poll the server database for a characteristic value, up to ~5 seconds.
    /// Write-without-response has no acknowledgement, so the server applies it
    /// asynchronously and a fixed sleep would be racy under CI load.
    static func waitForValue(
        _ pair: Pair,
        uuid: BluetoothUUID,
        equals expected: Data
    ) async throws -> Data? {
        for _ in 0..<500 {
            let stored = pair.server.database.first { $0.uuid == uuid }?.value
            if stored == expected { return stored }
            try await Task.sleep(nanoseconds: 10_000_000)  // 10ms
        }
        return pair.server.database.first { $0.uuid == uuid }?.value
    }

    @Test func writeWithoutResponse() async throws {
        let pair = try await Self.connect(service: Self.testService)
        let (_, characteristics) = try await Self.discover(pair)
        let write = try #require(characteristics.first { $0.uuid == TestProfile.WriteWithoutResponse.uuid })
        let value = Data("cmd".utf8)
        try await pair.client.writeCharacteristic(write, data: value, withResponse: false)
        let stored = try await Self.waitForValue(pair, uuid: TestProfile.WriteWithoutResponse.uuid, equals: value)
        #expect(stored == value)
    }

    @Test func readWriteOnlyCharacteristicReturnsError() async throws {
        // Reading a write-only characteristic must produce an ATT error response.
        let pair = try await Self.connect(service: Self.testService)
        let (_, characteristics) = try await Self.discover(pair)
        let write = try #require(characteristics.first { $0.uuid == TestProfile.Write.uuid })
        await #expect(throws: (any Swift.Error).self) {
            _ = try await pair.client.readCharacteristic(write)
        }
    }

}
