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
        ("testErrorResponse", testErrorResponse),
        ("testMTU", testMTU),
        ("testReadByGroupType", testReadByGroupType),
        ("testFindByType", testFindByType),
        ("testReadByType", testReadByType)
    ]
    
    func testATTOpcode() {
        
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.request == nil)
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.response == .maximumTransmissionUnitResponse)
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.type == .request)
        
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.response == nil)
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.request == .maximumTransmissionUnitRequest)
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.type == .response)
    }
    
    func testErrorResponse() {
        
        do {
            
            let data: [UInt8] = [1, 16, 1, 0, 10]
            
            guard let errorResponse = ATTErrorResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.requestOpcode == .readByGroupTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 0x0001)
            XCTAssert(errorResponse.errorCode == .attributeNotFound)
            XCTAssert(errorResponse.byteValue == data)
            
            XCTAssertEqual(errorResponse.byteValue, data)
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
    }
    
    func testMTU() {
        
        do {
            
            XCTAssertEqual(ATTMaximumTransmissionUnit.default, .min)
            XCTAssertEqual(ATTMaximumTransmissionUnit.default.hashValue, Int(ATTMaximumTransmissionUnit.default.rawValue))
            XCTAssertNotEqual(ATTMaximumTransmissionUnit.min, .max)
            XCTAssertLessThan(ATTMaximumTransmissionUnit.min, .max)
            XCTAssertGreaterThan(ATTMaximumTransmissionUnit.max, .min)
            
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: 23))
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: 517))
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.min.rawValue))
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.max.rawValue))
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.default.rawValue))
            
            XCTAssertNil(ATTMaximumTransmissionUnit(rawValue: 20))
            XCTAssertNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.min.rawValue - 1))
            XCTAssertNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.max.rawValue + 1))
            
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 23, client: 512).rawValue, 23)
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 512, client: 23).rawValue, 23)
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 512, client: 256).rawValue, 256)
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 20, client: 23).rawValue, ATTMaximumTransmissionUnit.min.rawValue)
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: .max, client: .max).rawValue, ATTMaximumTransmissionUnit.max.rawValue)
        }
        
        do {
            
            let data: [UInt8] = [2, 23, 0]
            
            guard let pdu = ATTMaximumTransmissionUnitRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.clientMTU, 23)
            XCTAssertEqual(pdu.byteValue, data)
        }
        
        do {
            
            let data: [UInt8] = [3, 23, 0]
            
            guard let pdu = ATTMaximumTransmissionUnitResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.serverMTU, 23)
            XCTAssertEqual(pdu.byteValue, data)
        }
    }
    
    func testReadByGroupType() {
        
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
    }
    
    func testFindByType() {
        
        do {
            
            // find C7A8D570-E023-4FB8-E511-72F9E24FF160
            let data: [UInt8] = [6, 1, 0, 255, 255, 0, 40, 96, 241, 79, 226, 249, 114, 17, 229, 184, 79, 35, 224, 112, 213, 168, 199]
            
            guard let pdu = ATTFindByTypeRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(Data(pdu.attributeValue) == BluetoothUUID(rawValue: "C7A8D570-E023-4FB8-E511-72F9E24FF160")!.littleEndian.data)
            XCTAssert(pdu.byteValue == data)
        }
        
        do {
            
            // find 60F14FE2-F972-11E5-B84F-23E070D5A8C7
            let data: [UInt8] = [6, 1, 0, 255, 255, 0, 40, 199, 168, 213, 112, 224, 35, 79, 184, 229, 17, 114, 249, 226, 79, 241, 96]
            
            guard let pdu = ATTFindByTypeRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(Data(pdu.attributeValue) == BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!.littleEndian.data)
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
    }
    
    func testReadByType() {
        
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
}
