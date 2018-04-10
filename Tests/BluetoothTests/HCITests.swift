//
//  HCITests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/3/17.
//
//

import Foundation

import XCTest
import Foundation
@testable import Bluetooth

final class HCITests: XCTestCase {
    
    static let allTests = [
        ("testName", testName),
        ("testWriteLocalName", testWriteLocalName),
        ("testReadLocalName", testReadLocalName),
        ("testLowEnergyScan", testLowEnergyScan),
        ("testLEReadRemoteUsedFeatures", testLEReadRemoteUsedFeatures),
        ("testAdvertisingReport", testAdvertisingReport),
        ("testCommandStatusEvent", testCommandStatusEvent),
        ("testLEConnection", testLEConnection),
        ("testLEConnectionCancel", testLEConnectionCancel),
    ]
    
    func testName() {
        
        XCTAssert(LinkControlCommand.acceptConnection.name == "Accept Connection Request")
        XCTAssert(LinkPolicyCommand.holdMode.name == "Hold Mode")
        XCTAssert(InformationalParametersCommand.readLocalVersionInformation.name == "Read Local Version Information")
        XCTAssert(HostControllerBasebandCommand.readLocalName.name == "Read Local Name")
        XCTAssert(StatusParametersCommand.readFailedContactCounter.name == "Read Failed Contact Counter")
        XCTAssert(LowEnergyCommand.createConnection.name == "LE Create Connection")
        
        XCTAssert(HCIGeneralEvent.commandComplete.name == "Command Complete")
        XCTAssert(LowEnergyEvent.connectionComplete.name == "LE Connection Complete")
        
        XCTAssertTrue(HCIError.unknownCommand.description == "Unknown HCI Command")
    }
    
