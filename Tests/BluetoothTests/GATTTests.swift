//
//  GATTTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GATTTests: XCTestCase {
    
    static let allTests = [
        ("testGATT", testGATT),
        ("testMTUExchange", testMTUExchange),
        ("testDiscoverPrimaryServices", testDiscoverPrimaryServices)
    ]
    
    func testMTUExchange() {
        
        guard let mtu = ATTMaximumTransmissionUnit(rawValue: 512)
            else { XCTFail(); return }
        
        let testPDUs: [(ATTProtocolDataUnit, [UInt8])] = [
            (ATTMaximumTransmissionUnitRequest(clientMTU: mtu.rawValue),
             [0x02, 0x00, 0x02]),
            (ATTMaximumTransmissionUnitResponse(serverMTU: mtu.rawValue),
             [0x03, 0x00, 0x02])
        ]
        
        // decode and validate bytes
        test(testPDUs)
        
        // server
        let serverSocket = TestL2CAPSocket()
        let server = GATTServer(socket: serverSocket, maximumTransmissionUnit: mtu, maximumPreparedWrites: .max)
        server.log = { print("GATT Server: " + $0) }
        server.connection.log = { print("Server ATT: " + $0) }
        
        // client
        let clientSocket = TestL2CAPSocket()
        let client = GATTClient(socket: clientSocket, maximumTransmissionUnit: mtu)
        client.log = { print("GATT Client: " + $0) }
        client.connection.log = { print("Client ATT: " + $0) }
        
        clientSocket.target = serverSocket
        serverSocket.target = clientSocket // weak references
        
        // run fake sockets
        do { try run(server: (server, serverSocket), client: (client, clientSocket)) }
        catch { XCTFail("Error: \(error)") }
        
        XCTAssertEqual(server.connection.maximumTransmissionUnit, client.connection.maximumTransmissionUnit)
        XCTAssertEqual(server.connection.maximumTransmissionUnit, mtu)
        XCTAssertNotEqual(server.connection.maximumTransmissionUnit, .default)
        XCTAssertEqual(client.connection.maximumTransmissionUnit, mtu)
        XCTAssertNotEqual(client.connection.maximumTransmissionUnit, .default)
        
        // validate GATT PDUs
        let mockData = split(pdu: testPDUs.map { $0.1 })
        
        XCTAssertEqual(serverSocket.cache, mockData.server)
        XCTAssertEqual(clientSocket.cache, mockData.client)
    }
    
    func testDiscoverPrimaryServices() {
        
        struct ProximityProfile {
            
            static let services: [GATT.Service] = [
                
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
            
            static let GenericAccessService = GATT.Service(uuid: .bit16(0x1800),
                                                           primary: true,
                                                           characteristics: [
                    
                ]
            )
            
            static let GenericAttributeService = GATT.Service(uuid: .bit16(0x1801),
                                                              primary: true,
                                                              characteristics: [
                                                                GATT.Characteristic(uuid: BluetoothUUID(),
                                                                                    value: Data(),
                                                                                    permissions: [.read],
                                                                                    properties: [.read],
                                                                                    descriptors: []),
                                                                GATT.Characteristic(uuid: BluetoothUUID(),
                                                                                    value: Data(),
                                                                                    permissions: [.read],
                                                                                    properties: [.read],
                                                                                    descriptors: []),
                                                                GATT.Characteristic(uuid: BluetoothUUID(),
                                                                                    value: Data(),
                                                                                    permissions: [.read],
                                                                                    properties: [.read],
                                                                                    descriptors: []),
                                                                GATT.Characteristic(uuid: BluetoothUUID(),
                                                                                    value: Data(),
                                                                                    permissions: [.read],
                                                                                    properties: [.read],
                                                                                    descriptors: []),
                                                                GATT.Characteristic(uuid: BluetoothUUID(),
                                                                                    value: Data(),
                                                                                    permissions: [.read],
                                                                                    properties: [.read],
                                                                                    descriptors: [])
                ]
            )
            
            static let BatteryService = GATT.Service(uuid: .bit16(0x180F),
                                                     primary: true,
                                                     characteristics: [
                ]
            )
            
            static let CurrentTimeService = GATT.Service(uuid: .bit16(0x1805),
                                                         primary: true,
                                                         characteristics: [
                ]
            )
            
            static let DeviceInformationService = GATT.Service(uuid: .bit16(0x180A),
                                                               primary: true,
                                                               characteristics: [
                ]
            )
            
            static let LinkLossService = GATT.Service(uuid: .bit16(0x1803),
                                                      primary: true,
                                                      characteristics: [
                ]
            )
            
            static let TXPowerService = GATT.Service(uuid: .bit16(0x1804),
                                                      primary: true,
                                                      characteristics: [
                ]
            )
            
            static let ImmediateAlertService = GATT.Service(uuid: .bit16(0x1802),
                                                            primary: true,
                                                            characteristics: [
                ]
            )
            
            static let Apple1Service = GATT.Service(uuid: BluetoothUUID(uuid: UUID(uuidString: "D0611E78-BBB4-4591-A5F8-487910AE4366")!),
                                                            primary: true,
                                                            characteristics: [
                ]
            )
            
            static let Apple2Service = GATT.Service(uuid: BluetoothUUID(uuid: UUID(uuidString: "9FA480E0-4967-4542-9390-D343DC5D04AE")!),
                                                    primary: true,
                                                    characteristics: [
                ]
            )
            
            static let AppleNotificationService = GATT.Service(uuid: BluetoothUUID(uuid: UUID(uuidString: "7905F431-B5CE-4E99-A40F-4B1E122D00D0")!),
                                                    primary: true,
                                                    characteristics: [
                ]
            )
            
            static let Apple4Service = GATT.Service(uuid: BluetoothUUID(uuid: UUID(uuidString: "89D3502B-0F36-433A-8EF4-C502AD55F8DC")!),
                                                    primary: true,
                                                    characteristics: [
                ]
            )
        }
        
        guard let mtu = ATTMaximumTransmissionUnit(rawValue: 104)
            else { XCTFail(); return }
        
        let testPDUs: [(ATTProtocolDataUnit, [UInt8])] = [
            
            /**
             Apr 08 15:32:49.824  ATT Send         0x0041  SEND  Exchange MTU Request - MTU:104
             Exchange MTU Request - MTU:104
             Opcode: 0x02
             Client Rx MTU: 0x0068
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0003 (03) [ 02 68 00 ]
             */
            (ATTMaximumTransmissionUnitRequest(clientMTU: mtu.rawValue),
             [0x02, 0x68, 0x00]),
            
            /**
             Apr 08 15:32:49.845  ATT Receive      0x0041  RECV  Exchange MTU Response - MTU:104
             Exchange MTU Response - MTU:104
             Opcode: 0x03
             Client Rx MTU: 0x0068
             
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0003 (03) [ 03 68 00 ]
             */
            (ATTMaximumTransmissionUnitResponse(serverMTU: mtu.rawValue),
             [0x03, 0x68, 0x00]),
            
            /**
             Read By Group Type Request - Start Handle:0x0001 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0001
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 01 00 FF FF 00 28 ]
             */
            (ATTReadByGroupTypeRequest(startHandle: 0x01, endHandle: .max, type: GATT.UUID.primaryService.uuid),
             [0x10, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x28]),
            
            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0006
             Attribute Handle: 0x0001 End Group Handle: 0x0005 UUID: 1800 (Generic Access)
             Attribute Handle: 0x0006 End Group Handle: 0x0009 UUID: 1801 (Generic Attribute)
             
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x000E (14) [ 11 06 01 00 05 00 00 18 06 00 09 00 01 18 ]
             */
            (ATTReadByGroupTypeResponse(data: [
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x0001,
                    endGroupHandle: 0x0005,
                    value: [UInt8](BluetoothUUID.bit16(0x1800).littleEndian.data)
                ),
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x0006,
                    endGroupHandle: 0x0009,
                    value: [UInt8](BluetoothUUID.bit16(0x1801).littleEndian.data)
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
            (ATTReadByGroupTypeRequest(startHandle: 0x000a, endHandle: .max, type: GATT.UUID.primaryService.uuid),
            [0x10, 0x0A, 0x00, 0xFF, 0xFF, 0x00, 0x28]),
            
            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0014
             Attribute Handle: 0x000A End Group Handle: 0x000E UUID: D0611E78-BBB4-4591-A5F8-487910AE4366
             Attribute Handle: 0x000F End Group Handle: 0x0013 UUID: 9FA480E0-4967-4542-9390-D343DC5D04AE
             
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x002A (42) [ 11 14 0A 00 0E 00 66 43 AE 10 79 48 F8 A5 91 45 ... ]
             */
            (ATTReadByGroupTypeResponse(data: [
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x000A,
                    endGroupHandle: 0x000E,
                    value: [UInt8](BluetoothUUID(uuid: UUID(uuidString: "D0611E78-BBB4-4591-A5F8-487910AE4366")!).littleEndian.data)
                ),
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x000F,
                    endGroupHandle: 0x0013,
                    value: [UInt8](BluetoothUUID(uuid: UUID(uuidString: "9FA480E0-4967-4542-9390-D343DC5D04AE")!).littleEndian.data)
                )
                ])!,
             
             [/* 0x41, 0x20, 0x1B, 0x00, 0x2A, 0x00, 0x04, 0x00, */ 0x11, 0x14, 0x0A, 0x00, 0x0E, 0x00, 0x66, 0x43, 0xAE, 0x10, 0x79, 0x48, 0xF8, 0xA5, 0x91, 0x45, 0xB4, 0xBB, 0x78, 0x1E, 0x61, 0xD0, 0x0F, 0x00, 0x13, 0x00, 0xAE, 0x04, 0x5D, 0xDC, 0x43, 0xD3, 0x90, 0x93, 0x42, 0x45, 0x67, 0x49, 0xE0, 0x80, 0xA4, 0x9F]
            ),
            
            /**
             Read By Group Type Request - Start Handle:0x0014 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0014
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 14 00 FF FF 00 28 ]
             */
            (ATTReadByGroupTypeRequest(startHandle: 0x0014, endHandle: .max, type: GATT.UUID.primaryService.uuid),
            [0x10, 0x14, 0x00, 0xFF, 0xFF, 0x00, 0x28]),
            
            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0006
             Attribute Handle: 0x0014 End Group Handle: 0x0017 UUID: 180F (Battery Service)
             Attribute Handle: 0x0018 End Group Handle: 0x001D UUID: 1805 (Current Time Service)
             Attribute Handle: 0x001E End Group Handle: 0x0022 UUID: 180A (Device Information)
             
            L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0014 (20) [ 11 06 14 00 17 00 0F 18 18 00 1D 00 05 18 1E 00 ... ]
             */
            (ATTReadByGroupTypeResponse(data: [
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x0014,
                    endGroupHandle: 0x0017,
                    value: [UInt8](BluetoothUUID.bit16(0x180F).littleEndian.data)
                ),
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x0018,
                    endGroupHandle: 0x001D,
                    value: [UInt8](BluetoothUUID.bit16(0x1805).littleEndian.data)
                ),
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x001E,
                    endGroupHandle: 0x0022,
                    value: [UInt8](BluetoothUUID.bit16(0x180A).littleEndian.data)
                )
                ])!,
             
             [/* 0x41, 0x20, 0x18, 0x00, 0x14, 0x00, 0x04, 0x00, */ 0x11, 0x06, 0x14, 0x00, 0x17, 0x00, 0x0F, 0x18, 0x18, 0x00, 0x1D, 0x00, 0x05, 0x18, 0x1E, 0x00, 0x22, 0x00, 0x0A, 0x18]
            ),
            
            /**
             Read By Group Type Request - Start Handle:0x0023 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0023
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 23 00 FF FF 00 28 ]
             */
            (ATTReadByGroupTypeRequest(startHandle: 0x0023, endHandle: .max, type: GATT.UUID.primaryService.uuid),
             [0x10, 0x23, 0x00, 0xFF, 0xFF, 0x00, 0x28]),
            
            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0014
             Attribute Handle: 0x0023 End Group Handle: 0x002C UUID: 7905F431-B5CE-4E99-A40F-4B1E122D00D0 (Apple Notification Center Service)
             Attribute Handle: 0x002D End Group Handle: 0x0038 UUID: 89D3502B-0F36-433A-8EF4-C502AD55F8DC
             
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x002A (42) [ 11 14 23 00 2C 00 D0 00 2D 12 1E 4B 0F A4 99 4E ... ]
             */
            (ATTReadByGroupTypeResponse(data: [
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x0023,
                    endGroupHandle: 0x002C,
                    value: [UInt8](BluetoothUUID(uuid: UUID(uuidString: "7905F431-B5CE-4E99-A40F-4B1E122D00D0")!).littleEndian.data)
                ),
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x002D,
                    endGroupHandle: 0x0038,
                    value: [UInt8](BluetoothUUID(uuid: UUID(uuidString: "89D3502B-0F36-433A-8EF4-C502AD55F8DC")!).littleEndian.data)
                )
                ])!,
             
             [/* 0x41, 0x20, 0x1B, 0x00, 0x2A, 0x00, 0x04, 0x00, */ 0x11, 0x14, 0x23, 0x00, 0x2C, 0x00, 0xD0, 0x00, 0x2D, 0x12, 0x1E, 0x4B, 0x0F, 0xA4, 0x99, 0x4E, 0xCE, 0xB5, 0x31, 0xF4, 0x05, 0x79, 0x2D, 0x00, 0x38, 0x00, 0xDC, 0xF8, 0x55, 0xAD, 0x02, 0xC5, 0xF4, 0x8E, 0x3A, 0x43, 0x36, 0x0F, 0x2B, 0x50, 0xD3, 0x89]
            ),
            
            /**
             Read By Group Type Request - Start Handle:0x0039 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0039
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 39 00 FF FF 00 28 ]
             */
            (ATTReadByGroupTypeRequest(startHandle: 0x0039, endHandle: .max, type: GATT.UUID.primaryService.uuid),
             [0x10, 0x39, 0x00, 0xFF, 0xFF, 0x00, 0x28]),
            
            /**
             Read By Group Type Response
             Opcode: 0x11
             List Length: 0006
             Attribute Handle: 0x0039 End Group Handle: 0x003C UUID: 1803 (Link Loss)
             Attribute Handle: 0x003D End Group Handle: 0x003F UUID: 1804 (Tx Power)
             Attribute Handle: 0x0040 End Group Handle: 0x0042 UUID: 1802 (Immediate Alert)
             
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0014 (20) [ 11 06 39 00 3C 00 03 18 3D 00 3F 00 04 18 40 00 ... ]
             */
            (ATTReadByGroupTypeResponse(data: [
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x0039,
                    endGroupHandle: 0x003C,
                    value: [UInt8](BluetoothUUID.bit16(0x1803).littleEndian.data)
                ),
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x003D,
                    endGroupHandle: 0x003F,
                    value: [UInt8](BluetoothUUID.bit16(0x1804).littleEndian.data)
                ),
                ATTReadByGroupTypeResponse.AttributeData(
                    attributeHandle: 0x0040,
                    endGroupHandle: 0x0042,
                    value: [UInt8](BluetoothUUID.bit16(0x1802).littleEndian.data)
                )
                ])!,
             
             [/* 0x41, 0x20, 0x18, 0x00, 0x14, 0x00, 0x04, 0x00, */ 0x11, 0x06, 0x39, 0x00, 0x3C, 0x00, 0x03, 0x18, 0x3D, 0x00, 0x3F, 0x00, 0x04, 0x18, 0x40, 0x00, 0x42, 0x00, 0x02, 0x18]
            ),
            
            /**
             Read By Group Type Request - Start Handle:0x0043 - End Handle:0xffff - UUID:2800 (GATT Primary Service Declaration)
             Opcode: 0x10
             Starting Handle: 0x0043
             Ending Handle: 0xffff
             Attribute Group Type: 2800 (GATT Primary Service Declaration)
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0007 (07) [ 10 43 00 FF FF 00 28 ]
             */
            (ATTReadByGroupTypeRequest(startHandle: 0x0043, endHandle: .max, type: GATT.UUID.primaryService.uuid),
             [0x10, 0x43, 0x00, 0xFF, 0xFF, 0x00, 0x28]),
            
            /**
             Error Response - Attribute Handle: 0x0043 - Error Code: 0x0A - Attribute Not Found
             Opcode: 0x01
             Request Opcode In Error: 0x10 (Read By Group Type Request)
             Attribute Handle In Error: 0x0043 (67)
             Error Code: 0x0a (Attribute Not Found)
             
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0005 (05) [ 01 10 43 00 0A ]
             */
            (ATTErrorResponse(requestOpcode: ATTOpcode.readByGroupTypeRequest,
                              attributeHandle: 0x0043,
                              error: .attributeNotFound),
            [0x01, 0x10, 0x43, 0x00, 0x0A])
        ]
        
        test(testPDUs)
        
        // server
        let serverSocket = TestL2CAPSocket()
        let server = GATTServer(socket: serverSocket, maximumTransmissionUnit: mtu,  maximumPreparedWrites: .max)
        server.log = { print("GATT Server: " + $0) }
        server.connection.log = { print("Server ATT: " + $0) }
        server.database = generateDB(ProximityProfile.services)
        dumpGATT(database: server.database)
        
        // client
        let clientSocket = TestL2CAPSocket()
        let client = GATTClient(socket: clientSocket, maximumTransmissionUnit: mtu)
        client.log = { print("GATT Client: " + $0) }
        client.connection.log = { print("Client ATT: " + $0) }
        
        clientSocket.target = serverSocket
        serverSocket.target = clientSocket // weak references
        
        // run fake sockets
        do { try run(server: (server, serverSocket), client: (client, clientSocket)) }
        catch { XCTFail("Error: \(error)") }
        
        client.discoverAllPrimaryServices {
            
            switch $0 {
                
            case let .error(error):
                XCTFail("\(error)")
                
            case let .value(services):
                
                XCTAssertEqual(services.map { $0.uuid }, ProximityProfile.services.map { $0.uuid })
            }
        }
        
        // run fake sockets
        do { try run(server: (server, serverSocket), client: (client, clientSocket)) }
        catch { XCTFail("Error: \(error)") }
        
        // MTU
        XCTAssertEqual(server.connection.maximumTransmissionUnit, client.connection.maximumTransmissionUnit)
        XCTAssertEqual(server.connection.maximumTransmissionUnit, mtu)
        XCTAssertEqual(client.connection.maximumTransmissionUnit, mtu)
        
        // validate GATT PDUs
        let mockData = split(pdu: testPDUs.map { $0.1 })
        
        //XCTAssertEqual(serverSocket.cache, mockData.server)
        print("GATT Server PDUs")
        serverSocket.cache.forEach { print($0.map { "0x" + $0.toHexadecimal() }) }
        print("GATT Server Expected")
        mockData.server.forEach { print($0.map { "0x" + $0.toHexadecimal() }) }
        
        //XCTAssertEqual(clientSocket.cache, mockData.client)
        print("GATT Client PDUs")
        clientSocket.cache.forEach { print($0.map { "0x" + $0.toHexadecimal() }) }
        print("GATT Client Expected")
        mockData.client.forEach { print($0.map { "0x" + $0.toHexadecimal() }) }
    }
    
    func testGATT() {
        
        let database = generateDB(TestProfile.services)
        
        dumpGATT(database: database)
        
        // server
        let serverSocket = TestL2CAPSocket()
        let server = GATTServer(socket: serverSocket, maximumPreparedWrites: .max)
        server.log = { print("GATT Server: " + $0) }
        server.connection.log = { print("Server ATT: " + $0) }
        server.database = database
        
        // client
        let clientSocket = TestL2CAPSocket()
        let client = GATTClient(socket: clientSocket)
        client.log = { print("GATT Client: " + $0) }
        client.connection.log = { print("Client ATT: " + $0) }
        
        clientSocket.target = serverSocket
        serverSocket.target = clientSocket // weak references
        
        var writtenValues = [UInt16: Data]()
        
        func clientWillWriteServer(uuid: BluetoothUUID, handle: UInt16, value: Data, newValue: Data) -> ATT.Error? {
            
            print("\(#function) \(uuid) (\(handle))")
            
            writtenValues[handle] = newValue
            
            print(value.map { $0.toHexadecimal() })
            
            return nil
        }
        
        server.willWrite = clientWillWriteServer
        
        var writtenValuesConfirmed = [UInt16: Data]()
        
        defer { XCTAssertEqual(writtenValues, writtenValuesConfirmed) }
        
        func clientDidWriteServer(uuid: BluetoothUUID, handle: UInt16, value: Data) {
            
            print("\(#function) \(uuid) (\(handle))")
            
            XCTAssertEqual(writtenValues[handle], value, "Value not written")
            
            writtenValuesConfirmed[handle] = value
        }
        
        server.didWrite = clientDidWriteServer
        
        func discoverAllPrimaryServices() {
            
            client.discoverAllPrimaryServices {
                
                print("Discover All Primary Services")
                dump($0)
                
                switch $0 {
                case let .error(error):
                    
                    XCTFail("\(error)")
                    
                case let .value(services):
                    
                    XCTAssert(services.map({ $0.uuid }) == TestProfile.services.map { $0.uuid })
                    
                    for service in services {
                        
                        guard let testService = TestProfile.services.first(where: { $0.uuid == service.uuid })
                            else { XCTFail("Invalid service \(service.uuid)"); return }
                        
                        discoverAllCharacteristics(of: service, test: testService)
                        
                        testService.characteristics.forEach {
                            discoverCharacteristics(of: service, by: $0.uuid, test: testService)
                        }
                    }
                }
            }
        }
        
        func discoverAllCharacteristics(of service: GATTClient.Service, test testService: TestProfile.Service) {
            
            client.discoverAllCharacteristics(of: service) {
                
                print("Discover All Characteristics of a Service")
                dump($0)
                
                switch $0 {
                case let .error(error):
                    
                    XCTFail("\(error)")
                    
                case let .value(characteristics):
                    
                    XCTAssert(characteristics.map({ $0.uuid }) == testService.characteristics.map { $0.uuid })
                    
                    for characteristic in characteristics {
                        
                        guard let testCharacteristic = testService.characteristics.first(where: { $0.uuid == characteristic.uuid })
                            else { XCTFail("Invalid characteristic \(characteristic.uuid)"); return }
                        
                        validateCharacteristic(characteristic, test: testCharacteristic)
                    }
                }
            }
        }
        
        func discoverCharacteristics(of service: GATTClient.Service,
                                     by uuid: BluetoothUUID,
                                     test testService: TestProfile.Service) {
            
            client.discoverCharacteristics(of: service, by: uuid) {
                
                print("Discover Characteristics by UUID")
                dump($0)
                
                switch $0 {
                case let .error(error):
                    
                    XCTFail("\(error)")
                    
                case .value: break
                    
                    /*
                     case let .value(characteristics):
                     
                     // TODO: Investigate Discover Characteristics by UUID
                     //XCTAssert(value.count == 1, "\(uuid) \(value.map { $0.uuid })")
                     
                     for characteristic in characteristics {
                     
                     guard let testCharacteristic = testService.characteristics.first(where: { $0.uuid == characteristic.uuid })
                     else { XCTFail("Invalid characteristic \(characteristic.uuid)"); return }
                     
                     validateCharacteristic(characteristic, test: testCharacteristic)
                     }*/
                }
            }
        }
        
        func validateCharacteristic(_ characteristic: GATTClient.Characteristic,
                                    test testCharacteristic: TestProfile.Characteristic) {
            
            XCTAssert(characteristic.uuid == testCharacteristic.uuid)
            XCTAssert(characteristic.properties == testCharacteristic.properties)
            
            if testCharacteristic.properties.contains(.read), testCharacteristic.permissions.contains(.read) {
                
                guard characteristic.properties.contains(.read)
                    else { XCTFail("Cannot read charactertistic \(characteristic.uuid)"); return }
                
                client.readCharacteristic(characteristic) {
                    
                    print("Read Characteristic")
                    dump($0)
                    
                    switch $0 {
                    case let .error(error):
                        
                        XCTFail("\(error)")
                        
                    case let .value(value):
                        
                        XCTAssert(value == testCharacteristic.value)
                    }
                }
            }
            
            if testCharacteristic.properties.contains(.write), testCharacteristic.permissions.contains(.write) {
                
                guard characteristic.properties.contains(.write)
                    else { XCTFail("Cannot write to charactertistic \(characteristic.uuid)"); return }
                
                guard let (data, reliableWrites) = TestProfile.WriteValues[testCharacteristic.uuid]
                    else { fatalError("missing test data") }
                
                client.writeCharacteristic(characteristic, data: data, reliableWrites: reliableWrites) {
                    
                    print("Write Characteristic")
                    dump($0)
                    
                    switch $0 {
                    case let .error(error):
                        
                        XCTFail("\(error)")
                        
                    case .value:
                        
                        guard let writtenValue = writtenValues[characteristic.handle.value]
                            else { XCTFail("Did not write \(characteristic.uuid)"); return }
                        
                        XCTAssert(writtenValue == data, "\(characteristic.uuid) \(writtenValue) == \(data)")
                    }
                }
            }
        }
        
        // queue operations
        discoverAllPrimaryServices()
        
        // run fake sockets
        do { try run(server: (server, serverSocket), client: (client, clientSocket)) }
        catch { XCTFail("Error: \(error)") }
    }
    
}

