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
        ("testReadLocalVersionInformation", testReadLocalVersionInformation),
        ("testReadDeviceAddress", testReadDeviceAddress),
        ("testWriteLocalName", testWriteLocalName),
        ("testReadLocalName", testReadLocalName),
        ("testLowEnergyScan", testLowEnergyScan),
        ("testLEReadRemoteUsedFeatures", testLEReadRemoteUsedFeatures),
        ("testAdvertisingReport", testAdvertisingReport),
        ("testCommandStatusEvent", testCommandStatusEvent),
        ("testLEConnectionEvent", testLEConnectionEvent),
        ("testLEConnectionCreate", testLEConnectionCreate),
        ("testLEConnectionCancel", testLEConnectionCancel),
        ("testLEAddDeviceToWhiteList", testLEAddDeviceToWhiteList),
        ("testLERemoveDeviceFromWhiteList", testLERemoveDeviceFromWhiteList),
        ("testLEStartEncryption", testLEStartEncryption),
        ("testEncryptionChangeEvent", testEncryptionChangeEvent),
        ("testLowEnergyEncrypt", testLowEnergyEncrypt),
        ("testSetLERandomAddress", testSetLERandomAddress),
        ("testReadLocalSupportedFeatures", testReadLocalSupportedFeatures),
        ("testReadBufferSize", testReadBufferSize),
        ("testSetAdvertiseEnableParameter", testSetAdvertiseEnableParameter)
    ]
    
    func testSetAdvertiseEnableParameter() {
        
        let hostController = TestHostController()
        
        /**
         SEND [2006] Opcode: 0x2006 (OGF: 0x08    OCF: 0x06) 06 20 0f 14 00 1e 00 01 01 00 77 d8 47 a3 39 54 01 00
         Parameter Length: 15 (0x0F)
         Advertising Interval Min: 0x0014 (12.5ms)
         Advertising Interval Max: 0x001E (18.75ms)
         Advertising Type: 0x01 - Connectable directed advertising (ADV_DIRECT_IND)
         Own Address Type: Random
         Direct Address Type: Public
         Direct Address: (null)
         Advertising Channel Map: 0x01
         Advertising Filter Policy: 0x00 - Allow Scan Request from Any, Allow Connect Request from Any

         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.setAdvertisingParameters.opcode,
                     [0x06, 0x20, 0x0f, 0x14, 0x00, 0x1E, 0x00, 0x01, 0x01, 0x00, 0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54, 0x01, 0x00])
        )
        
        ///    0e 04 01 06 20 12
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x06, 0x20, 0x12]))
    }
    
    func testReadBufferSize() {
        
        let hostController = TestHostController()
        
        /**
         SEND  [1001] Read Buffer Size 02 20 00
         [2002] Opcode: 0x2002 (OGF: 0x08    OCF: 0x02)
         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.readBufferSize.opcode,
                     [0x02, 0x20, 0x00])
        )
        
        hostController.queue.append(.event([0x0E, 0x07, 0x01, 0x02, 0x20, 0x00, 0xFB, 0x00, 0x0F]))
        
        /**
         Command Complete [2002] - LE Read Buffer Size - Num LE Data Packets: 0x000F    0e 07 01 02 20 00 fb 00 0f
         Parameter Length: 7 (0x07)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x2002 (OGF: 0x08    OCF: 0x02) - [Low Energy] LE Read Buffer Size
         HC LE Data Packet Length: 0x00FB
         HC Total Num LE Data Packets: 0x000F
         */
        var readBufferSizeReturn: HCILEReadBufferSize!
        XCTAssertNoThrow(readBufferSizeReturn = try hostController.readBufferSize())
        XCTAssert(hostController.queue.isEmpty)
        
        XCTAssertEqual(readBufferSizeReturn.dataPacketLength, 0x00FB)
        XCTAssertEqual(readBufferSizeReturn.dataPacket, 0x000F)
    }
    
    func testReadLocalSupportedFeatures() {
        
        let hostController = TestHostController()
        
        /**
         SEND  [1001] Read Local Supported Features  03 20 00
         [2003] Opcode: 0x2003 (OGF: 0x08    OCF: 0x03)
         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.readLocalSupportedFeatures.opcode,
                     [0x03, 0x20, 0x00])
        )
        
        hostController.queue.append(.event([0x0E, 0x0C, 0x01, 0x03, 0x20, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))
        
        /**
         Command Complete [2003] - LE Read Local Supported Features     0e 0c 01 03 20 00 3f 00 00 00 00 00 00 00
         Parameter Length: 12 (0x0C)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x2003 (OGF: 0x08    OCF: 0x03) - [Low Energy] LE Read Local Supported Features
         LE Features: 0X000000000000003F
         LE Encryption
         Connection Parameters Request Procedure
         Extended Reject Indication
         Slave-initiated Features Exchange
         LE Ping
         LE Data Packet Length Extension
         */
        
        var lowEnergyFeatureSet: LowEnergyFeatureSet!
        XCTAssertNoThrow(lowEnergyFeatureSet = try hostController.readLocalSupportedFeatures())
        XCTAssert(hostController.queue.isEmpty)
        
        XCTAssertEqual(lowEnergyFeatureSet.rawValue, 0x000000000000003F)
    }
    
    func testName() {
        
        /// HCI command
        XCTAssert(LinkControlCommand.acceptConnection.name == "Accept Connection Request")
        XCTAssert(LinkPolicyCommand.holdMode.name == "Hold Mode")
        XCTAssert(InformationalCommand.readLocalVersionInformation.name == "Read Local Version Information")
        XCTAssert(HostControllerBasebandCommand.readLocalName.name == "Read Local Name")
        XCTAssert(StatusParametersCommand.readFailedContactCounter.name == "Read Failed Contact Counter")
        XCTAssert(HCILowEnergyCommand.createConnection.name == "LE Create Connection")
        
        func testCommand <T: HCICommand> (_ command: T.Type) {
            
            for rawValue in UInt16.min ... .max {
                
                guard let command = T.init(rawValue: rawValue)
                    else { continue }
                
                XCTAssert(command.opcode != .min)
                XCTAssert(command.opcode != rawValue)
                XCTAssert(command.name.isEmpty == false)
                XCTAssert(command.description == command.name)
            }
        }
        
        testCommand(LinkControlCommand.self)
        testCommand(LinkPolicyCommand.self)
        testCommand(InformationalCommand.self)
        testCommand(HostControllerBasebandCommand.self)
        testCommand(StatusParametersCommand.self)
        testCommand(HCILowEnergyCommand.self)
        
        func testCommandNames <T: HCICommand> (_ command: T.Type, names: [String], skip: String = "Unknown") {
            
            for (index, name) in names.enumerated().filter({ $0.1 != skip }) {
                
                XCTAssertEqual(T.init(rawValue: UInt16(index))?.name, name, "\(UInt8(index).toHexadecimal())")
            }
        }
        
        testCommandNames(HCILowEnergyCommand.self, names: [
            "Unknown",
            "LE Set Event Mask",
            "LE Read Buffer Size",
            "LE Read Local Supported Features",
            "Unknown",
            "LE Set Random Address",
            "LE Set Advertising Parameters",
            "LE Read Advertising Channel Tx Power",
            "LE Set Advertising Data",
            "LE Set Scan Response Data",
            "LE Set Advertise Enable",
            "LE Set Scan Parameters",
            "LE Set Scan Enable",
            "LE Create Connection",
            "LE Create Connection Cancel",
            "LE Read White List Size",
            "LE Clear White List",
            "LE Add Device To White List",
            "LE Remove Device From White List",
            "LE Connection Update",
            "LE Set Host Channel Classification",
            "LE Read Channel Map",
            "LE Read Remote Used Features",
            "LE Encrypt",
            "LE Rand",
            "LE Start Encryption",
            "LE Long Term Key Request Reply",
            "LE Long Term Key Request Negative Reply",
            "LE Read Supported States",
            "LE Receiver Test",
            "LE Transmitter Test",
            "LE Test End",
            ])
        
        testCommandNames(InformationalCommand.self, names: [
            "Unknown",
            "Read Local Version Information",
            "Read Local Supported Commands",
            "Read Local Supported Features",
            "Read Local Extended Features",
            "Read Buffer Size",
            "Unknown",
            "Unknown", // "Read Country Code",
            "Unknown",
            "Read Device Address", //"Read BD ADDR",
            "Read Data Block Size"
            ])
        
        // HCI event
        XCTAssert(HCIGeneralEvent.commandComplete.name == "Command Complete")
        XCTAssert(LowEnergyEvent.connectionComplete.name == "LE Connection Complete")
        
        func testEvent <T: HCIEvent> (_ command: T.Type) {
            
            for rawValue in UInt8.min ... .max {
                
                guard let event = T.init(rawValue: rawValue)
                    else { continue }
                
                XCTAssert(event.name.isEmpty == false)
                XCTAssert(event.description == event.name)
            }
        }
        
        testEvent(HCIGeneralEvent.self)
        testEvent(LowEnergyEvent.self)
        
        // HCI error
        XCTAssertTrue(HCIError.unknownCommand.description == "Unknown HCI Command")
        
        let errors = (UInt8.min ... .max).flatMap({ HCIError(rawValue: $0) })
        
        for error in errors {
            
            XCTAssert(error.name.isEmpty == false)
            XCTAssert(error.description == error.name)
            
            #if os(macOS)
            let nsError = error as NSError
            XCTAssertEqual(nsError.code, Int(error.rawValue))
            XCTAssertEqual(nsError.domain, "org.pureswift.Bluetooth.HCIError")
            XCTAssertEqual(nsError.userInfo[NSLocalizedDescriptionKey] as? String, error.description)
            XCTAssertEqual(nsError.userInfo[NSLocalizedDescriptionKey] as? String, error.name)
            
            print(nsError)
            #endif
        }
    }
    
    func testReadLocalVersionInformation() {
        
        let hostController = TestHostController()
        
        /**
         SEND  [1001] Read Local Version Information  01 10 00
         [1001] Opcode: 0x1001 (OGF: 0x04    OCF: 0x01)
         */
        hostController.queue.append(
            .command(InformationalCommand.readLocalVersionInformation.opcode,
                     [0x01, 0x10, 0x00])
        )
        
        /**
         RECV  Command Complete [1001] - Read Local Version Information - HCI Version: 0x08 (Core Spec v 4.2)  0E 0C 01 01 10 00 08 C2 12 08 0F 00 9A 21
         
         Parameter Length: 12 (0x0C)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x1001 (OGF: 0x04    OCF: 0x01) - [Informational] Read Local Version Information
         HCI Version: 0x08 (Core Spec v 4.2)
         HCI Revision: 0x12C2
         LMP Version: 0x08
         Manufacturer Name: 0x000F (Broadcom)
         LMP Subversion: 0x219A
         */
        hostController.queue.append(.event([0x0E, 0x0C, 0x01, 0x01, 0x10, 0x00, 0x08, 0xC2, 0x12, 0x08, 0x0F, 0x00, 0x9A, 0x21]))
        
        var localVersionInformation: HCILocalVersionInformation!
        XCTAssertNoThrow(localVersionInformation = try hostController.readLocalVersionInformation())
        XCTAssert(hostController.queue.isEmpty)
        
        XCTAssertEqual(localVersionInformation.hciVersion.rawValue, 0x08)
        XCTAssertEqual(localVersionInformation.hciVersion, .v4_2)
        XCTAssertEqual(localVersionInformation.hciRevision, 0x12C2)
        XCTAssertEqual(localVersionInformation.lmpVersion, 0x08)
        XCTAssertEqual(localVersionInformation.lmpSubversion, 0x219A)
        XCTAssertEqual(localVersionInformation.manufacturer.rawValue, 0x000F)
        XCTAssertEqual(localVersionInformation.manufacturer.description, "Broadcom Corporation")
    }
    
    func testReadDeviceAddress() {
        
        let hostController = TestHostController()
        
        // SEND  [1009] Read Device Address  09 10 00
        hostController.queue.append(
            .command(InformationalCommand.readDeviceAddress.opcode,
                     [0x09, 0x10, 0x00])
        )
        
        // RECV  Command Complete [1009] - Read Device Address - AC:BC:32:A6:67:42  0E 0A 01 09 10 00 42 67 A6 32 BC AC
        hostController.queue.append(
            .event([0x0E, 0x0A, 0x01, 0x09, 0x10, 0x00, 0x42, 0x67, 0xA6, 0x32, 0xBC, 0xAC])
        )
        
        var address: Address = .zero
        XCTAssertNoThrow(address = try hostController.readDeviceAddress())
        XCTAssert(hostController.queue.isEmpty)
        XCTAssertNotEqual(address, .zero)
        XCTAssertEqual(address.rawValue, "AC:BC:32:A6:67:42")
    }
    
    func testReadLocalName() {
        
        do {
            let data = Data([/*0x0E, 0xFC, 0x01, 0x14, 0x0C, 0x00,*/ 0x41, 0x6C, 0x73, 0x65, 0x79, 0xE2, 0x80, 0x99, 0x73, 0x20, 0x4D, 0x61, 0x63, 0x42, 0x6F, 0x6F, 0x6B, 0x20, 0x50, 0x72, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
            
            guard let readLocalNameParameter = HCIReadLocalName(data: data)
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
            XCTAssert(hostController.queue.isEmpty)
            XCTAssert(localName == returnedLocalName, "\(localName) == \(returnedLocalName)")
        }
    }
    
    func testWriteLocalName() {
        
        XCTAssert((HCIWriteLocalName(localName: "")?.data ?? Data()) == Data(repeating: 0x00, count: HCIWriteLocalName.length))
        
        // test local name lenght == 248
        do {
            let localNameParameter = String(repeating: "M", count: HCIWriteLocalName.length) //248
            
            guard let writeLocalNameParameter = HCIWriteLocalName(localName: localNameParameter)
                else { XCTFail(); return  }
            
            XCTAssert(writeLocalNameParameter.data.isEmpty == false)
            XCTAssertEqual(writeLocalNameParameter.data.count, HCIWriteLocalName.length)
        }
        
        // test local name shorter than 248 octets
        do{
            
            let localName = String(repeating: "M", count: 10)
            
            let data = Data(localName.utf8) + Data(repeating: 0x00, count: HCIWriteLocalName.length - 10)
            
            guard let writeLocalNameParameter = HCIWriteLocalName(localName: localName)
                else { XCTFail(); return }
            
            XCTAssertEqual(writeLocalNameParameter.data, data)
        }
        
        // test local name longer than 248
        do {
            let localNameParameter = String(repeating: "M", count: 260)
            
            let writeLocalNameParameter = HCIWriteLocalName(localName: localNameParameter)
            
            XCTAssertNil(writeLocalNameParameter, "HCIWriteLocalName was created with local name longer than 248")
        }
        
        // compare byte localname
        do {
            
            let localName = String(repeating: "M", count: 248)
            
            guard let writeLocalNameParameter = HCIWriteLocalName(localName: localName)
                else { XCTFail(); return  }
            
            XCTAssertEqual(writeLocalNameParameter.localName, localName)
            XCTAssert(writeLocalNameParameter.data.isEmpty == false)
            
            let data = Data([UInt8](repeating: 77, count: 248))
            
            XCTAssertEqual(writeLocalNameParameter.data, data, "Local Name is not generating correct bytes")
        }
        
        do {
            let localName = "Test"
            
            guard let writeLocalNameParameter = HCIWriteLocalName(localName: localName)
                else { XCTFail(); return  }
            
            XCTAssertEqual(writeLocalNameParameter.localName, localName)
            XCTAssert(writeLocalNameParameter.data.isEmpty == false)
            
            let data = Data([/* 0x13, 0x0C, 0xF8, */ 0x54, 0x65, 0x73, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
            
            XCTAssertEqual(writeLocalNameParameter.data, data, "\(HCIWriteLocalName.self) is not generating valid data")
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
            XCTAssert(hostController.queue.isEmpty)
        }
    }
    
    func testLowEnergyScan() {
        
        typealias Report = HCILEAdvertisingReport.Report
        
        typealias ScanParameters = HCILESetScanParameters
        
        let scanParameters = ScanParameters(type: .active,
                                            interval: LowEnergyScanTimeInterval(rawValue: 0x01E0)!,
                                            window: LowEnergyScanTimeInterval(rawValue: 0x0030)!,
                                            addressType: .public,
                                            filterPolicy: .accept)
        
        let hostController = TestHostController()
        
        // SEND  [200C] LE Set Scan Enable - 0x00, Filter duplicates: 0  0C 20 02 00 01
        hostController.queue.append(
            .command(HCILowEnergyCommand.setScanEnable.opcode,
                     [0x0C, 0x20, 0x02, 0x00, 0x01])
        )
        
        // RECV  Command Complete [200C] - LE Set Scan Enable  0E 04 01 0C 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x0C, 0x20, 0x00]))
        
        // SEND  [200B] LE Set Scan Parameters - Active - 30/300 (ms)  0B 20 07 01 E0 01 30 00 00 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setScanParameters.opcode,
                [0x0B, 0x20, 0x07, 0x01, 0xE0, 0x01, 0x30, 0x00, 0x00, 0x00])
            )
        
        // RECV  Command Complete [200B] - LE Set Scan Parameters  0E 04 01 0B 20 00
        hostController.queue.append(
            .event([0x0E, 0x04, 0x01, 0x0B, 0x20, 0x00])
        )
        
        // SEND  [200C] LE Set Scan Enable - 0x01, Filter duplicates: 1  0C 20 02 01 00
        hostController.queue.append(
            .command(HCILowEnergyCommand.setScanEnable.opcode,
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
            .command(HCILowEnergyCommand.setScanEnable.opcode,
                     [0x0C, 0x20, 0x02, 0x00, 0x01])
            )
            
        // Command Complete [200C] - LE Set Scan Enable  0E 04 01 0C 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x0C, 0x20, 0x00]))
        
        var reports = [Report]()
        XCTAssertNoThrow(reports = try hostController.lowEnergyScan(duration: 1.0, parameters: scanParameters))
        
        XCTAssert(hostController.queue.isEmpty)
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
            .command(HCILowEnergyCommand.readRemoteUsedFeatures.opcode,
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
        XCTAssertNoThrow(features = try hostController.lowEnergyReadRemoteUsedFeatures(connectionHandle: connectionHandle))
        
        XCTAssert(hostController.queue.isEmpty)
        XCTAssert(features.isEmpty == false, "Empty features")
        XCTAssertEqual(features, [.encryption, .extendedRejectIndication, .slaveInitiatedFeaturesExchange, .ping])
        XCTAssertNotEqual(features, [.encryption])
        XCTAssertNotEqual(features, .all)
    }
    
    func testAdvertisingReport() {
        
        typealias Report = HCILEAdvertisingReport.Report
        
        func parseAdvertisingReport(_ readBytes: Int, _ data: [UInt8]) -> [Report] {
            
            let eventData = Data(data[3 ..< readBytes])
            
            guard let meta = HCILowEnergyMetaEvent(data: eventData)
                else { XCTFail("Could not parse"); return [] }
            
            XCTAssert(meta.subevent == .advertisingReport, "Invalid event type \(meta.subevent)")
            
            guard let advertisingReport = HCILEAdvertisingReport(data: meta.eventData)
                else { XCTFail("Could not parse \(eventData)"); return [] }
            
            return advertisingReport.reports
        }
        
        func parseAdvertisingReportAddress(_ readBytes: Int, _ data: [UInt8]) -> [Address] {
            
            return parseAdvertisingReport(readBytes, data).map { $0.address }
        }
        
        do {
            
            let readBytes = 26
            let data: [UInt8] = [4, 62, 23, 2, 1, 0, 0, 66, 103, 166, 50, 188, 172, 11, 2, 1, 6, 7, 255, 76, 0, 16, 2, 11, 0, 186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            XCTAssertEqual(parseAdvertisingReportAddress(readBytes, data), [Address(rawValue: "AC:BC:32:A6:67:42")!])
        }
        
        do {
            
            let readBytes = 38
            let data: [UInt8] = [4, 62, 35, 2, 1, 0, 1, 53, 238, 129, 237, 128, 89, 23, 2, 1, 6, 19, 255, 76, 0, 12, 14, 8, 69, 6, 92, 128, 96, 83, 24, 163, 199, 32, 154, 91, 3, 191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            XCTAssertEqual(parseAdvertisingReportAddress(readBytes, data), [Address(rawValue: "59:80:ED:81:EE:35")!])
        }
        
        do {
            
            /**
             RECV  LE Meta Event - LE Advertising Report - 0 - 58:E2:8F:7C:0B:B3  -45 dBm - Proximity
             
             Parameter Length: 34 (0x22)
             Num Reports: 0X01
             Event Type: Connectable undirected advertising (ADV_IND)
             Address Type: Public
             Peer Address: 58:E2:8F:7C:0B:B3
             Length Data: 0X16
             Flags: 0X1A
             16 bit UUIDs: 0X1803 0X1804 0X1802
             Local Name: Proximity
             Data: 02 01 1A 07 03 03 18 04 18 02 18 0A 09 50 72 6F 78 69 6D 69 74 79
             RSSI: -45 dBm
             */
            
            let data: [UInt8] = [0x3E, 0x22, 0x02, 0x01, 0x00, 0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x16, 0x02, 0x01, 0x1A, 0x07, 0x03, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79, 0xD3]
            
            let advertisingReports = parseAdvertisingReport(1 + data.count, [4] + data)
            
            XCTAssertEqual(advertisingReports.count, 0x01)
            
            guard let report = advertisingReports.first
                else { XCTFail(); return }
            
            XCTAssertEqual(report.address, Address(rawValue: "58:E2:8F:7C:0B:B3")!)
            XCTAssertEqual(report.addressType, .public)
            XCTAssertEqual(report.event, .undirected)
            XCTAssertEqual(report.rssi.rawValue, -45)
            XCTAssertEqual(report.responseData.count, 0x16)
            
            let advertisingData: [UInt8] = [0x02, 0x01, 0x1A, 0x07, 0x03, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79]
            
            XCTAssertEqual(report.responseData, Data(advertisingData))
        }
        
        do {
            
            /**
             LE Meta Event - LE Advertising Report - 0 - 58:E2:8F:7C:0B:B3  -44 dBm  3E 0C 02 01 04 00 B3 0B 7C 8F E2 58 00 D4
             Parameter Length: 12 (0x0C)
             Num Reports: 0X01
             Event Type: Scan Response (SCAN_RSP)
             Address Type: Public
             Peer Address: 58:E2:8F:7C:0B:B3
             Length Data: 0000
             Data:
             RSSI: -44 dBm
             */
            
            let data = Data([0x3E, 0x0C, 0x02, 0x01, 0x04, 0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00, 0xD4])
            
            let advertisingReports = parseAdvertisingReport(1 + data.count, [4] + data)
            
            XCTAssertEqual(advertisingReports.count, 0x01)
            
            guard let report = advertisingReports.first
                else { XCTFail(); return }
            
            XCTAssertEqual(report.address, Address(rawValue: "58:E2:8F:7C:0B:B3")!)
            XCTAssertEqual(report.addressType, .public)
            XCTAssertEqual(report.event, .scanResponse)
            XCTAssertEqual(report.rssi.rawValue, -44)
            XCTAssertEqual(report.responseData, Data())
        }
        
        do {
            
            /**
             LE Meta Event - LE Advertising Report - 0 - 00:1A:AE:06:EF:9E  -70 dBm - BlueZ 5.43  3E 18 02 01 04 00 9E EF 06 AE 1A 00 0C 0B 09 42 6C 75 65 5A 20 35 2E 34 33 BA
             
             Parameter Length: 24 (0x18)
             Num Reports: 0X01
             Event Type: Scan Response (SCAN_RSP)
             Address Type: Public
             Peer Address: 00:1A:AE:06:EF:9E
             Length Data: 0X0C
             Local Name: BlueZ 5.43
             Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
             RSSI: -70 dBm
             */
            
            let data = Data([0x3E, 0x18, 0x02, 0x01, 0x04, 0x00, 0x9E, 0xEF, 0x06, 0xAE, 0x1A, 0x00, 0x0C, 0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33, 0xBA])
            
            let advertisingReports = parseAdvertisingReport(1 + data.count, [4] + data)
            
            XCTAssertEqual(advertisingReports.count, 0x01)
            
            guard let report = advertisingReports.first
                else { XCTFail(); return }
            
            XCTAssertEqual(report.address, Address(rawValue: "00:1A:AE:06:EF:9E")!)
            XCTAssertEqual(report.addressType, .public)
            XCTAssertEqual(report.event, .scanResponse)
            XCTAssertEqual(report.rssi.rawValue, -70)
            XCTAssertEqual(report.responseData.count, 0x0C)
            XCTAssertEqual(report.responseData, Data([0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33]))
            
        }
    }
    
    func testCommandStatusEvent() {
        
        func parseEvent(_ actualBytesRead: Int, _ eventBuffer: [UInt8]) -> HCICommandStatus? {
            
            let headerData = Data(eventBuffer[1 ..< 1 + HCIEventHeader.length])
            let eventData = Data(eventBuffer[(1 + HCIEventHeader.length) ..< actualBytesRead])
            
            guard let eventHeader = HCIEventHeader(data: headerData)
                else { return nil }
            
            XCTAssert(eventHeader.event.rawValue == headerData[0])
            XCTAssert(eventHeader.parameterLength == headerData[1])
            
            XCTAssert(eventHeader.event == .commandStatus)
            
            guard let event = HCICommandStatus(data: eventData)
                else { return nil }
            
            return event
        }
        
        do {
            
            let readBytes = 7
            let data: [UInt8] = [4, 15, 4, 11, 1, 13, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let event = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(event.status.error, .aclConnectionExists)
        }
        
        do {
            
            let readBytes = 7
            let data: [UInt8] = [4, 15, 4, 12, 1, 13, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let event = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(event.status.error, .commandDisallowed)
        }
    }
    
    func testLEConnectionEvent() {
        
        do {
            
            let readBytes = 7
            let data: [UInt8] = [4, 15, 4, 0, 1, 13, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let event: HCICommandStatus = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(event.status == .success)
        }
        
        do {
            
            let readBytes = 22
            let data: [UInt8] = [4, 62, 19, 1, 0, 71, 0, 0, 0, 66, 103, 166, 50, 188, 172, 15, 0, 0, 0, 128, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            guard let metaEvent: HCILowEnergyMetaEvent = parseEvent(readBytes, data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(metaEvent.subevent == .connectionComplete)
            
            guard let event = HCILEConnectionComplete(data: metaEvent.eventData)
                else { XCTFail("Could not parse"); return }
            
            XCTAssert(event.status == .success)
            XCTAssert(event.handle == 71)
        }
    }
    
    func testLEConnectionCreate() {
        
        typealias CommandParameter = HCILECreateConnection
        
        typealias SupervisionTimeout = HCILECreateConnection.SupervisionTimeout
        
        let hostController = TestHostController()
        
        let parameters = CommandParameter(scanInterval: LowEnergyScanTimeInterval(rawValue: 0x0060)!,
                                          scanWindow: LowEnergyScanTimeInterval(rawValue: 0x0030)!,
                                          initiatorFilterPolicy: .whiteList,
                                          peerAddressType: .public,
                                          peerAddress: .zero,
                                          ownAddressType: .public,
                                          connectionInterval: LowEnergyConnectionIntervalRange(rawValue: 0x0006 ... 0x000C)!,
                                          connectionLatency: .zero,
                                          supervisionTimeout: HCILECreateConnection.SupervisionTimeout(rawValue: 0x00C8)!,
                                          connectionLength: LowEnergyConnectionLength(rawValue: 0x0004 ... 0x0006))
        
        XCTAssertEqual(parameters.data.count, 0x19)
        XCTAssertEqual(parameters.scanInterval.miliseconds, 60)
        XCTAssertEqual(parameters.scanWindow.miliseconds, 30)
        XCTAssertEqual(parameters.connectionInterval.miliseconds, 7.5 ... 15)
        XCTAssertEqual(parameters.connectionLatency.rawValue, 0)
        XCTAssertEqual(parameters.supervisionTimeout.miliseconds, 2000)
        XCTAssertEqual(parameters.connectionLength.miliseconds, 2.5 ... 3.75)
        
        /**
         SEND  [200D] LE Create Connection - 00:00:00:00:00:00, Scan Window/Interval: 30ms/60ms, Min/Max Conn Interval: 7.5ms/15ms
         
         [200D] Opcode: 0x200D (OGF: 0x08    OCF: 0x0D)
         Parameter Length: 25 (0x19)
         LE Scan Interval: 0X0060 (60 ms)
         LE Scan Window: 0X0030 (30 ms)
         Initiator Filter Policy: 01 - White list is used to connect
         Peer Address Type: Public
         Peer Address: 00:00:00:00:00:00
         Own Address Type: Public
         Conn Interval Min: 0X0006 (7.5 ms)
         Conn Interval Max: 0X000C (15 ms)
         Conn Latency: 0
         Supervision Timeout: 0x00C8 (2000 ms)
         Minimum CE Length: 0x0004 (2.5 ms)
         Maximum CE Length: 0x0006 (3.75 ms)
         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.createConnection.opcode,
            [0x0D, 0x20, 0x19, 0x60, 0x00, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x04, 0x00, 0x06, 0x00])
        )
        
        // RECV  Command Status - LE Create Connection  0F 04 00 01 0D 20
        hostController.queue.append(.event([0x0F, 0x04, 0x00, 0x01, 0x0D, 0x20]))
        
        /**
         RECV  LE Meta Event - LE Connection Complete - Master - Public - 58:E2:8F:7C:0B:B3 - Conn Interval: 11.25 ms  3E 13 01 00 41 00 00 00 B3 0B 7C 8F E2 58 09 00 00 00 C8 00 05
         
         Parameter Length: 19 (0x13)
         Status: 0x00 - Success
         Connection Handle: 0x0041
         Role: 0x0000 (Master)
         Peer Address Type: Public
         Peer Address: 58:E2:8F:7C:0B:B3
         Connection Interval: 0X0009 (11.25 ms)
         Connection Latency: 000000 (0 ms)
         Supervision Timeout: 0X00C8 (2000 ms)
         Master Clock Accuracy: 0X05
         */
        hostController.queue.append(.event([0x3E, 0x13, 0x01, 0x00, 0x41, 0x00, 0x00, 0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x09, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x05]))
        
        var connection: HCILEConnectionComplete!
        XCTAssertNoThrow(connection = try hostController.lowEnergyCreateConnection(parameters: parameters))
        XCTAssert(hostController.queue.isEmpty)
        XCTAssertEqual(connection.status.rawValue, 0x00)
        XCTAssertEqual(connection.handle, 0x0041)
        XCTAssertEqual(connection.role, .master)
        XCTAssertEqual(connection.peerAddressType, .public)
        XCTAssertEqual(connection.peerAddress.rawValue, "58:E2:8F:7C:0B:B3")
        XCTAssertEqual(connection.interval.rawValue, 0x0009)
        XCTAssertEqual(connection.interval.miliseconds, 11.25)
        XCTAssertEqual(connection.latency.rawValue, 0)
        XCTAssertEqual(connection.supervisionTimeout.rawValue, 0x00C8)
        XCTAssertEqual(connection.supervisionTimeout.miliseconds, 2000)
        XCTAssertEqual(connection.masterClockAccuracy.rawValue, 0x05)
    }
    
    func testLEConnectionCancel() {
        
        let hostController = TestHostController()
        
        /**
         SEND  [200E] LE Create Connection Cancel  0E 20 00
         
         [200E] Opcode: 0x200E (OGF: 0x08    OCF: 0x0E)
         Parameter Length: 0 (0x00)
         */
        
        hostController.queue.append(
            .command(HCILowEnergyCommand.createConnectionCancel.opcode,
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
        
        XCTAssert(hostController.queue.isEmpty)
    }
    
    func testLEAddDeviceToWhiteList() {
        
        let hostController = TestHostController()
        
        // SEND  [2011] LE Add Device To White List - 0 - 58:E2:8F:7C:0B:B3  11 20 07 00 B3 0B 7C 8F E2 58
        hostController.queue.append(
            .command(HCILowEnergyCommand.addDeviceToWhiteList.opcode,
                     [0x11, 0x20, 0x07, 0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58])
        )
        
        // RECV  Command Complete [2011] - LE Add Device To White List  0E 04 01 11 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x11, 0x20, 0x00]))
        
        XCTAssertNoThrow(try hostController.lowEnergyAddDeviceToWhiteList(.public(Address(rawValue: "58:E2:8F:7C:0B:B3")!)))
        
        XCTAssert(hostController.queue.isEmpty)
    }
    
    func testLERemoveDeviceFromWhiteList() {
        
        let hostController = TestHostController()
        
        /**
         SEND  [2012] LE Remove Device From White List - 0 - 58:E2:8F:7C:0B:B3  12 20 07 00 B3 0B 7C 8F E2 58
         
         [2012] Opcode: 0x2012 (OGF: 0x08    OCF: 0x12)
         Parameter Length: 7 (0x07)
         Address Type: Public
         Address: 58:E2:8F:7C:0B:B3
         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.removeDeviceFromWhiteList.opcode,
                     [0x12, 0x20, 0x07, 0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58])
        )
        
        /**
         RECV  Command Complete [2012] - LE Remove Device From White List  0E 04 01 12 20 00
         
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x2012 (OGF: 0x08    OCF: 0x12) - [Low Energy] LE Remove Device From White List
         */
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x12, 0x20, 0x00]))
        
        XCTAssertNoThrow(try hostController.lowEnergyRemoveDeviceFromWhiteList(.public(Address(rawValue: "58:E2:8F:7C:0B:B3")!)))
        
        XCTAssert(hostController.queue.isEmpty)
    }
    
    func testLEStartEncryption() {
        
        let hostController = TestHostController()
        
        let connectionHandle: UInt16 = 0x0041
        
        let randomNumber: UInt64 = 0x0000000000000000
        
        let encryptedDiversifier: UInt16 = 0x0000
        
        let longTermKey = UInt128(bigEndian: UInt128(bytes: (0x23, 0x57, 0xEB, 0x0D, 0x0C, 0x24, 0xD8, 0x5A, 0x98, 0x57, 0x64, 0xEC, 0xCB, 0xEC, 0xEC, 0x05)))
        
        XCTAssertEqual(longTermKey.description, "2357EB0D0C24D85A985764ECCBECEC05")
        
        /**
         SEND  [2019] LE Start Encryption - Connection Handle: 0x0041  19 20 1C 41 00 00 00 00 00 00 00 00 00 00 00 05 EC EC CB EC 64 57 98 5A D8 24 0C 0D EB 57 23
         
         [2019] Opcode: 0x2019 (OGF: 0x08    OCF: 0x19)
         Parameter Length: 28 (0x1C)
         Connection Handle: 0041
         Random Number: 0000000000000000
         Encrypted Diversifier: 0000
         Long Term Key: 2357EB0D0C24D85A985764ECCBECEC05
         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.startEncryption.opcode,
                     [0x19, 0x20, 0x1C, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0xEC, 0xEC, 0xCB, 0xEC, 0x64, 0x57, 0x98, 0x5A, 0xD8, 0x24, 0x0C, 0x0D, 0xEB, 0x57, 0x23]))
        
        /**
         RECV  Command Status - LE Start Encryption  0F 04 00 01 19 20
         
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x2019 (OGF: 0x08    OCF: 0x19) - [Low Energy] LE Start Encryption
         */
        hostController.queue.append(.event([0x0F, 0x04, 0x00, 0x01, 0x19, 0x20]))
        
        /**
         RECV  Encryption Change Complete - Encryption Enabled  08 04 00 41 00 01
         
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Connection Handle: 0x0041
         Encryption Enable: 0x01
         */
        hostController.queue.append(.event([0x08, 0x04, 0x00, 0x41, 0x00, 0x01]))
        
        // FIXME: Implement LE Encryption
        //var encryptionChange: TestHostController.LowEnergyEncryptionChange?
        XCTAssertNoThrow(/* encryptionChange = */ try hostController.lowEnergyStartEncryption(connectionHandle: connectionHandle,
                                                                                              randomNumber: randomNumber,
                                                                                              encryptedDiversifier: encryptedDiversifier,
                                                                                              longTermKey: longTermKey))
        
        //XCTAssert(hostController.queue.isEmpty)
        //XCTAssertEqual(encryptionChange, .e0)
        //XCTAssertEqual(encryptionChange?.rawValue, 0x01)
    }
    
    func testEncryptionChangeEvent() {
        
        let data = Data([/* 0x08, 0x04, */ 0x00, 0x41, 0x00, 0x01])
        
        guard let event = HCIEncryptionChange(data: data)
            else { XCTFail("Could not parse HCI Event"); return }
        
        XCTAssertEqual(event.status.rawValue, 0x00)
        XCTAssertEqual(event.handle, 0x0041)
        XCTAssertEqual(event.encryptionEnabled, .e0)
        XCTAssertEqual(event.encryptionEnabled.rawValue, 0x01)
    }
    
    func testLowEnergyEncrypt() {
        
        let hostController = TestHostController()
        
        let key = UInt128(bigEndian: UInt128(bytes: (0x4C, 0x68, 0x38, 0x41, 0x39, 0xF5, 0x74, 0xD8, 0x36, 0xBC, 0xF3, 0x4E, 0x9D, 0xFB, 0x01, 0xBF)))
        
        XCTAssertEqual(key.description, "4C68384139F574D836BCF34E9DFB01BF")
        
        let plainTextData = UInt128(bigEndian: UInt128(bytes: (0x02, 0x13, 0x24, 0x35, 0x46, 0x57, 0x68, 0x79, 0xac, 0xbd, 0xce, 0xdf, 0xe0, 0xf1, 0x02, 0x13)))
        
        XCTAssertEqual(plainTextData.description, "0213243546576879ACBDCEDFE0F10213")
        
        /**
         HCI_LE_Encrypt (length 0x20) – command
         Pars (LSO to MSO) bf 01 fb 9d 4e f3 bc 36 d8 74 f5 39 41 38 68 4c 13 02 f1 e0 df
         ce bd ac 79 68 57 46 35 24 13 02
         Key (16-octet value MSO to LSO): 0x4C68384139F574D836BCF34E9DFB01BF
         Plaintext_Data (16-octet value MSO to LSO): 0x0213243546576879acbdcedfe0f10213
         */
        
        let commandHeader = HCICommandHeader(command: HCILowEnergyCommand.encrypt,
                                             parameterLength: 0x20)
        
        XCTAssertEqual(commandHeader.data, Data([23, 32, 32]))
        
        hostController.queue.append(
            .command(commandHeader.opcode,
                     commandHeader.data + [0xbf, 0x01, 0xfb, 0x9d, 0x4e, 0xf3, 0xbc, 0x36, 0xd8, 0x74, 0xf5, 0x39, 0x41, 0x38, 0x68, 0x4c, 0x13, 0x02, 0xf1, 0xe0, 0xdf, 0xce, 0xbd, 0xac, 0x79, 0x68, 0x57, 0x46, 0x35, 0x24, 0x13, 0x02]
            )
        )
        
        /**
         HCI_Command_Complete (length 0x14) – event
         Pars (LSO to MSO) 02 17 20 00 66 c6 c2 27 8e 3b 8e 05 3e 7e a3 26 52 1b ad 99
         Num_HCI_Commands_Packets: 0x02
         Command_Opcode (2-octet value MSO to LSO): 0x2017
         Status: 0x00
         Encrypted_Data (16-octet value MSO to LSO): 0x99ad1b5226a37e3e058e3b8e27c2c666
         */
        
        let eventHeader = HCIEventHeader(event: .commandComplete, parameterLength: 0x14)
        
        hostController.queue.append(.event(eventHeader.data + [0x02, 0x17, 0x20, 0x00, 0x66, 0xc6, 0xc2, 0x27, 0x8e, 0x3b, 0x8e, 0x05, 0x3e, 0x7e, 0xa3, 0x26, 0x52, 0x1b, 0xad, 0x99]))
        
        var encryptedData: UInt128 = 0
        XCTAssertNoThrow(encryptedData = try hostController.lowEnergyEncrypt(key: key, data: plainTextData))
        
        XCTAssert(hostController.queue.isEmpty)
        XCTAssertNotEqual(encryptedData, 0)
        XCTAssertEqual(encryptedData.description, "99AD1B5226A37E3E058E3B8E27C2C666")
    }
    
    func testSetLERandomAddress() {
        
        let hostController = TestHostController()
        
        let randomAddress = Address(rawValue: "68:60:B2:29:26:8D")!
        
        /**
         SEND  [2005] LE Set Random Address - 68:60:B2:29:26:8D  05 20 06 8D 26 29 B2 60 68
         
         [2005] Opcode: 0x2005 (OGF: 0x08    OCF: 0x05)
         Parameter Length: 6 (0x06)
         Random Address: 68:60:B2:29:26:8D
         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.setRandomAddress.opcode,
                     [0x05, 0x20, 0x06, 0x8D, 0x26, 0x29, 0xB2, 0x60, 0x68])
        )
        
        /**
         RECV  Command Complete [2005] - LE Set Random Address  0E 04 01 05 20 00
         
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x2005 (OGF: 0x08    OCF: 0x05) - [Low Energy] LE Set Random Address
         */
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x05, 0x20, 0x00]))
        
        XCTAssertNoThrow(try hostController.lowEnergySetRandomAddress(randomAddress))
        XCTAssert(hostController.queue.isEmpty)
    }
}

@inline(__always)
@_silgen_name("swift_bluetooth_parse_event")
fileprivate func parseEvent <T: HCIEventParameter> (_ actualBytesRead: Int, _ eventBuffer: [UInt8]) -> T? {
    
    let headerData = Data(eventBuffer[1 ..< 1 + HCIEventHeader.length])
    let eventData = Data(eventBuffer[(1 + HCIEventHeader.length) ..< actualBytesRead])
    
    guard let eventHeader = HCIEventHeader(data: headerData)
        else { return nil }
    
    XCTAssert(eventHeader.event.rawValue == T.event.rawValue)
    
    guard let event = T(data: eventData)
        else { return nil }
    
    return event
}
