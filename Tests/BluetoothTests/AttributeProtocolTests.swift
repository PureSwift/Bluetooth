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
        ("testATTError", testATTError),
        ("testErrorResponse", testErrorResponse),
        ("testMTU", testMTU),
        ("testReadByGroupType", testReadByGroupType),
        ("testFindByType", testFindByType),
        ("testReadByType", testReadByType),
        ("testHandleValueIndication", testHandleValueIndication),
        ("testHandleValueConfirmation", testHandleValueConfirmation),
        ("testHandleValueNotification", testHandleValueNotification),
        ("testRead", testRead),
        ("testWrite", testWrite),
        ("testFindInformation", testFindInformation)
    ]
    
    func testATTOpcode() {
        
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.request == nil)
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.response == .maximumTransmissionUnitResponse)
        XCTAssert(ATTOpcode.maximumTransmissionUnitRequest.type == .request)
        
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.response == nil)
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.request == .maximumTransmissionUnitRequest)
        XCTAssert(ATTOpcode.maximumTransmissionUnitResponse.type == .response)
    }
    
    func testATTError() {
        
        XCTAssertEqual(ATTError.invalidHandle.name, "Invalid Handle")
        XCTAssertEqual(ATTError.invalidHandle.errorDescription, "The attribute handle given was not valid on this server.")
        XCTAssertEqual(ATTError.invalidHandle.description, ATTError.invalidHandle.name)
        
        let errors = (1 ... .max).flatMap { ATTError(rawValue: $0) }
        XCTAssert(errors.count == 0x11)
        
        for error in errors {
            
            XCTAssert(error.name.isEmpty == false)
            XCTAssert(error.errorDescription.isEmpty == false)
            XCTAssert(error.description.isEmpty == false)
            XCTAssertEqual(error.description, error.name)
            
            let nsError = error as NSError
            XCTAssertEqual(nsError.code, Int(error.rawValue))
            XCTAssertEqual(nsError.domain, "org.pureswift.Bluetooth.ATTError")
            XCTAssertEqual(nsError.userInfo[NSLocalizedDescriptionKey] as? String, error.description)
            XCTAssertEqual(nsError.userInfo[NSLocalizedDescriptionKey] as? String, error.name)
            XCTAssertEqual(nsError.userInfo[NSLocalizedFailureReasonErrorKey] as? String, error.errorDescription)
            
            print(nsError)
        }
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
            
            XCTAssertEqual(errorResponse.requestOpcode, .readByGroupTypeRequest)
            XCTAssertEqual(errorResponse.attributeHandle, 49)
            XCTAssertEqual(errorResponse.errorCode, .attributeNotFound)
            XCTAssertEqual(errorResponse.byteValue, data)
        }
    }
    
    func testMTU() {
        
        do {
            
            XCTAssertEqual(ATTMaximumTransmissionUnit.default, .min, "Default MTU is the minimum MTU")
            XCTAssertEqual(ATTMaximumTransmissionUnit.default.hashValue, Int(ATTMaximumTransmissionUnit.default.rawValue), "MTU hash is raw value")
            XCTAssertNotEqual(ATTMaximumTransmissionUnit.min, .max, "ATT MTU minimum value is less than maximum value")
            XCTAssertLessThan(ATTMaximumTransmissionUnit.min, .max, "ATT MTU maximum value is greater than minimum value")
            XCTAssertGreaterThan(ATTMaximumTransmissionUnit.max, .min, "ATT MTU maximum value is not equal to minimum value")
            
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: 23), "Valid MTU value")
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: 517), "Valid MTU value")
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.min.rawValue), "Valid MTU value")
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.max.rawValue), "Valid MTU value")
            XCTAssertNotNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.default.rawValue), "Valid MTU value")
            
            XCTAssertNil(ATTMaximumTransmissionUnit(rawValue: 20), "Invalid MTU value")
            
            #if os(Linux) && swift(>=3.0) && !swift(>=3.2)
            #else
            XCTAssertNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.min.rawValue - 1), "Invalid MTU value")
            XCTAssertNil(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.max.rawValue + 1), "Invalid MTU value")
            #endif
            
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 23, client: 512).rawValue, 23, "The server and client shall set ATT_MTU to the minimum of the Client Rx MTU and the Server Rx MTU.")
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 512, client: 23).rawValue, 23, "The server and client shall set ATT_MTU to the minimum of the Client Rx MTU and the Server Rx MTU.")
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 512, client: 256).rawValue, 256, "The server and client shall set ATT_MTU to the minimum of the Client Rx MTU and the Server Rx MTU.")
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: 20, client: 23), .default, "If either Client Rx MTU or Service Rx MTU are incorrectly less than the default ATT_MTU, then the ATT_MTU shall not be changed and the ATT_MTU shall be the default ATT_MTU.")
            XCTAssertEqual(ATTMaximumTransmissionUnit(server: .max, client: .max), .max, "Cannot be larger than max ATT_MTU")
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
    
    func testHandleValueIndication() {
        
        do {
            
            /**
             Handle Value Indication
             Opcode: 0x1d
             Attribute Handle: 0x0008 (8)
             Value: 0a 00 ff ff
             
             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0007 (07) [ 1D 08 00 0A 00 FF FF ]
             */
            
            let data: [UInt8] = [0x1D, 0x08, 0x00, 0x0A, 0x00, 0xFF, 0xFF]
            
            guard let pdu = ATTHandleValueIndication(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x1d)
            XCTAssertEqual(pdu.byteValue, data)
            XCTAssertEqual(pdu.handle, 0x0008)
            XCTAssertEqual(pdu.value, [0x0a, 0x00, 0xff, 0xff])
        }
    }
    
    func testHandleValueConfirmation() {
        
        do {
            
            /**
             Handle Value Confirmation
             Opcode: 0x1e
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0001 (01) [ 1E ]
             */
            
            let data: [UInt8] = [0x1E]
            
            guard let pdu = ATTHandleValueConfirmation(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x1e)
            XCTAssertEqual(pdu.byteValue, data)
        }
    }
    
    func testHandleValueNotification() {
        
        do {
            
            /**
             RECV  Handle Value Notification - Handle:0x0016 - Value:64
             Handle Value Notification - Handle:0x0016 - Value:64
             Opcode: 0x1b
             Attribute Handle: 0x0016 (22)
             
             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0004 (04) [ 1B 16 00 64 ]
             */
            
            let data: [UInt8] = [0x1B, 0x16, 0x00, 0x64]
            
            guard let pdu = ATTHandleValueNotification(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.byteValue, data)
            XCTAssertEqual(pdu.handle, 0x0016)
            XCTAssertEqual(pdu.value, [0x64])
        }
    }
    
    func testRead() {
        
        do {
            
            /**
             ATT Send - Read Request - Handle:0x0016
             Read Request - Handle:0x0016
             Opcode: 0x0a
             Attribute Handle: 0x0016 (22)
             
             L2CAP Send       0x0042  SEND  Channel ID: 0x0004  Length: 0x0003 (03) [ 0A 16 00 ]
             */
            let data: [UInt8] = [0x0A, 0x16, 0x00]
            
            guard let pdu = ATTReadRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x0a)
            XCTAssertEqual(pdu.byteValue, data)
            XCTAssertEqual(pdu.handle, 0x0016)
        }
        
        do {
            
            /**
             ATT Receive - Read Response - Value:64
             Read Response - Value:64
             Opcode: 0x0b
             Value: 64
             
             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0002 (02) [ 0B 64 ]
             */
            
            let data: [UInt8] = [0x0B, 0x64]
            
            guard let pdu = ATTReadResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x0b)
            XCTAssertEqual(pdu.byteValue, data)
            XCTAssertEqual(pdu.attributeValue, [0x64])
        }
    }
    
    func testWrite() {
        
        do {
            
            /**
             Write Request - Handle:0x0017 - Value:0100
             Opcode: 0x12
             Attribute Handle: 0x0017 (23)
             Value: 01 00
             
             L2CAP Send       0x0042  SEND  Channel ID: 0x0004  Length: 0x0005 (05) [ 12 17 00 01 00 ]
             */
            
            let data: [UInt8] = [0x12, 0x17, 0x00, 0x01, 0x00]
            
            guard let pdu = ATTWriteRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x12)
            XCTAssertEqual(pdu.byteValue, data)
            XCTAssertEqual(pdu.handle, 0x0017)
            XCTAssertEqual(pdu.value, [0x01, 0x00])
        }
        
        do {
            
            /**
             Write Response
             Opcode: 0x13
             
             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0001 (01) [ 13 ]
             */
            
            let data: [UInt8] = [0x13]
            
            guard let pdu = ATTWriteResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x13)
            XCTAssertEqual(pdu.byteValue, data)
        }
    }
    
    func testFindInformation() {
        
        do {
            
            /**
             Find Information Request - Start Handle:0x0017 - End Handle:0x0017
             Opcode: 0x04
             Start Handle: 0x0017
             End Handle: 0x0017
             L2CAP Send Channel ID: 0x0004  Length: 0x0005 (05) [ 04 17 00 17 00 ]
             */
            
            let data: [UInt8] = [0x04, 0x17, 0x00, 0x17, 0x00]
            
            guard let pdu = ATTFindInformationRequest(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.byteValue, data)
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x04)
            XCTAssertEqual(pdu.startHandle, 0x0017)
            XCTAssertEqual(pdu.endHandle, 0x0017)
        }
        
        do {
            
            /**
             Find Information Response
             Opcode: 0x05
             Format: 1 (Handles and 16 byte UUIDs)
             Handle: 0x0017 UUID: 2902 (Client Characteristic Configuration)
             
             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0006 (06) [ 05 01 17 00 02 29 ]
             */
            
            let data: [UInt8] = [0x05, 0x01, 0x17, 0x00, 0x02, 0x29]
            
            guard let pdu = ATTFindInformationResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            let foundData = ATTFindInformationResponse.Data.bit16([(0x0017, 0x2902)])
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x05)
            XCTAssertEqual(pdu.byteValue, data)
            XCTAssertEqual(pdu.data.byteValue, foundData.byteValue)
            XCTAssertEqual("\(pdu.data)", "\(foundData)")
        }
    }
}