extension GATTTests {
    
    func generateDB(_ services: [GATT.Service]) -> GATTDatabase {
        
        var database = GATTDatabase()
        
        services.forEach { database.add(service: $0) }
        
        return database
    }
    
    func dumpGATT(database: GATTDatabase) {
        
        print("GATT Database:")
        
        for attribute in database.attributes {
            
            let type: Any = GATT.UUID.init(uuid: attribute.uuid as BluetoothUUID) ?? attribute.uuid
            
            let value: Any = BluetoothUUID(data: attribute.value)?.littleEndian ?? String(data: attribute.value, encoding: .utf8) ?? attribute.value
            
            print("\(attribute.handle) - \(type)")
            print("Permissions: \(attribute.permissions)")
            print("Value: \(value)")
        }
    }
    
    func test(_ testPDUs: [(ATTProtocolDataUnit, [UInt8])]) {
        
        // decode and compare
        for (testPDU, testData) in testPDUs {
            
            guard let decodedPDU = type(of: testPDU).init(byteValue: testData)
                else { XCTFail("Could not decode \(type(of: testPDU))"); return }
            
            dump(decodedPDU)
            
            XCTAssertEqual(decodedPDU.byteValue, testData)
            
            var decodedDump = ""
            dump(decodedPDU, to: &decodedDump)
            var testDump = ""
            dump(testPDU, to: &testDump)
            
            XCTAssertEqual(decodedDump, testDump)
        }
    }
    
