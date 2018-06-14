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
        ("testFindInformation", testFindInformation),
        ("testConfigureClientDescriptor", testConfigureClientDescriptor),
        ("testDiscovery", testDiscovery)
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
            
            #if os(macOS)
            let nsError = error as NSError
            XCTAssertEqual(nsError.code, Int(error.rawValue))
            XCTAssertEqual(nsError.domain, "org.pureswift.Bluetooth.ATTError")
            XCTAssertEqual(nsError.userInfo[NSLocalizedDescriptionKey] as? String, error.description)
            XCTAssertEqual(nsError.userInfo[NSLocalizedDescriptionKey] as? String, error.name)
            XCTAssertEqual(nsError.userInfo[NSLocalizedFailureReasonErrorKey] as? String, error.errorDescription)
            
            print(nsError)
            #endif
        }
    }
    
    func testErrorResponse() {
        
        do {
            
            let data = Data([1, 16, 1, 0, 10])
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.request == .readByGroupTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 0x0001)
            XCTAssert(errorResponse.error == .attributeNotFound)
            XCTAssert(errorResponse.data == data)
            
            XCTAssertEqual(errorResponse.data, data)
        }
        
        do {
            
            let data = Data([1, 8, 0, 0, 6])
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.request == .readByTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 0x0000)
            XCTAssert(errorResponse.error == .requestNotSupported)
            XCTAssert(errorResponse.data == data)
        }
        
        do {
            
            let data = Data([1, 16, 49, 0, 10])
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(errorResponse.request, .readByGroupTypeRequest)
            XCTAssertEqual(errorResponse.attributeHandle, 49)
            XCTAssertEqual(errorResponse.error, .attributeNotFound)
            XCTAssertEqual(errorResponse.data, data)
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
            
            #if swift(>=3.1)
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
            
            let data = Data([2, 23, 0])
            
            guard let pdu = ATTMaximumTransmissionUnitRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.clientMTU, 23)
            XCTAssertEqual(pdu.data, data)
        }
        
        do {
            
            let data = Data([3, 23, 0])
            
            guard let pdu = ATTMaximumTransmissionUnitResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.serverMTU, 23)
            XCTAssertEqual(pdu.data, data)
        }
    }
    
    func testReadByGroupType() {
        
        do {
            
            // bad response / malformed data
            let data = Data([16, 1, 0, 255, 255, 40, 0])
            
            guard let pdu = ATTReadByGroupTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(pdu.type == .bit16(0x0028))
            XCTAssert(pdu.data == data)
            
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
            
            let data: Data = pdu.data
            
            XCTAssert(data != Data([16, 1, 0, 255, 255, 40, 0]), "Produced malformed data")
            XCTAssert(data == Data([16, 1, 0, 255, 255, 0, 40]))
            
            guard let decoded = ATTReadByGroupTypeRequest(data: pdu.data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(decoded.startHandle == pdu.startHandle)
            XCTAssert(decoded.endHandle == pdu.endHandle)
            XCTAssert(decoded.type == pdu.type)
            XCTAssert(decoded.type.data == pdu.type.data)
            XCTAssert(decoded.type.littleEndian == pdu.type.littleEndian)
            XCTAssert(decoded.type == GATT.UUID.primaryService.uuid, "\(decoded.type)")
            XCTAssert(decoded.type == .bit16(0x2800))
            XCTAssert(decoded.type != .bit16(0x0028))
            XCTAssert(decoded.data == pdu.data)
        }
        
        do {
            
            let data = Data([17, 6, 1, 0, 5, 0, 0, 24, 6, 0, 9, 0, 1, 24, 16, 0, 20, 0, 10, 24])
            
            guard let pdu = ATTReadByGroupTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.attributeData.isEmpty == false)
            XCTAssert(pdu.data == data)
        }
        
        do {
            
            // service UUID
            let uuidString = "60F14FE2-F972-11E5-B84F-23E070D5A8C7"
            
            let data = Data([17, 20, 40, 0, 48, 0, 199, 168, 213, 112, 224, 35, 79, 184, 229, 17, 114, 249, 226, 79, 241, 96])
            
            guard let pdu = ATTReadByGroupTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.attributeData.count, 1)
            XCTAssertEqual(pdu.attributeData.first?.attributeHandle, 40)
            XCTAssertEqual(pdu.attributeData.first?.endGroupHandle, 48)
            XCTAssertEqual(pdu.attributeData[0].value, Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60])) // proper little endian representation
            XCTAssertNotEqual(pdu.attributeData[0].value, Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7])) // invalid data
            XCTAssertEqual(pdu.attributeData[0].value, BluetoothUUID(rawValue: uuidString)!.littleEndian.data)
            XCTAssertEqual(BluetoothUUID(littleEndian:
                BluetoothUUID(data: Data(pdu.attributeData[0].value))!).rawValue, uuidString)
            XCTAssertEqual(pdu.data, data)
        }
    }
    
    func testFindByType() {
        
        do {
            
            // find C7A8D570-E023-4FB8-E511-72F9E24FF160
            let data = Data([6, 1, 0, 255, 255, 0, 40, 96, 241, 79, 226, 249, 114, 17, 229, 184, 79, 35, 224, 112, 213, 168, 199])
            
            guard let pdu = ATTFindByTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(Data(pdu.attributeValue) == BluetoothUUID(rawValue: "C7A8D570-E023-4FB8-E511-72F9E24FF160")!.littleEndian.data)
            XCTAssert(pdu.data == data)
        }
        
        do {
            
            // find 60F14FE2-F972-11E5-B84F-23E070D5A8C7
            let data = Data([6, 1, 0, 255, 255, 0, 40, 199, 168, 213, 112, 224, 35, 79, 184, 229, 17, 114, 249, 226, 79, 241, 96])
            
            guard let pdu = ATTFindByTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.startHandle == 0x0001)
            XCTAssert(pdu.endHandle == 0xFFFF)
            XCTAssert(Data(pdu.attributeValue) == BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!.littleEndian.data)
            XCTAssert(pdu.data == data)
        }
        
        do {
            
            let data = Data([7, 40, 0, 48, 0])
            
            guard let pdu = ATTFindByTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            guard let foundHandle = pdu.handlesInformationList.first,
                pdu.handlesInformationList.count == 1
                else { XCTFail("Invalid response"); return }
            
            XCTAssert(foundHandle.foundAttribute == 40)
            XCTAssert(foundHandle.groupEnd == 48)
            XCTAssert(pdu.data == data)
        }
    }
    
    func testReadByType() {
        
        typealias DeclarationAttribute = GATTDatabase.CharacteristicDeclarationAttribute
        
        typealias Attribute = GATTDatabase.Attribute
        
        do {
            
            let data = Data([9, 21, 41, 0, 2, 42, 0, 199, 168, 213, 112, 224, 35, 224, 128, 229, 17, 111, 249, 76, 38, 125, 231])
            
            guard let pdu = ATTReadByTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.data == data)
            
            guard let foundCharacteristicData = pdu.attributeData.first,
                pdu.attributeData.count == 1
                else { XCTFail("Invalid response"); return }
            
            XCTAssert(foundCharacteristicData.handle == 41)
            XCTAssert(foundCharacteristicData.value.isEmpty == false)
        }
        
        do {
            
            let data = Data([9, 21, 41, 0, 2, 42, 0, 199, 168, 213, 112, 224, 35, 224, 128, 229, 17, 111, 249, 76, 38, 125, 231])
            
            guard let pdu = ATTReadByTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(pdu.data == data)
            
            guard let characteristicData = pdu.attributeData.first,
                pdu.attributeData.count == 1
                else { XCTFail("Invalid response"); return }
            
            XCTAssert(characteristicData.handle == 41)
            XCTAssert(characteristicData.value.isEmpty == false)
            
            let attribute = Attribute(handle: characteristicData.handle,
                                      uuid: .characteristic,
                                      value: Data(characteristicData.value),
                                      permissions: [.read])
            
            guard let declaration = DeclarationAttribute(attribute: attribute)
                else { XCTFail("Could not parse"); return }
            
            let characteristic = TestProfile.Read
            
            XCTAssert(declaration.valueHandle == 42)
            XCTAssert(declaration.uuid == characteristic.uuid)
            XCTAssert(declaration.properties.set == Set(characteristic.properties))
            XCTAssert(declaration.properties == characteristic.properties)
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
            
            let data = Data([0x1D, 0x08, 0x00, 0x0A, 0x00, 0xFF, 0xFF])
            
            guard let pdu = ATTHandleValueIndication(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x1d)
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.handle, 0x0008)
            XCTAssertEqual(pdu.value, Data([0x0a, 0x00, 0xff, 0xff]))
            XCTAssertEqual(ATTHandleValueIndication(handle: 0x0008, value: Data([0x0a, 0x00, 0xff, 0xff])).data, data)
        }
        
        do {
            
            /**
             Handle Value Indication
             Opcode: 0x1d
             Attribute Handle: 0x0008 (8)
             */
            
            let data = Data([0x1D, 0x08, 0x00])
            
            guard let pdu = ATTHandleValueIndication(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x1D)
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.handle, 0x0008)
            XCTAssertEqual(pdu.value, Data())
            XCTAssertEqual(ATTHandleValueIndication(handle: 0x0008, value: Data()).data, data)
        }
    }
    
    func testHandleValueConfirmation() {
        
        do {
            
            /**
             Handle Value Confirmation
             Opcode: 0x1e
             
             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0001 (01) [ 1E ]
             */
            
            let data = Data([0x1E])
            
            guard let pdu = ATTHandleValueConfirmation(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x1e)
            XCTAssertEqual(pdu.data, data)
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
            
            let data = Data([0x1B, 0x16, 0x00, 0x64])
            
            guard let pdu = ATTHandleValueNotification(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.handle, 0x0016)
            XCTAssertEqual(pdu.value, Data([0x64]))
            
            XCTAssertEqual(ATTHandleValueNotification(handle: 0x0016, value: Data([0x64])).data, data)
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
            let data = Data([0x0A, 0x16, 0x00])
            
            guard let pdu = ATTReadRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x0a)
            XCTAssertEqual(pdu.data, data)
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
            
            let data = Data([0x0B, 0x64])
            
            guard let pdu = ATTReadResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x0b)
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.attributeValue, Data([0x64]))
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
            
            let data = Data([0x12, 0x17, 0x00, 0x01, 0x00])
            
            guard let pdu = ATTWriteRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x12)
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.handle, 0x0017)
            XCTAssertEqual(pdu.value, Data([0x01, 0x00]))
        }
        
        do {
            
            /**
             Write Response
             Opcode: 0x13
             
             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0001 (01) [ 13 ]
             */
            
            let data = Data([0x13])
            
            guard let pdu = ATTWriteResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x13)
            XCTAssertEqual(pdu.data, data)
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
            
            let data = Data([0x04, 0x17, 0x00, 0x17, 0x00])
            
            guard let pdu = ATTFindInformationRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
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
            
            let data = Data([0x05, 0x01, 0x17, 0x00, 0x02, 0x29])
            
            guard let pdu = ATTFindInformationResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            let foundData = ATTFindInformationResponse.AttributeData.bit16([(0x0017, 0x2902)])
            
            XCTAssertEqual(type(of: pdu).attributeOpcode.rawValue, 0x05)
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.attributeData.data, foundData.data)
            XCTAssertEqual("\(pdu.attributeData)", "\(foundData)")
        }
        
        do {
            
            // Find Information Request - Start Handle:0x0004 - End Handle:0x0004
            let data = Data([4, 4, 0, 4, 0])
            
            guard let pdu = ATTFindInformationRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.startHandle, 0x04)
            XCTAssertEqual(pdu.endHandle, 0x04)
        }
        
        do {
            
            // Find Information Response
            // Opcode: 0x05
            // Format: 1 (Handles and 16 byte UUIDs)
            // Handle: 0x0004 UUID: 2902 (Client Characteristic Configuration)
            let data = Data([5, 1, 4, 0, 2, 41])
            
            guard let pdu = ATTFindInformationResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            
            guard case let .bit16(attributeData) = pdu.attributeData
                else { XCTFail("Invalid data"); return }
            
            XCTAssertEqual(attributeData.count, 1)
            XCTAssertEqual(attributeData[0].0, 0x0004)
            XCTAssertEqual(BluetoothUUID.bit16(attributeData[0].1), .clientCharacteristicConfiguration)
        }
    }
    
    func testConfigureClientDescriptor() {
        
        /**
         Read: [2, 185, 0]
         Send: [3, 200, 0]
         Read: [18, 4, 0, 1, 0]
         Send: [19]
         */
        
        do {
            
            let data = Data([2, 185, 0])
            
            guard let pdu = ATTMaximumTransmissionUnitRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.clientMTU, 185)
        }
        
        do {
            
            let data = Data([3, 200, 0])
            
            guard let pdu = ATTMaximumTransmissionUnitResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.serverMTU, 200)
        }
        
        do {
            
            let data = Data([18, 4, 0, 1, 0])
            
            guard let pdu = ATTWriteRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.handle, 0x04)
            XCTAssertEqual(pdu.value, Data([1, 0]))
            
            guard let clientConfiguration = GATTClientCharacteristicConfiguration(data: Data(pdu.value))
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(clientConfiguration.data, Data(pdu.value))
            XCTAssertEqual(clientConfiguration.configuration, [.notify])
            XCTAssertNotEqual(clientConfiguration.configuration, [.notify, .indicate])
            XCTAssertNotEqual(clientConfiguration.configuration, [])
        }
        
        do {
            
            let data = Data([19])
            
            guard let pdu = ATTWriteResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
        }
    }
    
    func testDiscovery() {
        
        // MTU Exchange
        do {
            
            let data = Data([2, 185, 0])
            
            guard let pdu = ATTMaximumTransmissionUnitRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.clientMTU, 185)
        }
        
        do {
            
            let data = Data([3, 200, 0])
            
            guard let pdu = ATTMaximumTransmissionUnitResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.serverMTU, 200)
        }
        
        // Service Discovery
        do {
            
            let data = Data([16, 1, 0, 255, 255, 0, 40])
            
            guard let pdu = ATTReadByGroupTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.type, BluetoothUUID.primaryService)
            XCTAssertEqual(pdu.startHandle, 0x0001)
            XCTAssertEqual(pdu.endHandle, .max)
        }
        
        do {
            
            let data = Data([17, 20, 1, 0, 6, 0, 231, 207, 159, 173, 34, 222, 166, 180, 145, 78, 37, 213, 23, 49, 212, 52, 7, 0, 12, 0, 251, 52, 155, 95, 128, 0, 0, 128, 0, 16, 0, 0, 169, 254, 0, 0, 13, 0, 18, 0, 178, 26, 190, 138, 180, 130, 146, 145, 222, 73, 117, 102, 201, 67, 100, 139])
            
            guard let pdu = ATTReadByGroupTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
                        
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.attributeData.count, 3)
            
            XCTAssertEqual(pdu.attributeData[0].attributeHandle, 1)
            XCTAssertEqual(pdu.attributeData[0].endGroupHandle, 6)
            XCTAssertEqual(BluetoothUUID(littleEndian: BluetoothUUID(data: Data(pdu.attributeData[0].value))!).rawValue,
                           "34D43117-D525-4E91-B4A6-DE22AD9FCFE7")
            
            XCTAssertEqual(pdu.attributeData[1].attributeHandle, 7)
            XCTAssertEqual(pdu.attributeData[1].endGroupHandle, 12)
            XCTAssertEqual(BluetoothUUID(littleEndian: BluetoothUUID(data: Data(pdu.attributeData[1].value))!).rawValue,
                           "0000FEA9-0000-1000-8000-00805F9B34FB")
            
            XCTAssertEqual(pdu.attributeData[2].attributeHandle, 13)
            XCTAssertEqual(pdu.attributeData[2].endGroupHandle, 18)
            XCTAssertEqual(BluetoothUUID(littleEndian: BluetoothUUID(data: Data(pdu.attributeData[2].value))!).rawValue,
                           "8B6443C9-6675-49DE-9192-82B48ABE1AB2")
        }
        
        do {
            
            let data = Data([16, 19, 0, 255, 255, 0, 40])
            
            guard let pdu = ATTReadByGroupTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.type, BluetoothUUID.primaryService)
            XCTAssertEqual(pdu.startHandle, 19)
            XCTAssertEqual(pdu.endHandle, .max)
        }
        
        do {
            
            let data = Data([1, 16, 19, 0, 10])
            
            guard let pdu = ATTErrorResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.error, .attributeNotFound)
            XCTAssertEqual(pdu.attributeHandle, 19)
            XCTAssertEqual(pdu.request, .readByGroupTypeRequest)
        }
        
        /// Characteristic Discovery
        do {
            
            let data = Data([8, 1, 0, 6, 0, 3, 40])
            
            guard let pdu = ATTReadByTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.startHandle, 1)
            XCTAssertEqual(pdu.endHandle, 6)
            XCTAssertEqual(pdu.attributeType, .characteristic)
        }
        
        do {
            
            let data = Data([9, 21, 2, 0, 16, 3, 0, 153, 234, 51, 69, 164, 205, 80, 147, 177, 76, 242, 125, 196, 139, 229, 43, 5, 0, 8, 6, 0, 174, 253, 204, 198, 23, 135, 52, 155, 155, 75, 219, 59, 176, 229, 202, 148])
            
            guard let pdu = ATTReadByTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.attributeData.count, 2)
            XCTAssertEqual(pdu.attributeData[0].handle, 2)
            XCTAssertEqual(pdu.attributeData[1].handle, 5)
            
            do {
                
                let attribute = GATTDatabase.Attribute(handle: pdu.attributeData[0].handle,
                                                       uuid: .characteristic,
                                                       value: Data(pdu.attributeData[0].value),
                                                       permissions: [.read])
                
                guard let declaration = GATTDatabase.CharacteristicDeclarationAttribute(attribute: attribute)
                    else { XCTFail(); return }
                
                XCTAssertEqual(declaration.attribute.value, attribute.value)
                XCTAssertEqual(declaration.uuid.rawValue, "2BE58BC4-7DF2-4CB1-9350-CDA44533EA99")
                XCTAssertEqual(declaration.valueHandle, 3)
                XCTAssertEqual(declaration.properties, [.notify])
            }
            
            do {
                
                let attribute = GATTDatabase.Attribute(handle: pdu.attributeData[1].handle,
                                                       uuid: .characteristic,
                                                       value: Data(pdu.attributeData[1].value),
                                                       permissions: [.read])
                
                guard let characteristicDeclarationAttribute = GATTDatabase.CharacteristicDeclarationAttribute(attribute: attribute)
                    else { XCTFail(); return }
                
                XCTAssertEqual(characteristicDeclarationAttribute.attribute.value, attribute.value)
                XCTAssertEqual(characteristicDeclarationAttribute.uuid.rawValue, "94CAE5B0-3BDB-4B9B-9B34-8717C6CCFDAE")
                XCTAssertEqual(characteristicDeclarationAttribute.properties, [.write])
                XCTAssertEqual(characteristicDeclarationAttribute.valueHandle, 6)
            }
        }
        
        /// Characteristic Discovery
        do {
            
            let data = Data([8, 7, 0, 12, 0, 3, 40])
            
            guard let pdu = ATTReadByTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.startHandle, 7)
            XCTAssertEqual(pdu.endHandle, 12)
            XCTAssertEqual(pdu.attributeType, .characteristic)
        }
        
        do {
            
            let data = Data([9, 21, 8, 0, 18, 9, 0, 1, 0, 0, 87, 39, 220, 216, 142, 254, 77, 227, 3, 128, 24, 131, 204, 11, 0, 8, 12, 0, 2, 0, 0, 87, 39, 220, 216, 142, 254, 77, 227, 3, 128, 24, 131, 204])
            
            guard let pdu = ATTReadByTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.attributeData.count, 2)
            XCTAssertEqual(pdu.attributeData[0].handle, 8)
            XCTAssertEqual(pdu.attributeData[1].handle, 11)
            
            do {
                
                let attribute = GATTDatabase.Attribute(handle: pdu.attributeData[0].handle,
                                                       uuid: .characteristic,
                                                       value: Data(pdu.attributeData[0].value),
                                                       permissions: [.read])
                
                guard let characteristicDeclarationAttribute = GATTDatabase.CharacteristicDeclarationAttribute(attribute: attribute)
                    else { XCTFail(); return }
                
                XCTAssertEqual(characteristicDeclarationAttribute.attribute.value, attribute.value)
                XCTAssertEqual(characteristicDeclarationAttribute.uuid.rawValue, "CC831880-03E3-4DFE-8ED8-DC2757000001")
                XCTAssertEqual(characteristicDeclarationAttribute.properties, [.read, .notify])
            }
            
            do {
                
                let attribute = GATTDatabase.Attribute(handle: pdu.attributeData[1].handle,
                                                       uuid: .characteristic,
                                                       value: pdu.attributeData[1].value,
                                                       permissions: [.read])
                
                guard let characteristicDeclarationAttribute = GATTDatabase.CharacteristicDeclarationAttribute(attribute: attribute)
                    else { XCTFail(); return }
                
                XCTAssertEqual(characteristicDeclarationAttribute.attribute.value, attribute.value)
                XCTAssertEqual(characteristicDeclarationAttribute.uuid.rawValue, "CC831880-03E3-4DFE-8ED8-DC2757000002")
                XCTAssertEqual(characteristicDeclarationAttribute.properties, [.write])
            }
        }
        
        /// Characteristic Discovery
        do {
            
            let data = Data([8, 13, 0, 18, 0, 3, 40])
            
            guard let pdu = ATTReadByTypeRequest(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.startHandle, 13)
            XCTAssertEqual(pdu.endHandle, 18)
            XCTAssertEqual(pdu.attributeType, .characteristic)
        }
        
        do {
            
            let data = Data([9, 21, 14, 0, 16, 15, 0, 148, 89, 241, 12, 105, 23, 110, 137, 175, 75, 151, 213, 45, 106, 139, 210, 17, 0, 8, 18, 0, 231, 116, 224, 184, 128, 249, 130, 161, 110, 70, 164, 15, 236, 148, 235, 104])
            
            guard let pdu = ATTReadByTypeResponse(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(pdu.data, data)
            XCTAssertEqual(pdu.attributeData.count, 2)
            XCTAssertEqual(pdu.attributeData[0].handle, 14)
            XCTAssertEqual(pdu.attributeData[1].handle, 17)
            
            do {
                
                let attribute = GATTDatabase.Attribute(handle: pdu.attributeData[0].handle,
                                                       uuid: .characteristic,
                                                       value: pdu.attributeData[0].value,
                                                       permissions: [.read])
                
                guard let characteristicDeclarationAttribute = GATTDatabase.CharacteristicDeclarationAttribute(attribute: attribute)
                    else { XCTFail(); return }
                
                XCTAssertEqual(characteristicDeclarationAttribute.attribute.value, attribute.value)
                XCTAssertEqual(characteristicDeclarationAttribute.uuid.rawValue, "D28B6A2D-D597-4BAF-896E-17690CF15994")
                XCTAssertEqual(characteristicDeclarationAttribute.properties, [.notify])
            }
            
            do {
                
                let attribute = GATTDatabase.Attribute(handle: pdu.attributeData[1].handle,
                                                       uuid: .characteristic,
                                                       value: Data(pdu.attributeData[1].value),
                                                       permissions: [.read])
                
                guard let characteristicDeclarationAttribute = GATTDatabase.CharacteristicDeclarationAttribute(attribute: attribute)
                    else { XCTFail(); return }
                
                XCTAssertEqual(characteristicDeclarationAttribute.attribute.value, attribute.value)
                XCTAssertEqual(characteristicDeclarationAttribute.uuid.rawValue, "68EB94EC-0FA4-466E-A182-F980B8E074E7")
                XCTAssertEqual(characteristicDeclarationAttribute.properties, [.write])
            }
        }
    }
}
