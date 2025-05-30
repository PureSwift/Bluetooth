//
//  GATTTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import Testing
import Foundation
import Bluetooth
@testable import BluetoothGATT

@Suite(.serialized)
struct GATTTests {

    @Test func mtuExchange() async throws {

        let mtu = try #require(ATTMaximumTransmissionUnit(rawValue: 512))

        let testPDUs: [(ATTProtocolDataUnit, [UInt8])] = [
            (
                ATTMaximumTransmissionUnitRequest(clientMTU: mtu.rawValue),
                [0x02, 0x00, 0x02]
            ),
            (
                ATTMaximumTransmissionUnitResponse(serverMTU: mtu.rawValue),
                [0x03, 0x00, 0x02]
            )
        ]

        // decode and validate bytes
        test(testPDUs)

        // server
        let serverAddress = BluetoothAddress.min
        let clientAddress = BluetoothAddress.max
        let serverSocket = try TestL2CAPServer.lowEnergyServer(
            address: serverAddress,
            isRandom: false,
            backlog: 1
        )

        // client
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
        print("GATTServer: New connection")
        let server = GATTServer(
            socket: newConnection,
            maximumTransmissionUnit: mtu,
            maximumPreparedWrites: .max,
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
        try await client.exchangeMTU()  // force MTU exchange

        let serverMTU = server.maximumTransmissionUnit
        let clientMTU = await client.maximumTransmissionUnit
        #expect(serverMTU == clientMTU)
        #expect(serverMTU == mtu)
        #expect(serverMTU != .default)
        #expect(clientMTU == mtu)
        #expect(clientMTU != .default)

        // validate GATT PDUs
        let mockData = split(pdu: testPDUs.map { $1 })
        let serverCache = server.connection.socket.cache
        let clientCache = clientSocket.cache
        #expect(serverCache == mockData.server)
        #expect(clientCache == mockData.client)
    }

    @Test func discoverPrimaryServicesNoMTUExchange() async throws {

        // If MTU is not negociated, then make sure all PDUs respect the MTU limit

        let profiles: [[GATTAttribute<Data>.Service]] = [
            ProximityProfile.services,
            [
                ProximityProfile.Apple1Service,
                ProximityProfile.Apple2Service,
                ProximityProfile.AppleNotificationService,
                ProximityProfile.Apple4Service,
                GATTAttribute<Data>.Service(
                    uuid: BluetoothUUID(rawValue: "A6BEA019-D82A-46AA-B612-0304BB884423")!,
                    isPrimary: true,
                    characteristics: []),
                GATTAttribute<Data>.Service(
                    uuid: BluetoothUUID(rawValue: "23627A36-4F81-49F9-9501-8B8A49FBA529")!,
                    isPrimary: true,
                    characteristics: [])
            ]
        ]

        for profile in profiles.prefix(1) {

            // server
            let serverAddress = BluetoothAddress.min
            let clientAddress = BluetoothAddress.max
            let serverSocket = try TestL2CAPServer.lowEnergyServer(
                address: serverAddress,
                isRandom: false,
                backlog: 1
            )

            // client
            let clientSocket = try TestL2CAPSocket.lowEnergyClient(
                address: clientAddress,
                destination: serverAddress,
                isRandom: false
            )
            let client = await GATTClient(
                socket: clientSocket,
                maximumTransmissionUnit: .default,
                log: { print("GATTClient:", $0) }
            )

            let newConnection = try serverSocket.accept()
            print("GATTServer: New connection")
            let server = GATTServer(
                socket: newConnection,
                maximumTransmissionUnit: .max,
                maximumPreparedWrites: .max,
                database: GATTDatabase(services: profile),
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

            // request
            let services = try await client.discoverAllPrimaryServices()
            #expect(services.map { $0.uuid } == profile.map { $0.uuid })

            // validate MTU
            let serverMTU = server.maximumTransmissionUnit
            let serverPreferredMTU = server.preferredMaximumTransmissionUnit
            let clientMTU = await client.maximumTransmissionUnit
            let clientPreferredMTU = await client.preferredMaximumTransmissionUnit
            #expect(serverMTU == clientMTU)
            #expect(serverMTU == .default)
            #expect(clientMTU == .default)
            #expect(serverPreferredMTU == .max)
            #expect(clientPreferredMTU == .default)
            /*
            // validate GATT MTU
            let serverCache = await (server.connection.socket as! TestL2CAPSocket).cache
            let clientCache = await clientSocket.cache
            (serverCache + clientCache).forEach {
                XCTAssert($0.count <= Int(ATTMaximumTransmissionUnit.default.rawValue))
                let opcode = ATTOpcode(rawValue: $0[0])!
                XCTAssertNotEqual(opcode, .maximumTransmissionUnitRequest, "Never exchange MTU")
                XCTAssertNotEqual(opcode, .maximumTransmissionUnitResponse, "Never exchange MTU")
            }*/
        }
    }

    @Test func discoverPrimaryServicesApple() async throws {

        guard let mtu = ATTMaximumTransmissionUnit(rawValue: 104)
        else {
            Issue.record()
            return
        }

        let testPDUs: [(ATTProtocolDataUnit, [UInt8])] = [

            /**
             Apr 08 15:32:49.824  ATT Send         0x0041  SEND  Exchange MTU Request - MTU:104
             Exchange MTU Request - MTU:104
             Opcode: 0x02
             Client Rx MTU: 0x0068
            
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0003 (03) [ 02 68 00 ]
             */
            (
                ATTMaximumTransmissionUnitRequest(clientMTU: mtu.rawValue),
                [0x02, 0x68, 0x00]
            ),

            /**
             Apr 08 15:32:49.845  ATT Receive      0x0041  RECV  Exchange MTU Response - MTU:104
             Exchange MTU Response - MTU:104
             Opcode: 0x03
             Client Rx MTU: 0x0068
            
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0003 (03) [ 03 68 00 ]
             */
            (
                ATTMaximumTransmissionUnitResponse(serverMTU: mtu.rawValue),
                [0x03, 0x68, 0x00]
            ),

            /**
             Read By Group Type Request - Start Handle:0x0001 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0001
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
            
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 01 00 FF FF 00 28 ]
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x01, endHandle: .max, type: GATTUUID.primaryService.uuid),
                [0x10, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),

            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0006
             Attribute Handle: 0x0001 End Group Handle: 0x0005 UUID: 1800 (Generic Access)
             Attribute Handle: 0x0006 End Group Handle: 0x0009 UUID: 1801 (Generic Attribute)
            
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x000E (14) [ 11 06 01 00 05 00 00 18 06 00 09 00 01 18 ]
             */
            (
                ATTReadByGroupTypeResponse(attributeData: [
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x0001,
                        endGroupHandle: 0x0005,
                        value: Data(BluetoothUUID.bit16(0x1800).littleEndian)
                    ),
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x0006,
                        endGroupHandle: 0x0009,
                        value: Data(BluetoothUUID.bit16(0x1801).littleEndian)
                    )
                ])!,

                [0x11, 0x06, 0x01, 0x00, 0x05, 0x00, 0x00, 0x18, 0x06, 0x00, 0x09, 0x00, 0x01, 0x18]
            ),

            /**
             Read By Group Type Request - Start Handle:0x000a - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x000a
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
            
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 0A 00 FF FF 00 28 ]
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x000a, endHandle: .max, type: GATTUUID.primaryService.uuid),
                [0x10, 0x0A, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),

            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0014
             Attribute Handle: 0x000A End Group Handle: 0x000E UUID: D0611E78-BBB4-4591-A5F8-487910AE4366
             Attribute Handle: 0x000F End Group Handle: 0x0013 UUID: 9FA480E0-4967-4542-9390-D343DC5D04AE
            
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x002A (42) [ 11 14 0A 00 0E 00 66 43 AE 10 79 48 F8 A5 91 45 ... ]
             */
            (
                ATTReadByGroupTypeResponse(attributeData: [
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x000A,
                        endGroupHandle: 0x000E,
                        value: Data(BluetoothUUID(uuid: UUID(uuidString: "D0611E78-BBB4-4591-A5F8-487910AE4366")!).littleEndian)
                    ),
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x000F,
                        endGroupHandle: 0x0013,
                        value: Data(BluetoothUUID(uuid: UUID(uuidString: "9FA480E0-4967-4542-9390-D343DC5D04AE")!).littleEndian)
                    )
                ])!,

                [ /* 0x41, 0x20, 0x1B, 0x00, 0x2A, 0x00, 0x04, 0x00, */0x11, 0x14, 0x0A, 0x00, 0x0E, 0x00, 0x66, 0x43, 0xAE, 0x10, 0x79, 0x48, 0xF8, 0xA5, 0x91, 0x45, 0xB4, 0xBB, 0x78, 0x1E, 0x61, 0xD0, 0x0F, 0x00, 0x13, 0x00, 0xAE, 0x04, 0x5D, 0xDC, 0x43, 0xD3, 0x90, 0x93, 0x42, 0x45, 0x67, 0x49, 0xE0, 0x80, 0xA4, 0x9F]
            ),