    func run(server: (gatt: GATTServer, socket: TestL2CAPSocket), client: (gatt: GATTClient, socket: TestL2CAPSocket)) throws {
        
        var didWrite = false
        repeat {
            
            didWrite = false
            
            while try client.gatt.write() {
                
                didWrite = true
            }
            
            while server.socket.receivedData.isEmpty == false {
                
                try server.gatt.read()
            }
            
            while try server.gatt.write() {
                
                didWrite = true
            }
            
            while client.socket.receivedData.isEmpty == false {
                
                try client.gatt.read()
            }
            
        } while didWrite
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

public struct TestProfile {
    
    public typealias Service = GATT.Service
    public typealias Characteristic = GATT.Characteristic
    
    public static let services: [Service] = [
        TestService,
        TestDefinedService
    ]
    
    public static let TestService = Service(uuid: BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!,
                                            primary: true,
                                            characteristics: [
                                                TestProfile.Read,
                                                TestProfile.ReadBlob,
                                                TestProfile.Write,
                                                TestProfile.WriteBlob,
                                                TestProfile.WriteWithoutResponse,
                                                TestProfile.WriteBlobWithoutResponse
        ])
    
    public static let Read = Characteristic(uuid: BluetoothUUID(rawValue: "E77D264C-F96F-11E5-80E0-23E070D5A8C7")!,
                                            value: "Test Read-Only".data(using: .utf8)!,
                                            permissions: [.read],
                                            properties: [.read])
    
    public static let ReadBlob = Characteristic(uuid: BluetoothUUID(rawValue: "0615FF6C-0E37-11E6-9E58-75D7DC50F6B1")!,
                                                value: Data(bytes: [UInt8](repeating: UInt8.max, count: 512)),
                                                permissions: [.read],
                                                properties: [.read])
    
    public static let Write = Characteristic(uuid: BluetoothUUID(rawValue: "37BBD7D0-F96F-11E5-8EC1-23E070D5A8C7")!,
                                             value: Data(),
                                             permissions: [.write],
                                             properties: [.write])
    
    public static let WriteValue = "Test Write".data(using: .utf8)!
    
    public static let WriteWithoutResponse = Characteristic(uuid: BluetoothUUID(rawValue: "AFE458FE-55BE-4D99-8C22-82FACE077D86")!,
                                                            value: Data(),
                                                            permissions: [.write],
                                                            properties: [.write, .writeWithoutResponse])
    
    public static let WriteBlob = Characteristic(uuid: BluetoothUUID(rawValue: "2FDDB448-F96F-11E5-A891-23E070D5A8C7")!,
                                                 value: Data(),
                                                 permissions: [.write],
                                                 properties: [.write])
    
    public static let WriteBlobValue = Data(bytes: [UInt8](repeating: 0xAA, count: 512))
    
    public static let WriteBlobWithoutResponse = Characteristic(uuid: BluetoothUUID(rawValue: "D4A6E516-C867-4582-BF66-0A02BD854613")!,
                                                                value: Data(),
                                                                permissions: [.write],
                                                                properties: [.write, .writeWithoutResponse])
    
    public static let TestDefinedService = Service(uuid: BluetoothUUID.bit16(0xFEA9),
                                                   primary: true,
                                                   characteristics: [
                                                    TestProfile.Read,
                                                    TestProfile.ReadBlob,
                                                    TestProfile.Write,
                                                    TestProfile.WriteBlob,
                                                    TestProfile.WriteWithoutResponse,
                                                    TestProfile.WriteBlobWithoutResponse
        ])
    
    public static let WriteValues: [BluetoothUUID: (data: Data, reliableWrites: Bool)] = [
        Write.uuid: (WriteValue, true),
        WriteBlob.uuid: (WriteBlobValue, true),
        WriteWithoutResponse.uuid: (WriteValue, false),
        WriteBlobWithoutResponse.uuid: (WriteBlobValue, false)
    ]
}
