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
        ("testATTProtocolDataUnit", testATTProtocolDataUnit)
    ]
    
    func testATTOpcode() {
        
        XCTAssert(ATTOpcode.MaximumTransmissionUnitRequest.request == nil)
        XCTAssert(ATTOpcode.MaximumTransmissionUnitRequest.response == .MaximumTransmissionUnitResponse)
        XCTAssert(ATTOpcode.MaximumTransmissionUnitRequest.type == .Request)
        
        XCTAssert(ATTOpcode.MaximumTransmissionUnitResponse.response == nil)
        XCTAssert(ATTOpcode.MaximumTransmissionUnitResponse.request == .MaximumTransmissionUnitRequest)
        XCTAssert(ATTOpcode.MaximumTransmissionUnitResponse.type == .Response)
    }
    
    func testATTProtocolDataUnit() {
        
        do {
            
            let data: [UInt8] = [1, 16, 1, 0, 10]
            
            guard let errorResponse = ATTErrorResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.requestOpcode == .ReadByGroupTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 0x0001)
            XCTAssert(errorResponse.errorCode == .AttributeNotFound)
            XCTAssert(errorResponse.byteValue == data)
        }
        
        do {
            
            let data: [UInt8] = [1, 8, 0, 0, 6]
            
            guard let errorResponse = ATTErrorResponse(byteValue: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(errorResponse.requestOpcode == .ReadByTypeRequest)
            XCTAssert(errorResponse.attributeHandle == 0x0000)
            XCTAssert(errorResponse.errorCode == .RequestNotSupported)
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
            //XCTAssert(pdu.type == GATT.UUID.PrimaryService.toUUID(), "\(pdu.type)")
            //XCTAssert(pdu.type == .bit16(0x2800))
        }
        
        do {
            
            // discover all primary services
            let pdu = ATTReadByGroupTypeRequest(startHandle: 0x0001,
                                                endHandle: 0xFFFF,
                                                type: GATT.UUID.PrimaryService.toUUID())
            
            XCTAssert(pdu.type == GATT.UUID.PrimaryService.toUUID(), "\(pdu.type)")
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
            XCTAssert(decoded.type == GATT.UUID.PrimaryService.toUUID(), "\(decoded.type)")
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
    }
}