            /**
             Read By Group Type Request - Start Handle:0x0014 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0014
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
            
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 14 00 FF FF 00 28 ]
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x0014, endHandle: .max, type: GATTUUID.primaryService.uuid),
                [0x10, 0x14, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),

            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0006
             Attribute Handle: 0x0014 End Group Handle: 0x0017 UUID: 180F (Battery Service)
             Attribute Handle: 0x0018 End Group Handle: 0x001D UUID: 1805 (Current Time Service)
             Attribute Handle: 0x001E End Group Handle: 0x0022 UUID: 180A (Device Information)
            
            L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0014 (20) [ 11 06 14 00 17 00 0F 18 18 00 1D 00 05 18 1E 00 ... ]
             */
            (
                ATTReadByGroupTypeResponse(attributeData: [
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x0014,
                        endGroupHandle: 0x0017,
                        value: Data(BluetoothUUID.bit16(0x180F).littleEndian)
                    ),
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x0018,
                        endGroupHandle: 0x001D,
                        value: Data(BluetoothUUID.bit16(0x1805).littleEndian)
                    ),
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x001E,
                        endGroupHandle: 0x0022,
                        value: Data(BluetoothUUID.bit16(0x180A).littleEndian)
                    )
                ])!,

                [ /* 0x41, 0x20, 0x18, 0x00, 0x14, 0x00, 0x04, 0x00, */0x11, 0x06, 0x14, 0x00, 0x17, 0x00, 0x0F, 0x18, 0x18, 0x00, 0x1D, 0x00, 0x05, 0x18, 0x1E, 0x00, 0x22, 0x00, 0x0A, 0x18]
            ),

            /**
             Read By Group Type Request - Start Handle:0x0023 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0023
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
            
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 23 00 FF FF 00 28 ]
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x0023, endHandle: .max, type: GATTUUID.primaryService.uuid),
                [0x10, 0x23, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),

            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0014
             Attribute Handle: 0x0023 End Group Handle: 0x002C UUID: 7905F431-B5CE-4E99-A40F-4B1E122D00D0 (Apple Notification Center Service)
             Attribute Handle: 0x002D End Group Handle: 0x0038 UUID: 89D3502B-0F36-433A-8EF4-C502AD55F8DC
            
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x002A (42) [ 11 14 23 00 2C 00 D0 00 2D 12 1E 4B 0F A4 99 4E ... ]
             */
            (
                ATTReadByGroupTypeResponse(attributeData: [
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x0023,
                        endGroupHandle: 0x002C,
                        value: Data(BluetoothUUID(uuid: UUID(uuidString: "7905F431-B5CE-4E99-A40F-4B1E122D00D0")!).littleEndian)
                    ),
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x002D,
                        endGroupHandle: 0x0038,
                        value: Data(BluetoothUUID(uuid: UUID(uuidString: "89D3502B-0F36-433A-8EF4-C502AD55F8DC")!).littleEndian)
                    )
                ])!,

                [ /* 0x41, 0x20, 0x1B, 0x00, 0x2A, 0x00, 0x04, 0x00, */0x11, 0x14, 0x23, 0x00, 0x2C, 0x00, 0xD0, 0x00, 0x2D, 0x12, 0x1E, 0x4B, 0x0F, 0xA4, 0x99, 0x4E, 0xCE, 0xB5, 0x31, 0xF4, 0x05, 0x79, 0x2D, 0x00, 0x38, 0x00, 0xDC, 0xF8, 0x55, 0xAD, 0x02, 0xC5, 0xF4, 0x8E, 0x3A, 0x43, 0x36, 0x0F, 0x2B, 0x50, 0xD3, 0x89]
            ),

            /**
             Read By Group Type Request - Start Handle:0x0039 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0039
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
            
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 39 00 FF FF 00 28 ]
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x0039, endHandle: .max, type: GATTUUID.primaryService.uuid),
                [0x10, 0x39, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),

            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0006
             Attribute Handle: 0x0039 End Group Handle: 0x003C UUID: 1803 (Link Loss)
             Attribute Handle: 0x003D End Group Handle: 0x003F UUID: 1804 (Tx Power)
             Attribute Handle: 0x0040 End Group Handle: 0x0042 UUID: 1802 (Immediate Alert)
            
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0014 (20) [ 11 06 39 00 3C 00 03 18 3D 00 3F 00 04 18 40 00 ... ]
             */
            (
                ATTReadByGroupTypeResponse(attributeData: [
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x0039,
                        endGroupHandle: 0x003C,
                        value: Data(BluetoothUUID.bit16(0x1803).littleEndian)
                    ),
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x003D,
                        endGroupHandle: 0x003F,
                        value: Data(BluetoothUUID.bit16(0x1804).littleEndian)
                    ),
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x0040,
                        endGroupHandle: 0x0042,
                        value: Data(BluetoothUUID.bit16(0x1802).littleEndian)
                    )
                ])!,

                [ /* 0x41, 0x20, 0x18, 0x00, 0x14, 0x00, 0x04, 0x00, */0x11, 0x06, 0x39, 0x00, 0x3C, 0x00, 0x03, 0x18, 0x3D, 0x00, 0x3F, 0x00, 0x04, 0x18, 0x40, 0x00, 0x42, 0x00, 0x02, 0x18]
            ),

            /**
             Read By Group Type Request - Start Handle:0x0043 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0043
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
            
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 43 00 FF FF 00 28 ]
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x0043, endHandle: .max, type: GATTUUID.primaryService.uuid),
                [0x10, 0x43, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),

            /**
             Error Response - Attribute Handle: 0x0043 - Error Code: 0x0A - Attribute Not Found
             Opcode: 0x01
             Request Opcode In Error: 0x10 (Read By Group Type Request)
             Attribute Handle In Error: 0x0043 (67)
             Error Code: 0x0a (Attribute Not Found)
            
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0005 (05) [ 01 10 43 00 0A ]
             */
            (
                ATTErrorResponse(
                    request: .readByGroupTypeRequest,
                    attributeHandle: 0x0043,
                    error: .attributeNotFound),
                [0x01, 0x10, 0x43, 0x00, 0x0A]
            )
        ]

        test(testPDUs)

        // server
        let serverAddress = BluetoothAddress.min
        let clientAddress = BluetoothAddress.max
        let serverSocket = try TestL2CAPServer.lowEnergyServer(
            address: serverAddress,
            isRandom: false,
            backlog: 1
        )

        // client
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
        print("GATTServer: New connection")
        let server = GATTServer(
            socket: newConnection,
            maximumTransmissionUnit: mtu,
            maximumPreparedWrites: .max,
            database: GATTDatabase(services: ProximityProfile.services),
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

        // request
        let services = try await client.discoverAllPrimaryServices()
        #expect(services.map { $0.uuid } == ProximityProfile.services.map { $0.uuid })

        // validate MTU
        let serverMTU = server.maximumTransmissionUnit
        let clientMTU = await client.maximumTransmissionUnit
        #expect(serverMTU == clientMTU)
        #expect(serverMTU == mtu)
        #expect(clientMTU == mtu)

        // validate GATT PDUs
        /*
        let mockData = split(pdu: testPDUs.map { $1 })
        let serverCache = await (server.connection.socket as! TestL2CAPSocket).cache
        let clientCache = await clientSocket.cache
        XCTAssertEqual(serverCache, mockData.server)
        XCTAssertEqual(clientCache, mockData.client)*/
    }

    @Test func discoverPrimaryServices() async throws {

        let clientMTU = ATTMaximumTransmissionUnit(rawValue: 104)!  // 0x0068
        let serverMTU = ATTMaximumTransmissionUnit.default  // 23
        let finalMTU = serverMTU
        #expect(ATTMaximumTransmissionUnit(server: clientMTU.rawValue, client: serverMTU.rawValue) == finalMTU)

        let testPDUs: [(ATTProtocolDataUnit, [UInt8])] = [
            /**
             Exchange MTU Request - MTU:104
             Opcode: 0x02
             Client Rx MTU: 0x0068
             */
            (
                ATTMaximumTransmissionUnitRequest(clientMTU: clientMTU.rawValue),
                [0x02, 0x68, 0x00]
            ),
            /**
             Exchange MTU Response - MTU:23
             Opcode: 0x03
             Client Rx MTU: 0x0017
             */
            (
                ATTMaximumTransmissionUnitResponse(serverMTU: serverMTU.rawValue),
                [0x03, 0x17, 0x00]
            ),
            /**
             Read By Group Type Request - Start Handle:0x0001 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0001
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x0001, endHandle: 0xffff, type: BluetoothUUID.Declaration.primaryService),
                [0x10, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),
            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0006
             Attribute Handle: 0x0001 End Group Handle: 0x0004 UUID: 180F (Battery Service)
             */
            (
                ATTReadByGroupTypeResponse(attributeData: [
                    ATTReadByGroupTypeResponse.AttributeData(
                        attributeHandle: 0x001,
                        endGroupHandle: 0x0004,
                        value: Data(BluetoothUUID.Service.battery.littleEndian))
                ])!,
                [0x11, 0x06, 0x01, 0x00, 0x04, 0x00, 0x0F, 0x18]
            ),
            /**
             Read By Group Type Request - Start Handle:0x0005 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0005
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
             */
            (
                ATTReadByGroupTypeRequest(startHandle: 0x0005, endHandle: 0xffff, type: BluetoothUUID.Declaration.primaryService),
                [0x10, 0x05, 0x00, 0xFF, 0xFF, 0x00, 0x28]
            ),
            /**
             Error Response - Attribute Handle: 0x0005 - Error Code: 0x0A - Attribute Not Found
             Opcode: 0x01
             Request Opcode In Error: 0x10 (Read By Group Type Request)
             Attribute Handle In Error: 0x0005 (5)
             Error Code: 0x0a (Attribute Not Found)
             */
            (
                ATTErrorResponse(request: .readByGroupTypeRequest, attributeHandle: 0x0005, error: .attributeNotFound),
                [0x01, 0x10, 0x05, 0x00, 0x0A]
            )
        ]

        // decode and validate bytes
        test(testPDUs)

        // service
        let batteryLevel = GATTBatteryLevel(level: .min)

        let characteristics = [
            GATTAttribute<Data>.Characteristic(
                uuid: type(of: batteryLevel).uuid,
                value: batteryLevel.data,
                permissions: [.read],
                properties: [.read, .notify],
                descriptors: [.init(GATTClientCharacteristicConfiguration(), permissions: [.read, .write])])
        ]

        let service = GATTAttribute<Data>.Service(
            uuid: BluetoothUUID.Service.battery,
            isPrimary: true,
            characteristics: characteristics)

        // server
        let serverAddress = BluetoothAddress.min
        let clientAddress = BluetoothAddress.max
        let serverSocket = try TestL2CAPServer.lowEnergyServer(
            address: serverAddress,
            isRandom: false,
            backlog: 1
        )

        // client
        let clientSocket = try TestL2CAPSocket.lowEnergyClient(
            address: clientAddress,
            destination: serverAddress,
            isRandom: false
        )
        let client = await GATTClient(
            socket: clientSocket,
            maximumTransmissionUnit: clientMTU,
            log: { print("GATTClient:", $0) }
        )

        let newConnection = try serverSocket.accept()
        print("GATTServer: New connection")
        let server = GATTServer(
            socket: newConnection,
            maximumTransmissionUnit: serverMTU,
            maximumPreparedWrites: .max,
            database: GATTDatabase(services: [service]),
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

        // request
        let services = try await client.discoverAllPrimaryServices()
        #expect(services.map { $0.uuid } == [service].map { $0.uuid })

        // validate MTU
        let finalServerMTU = server.maximumTransmissionUnit
        let finalClientMTU = await client.maximumTransmissionUnit
        #expect(finalServerMTU == finalMTU)
        #expect(finalClientMTU == finalMTU)

        // validate GATT PDUs
        let mockData = split(pdu: testPDUs.map { $1 })
        let serverCache = server.connection.socket.cache
        let clientCache = clientSocket.cache
        #expect(serverCache == mockData.server)
        #expect(clientCache == mockData.client)
    }

    @Test func discoverServiceByUUID() async throws {

        let characteristic = GATTAttribute<Data>.Characteristic(
            uuid: BluetoothUUID(),
            value: Data(),
            permissions: [.read],
            properties: [.read],
            descriptors: [])

        let services = (0..<6).map {
            GATTAttribute<Data>.Service(
                uuid: BluetoothUUID(),
                isPrimary: $0 == 0 || $0 % 2 == 0,  // true if even number or zero
                characteristics: [characteristic])
        }

        let database = GATTDatabase(services: services)

        // server
        let serverAddress = BluetoothAddress.min
        let clientAddress = BluetoothAddress.max
        let serverSocket = try TestL2CAPServer.lowEnergyServer(
            address: serverAddress,
            isRandom: false,
            backlog: 1
        )

        // client
        let clientSocket = try TestL2CAPSocket.lowEnergyClient(
            address: clientAddress,
            destination: serverAddress,
            isRandom: false
        )
        let client = await GATTClient(
            socket: clientSocket,
            maximumTransmissionUnit: .default,
            log: { print("GATTClient:", $0) }
        )
        let newConnection = try serverSocket.accept()
        print("GATTServer: New connection")
        let server = GATTServer(
            socket: newConnection,
            maximumTransmissionUnit: .default,
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

        // discover service
        let foundServices = try await client.discoverPrimaryServices(by: services[0].uuid)
        guard foundServices.count == 1,
            let foundService = foundServices.first
        else {
            Issue.record("Service not found")
            return
        }

        #expect(foundService.uuid == services[0].uuid)
        #expect(foundService.handle == database.serviceHandles(at: 0).start)
        #expect(foundService.end == database.serviceHandles(at: 0).end)
        #expect(foundService.isPrimary == (database.first!.uuid == BluetoothUUID.Declaration.primaryService))

        let characteristics = try await client.discoverAllCharacteristics(of: foundService)
        guard let foundCharacteristic = characteristics.first(where: { $0.uuid == characteristic.uuid })
        else {
            Issue.record("Characteristic \(characteristic.uuid) not found")
            return
        }

        #expect(database[handle: foundCharacteristic.handle.declaration].uuid == BluetoothUUID.Declaration.characteristic)
        #expect(database[handle: foundCharacteristic.handle.value].uuid == characteristic.uuid)
        #expect(database[handle: foundCharacteristic.handle.value].permissions == characteristic.permissions)
        //XCTAssertEqual(client.endHandle(for: foundCharacteristic, service: (foundService, characteristics)), foundService.end)

        // validate MTU
        let finalServerMTU = server.maximumTransmissionUnit
        let finalClientMTU = await client.maximumTransmissionUnit
        #expect(finalServerMTU == .default)
        #expect(finalClientMTU == .default)
    }

    @Test func discoverCharacteristicByUUID() async throws {

        let characteristic = GATTAttribute<Data>.Characteristic(
            uuid: BluetoothUUID(),
            value: Data(),
            permissions: [.read],
            properties: [.read],
            descriptors: []
        )

        let service = GATTAttribute<Data>.Service(
            uuid: BluetoothUUID(),
            isPrimary: true,
            characteristics: [characteristic]
        )

        let database = GATTDatabase(services: [service])

        // server
        let serverAddress = BluetoothAddress.min
        let clientAddress = BluetoothAddress.max
        let serverSocket = try TestL2CAPServer.lowEnergyServer(
            address: serverAddress,
            isRandom: false,
            backlog: 1
        )

        // client
        let clientSocket = try TestL2CAPSocket.lowEnergyClient(
            address: clientAddress,
            destination: serverAddress,
            isRandom: false
        )
        let client = await GATTClient(
            socket: clientSocket,
            maximumTransmissionUnit: .default,
            log: { print("GATTClient:", $0) }
        )
        let newConnection = try serverSocket.accept()
        print("GATTServer: New connection")
        let server = GATTServer(
            socket: newConnection,
            maximumTransmissionUnit: .default,
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

        // discover service
        let foundServices = try await client.discoverPrimaryServices(by: service.uuid)
        guard foundServices.count == 1,
            let foundService = foundServices.first
        else {
            Issue.record("Service not found")
            return
        }

        #expect(foundService.uuid == service.uuid)
        #expect(foundService.handle == database.serviceHandles(at: 0).start)
        #expect(foundService.end == database.serviceHandles(at: 0).end)
        #expect(foundService.isPrimary == (database.first!.uuid == BluetoothUUID.Declaration.primaryService))

        let foundCharacteristics = try await client.discoverCharacteristics(of: foundService, by: characteristic.uuid)

        guard foundCharacteristics.count == 1,
            let foundCharacteristic = foundCharacteristics.first
        else {
            Issue.record("Characteristic not found")
            return
        }

        #expect(database[handle: foundCharacteristic.handle.declaration].uuid == BluetoothUUID.Declaration.characteristic)
        #expect(database[handle: foundCharacteristic.handle.value].uuid == characteristic.uuid)
        #expect(database[handle: foundCharacteristic.handle.value].permissions == characteristic.permissions)

        // validate MTU
        let finalServerMTU = server.maximumTransmissionUnit
        let finalClientMTU = await client.maximumTransmissionUnit
        #expect(finalServerMTU == .default)
        #expect(finalClientMTU == .default)
    }

    @Test func descriptors() async throws {

        let descriptors = [
            .init(GATTClientCharacteristicConfiguration(), permissions: [.read, .write]),
            GATTAttribute<Data>.Descriptor(
                uuid: BluetoothUUID(),
                value: Data("UInt128 Descriptor".utf8),
                permissions: [.read, .write]),
            GATTAttribute<Data>.Descriptor(
                uuid: BluetoothUUID.Member.savantSystems,
                value: Data("Savant".utf8),
                permissions: [.read]),
            GATTAttribute<Data>.Descriptor(
                uuid: BluetoothUUID.Member.savantSystems2,
                value: Data("Savant2".utf8),
                permissions: [.write])
        ]

        let characteristic = GATTAttribute<Data>.Characteristic(
            uuid: BluetoothUUID(),
            value: Data(),
            permissions: [.read],
            properties: [.read],
            descriptors: descriptors)

        let service = GATTAttribute<Data>.Service.init(
            uuid: BluetoothUUID(),
            isPrimary: true,
            characteristics: [characteristic])

        let database = GATTDatabase<Data>(services: [service])

        // server
        let serverAddress = BluetoothAddress.min
        let clientAddress = BluetoothAddress.max
        let serverSocket = try TestL2CAPServer.lowEnergyServer(
            address: serverAddress,
            isRandom: false,
            backlog: 1
        )

        // client
        let clientSocket = try TestL2CAPSocket.lowEnergyClient(
            address: clientAddress,
            destination: serverAddress,
            isRandom: false
        )
        let client = await GATTClient(
            socket: clientSocket,
            maximumTransmissionUnit: .default,
            log: { print("GATTClient:", $0) }
        )
        let newConnection = try serverSocket.accept()
        print("GATTServer: New connection")
        let server = GATTServer(
            socket: newConnection,
            maximumTransmissionUnit: .default,
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

        // discover service
        let foundServices = try await client.discoverPrimaryServices(by: service.uuid)
        guard foundServices.count == 1,
            let foundService = foundServices.first
        else {
            Issue.record("Service not found")
            return
        }

        #expect(foundService.uuid == service.uuid)
        #expect(foundService.handle == database.serviceHandles(at: 0).start)
        #expect(foundService.end == database.serviceHandles(at: 0).end)
        #expect(foundService.isPrimary == (database.first!.uuid == BluetoothUUID.Declaration.primaryService))

        let characteristics = try await client.discoverAllCharacteristics(of: foundService)

        guard let foundCharacteristic = characteristics.first(where: { $0.uuid == characteristic.uuid })
        else {
            Issue.record("Characteristic \(characteristic.uuid) not found")
            return
        }

        #expect(database[handle: foundCharacteristic.handle.declaration].uuid == BluetoothUUID.Declaration.characteristic)
        #expect(database[handle: foundCharacteristic.handle.value].uuid == characteristic.uuid)
        #expect(database[handle: foundCharacteristic.handle.value].permissions == characteristic.permissions)
        let endHandle = await client.endHandle(for: foundCharacteristic, service: (foundService, characteristics))
        #expect(endHandle == foundService.end)

        let foundDescriptors = try await client.discoverDescriptors(of: foundCharacteristic, service: (foundService, characteristics))

        #expect(foundDescriptors.isEmpty == false, "No descriptors found")
        #expect(foundDescriptors.count == descriptors.count)
        #expect(foundDescriptors.map({ $0.uuid }) == descriptors.map({ $0.uuid }))

        for (index, descriptor) in foundDescriptors.enumerated() {
            let expectedValue = descriptors[index].value
            let descriptorPermissions = descriptors[index].permissions
            if descriptorPermissions.contains(.read) {
                let readValue = try await client.readDescriptor(descriptor)
                #expect(readValue == expectedValue)
            }
            if descriptorPermissions.contains(.write) {
                let newValue = Data("new value".utf8)
                try await client.writeDescriptor(descriptor, data: newValue)
                let newServerValue = server.database[handle: descriptor.handle].value
                #expect(newValue == newServerValue)
            }
        }

        // validate MTU
        let finalServerMTU = server.maximumTransmissionUnit
        let finalClientMTU = await client.maximumTransmissionUnit
        #expect(finalServerMTU == .default)
        #expect(finalClientMTU == .default)
    }

    @Test func notification() async throws {

        func test(with characteristics: [GATTAttribute<Data>.Characteristic], newData: [Data]) async throws {

            let service = GATTAttribute<Data>.Service(
                uuid: BluetoothUUID(),
                isPrimary: true,
                characteristics: characteristics
            )

            let database = GATTDatabase(services: [service])

            // server
            let serverAddress = BluetoothAddress.min
            let clientAddress = BluetoothAddress.max
            let serverSocket = try TestL2CAPServer.lowEnergyServer(
                address: serverAddress,
                isRandom: false,
                backlog: 1
            )

            // client
            let clientSocket = try TestL2CAPSocket.lowEnergyClient(
                address: clientAddress,
                destination: serverAddress,
                isRandom: false
            )
            let client = await GATTClient(
                socket: clientSocket,
                maximumTransmissionUnit: .default,
                log: { print("GATTClient:", $0) }
            )
            let newConnection = try serverSocket.accept()
            print("GATTServer: New connection")
            let server = GATTServer(
                socket: newConnection,
                maximumTransmissionUnit: .default,
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

            // discover service
            let foundServices = try await client.discoverPrimaryServices(by: service.uuid)
            guard foundServices.count == 1,
                let foundService = foundServices.first
            else {
                Issue.record("Service not found")
                return
            }

            #expect(foundService.uuid == service.uuid)
            #expect(foundService.handle == database.serviceHandles(at: 0).start)
            #expect(foundService.end == database.serviceHandles(at: 0).end)
            #expect(foundService.isPrimary == (database.first!.uuid == BluetoothUUID.Declaration.primaryService))

            let characteristics = try await client.discoverAllCharacteristics(of: foundService)

            guard let notificationCharacteristic = characteristics.first(where: { $0.properties.contains(.notify) || $0.properties.contains(.indicate) })
            else {
                Issue.record("Characteristic not found")
                return
            }

            let descriptors = try await client.discoverDescriptors(of: notificationCharacteristic, service: (foundService, characteristics))
            #expect(descriptors.isEmpty == false, "No descriptors found")

            // notifications
            actor NotificationData {
                var receivedNotifications = [Data]()
                var receivedIndications = [Data]()
                func notification(_ data: Data) {
                    receivedNotifications.append(data)
                }
                func indication(_ data: Data) {
                    receivedIndications.append(data)
                }
            }

            let notificationData = NotificationData()
            let notification: GATTClient<TestL2CAPSocket>.Notification?
            if notificationCharacteristic.properties.contains(.notify) {
                notification = { data in
                    Task {
                        await notificationData.notification(data)
                    }
                }
            } else {
                notification = nil
            }
            let indication: GATTClient<TestL2CAPSocket>.Notification?
            if notificationCharacteristic.properties.contains(.indicate) {
                indication = { data in
                    Task {
                        await notificationData.indication(data)
                    }
                }
            } else {
                indication = nil
            }

            try await client.clientCharacteristicConfiguration(
                notificationCharacteristic,
                notification: notification,
                indication: indication,
                descriptors: descriptors
            )

            for data in newData {
                server.writeValue(data, forCharacteristic: notificationCharacteristic.uuid)
            }

            try await Task.sleep(nanoseconds: 1_000_000)

            // stop notifications
            try await client.clientCharacteristicConfiguration(
                notificationCharacteristic,
                notification: nil,
                indication: nil,
                descriptors: descriptors
            )

            let maxLength = 20  //MTU-3
            let expectedNotificationValues = newData.map { Data($0.prefix(maxLength)) }
            if notificationCharacteristic.properties.contains(.notify) {
                await #expect(notificationData.receivedNotifications == expectedNotificationValues)
            }
            if notificationCharacteristic.properties.contains(.indicate) {
                await #expect(notificationData.receivedIndications == expectedNotificationValues)
            }
        }

        try await test(with: [TestProfile.Read, TestProfile.Write, TestProfile.Notify], newData: [Data("test".utf8)])
        //try await test(with: [TestProfile.Read, TestProfile.Write, TestProfile.Indicate], newData: [Data("test".utf8)])
        //try await test(with: [TestProfile.Notify, TestProfile.Read, TestProfile.Write], newData: [Data("test".utf8)])
        //try await test(with: [TestProfile.Notify], newData: [Data("test".utf8)])
        //try await test(with: [TestProfile.Indicate], newData: [Data("test".utf8)])
        //try await test(with: [TestProfile.Notify], newData: [Data(repeating: 1, count: 20)])
        //try await test(with: [TestProfile.Indicate], newData: [Data(repeating: 1, count: 20)])
        //try await test(with: [TestProfile.Notify], newData: [Data(repeating: 1, count: Int(ATTMaximumTransmissionUnit.max.rawValue))])
        //try await test(with: [TestProfile.Indicate], newData: [Data(repeating: 1, count: Int(ATTMaximumTransmissionUnit.max.rawValue))])
    }
}

private extension GATTTests {

    func test(
        _ testPDUs: [(ATTProtocolDataUnit, [UInt8])],
        file: StaticString = #file,
        line: UInt = #line
    ) {

        // decode and compare
        for (testPDU, testData) in testPDUs {

            guard let decodedPDU = type(of: testPDU).init(data: Data(testData)) else {
                Issue.record("Could not decode \(type(of: testPDU))")
                return
            }

            //dump(decodedPDU)

            #expect(decodedPDU.data == Data(testData))

            var decodedDump = ""
            dump(decodedPDU, to: &decodedDump)
            var testDump = ""
            dump(testPDU, to: &testDump)

            // FIXME: Compare with Equatable
            // Data has different pointers, so dumps will always be different
            //XCTAssertEqual(decodedDump, testDump)
        }
    }

    func split(pdu data: [[UInt8]]) -> (server: [Data], client: [Data]) {

        var serverSocketData = [Data]()
        var clientSocketData = [Data]()

        for pduData in data {

            guard let opcodeByte = pduData.first
            else { fatalError("Empty data \(pduData)") }

            guard let opcode = ATTOpcode(rawValue: opcodeByte)
            else { fatalError("Invalid opcode \(opcodeByte)") }

            switch opcode.type.destination {

            case .client:

                clientSocketData.append(Data(pduData))

            case .server:

                serverSocketData.append(Data(pduData))
            }
        }

        return (serverSocketData, clientSocketData)
    }
}

fileprivate extension ATTOpcodeType {

    enum Destination {

        case client
        case server
    }

    var destination: Destination {

        switch self {

        case .command,
            .request:

            return .server

        case .response,
            .confirmation,
            .indication,
            .notification:

            return .client
        }
    }
}

struct ProximityProfile {

    static let services: [GATTAttribute<Data>.Service] = [

        GenericAccessService,
        GenericAttributeService,

        Apple1Service,
        Apple2Service,

        BatteryService,
        CurrentTimeService,
        DeviceInformationService,

        AppleNotificationService,
        Apple4Service,

        LinkLossService,
        TXPowerService,
        ImmediateAlertService
    ]

    static let GenericAccessService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x1800),
        isPrimary: true,
        characteristics: []
    )

    static let GenericAttributeService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x1801),
        isPrimary: true,
        characteristics: [
            GATTAttribute<Data>.Characteristic(
                uuid: BluetoothUUID(),
                value: Data(),
                permissions: [.read],
                properties: [.read],
                descriptors: []),
            GATTAttribute<Data>.Characteristic(
                uuid: BluetoothUUID(),
                value: Data(),
                permissions: [.read],
                properties: [.read],
                descriptors: []),
            GATTAttribute<Data>.Characteristic(
                uuid: BluetoothUUID(),
                value: Data(),
                permissions: [.read],
                properties: [.read],
                descriptors: []),
            GATTAttribute<Data>.Characteristic(
                uuid: BluetoothUUID(),
                value: Data(),
                permissions: [.read],
                properties: [.read],
                descriptors: []),
            GATTAttribute<Data>.Characteristic(
                uuid: BluetoothUUID(),
                value: Data(),
                permissions: [.read],
                properties: [.read],
                descriptors: [])
        ]
    )

    static let BatteryService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x180F),
        isPrimary: true,
        characteristics: []
    )

    static let CurrentTimeService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x1805),
        isPrimary: true,
        characteristics: []
    )

    static let DeviceInformationService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x180A),
        isPrimary: true,
        characteristics: []
    )

    static let LinkLossService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x1803),
        isPrimary: true,
        characteristics: []
    )

    static let TXPowerService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x1804),
        isPrimary: true,
        characteristics: []
    )

    static let ImmediateAlertService = GATTAttribute<Data>.Service(
        uuid: .bit16(0x1802),
        isPrimary: true,
        characteristics: []
    )

    static let Apple1Service = GATTAttribute<Data>.Service(
        uuid: BluetoothUUID(uuid: UUID(uuidString: "D0611E78-BBB4-4591-A5F8-487910AE4366")!),
        isPrimary: true,
        characteristics: []
    )

    static let Apple2Service = GATTAttribute<Data>.Service(
        uuid: BluetoothUUID(uuid: UUID(uuidString: "9FA480E0-4967-4542-9390-D343DC5D04AE")!),
        isPrimary: true,
        characteristics: []
    )

    static let AppleNotificationService = GATTAttribute<Data>.Service(
        uuid: BluetoothUUID(uuid: UUID(uuidString: "7905F431-B5CE-4E99-A40F-4B1E122D00D0")!),
        isPrimary: true,
        characteristics: []
    )

    static let Apple4Service = GATTAttribute<Data>.Service(
        uuid: BluetoothUUID(uuid: UUID(uuidString: "89D3502B-0F36-433A-8EF4-C502AD55F8DC")!),
        isPrimary: true,
        characteristics: []
    )
}
#endif
