//
//  AttributeProtocolTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/3/17.
//
//

import XCTest
import Foundation
@testable import Bluetooth

final class AttributeProtocolTests: XCTestCase {
    
    static let allTests = [
        ("testATTOpcode", testATTOpcode),
        ("testATTProtocolDataUnit", testATTProtocolDataUnit),
        ("testGATTClientData", testGATTClientData),
        ("testGATT", testGATT)
    ]
    
    func testATTOpcode() {
        
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.request == nil)
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.response == .maximumTransmissionUnitResponse)
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.type == .request)
        
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.response == nil)
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.request == .maximumTransmissionUnitRequest)
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.type == .response)
    }
    
    func testATTProtocolDataUnit() {
        
        do {
            
            let data: [UInt8] = [1, 16, 1, 0, 10]
            
            guard let errorResponse = ATTErrorResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.requestOpcode == .readByGroupTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 0x0001)
            XCTAssert(errorResponse.errorCode == .attributeNotFound)
            XCTAssert(errorResponse.byteValue == data)
        }
        
        do {
            
            let data: [UInt8] = [1, 8, 0, 0, 6]
            
            guard let errorResponse = ATTErrorResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.requestOpcode == .readByTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 0x0000)
            XCTAssert(errorResponse.errorCode == .requestNotSupported)
            XCTAssert(errorResponse.byteValue == data)
        }
        
        do {
            
            let data: [UInt8] = [1, 16, 49, 0, 10]
            
            guard let errorResponse = ATTErrorResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.requestOpcode == .readByGroupTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 49)
            XCTAssert(errorResponse.errorCode == .attributeNotFound)
            XCTAssert(errorResponse.byteValue == data)
        }
        
        do {
            
            let data: [UInt8] = [2, 23, 0]
            
            guard let pdu = ATTMaximumTransmissionUnitRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.clientMTU == 23)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            let data: [UInt8] = [3, 23, 0]
            
            guard let pdu = ATTMaximumTransmissionUnitResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.serverMTU == 23)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            // bad response / malformed data
            let data: [UInt8] = [16, 1, 0, 255, 255, 40, 0]
            
            guard let pdu = ATTReadByGroupTypeRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(pdu.type == .bit16(0x0028))
            XCTAssert(pdu.byteValue == data)
            
            // correct values
            //XCTAssert(pdu.type == GATT.UUID.PrimaryService.uuid, "\(pdu.type)")
            //XCTAssert(pdu.type == .bit16(0x2800))
        }
        
        do {
            
            // discover all primary services
            let pdu = ATTReadByGroupTypeRequest(startHandle: 0x0001,
                                                endHandle: 0xFFFF,
                                                type: GATT.UUID.primaryService.uuid)
            
            XCTAssert(pdu.type == GATT.UUID.primaryService.uuid, "\(pdu.type)")
            XCTAssert(pdu.type == .bit16(0x2800))
            XCTAssert(pdu.type != .bit16(0x0028))
            
            let data: [UInt8] = pdu.byteValue
            
            XCTAssert(data != [16, 1, 0, 255, 255, 40, 0], "Produced malformed data")
            XCTAssert(data == [16, 1, 0, 255, 255, 0, 40])
            
            guard let decoded = ATTReadByGroupTypeRequest(byteValue: pdu.byteValue)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(decoded.startHandle == pdu.startHandle)
            XCTAssert(decoded.endHandle == pdu.endHandle)
            XCTAssert(decoded.type == pdu.type)
            XCTAssert(decoded.type.data == pdu.type.data)
            XCTAssert(decoded.type.littleEndian == pdu.type.littleEndian)
            XCTAssert(decoded.type == GATT.UUID.primaryService.uuid, "\(decoded.type)")
            XCTAssert(decoded.type == .bit16(0x2800))
            XCTAssert(decoded.type != .bit16(0x0028))
            XCTAssert(decoded.byteValue == pdu.byteValue)
        }
        
        do {
            
            let data: [UInt8] = [17, 6, 1, 0, 5, 0, 0, 24, 6, 0, 9, 0, 1, 24, 16, 0, 20, 0, 10, 24]
            
            guard let pdu = ATTReadByGroupTypeResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.data.isEmpty == false)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            // service UUID
            let uuidString = "60F14FE2-F972-11E5-B84F-23E070D5A8C7"
            
            let data: [UInt8] = [17, 20, 40, 0, 48, 0, 199, 168, 213, 112, 224, 35, 79, 184, 229, 17, 114, 249, 226, 79, 241, 96]
            
            guard let pdu = ATTReadByGroupTypeResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.data.count == 1)
            XCTAssert(pdu.data.first?.attributeHandle == 40)
            XCTAssert(pdu.data.first?.endGroupHandle == 48)
            XCTAssert(pdu.data[0].value == [0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]) // proper little endian representation
            XCTAssert(pdu.data[0].value != [0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]) // invalid data
            XCTAssert(Data(pdu.data[0].value) == BluetoothUUID(rawValue: uuidString)!.littleEndian.data)
            XCTAssert(BluetoothUUID(littleEndian:
                BluetoothUUID(data: Data(pdu.data[0].value))!).rawValue == uuidString)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            // find C7A8D570-E023-4FB8-E511-72F9E24FF160
            let data: [UInt8] = [6, 1, 0, 255, 255, 0, 40, 96, 241, 79, 226, 249, 114, 17, 229, 184, 79, 35, 224, 112, 213, 168, 199]
            
            guard let pdu = ATTFindByTypeRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(pdu.attributeValue == BluetoothUUID(rawValue: "C7A8D570-E023-4FB8-E511-72F9E24FF160")!.littleEndianData)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            // find 60F14FE2-F972-11E5-B84F-23E070D5A8C7
            let data: [UInt8] = [6, 1, 0, 255, 255, 0, 40, 199, 168, 213, 112, 224, 35, 79, 184, 229, 17, 114, 249, 226, 79, 241, 96]
            
            guard let pdu = ATTFindByTypeRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(pdu.attributeValue == BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!.littleEndianData)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            let data: [UInt8] = [7, 40, 0, 48, 0]
            
            guard let pdu = ATTFindByTypeResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            guard let foundHandle = pdu.handlesInformationList.first,
                pdu.handlesInformationList.count == 1
                else { XCTFail("Invalid response"); return }
            
            XCTAssert(foundHandle.foundAttribute == 40)
            XCTAssert(foundHandle.groupEnd == 48)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            let data: [UInt8] = [9, 21, 41, 0, 2, 42, 0, 199, 168, 213, 112, 224, 35, 224, 128, 229, 17, 111, 249, 76, 38, 125, 231]
            
            guard let pdu = ATTReadByTypeResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.byteValue == data)
            
            guard let foundCharacteristicData = pdu.data.first,
                pdu.data.count == 1
                else { XCTFail("Invalid response"); return }
            
            XCTAssert(foundCharacteristicData.handle == 41)
            XCTAssert(foundCharacteristicData.value.isEmpty == false)
        }
    }
    
    func testGATTClientData() {
        
        do {
            
            let data: [UInt8] = [9, 21, 41, 0, 2, 42, 0, 199, 168, 213, 112, 224, 35, 224, 128, 229, 17, 111, 249, 76, 38, 125, 231]
            
            guard let pdu = ATTReadByTypeResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.byteValue == data)
            
            guard let foundCharacteristicData = pdu.data.first,
                pdu.data.count == 1
                else { XCTFail("Invalid response"); return }
            
            XCTAssert(foundCharacteristicData.handle == 41)
            XCTAssert(foundCharacteristicData.value.isEmpty == false)
            
            guard let characteristicDeclaration = GATTClient.CharacteristicDeclaration(littleEndian: foundCharacteristicData.value)
                else { XCTFail("Could not parse"); return }
            
            let characteristic = TestProfile.Read
            
            XCTAssert(characteristicDeclaration.valueHandle == 42)
            XCTAssert(characteristicDeclaration.uuid == characteristic.uuid)
            XCTAssert(characteristicDeclaration.properties.set == Set(characteristic.properties))
            XCTAssert(characteristicDeclaration.properties == characteristic.properties)
        }
    }
    
    func testGATT() {
        
        let database = generateDB()
        
        print("GATT Database:")
        
        for attribute in database.attributes {
            
            let type: Any = GATT.UUID.init(uuid: attribute.uuid as BluetoothUUID) ?? attribute.uuid
            
            let value: Any = BluetoothUUID(littleEndianData: [UInt8](attribute.value)) ?? String(UTF8Data: attribute.value) ?? attribute.value
            
            print("\(attribute.handle) - \(type)")
            print("Permissions: \(attribute.permissions)")
            print("Value: \(value)")
        }
        
        // server
        let serverSocket = TestL2CAPSocket()
        let server = GATTServer(socket: serverSocket)
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
                    
                case let .value(characteristics):
                    
                    // TODO: Investigate Discover Characteristics by UUID
                    //XCTAssert(value.count == 1, "\(uuid) \(value.map { $0.uuid })")
                    
                    for characteristic in characteristics {
                        
                        guard let testCharacteristic = testService.characteristics.first(where: { $0.uuid == characteristic.uuid })
                            else { XCTFail("Invalid characteristic \(characteristic.uuid)"); return }
                        
                        validateCharacteristic(characteristic, test: testCharacteristic)
                    }
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
                    
                    print("Discover Characteristics by UUID")
                    dump($0)
                    
                    switch $0 {
                    case let .error(error):
                        
                        XCTFail("\(error)")
                        
                    case let .value(value):
                        
                        XCTAssert(value == testCharacteristic.value)
                    }
                }
            }
        }
        
        // queue operations
        discoverAllPrimaryServices()
        
        // fake sockets
        do {
            
            var didWrite = false
            repeat {
                
                didWrite = false
                
                while try client.write() {
                    
                    didWrite = true
                }
                
                while serverSocket.receivedData.isEmpty == false {
                    
                    try server.read()
                }
                
                while try server.write() {
                    
                    didWrite = true
                }
                
                while clientSocket.receivedData.isEmpty == false {
                    
                    try client.read()
                }
                
            } while didWrite
        }
        
        catch { XCTFail("Error: \(error)") }
    }
}

private func generateDB() -> GATTDatabase {
    
    var database = GATTDatabase()
    
    for service in TestProfile.services {
        
        let _ = database.add(service: service)
    }
    
    return database
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
                                                TestProfile.WriteBlob
        ])
    
    public static let Read = Characteristic(uuid: BluetoothUUID(rawValue: "E77D264C-F96F-11E5-80E0-23E070D5A8C7")!,
                                            value: "Test Read-Only".toUTF8Data(),
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
    
    public static let WriteValue = "Test Write".toUTF8Data()
    
    public static let WriteBlob = Characteristic(uuid: BluetoothUUID(rawValue: "2FDDB448-F96F-11E5-A891-23E070D5A8C7")!,
                                                 value: Data(),
                                                 permissions: [.write],
                                                 properties: [.write])
    
    public static let WriteBlobValue = Data(bytes: [UInt8](repeating: 1, count: 512))
    
    public static let TestDefinedService = Service(uuid: BluetoothUUID.bit16(0xFEA9),
                                                   primary: true,
                                                   characteristics: [
                                                    TestProfile.Read,
                                                    TestProfile.ReadBlob,
                                                    TestProfile.Write,
                                                    TestProfile.WriteBlob
        ])
}