    func testReadLocalName() {
        
        typealias ReadLocalNameReturnParameter = HostControllerBasebandCommand.ReadLocalNameReturnParameter
        
        do{
            let data: [UInt8] = [/*0x0E, 0xFC, 0x01, 0x14, 0x0C, 0x00,*/ 0x41, 0x6C, 0x73, 0x65, 0x79, 0xE2, 0x80, 0x99, 0x73, 0x20, 0x4D, 0x61, 0x63, 0x42, 0x6F, 0x6F, 0x6B, 0x20, 0x50, 0x72, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
            
            guard let readLocalNameParameter = ReadLocalNameReturnParameter(byteValue: data)
                else { XCTFail("Bytes couldn't convert to String"); return  }
            
            let dataString = "Alsey’s MacBook Pro"
            
            XCTAssert(readLocalNameParameter.localName == dataString, "Strings are not equal\n\(readLocalNameParameter.localName)\n\(dataString)")
        }
        
        do {
            
            let opcode: UInt16 = 0x0C14
            
            let localName = "Alsey’s MacBook Pro"
            
            let commandData: [UInt8] = [0x14, 0x0C, 0x00]
            
            let eventData: [UInt8] = [0x0E, 0xFC, 0x01, 0x14, 0x0C, 0x00, 0x41, 0x6C, 0x73, 0x65, 0x79, 0xE2, 0x80, 0x99, 0x73, 0x20, 0x4D, 0x61, 0x63, 0x42, 0x6F, 0x6F, 0x6B, 0x20, 0x50, 0x72, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
            
            guard let hostController = TestHostController.default
                else { XCTFail(); return }
            
            hostController.queue = [.command(opcode, commandData), .event(eventData)]
            
            var returnedLocalName: String!
            XCTAssertNoThrow(returnedLocalName = try hostController.readLocalName())
            XCTAssert(localName == returnedLocalName, "\(localName) == \(returnedLocalName)")
        }
    }
    
    func testWriteLocalName() {
        
        typealias WriteLocalNameParameter = HostControllerBasebandCommand.WriteLocalNameParameter
        
        XCTAssert((WriteLocalNameParameter(localName: "")?.byteValue ?? []) == [UInt8](repeating: 0x00, count: WriteLocalNameParameter.length))
        
        // test local name lenght == 248
        do {
            let localNameParameter = String(repeating: "M", count: WriteLocalNameParameter.length) //248
            
            guard let writeLocalNameParameter = WriteLocalNameParameter(localName: localNameParameter)
                else { XCTFail(); return  }
            
            XCTAssert(writeLocalNameParameter.byteValue.isEmpty == false)
            XCTAssert(writeLocalNameParameter.byteValue.count == WriteLocalNameParameter.length)
        }
        
        // test local name shorter than 248 octets
        do{
            
            let localName = String(repeating: "M", count: 10)
            
            let data: [UInt8] = [UInt8](localName.utf8) + [UInt8](repeating: 0x00, count: WriteLocalNameParameter.length - 10)
            
            guard let writeLocalNameParameter = WriteLocalNameParameter(localName: localName)
                else { XCTFail(); return }
            
            XCTAssert(writeLocalNameParameter.byteValue == data)
        }
        
        // test local name longer than 248
        do {
            let localNameParameter = String(repeating: "M", count: 260)
            
            let writeLocalNameParameter = WriteLocalNameParameter(localName: localNameParameter)
            
            XCTAssert(writeLocalNameParameter == nil, "WriteLocalNameParameter was created with local name longer than 248")
        }
        
        // compare byte localname
        do {
            
            let localName = String(repeating: "M", count: 248)
            
            guard let writeLocalNameParameter = WriteLocalNameParameter(localName: localName)
                else { XCTFail(); return  }
            
            XCTAssert(writeLocalNameParameter.localName == localName)
            XCTAssert(writeLocalNameParameter.byteValue.isEmpty == false)
            
            let data = [UInt8](repeating: 77, count: 248)
            
            XCTAssert(writeLocalNameParameter.byteValue == data, "Local Name is not generating correct bytes")
        }
        
        do {
            let localName = "Test"
            
            guard let writeLocalNameParameter = WriteLocalNameParameter(localName: localName)
                else { XCTFail(); return  }
            
            XCTAssert(writeLocalNameParameter.localName == localName)
            XCTAssert(writeLocalNameParameter.byteValue.isEmpty == false)
            
            let data: [UInt8] = [/* 0x13, 0x0C, 0xF8, */ 0x54, 0x65, 0x73, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
            
            XCTAssert(writeLocalNameParameter.byteValue == data, "\(WriteLocalNameParameter.self) is not generating correct bytes")
        }
        
        do {
            
            let opcode: UInt16 = 0x0C13
            
            XCTAssertEqual(opcode, HostControllerBasebandCommand.writeLocalName.opcode)
            
            let localName = "ColemanCDA"
            
            let commandData: [UInt8] = [0x13, 0x0C, 0xF8, 0x43, 0x6F, 0x6C, 0x65, 0x6D, 0x61, 0x6E, 0x43, 0x44, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
            
            let eventData: [UInt8] = [0x0E, 0x04, 0x01, 0x13, 0x0C, 0x00]
            
            let hostController = TestHostController()
            hostController.queue = [.command(opcode, commandData), .event(eventData)]
            
            XCTAssertNoThrow(try hostController.writeLocalName(localName))
        }
    }
    
    func testLowEnergyScan() {
        
        typealias Report = LowEnergyEvent.AdvertisingReportEventParameter.Report
        
        typealias ScanParameters = LowEnergyCommand.SetScanParametersParameter
        
        let scanParameters = ScanParameters(type: .active,
                                            interval: LowEnergyScanTimeInterval(rawValue: 0x01E0)!,
                                            window: LowEnergyScanTimeInterval(rawValue: 0x0030)!,
                                            addressType: .public,
                                            filterPolicy: .accept)
        
        let hostController = TestHostController()
        
        // SEND  [200C] LE Set Scan Enable - 0x00, Filter duplicates: 0  0C 20 02 00 01
        hostController.queue.append(
            .command(LowEnergyCommand.setScanEnable.opcode,
                     [0x0C, 0x20, 0x02, 0x00, 0x01])
        )
        
        // RECV  Command Complete [200C] - LE Set Scan Enable  0E 04 01 0C 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x0C, 0x20, 0x00]))
        
        // SEND  [200B] LE Set Scan Parameters - Active - 30/300 (ms)  0B 20 07 01 E0 01 30 00 00 00
        hostController.queue.append(
            .command(
                LowEnergyCommand.setScanParameters.opcode,
                [0x0B, 0x20, 0x07, 0x01, 0xE0, 0x01, 0x30, 0x00, 0x00, 0x00])
            )
        
        // RECV  Command Complete [200B] - LE Set Scan Parameters  0E 04 01 0B 20 00
        hostController.queue.append(
            .event([0x0E, 0x04, 0x01, 0x0B, 0x20, 0x00])
        )
        
        // SEND  [200C] LE Set Scan Enable - 0x01, Filter duplicates: 1  0C 20 02 01 00
        hostController.queue.append(
            .command(LowEnergyCommand.setScanEnable.opcode,
                     [0x0C, 0x20, 0x02, 0x01, 0x01])
            )
        
        // RECV  Command Complete [200C] - LE Set Scan Enable  0E 04 01 0C 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x0C, 0x20, 0x00]))
            
        // RECV  LE Meta Event - LE Advertising Report - 1 - 02:E4:72:17:FD:E2  -55 dBm - Type 9
        // 3E 1B 02 01 03 01 E2 FD 17 72 E4 02 0F 02 01 1B 0B FF 4C 00 09 06 03 1A C0 A8 01 02 C9
        hostController.queue.append(.event([0x3E, 0x1B, 0x02, 0x01, 0x03, 0x01, 0xE2, 0xFD, 0x17, 0x72, 0xE4, 0x02, 0x0F, 0x02, 0x01, 0x1B, 0x0B, 0xFF, 0x4C, 0x00, 0x09, 0x06, 0x03, 0x1A, 0xC0, 0xA8, 0x01, 0x02, 0xC9]))
            
        // RECV  LE Meta Event - LE Advertising Report - 0 - C8:69:CD:46:0B:5D  -54 dBm - Type 16
        // 3E 1A 02 01 00 00 5D 0B 46 CD 69 C8 0E 02 01 1A 0A FF 4C 00 10 05 01 10 C3 14 DD CA
        hostController.queue.append(.event([0x3E, 0x1A, 0x02, 0x01, 0x00, 0x00, 0x5D, 0x0B, 0x46, 0xCD, 0x69, 0xC8, 0x0E, 0x02, 0x01, 0x1A, 0x0A, 0xFF, 0x4C, 0x00, 0x10, 0x05, 0x01, 0x10, 0xC3, 0x14, 0xDD, 0xCA]))
            
        // SEND  [200C] LE Set Scan Enable - 0x00, Filter duplicates: 1  0C 20 02 00 01
        hostController.queue.append(
            .command(LowEnergyCommand.setScanEnable.opcode,
                     [0x0C, 0x20, 0x02, 0x00, 0x01])
            )
            
        // Command Complete [200C] - LE Set Scan Enable  0E 04 01 0C 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x0C, 0x20, 0x00]))
        
        var reports = [Report]()
        XCTAssertNoThrow(reports = try hostController.lowEnergyScan(parameters: scanParameters))
        
        XCTAssert(reports.isEmpty == false)
        
        guard reports.count == 2
            else { XCTFail(); return }
        
        XCTAssertEqual(reports[0].address, Address(rawValue: "02:E4:72:17:FD:E2"))
        XCTAssertEqual(reports[0].addressType, .random)
        XCTAssertEqual(reports[0].rssi.rawValue, -55)
        XCTAssertEqual(reports[0].event, .nonConnectable)
        
        XCTAssertEqual(reports[1].address, Address(rawValue: "C8:69:CD:46:0B:5D"))
        XCTAssertEqual(reports[1].addressType, .public)
        XCTAssertEqual(reports[1].rssi.rawValue, -54)
        XCTAssertEqual(reports[1].event, .undirected)
    }
    
    func testLEReadRemoteUsedFeatures() {
        
        let connectionHandle: UInt16 = 0x0041
        
        let hostController = TestHostController()
        
        /**
         SEND  [2016] LE Read Remote Used Features - Connection Handle: 0x0041  16 20 02 41 00
         
         [2016] Opcode: 0x2016 (OGF: 0x08    OCF: 0x16)
         Parameter Length: 2 (0x02)
         Connection Handle: 0041
         */
        hostController.queue.append(
            .command(LowEnergyCommand.readRemoteUsedFeatures.opcode,
                     [0x16, 0x20, 0x02, 0x41, 0x00])
        )
        
        /**
         RECV  Command Status - LE Read Remote Used Features  0F 04 00 01 16 20
         
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         
         Opcode: 0x2016 (OGF: 0x08    OCF: 0x16) - [Low Energy] LE Read Remote Used Features
         */
        hostController.queue.append(.event([0x0F, 0x04, 0x00, 0x01, 0x16, 0x20]))
        
        /**
         RECV  LE Meta Event - LE Read Remote Used Features Complete. DPLE Unsupported  3E 0C 04 00 41 00 1D 00 00 00 00 00 00 00
         
         Parameter Length: 12 (0x0C)
         Status: 0x00 - Success
         Connection Handle: 0x0041
         
         LE Features:               0X1D
            LE Encryption
            Extended Reject Indication
            Slave-initiated Features Exchange
            LE Ping
         */
        hostController.queue.append(.event([0x3E, 0x0C, 0x04, 0x00, 0x41, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))
        
        var features = LowEnergyFeatureSet()
        XCTAssertNoThrow(features = try hostController.readRemoteUsedFeatures(connectionHandle: connectionHandle))
        
        XCTAssert(features.isEmpty == false, "Empty features")
        XCTAssertEqual(features, [.encryption, .extendedRejectIndication, .slaveInitiatedFeaturesExchange, .ping])
        XCTAssertNotEqual(features, [.encryption])
        XCTAssertNotEqual(features, .all)
    }
    
    func testAdvertisingReport() {
        
        func parseAdvertisingReport(_ readBytes: Int, _ data: [UInt8]) -> [Address] {
            
            let eventData = Array(data[3 ..< readBytes])
            
            guard let meta = HCIGeneralEvent.LowEnergyMetaParameter(byteValue: eventData)
                else { XCTFail("Could not parse"); return [] }
            
            XCTAssert(meta.subevent == .advertisingReport, "Invalid event type \(meta.subevent)")
            
            guard let advertisingReport = LowEnergyEvent.AdvertisingReportEventParameter(byteValue: meta.data)
                else { XCTFail("Could not parse"); return [] }
            
            return advertisingReport.reports.map { $0.address }
        }
        
        do {
            
            let readBytes = 26
            let data: [UInt8] = [4, 62, 23, 2, 1, 0, 0, 66, 103, 166, 50, 188, 172, 11, 2, 1, 6, 7, 255, 76, 0, 16, 2, 11, 0, 186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            XCTAssert(parseAdvertisingReport(readBytes, data) == [Address(rawValue: "AC:BC:32:A6:67:42")!])
        }
        
        do {
            
            let readBytes = 38
            let data: [UInt8] = [4, 62, 35, 2, 1, 0, 1, 53, 238, 129, 237, 128, 89, 23, 2, 1, 6, 19, 255, 76, 0, 12, 14, 8, 69, 6, 92, 128, 96, 83, 24, 163, 199, 32, 154, 91, 3, 191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            XCTAssert(parseAdvertisingReport(readBytes, data) == [Address(rawValue: "59:80:ED:81:EE:35")!])
        }
    }
    
    func testCommandStatusEvent() {
        
        func parseEvent(_ actualBytesRead: Int, _ eventBuffer: [UInt8]) -> HCIGeneralEvent.CommandStatusParameter? {
            
            let headerData = Array(eventBuffer[1 ..< 1 + HCIEventHeader.length])
            let eventData = Array(eventBuffer[(1 + HCIEventHeader.length) ..< actualBytesRead])
            
            guard let eventHeader = HCIEventHeader(bytes: headerData)
                else { return nil }
            
            XCTAssert(eventHeader.event.rawValue == headerData[0])
            XCTAssert(eventHeader.parameterLength == headerData[1])
            
            XCTAssert(eventHeader.event == .commandStatus)
            
            guard let event = HCIGeneralEvent.CommandStatusParameter(byteValue: eventData)
                else { return nil }
            
            return event
        }
        
        do {
            
            let readBytes = 7
            let data: [UInt8] = [4, 15, 4, 11, 1, 13, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let event = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(event.status == HCIError.aclConnectionExists.rawValue)
        }
        
        do {
            
            let readBytes = 7
            let data: [UInt8] = [4, 15, 4, 12, 1, 13, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let event = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(event.status == HCIError.commandDisallowed.rawValue)
        }
    }
    
    func testLEConnection() {
        
        do {
            
            let readBytes = 7
            let data: [UInt8] = [4, 15, 4, 0, 1, 13, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let event: HCIGeneralEvent.CommandStatusParameter = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(event.status == 0x00)
        }
        
        do {
            
            let readBytes = 22
            let data: [UInt8] = [4, 62, 19, 1, 0, 71, 0, 0, 0, 66, 103, 166, 50, 188, 172, 15, 0, 0, 0, 128, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let metaEvent: HCIGeneralEvent.LowEnergyMetaParameter = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(metaEvent.subevent == .connectionComplete)
            
            guard let event = LowEnergyEvent.ConnectionCompleteParameter(byteValue: metaEvent.data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(event.status == .success)
            XCTAssert(event.handle == 71)
        }
    }
    
    func testLEConnectionCancel() {
        
        let hostController = TestHostController()
        
        /**
         SEND  [200E] LE Create Connection Cancel  0E 20 00
         
         [200E] Opcode: 0x200E (OGF: 0x08    OCF: 0x0E)
         Parameter Length: 0 (0x00)
         */
        
        hostController.queue.append(
            .command(LowEnergyCommand.createConnectionCancel.opcode,
                     [0x0E, 0x20, 0x00])
        )
        
        /**
         Command Complete [200E] - LE Create Connection Cancel - Command Disallowed (0xC)  0E 04 01 0E 20 0C
         
         Parameter Length: 4 (0x04)
         Status: 0x0C - Command Disallowed
         Num HCI Command Packets: 0x01
         Opcode: 0x200E (OGF: 0x08    OCF: 0x0E) - [Low Energy] LE Create Connection Cancel
         */
        
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x0E, 0x20, 0x0C]))
        
        XCTAssertThrowsError(try hostController.lowEnergyCreateConnectionCancel(),
                             "Error expected",
                             { XCTAssertEqual($0 as? HCIError, .commandDisallowed) })
    }
}

@inline(__always)
@_silgen_name("swift_bluetooth_parse_event")
fileprivate func parseEvent <T: HCIEventParameter> (_ actualBytesRead: Int, _ eventBuffer: [UInt8]) -> T? {
    
    let headerData = Array(eventBuffer[1 ..< 1 + HCIEventHeader.length])
    let eventData = Array(eventBuffer[(1 + HCIEventHeader.length) ..< actualBytesRead])
    
    guard let eventHeader = HCIEventHeader(bytes: headerData)
        else { return nil }
    
    XCTAssert(eventHeader.event.rawValue == T.event.rawValue)
    
    guard let event = T(byteValue: eventData)
        else { return nil }
    
    return event
}
