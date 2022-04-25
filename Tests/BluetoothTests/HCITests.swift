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
import Bluetooth
@testable import BluetoothHCI

final class HCITests: XCTestCase {
    
    func testSetAdvertiseEnableParameter() async throws {
        
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
    
    func testReadBufferSize() async throws {
        
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
        (readBufferSizeReturn = try await hostController.readBufferSize())
        XCTAssert(hostController.queue.isEmpty)
        
        XCTAssertEqual(readBufferSizeReturn.dataPacketLength, 0x00FB)
        XCTAssertEqual(readBufferSizeReturn.dataPacket, 0x000F)
    }
    
    func testLEReadLocalSupportedFeatures() async throws {
        
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
        (lowEnergyFeatureSet = try await hostController.lowEnergyReadLocalSupportedFeatures())
        XCTAssert(hostController.queue.isEmpty)
        
        XCTAssertEqual(lowEnergyFeatureSet.rawValue, 0x000000000000003F)
    }
    
    func testName() async throws {
        
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
            
            for (index, name) in names.enumerated().filter({ $1 != skip }) {
                
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
        
        let errors = (UInt8.min ... .max).compactMap({ HCIError(rawValue: $0) })
        
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
    
    func testReadLocalVersionInformation() async throws {
        
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
        (localVersionInformation = try await hostController.readLocalVersionInformation())
        XCTAssert(hostController.queue.isEmpty)
        
        XCTAssertEqual(localVersionInformation.hciVersion.rawValue, 0x08)
        XCTAssertEqual(localVersionInformation.hciVersion, .v4_2)
        XCTAssertEqual(localVersionInformation.hciRevision, 0x12C2)
        XCTAssertEqual(localVersionInformation.lmpVersion, 0x08)
        XCTAssertEqual(localVersionInformation.lmpSubversion, 0x219A)
        XCTAssertEqual(localVersionInformation.manufacturer.rawValue, 0x000F)
        XCTAssertEqual(localVersionInformation.manufacturer.description, "Broadcom Corporation")
    }
    
    func testReadDeviceAddress() async throws {
        
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
        
        var address: BluetoothAddress = .zero
        (address = try await hostController.readDeviceAddress())
        XCTAssert(hostController.queue.isEmpty)
        XCTAssertNotEqual(address, .zero)
        XCTAssertEqual(address.rawValue, "AC:BC:32:A6:67:42")
    }
    
    func testReadLocalName() async throws {
        
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
            
            guard let hostController = await TestHostController.default
                else { XCTFail(); return }
            
            hostController.queue = [.command(opcode, commandData), .event(eventData)]
            
            var returnedLocalName: String = ""
            (returnedLocalName = try await hostController.readLocalName())
            XCTAssert(hostController.queue.isEmpty)
            XCTAssert(localName == returnedLocalName, "\(localName) == \(returnedLocalName)")
        }
    }
    
    func testWriteLocalName() async throws {
        
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
            
            (try await hostController.writeLocalName(localName))
            XCTAssert(hostController.queue.isEmpty)
        }
    }
    
    func testLowEnergyScan() async throws {
        
        typealias Report = HCILEAdvertisingReport.Report
        typealias ScanParameters = HCILESetScanParameters
        
        let scanParameters = ScanParameters(
            type: .active,
            interval: LowEnergyScanTimeInterval(rawValue: 0x01E0)!,
            window: LowEnergyScanTimeInterval(rawValue: 0x0030)!,
            addressType: .public,
            filterPolicy: .accept
        )
        
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
        
        let scan = try await hostController.lowEnergyScan(filterDuplicates: true, parameters: scanParameters)
        Task {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            scan.stop()
        }
        var reports = [Report]()
        for try await report in scan {
            reports.append(report)
        }
        
        XCTAssert(hostController.queue.isEmpty)
        XCTAssert(reports.isEmpty == false)
        
        guard reports.count == 2
            else { XCTFail(); return }
        
        XCTAssertEqual(reports[0].address, BluetoothAddress(rawValue: "02:E4:72:17:FD:E2"))
        XCTAssertEqual(reports[0].addressType, .random)
        XCTAssertEqual(reports[0].rssi?.rawValue, -55)
        XCTAssertEqual(reports[0].event, .nonConnectable)
        XCTAssertEqual(reports[0].event.isConnectable, false)
        
        XCTAssertEqual(reports[1].address, BluetoothAddress(rawValue: "C8:69:CD:46:0B:5D"))
        XCTAssertEqual(reports[1].addressType, .public)
        XCTAssertEqual(reports[1].rssi?.rawValue, -54)
        XCTAssertEqual(reports[1].event, .undirected)
        XCTAssertEqual(reports[1].event.isConnectable, true)
    }
    
    func testLEReadRemoteUsedFeatures() async throws {
        
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
        (features = try await hostController.lowEnergyReadRemoteUsedFeatures(connectionHandle: connectionHandle))
        
        XCTAssert(hostController.queue.isEmpty)
        XCTAssert(features.isEmpty == false, "Empty features")
        XCTAssertEqual(features, [.encryption, .extendedRejectIndication, .slaveInitiatedFeaturesExchange, .ping])
        XCTAssertNotEqual(features, [.encryption])
        XCTAssertNotEqual(features, .all)
    }
    
    func testAdvertisingReport() async throws {
        
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
        
        func parseAdvertisingReportAddress(_ readBytes: Int, _ data: [UInt8]) -> [BluetoothAddress] {
            
            return parseAdvertisingReport(readBytes, data).map { $0.address }
        }
        
        do {
            
            let readBytes = 26
            let data: [UInt8] = [4, 62, 23, 2, 1, 0, 0, 66, 103, 166, 50, 188, 172, 11, 2, 1, 6, 7, 255, 76, 0, 16, 2, 11, 0, 186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            XCTAssertEqual(parseAdvertisingReportAddress(readBytes, data), [BluetoothAddress(rawValue: "AC:BC:32:A6:67:42")!])
        }
        
        do {
            
            let readBytes = 38
            let data: [UInt8] = [4, 62, 35, 2, 1, 0, 1, 53, 238, 129, 237, 128, 89, 23, 2, 1, 6, 19, 255, 76, 0, 12, 14, 8, 69, 6, 92, 128, 96, 83, 24, 163, 199, 32, 154, 91, 3, 191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            XCTAssertEqual(parseAdvertisingReportAddress(readBytes, data), [BluetoothAddress(rawValue: "59:80:ED:81:EE:35")!])
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
            
            XCTAssertEqual(report.address, BluetoothAddress(rawValue: "58:E2:8F:7C:0B:B3")!)
            XCTAssertEqual(report.addressType, .public)
            XCTAssertEqual(report.event, .undirected)
            XCTAssertEqual(report.event.isConnectable, true)
            XCTAssertEqual(report.rssi?.rawValue, -45)
            XCTAssertEqual(report.responseData.count, 0x16)
            
            let advertisingData: LowEnergyAdvertisingData = [0x02, 0x01, 0x1A, 0x07, 0x03, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79]
            
            XCTAssertEqual(report.responseData, advertisingData)
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
            
            XCTAssertEqual(report.address, BluetoothAddress(rawValue: "58:E2:8F:7C:0B:B3")!)
            XCTAssertEqual(report.addressType, .public)
            XCTAssertEqual(report.event, .scanResponse)
            XCTAssertEqual(report.event.isConnectable, true)
            XCTAssertEqual(report.rssi?.rawValue, -44)
            XCTAssertEqual(report.responseData.data, Data())
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
            
            XCTAssertEqual(report.address, BluetoothAddress(rawValue: "00:1A:AE:06:EF:9E")!)
            XCTAssertEqual(report.addressType, .public)
            XCTAssertEqual(report.event, .scanResponse)
            XCTAssertEqual(report.event.isConnectable, true)
            XCTAssertEqual(report.rssi?.rawValue, -70)
            XCTAssertEqual(report.responseData.count, 0x0C)
            XCTAssertEqual(report.responseData, [0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
        }
        
        do {
            var testData = [Data]()
            testData.append(
                Data([0x01, 0x00, 0x01, 0x8a, 0x03, 0x6b, 0xa1, 0x00, 0x7a, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x01, 0x18, 0x81, 0x42, 0x89, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x8a, 0x03, 0x6b, 0xa1, 0x00, 0x7a, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x01, 0x18, 0x81, 0x42, 0x89, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x8a, 0x03, 0x6b, 0xa1, 0x00, 0x7a, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x01, 0x18, 0x81, 0x42, 0x89, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x34, 0x2d, 0x99, 0x10, 0x5f, 0x41, 0x16, 0x02, 0x01, 0x1a, 0x02, 0x0a, 0x07, 0x0f, 0xff, 0x4c, 0x00, 0x0f, 0x02, 0x00, 0x00, 0x10, 0x06, 0x50, 0x1e, 0xb1, 0x3f, 0x63, 0x76, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x9c, 0xf2, 0x17, 0xce, 0xe4, 0x78, 0x1b, 0x02, 0x01, 0x06, 0x17, 0xff, 0x4c, 0x00, 0x0f, 0x02, 0x00, 0x00, 0x0c, 0x0e, 0x08, 0xbf, 0x52, 0x92, 0x15, 0x99, 0x34, 0x94, 0x05, 0x83, 0x07, 0x31, 0xd3, 0x7a, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x00, 0xf3, 0x38, 0x04, 0x85, 0x9c, 0x78, 0x0c, 0x02, 0x01, 0x06, 0x03, 0x02, 0x24, 0xfe, 0x04, 0xff, 0xd1, 0x01, 0x00, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x0d, 0xf4, 0xf3, 0xdf, 0x38, 0x59, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x01, 0x18, 0x81, 0x42, 0x89, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x9c, 0xf2, 0x17, 0xce, 0xe4, 0x78, 0x12, 0x02, 0x01, 0x06, 0x0e, 0xff, 0x4c, 0x00, 0x0f, 0x05, 0xa0, 0x33, 0x23, 0xa1, 0xa4, 0x10, 0x02, 0x4b, 0x0c, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x9c, 0xf2, 0x17, 0xce, 0xe4, 0x78, 0x1e, 0x02, 0x01, 0x06, 0x1a, 0xff, 0x4c, 0x00, 0x0c, 0x0e, 0x08, 0xd7, 0x52, 0x40, 0x95, 0x8b, 0xb7, 0x49, 0x41, 0xd3, 0xcd, 0xb6, 0x86, 0x9b, 0x10, 0x05, 0x47, 0x1c, 0x23, 0xa1, 0xa4, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x0b, 0x5f, 0x14, 0x01, 0xf0, 0x6c, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x0b, 0x18, 0x37, 0x26, 0xba, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x0b, 0x5f, 0x14, 0x01, 0xf0, 0x6c, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x0b, 0x18, 0x37, 0x26, 0xba, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x00, 0xf3, 0x38, 0x04, 0x85, 0x9c, 0x78, 0x0c, 0x02, 0x01, 0x06, 0x03, 0x02, 0x24, 0xfe, 0x04, 0xff, 0xd1, 0x01, 0x00, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x86, 0x3c, 0xd2, 0x41, 0x15, 0x6d, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x06, 0x18, 0x85, 0xec, 0x82, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0xe6, 0xf9, 0xa7, 0x5e, 0xc2, 0x79, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x47, 0x1c, 0x5c, 0x0e, 0xf5, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0xe6, 0xf9, 0xa7, 0x5e, 0xc2, 0x79, 0x1e, 0x02, 0x01, 0x06, 0x1a, 0xff, 0x4c, 0x00, 0x0c, 0x0e, 0x08, 0x10, 0x53, 0x1f, 0x14, 0x26, 0xe1, 0xc2, 0x89, 0x38, 0x8f, 0xbd, 0xbc, 0xf9, 0x10, 0x05, 0x4b, 0x1c, 0x5c, 0x0e, 0xf5, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0xb4, 0xc0, 0x4e, 0x01, 0xdf, 0x53, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x04, 0x18, 0xfa, 0x7a, 0xc1, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x00, 0xf3, 0x38, 0x04, 0x85, 0x9c, 0x78, 0x0c, 0x02, 0x01, 0x06, 0x03, 0x02, 0x24, 0xfe, 0x04, 0xff, 0xd1, 0x01, 0x00, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x67, 0x39, 0x2e, 0xdf, 0x62, 0x45, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x0f, 0x18, 0x71, 0x4c, 0x11, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x67, 0x39, 0x2e, 0xdf, 0x62, 0x45, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x0f, 0x18, 0x71, 0x4c, 0x11, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x00, 0xf3, 0x38, 0x04, 0x85, 0x9c, 0x78, 0x0c, 0x02, 0x01, 0x06, 0x03, 0x02, 0x24, 0xfe, 0x04, 0xff, 0xd1, 0x01, 0x00, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x7f, 0xc5, 0xb8, 0xa5, 0xa8, 0x44, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x0e, 0x18, 0xfd, 0xb0, 0xae, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x2e, 0x20, 0xd2, 0xec, 0xb7, 0x6c, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x0e, 0x18, 0xfd, 0xb0, 0xae, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x2e, 0x20, 0xd2, 0xec, 0xb7, 0x6c, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x0e, 0x18, 0xfd, 0xb0, 0xae, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0xda, 0xf6, 0xa3, 0x1a, 0xf7, 0x42, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x07, 0x18, 0x99, 0x83, 0x1e, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x69, 0xdf, 0xb6, 0x30, 0xf6, 0x40, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x4b, 0x1c, 0xa5, 0xcc, 0x4b, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x00, 0x8e, 0xcb, 0xe3, 0x40, 0xeb, 0xe0, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x47, 0x1c, 0xa5, 0xcc, 0x4b, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x77, 0x29, 0x8d, 0xb9, 0x47, 0x40, 0x12, 0x02, 0x01, 0x06, 0x0e, 0xff, 0x4c, 0x00, 0x0f, 0x05, 0xa0, 0x33, 0xb9, 0xa8, 0x03, 0x10, 0x02, 0x4b, 0x0c, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x77, 0x29, 0x8d, 0xb9, 0x47, 0x40, 0x1e, 0x02, 0x01, 0x06, 0x1a, 0xff, 0x4c, 0x00, 0x0c, 0x0e, 0x08, 0xb6, 0x53, 0x84, 0x14, 0x2d, 0xb2, 0x02, 0xdd, 0xe3, 0x7e, 0x4f, 0x22, 0xb2, 0x10, 0x05, 0x4b, 0x1c, 0xb9, 0xa8, 0x03, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x87, 0xca, 0x14, 0x8c, 0xcf, 0x7e, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x07, 0x18, 0x99, 0x83, 0x1e, 0x80])
            )
            testData.append(
                Data([0x01, 0x00, 0x01, 0x87, 0xca, 0x14, 0x8c, 0xcf, 0x7e, 0x0e, 0x02, 0x01, 0x06, 0x0a, 0xff, 0x4c, 0x00, 0x10, 0x05, 0x07, 0x18, 0x99, 0x83, 0x1e, 0x80])
            )
            
            var reports = [HCILEAdvertisingReport]()
            reports.reserveCapacity(reports.count)
            
            for data in testData {
                guard let report = HCILEAdvertisingReport(data: data) else {
                    XCTFail("Unable to parse")
                    return
                }
                reports.append(report)
            }
            
            XCTAssertEqual(reports[0].reports[0].address.rawValue, "7A:00:A1:6B:03:8A")
        }
    }
    
    func testCommandStatusEvent() async throws {
        
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
    
    func testLEConnectionEvent() async throws {
        
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
    
    func testLEConnectionCreate() async throws {
        
        typealias CommandParameter = HCILECreateConnection
        
        let hostController = TestHostController()
        
        let parameters = CommandParameter(scanInterval: LowEnergyScanTimeInterval(rawValue: 0x0060)!,
                                          scanWindow: LowEnergyScanTimeInterval(rawValue: 0x0030)!,
                                          initiatorFilterPolicy: .whiteList,
                                          peerAddressType: .public,
                                          peerAddress: .zero,
                                          ownAddressType: .public,
                                          connectionInterval: LowEnergyConnectionIntervalRange(rawValue: 0x0006 ... 0x000C)!,
                                          connectionLatency: .zero,
                                          supervisionTimeout: LowEnergySupervisionTimeout(rawValue: 0x00C8)!,
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
        (connection = try await hostController.lowEnergyCreateConnection(parameters: parameters))
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
    
    func testLEConnectionCancel() async throws {
        
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
        
        var caughtError: HCIError?
        do { try await hostController.lowEnergyCreateConnectionCancel() }
        catch let error as HCIError {
            caughtError = error
        }
        catch {
            XCTFail("Expected HCIError.commandDisallowed, instead got \(error)")
        }
        XCTAssertEqual(caughtError, .commandDisallowed)
        
        XCTAssert(hostController.queue.isEmpty)
    }
    
    func testLEAddDeviceToWhiteList() async throws {
        
        let hostController = TestHostController()
        
        // SEND  [2011] LE Add Device To White List - 0 - 58:E2:8F:7C:0B:B3  11 20 07 00 B3 0B 7C 8F E2 58
        hostController.queue.append(
            .command(HCILowEnergyCommand.addDeviceToWhiteList.opcode,
                     [0x11, 0x20, 0x07, 0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58])
        )
        
        // RECV  Command Complete [2011] - LE Add Device To White List  0E 04 01 11 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x11, 0x20, 0x00]))
        
        (try await hostController.lowEnergyAddDeviceToWhiteList(.public(BluetoothAddress(rawValue: "58:E2:8F:7C:0B:B3")!)))
        
        XCTAssert(hostController.queue.isEmpty)
    }
    
    func testLERemoveDeviceFromWhiteList() async throws {
        
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
        
        (try await hostController.lowEnergyRemoveDeviceFromWhiteList(.public(BluetoothAddress(rawValue: "58:E2:8F:7C:0B:B3")!)))
        
        XCTAssert(hostController.queue.isEmpty)
    }
    
    func testLEStartEncryption() async throws {
        
        let hostController = TestHostController()
        let connectionHandle: UInt16 = 0x0041
        let randomNumber: UInt64 = 0x0000000000000000
        let encryptedDiversifier: UInt16 = 0x0000
        let longTermKey = UInt128(bigEndian: UInt128(bytes: (0x23, 0x57, 0xEB, 0x0D, 0x0C, 0x24, 0xD8, 0x5A, 0x98, 0x57, 0x64, 0xEC, 0xCB, 0xEC, 0xEC, 0x05)))
        XCTAssertEqual(longTermKey.description, "2357EB0D0C24D85A985764ECCBECEC05")
        
        do {
            
            let data = Data([0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0xEC, 0xEC, 0xCB, 0xEC, 0x64, 0x57, 0x98, 0x5A, 0xD8, 0x24, 0x0C, 0x0D, 0xEB, 0x57, 0x23])
            
            let command = HCILEStartEncryption(connectionHandle: connectionHandle,
                                               randomNumber: randomNumber,
                                               encryptedDiversifier: encryptedDiversifier,
                                               longTermKey: longTermKey)
            
            XCTAssertEqual(command.data, data)
        }
        
        do {
            
            let data = Data([0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0xEC, 0xEC, 0xCB, 0xEC, 0x64, 0x57, 0x98, 0x5A, 0xD8, 0x24, 0x0C, 0x0D, 0xEB, 0x57, 0x23])
            
            // random number
            let command = HCILEStartEncryption(connectionHandle: connectionHandle,
                                               encryptedDiversifier: encryptedDiversifier,
                                               longTermKey: longTermKey)
            
            XCTAssertNotEqual(command.data, data)
        }
        
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
        (/* encryptionChange = */ try await hostController.lowEnergyStartEncryption(connectionHandle: connectionHandle,
                                                                                              randomNumber: randomNumber,
                                                                                              encryptedDiversifier:      encryptedDiversifier,
                                                                                              longTermKey: longTermKey))
        
        //XCTAssert(hostController.queue.isEmpty)
        //XCTAssertEqual(encryptionChange, .e0)
        //XCTAssertEqual(encryptionChange?.rawValue, 0x01)
    }
    
    func testEncryptionChangeEvent() async throws {
        
        let data = Data([/* 0x08, 0x04, */ 0x00, 0x41, 0x00, 0x01])
        
        guard let event = HCIEncryptionChange(data: data)
            else { XCTFail("Could not parse HCI Event"); return }
        
        XCTAssertEqual(event.status.rawValue, 0x00)
        XCTAssertEqual(event.handle, 0x0041)
        XCTAssertEqual(event.encryptionEnabled, .e0)
        XCTAssertEqual(event.encryptionEnabled.rawValue, 0x01)
    }
    
    func testLowEnergyEncrypt() async throws {
        
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
        
        XCTAssertEqual(HCILEEncrypt(key: key, plainText: plainTextData).data,
                       Data([0xbf, 0x01, 0xfb, 0x9d, 0x4e, 0xf3, 0xbc, 0x36, 0xd8, 0x74, 0xf5, 0x39, 0x41, 0x38, 0x68, 0x4c, 0x13, 0x02, 0xf1, 0xe0, 0xdf, 0xce, 0xbd, 0xac, 0x79, 0x68, 0x57, 0x46, 0x35, 0x24, 0x13, 0x02]))
        
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
        
        XCTAssertEqual(HCILEEncryptReturn(data: Data([/* 0x02, 0x17, 0x20, 0x00, */ 0x66, 0xc6, 0xc2, 0x27, 0x8e, 0x3b, 0x8e, 0x05, 0x3e, 0x7e, 0xa3, 0x26, 0x52, 0x1b, 0xad, 0x99]))?.encryptedData.description, "99AD1B5226A37E3E058E3B8E27C2C666")
        
        var encryptedData: UInt128 = 0
        (encryptedData = try await hostController.lowEnergyEncrypt(key: key, data: plainTextData))
        
        XCTAssert(hostController.queue.isEmpty)
        XCTAssertNotEqual(encryptedData, 0)
        XCTAssertEqual(encryptedData.description, "99AD1B5226A37E3E058E3B8E27C2C666")
    }
    
    func testSetLERandomAddress() async throws {
        
        let hostController = TestHostController()
        
        let randomAddress = BluetoothAddress(rawValue: "68:60:B2:29:26:8D")!
        
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
        
        (try await hostController.lowEnergySetRandomAddress(randomAddress))
        XCTAssert(hostController.queue.isEmpty)
    }
    
    func testRemoteNameRequest() async throws {
        
        let hostController = TestHostController()
        
        /**
         [0419] Opcode: 0x0419 (OGF: 0x01    OCF: 0x19)
         Parameter Length: 10 (0x0A)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Page Scan Repetition Mode: 0x01
         Page Scan Mode: 0x00
         Clock Offset: 0x1B5A
         Aug 02 17:19:16.588  HCI Command 19 04 0a af d2 06 2d 70 b0 01 00 5a 1b
        */
        hostController.queue.append(
            .command(LinkControlCommand.remoteNameRequest.opcode,
                     [0x19, 0x04, 0x0a, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x01, 0x00, 0x5a, 0x1b])
        )
        
        do {
            /**
             Aug 02 17:19:16.589  HCI Event        0x0000                     Command Status - Remote Name Request
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0419 (OGF: 0x01    OCF: 0x19) - [Link Control] Remote Name Request
             Aug 02 17:19:16.589  HCI Event  0f 04 00 01 19 04
            */
            let eventHeader = HCIEventHeader(event: .commandStatus, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x00, 0x01, 0x19, 0x04]))
        }
        
        do {
            /**
             Aug 02 17:19:16.595  HCI Event        0x0000  iPhone             Remote Name Request Complete - B0:70:2D:06:D2:AF - iPhone
             Parameter Length: 255 (0xFF)
             Status: 0x00 - Success
             Bluetooth Device Address: B0:70:2D:06:D2:AF
             Remote Name: iPhone
             Aug 02 17:19:16.595  HCI Event 07 FF 00 AF D2 06 2D 70 B0 69 50 68 6F 6E 65 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00                                      .
            */
            let buffer: [UInt8] = [0x00, 0xAF, 0xD2, 0x06, 0x2D, 0x70, 0xB0, 0x69, 0x50, 0x68, 0x6F, 0x6E, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
            
            let eventHeader = HCIEventHeader(event: .remoteNameRequestComplete, parameterLength: 0xFF)
            
            hostController.queue.append(.event(eventHeader.data + buffer))
        }
        
        guard let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")
            else { XCTFail("Unable to init variable"); return }
        
        let pscanRepMode = PageScanRepetitionMode(rawValue: 0x01)
        
        let clockOffset = HCIRemoteNameRequest.ClockOffset(rawValue: 0x1B5A)
        
        let completionEvent = try await hostController.remoteNameRequest(
            address: address,
            pscanRepMode: pscanRepMode,
            clockOffset: clockOffset
        )
        XCTAssertEqual(completionEvent.address, address)
        XCTAssertEqual(completionEvent.status, .success)
    }
    
    func testInquiry() async throws {
        
        XCTAssertEqual(HCIInquiry.Duration.min.seconds, 1.28, "Range: 1.28 – 61.44 Sec")
        XCTAssertEqual(HCIInquiry.Duration.max.seconds, 61.44, "Range: 1.28 – 61.44 Sec")
        (0x01 ... 0x30).forEach { XCTAssertNotNil(HCIInquiry.Duration(rawValue: UInt8($0)), "Could not initialize") }
        XCTAssertNil(HCIInquiry.Duration(rawValue: 0))
        (UInt8(0x31) ..< .max).forEach { XCTAssertNil(HCIInquiry.Duration(rawValue: $0), "Should not initialize") }
        
        guard let lap = HCIInquiry.LAP(rawValue: UInt24(bytes: (0x33, 0x8b, 0x9e)))
            else { XCTFail("Unable to init variable"); return }
        
        guard let duration = HCIInquiry.Duration(rawValue: 0x0A)
            else { XCTFail("Unable to init variable"); return }
        
        let responses = HCIInquiry.Responses(rawValue: 0xFF)
        
        XCTAssertNotNil(HCIInquiry(lap: lap, duration: duration, responses: responses))
        
        let hostController = TestHostController()
        
        /**
         [0401] Opcode: 0x0401 (OGF: 0x01    OCF: 0x01)
         Parameter Length: 5 (0x05)
         LAP: 0x9E8B00
         Inquiry Length: 0x05
         6.400000 seconds
         Number of Responses: 0x20
         Jul 26 15:27:21.774  HCI Command  01 04 05 00 8b 9e 05 20
         */
        hostController.queue.append(
            .command(LinkControlCommand.inquiry.opcode, [0x01, 0x04, 0x05, 0x33, 0x8b, 0x9e, 0x0a, 0xff])
        )
        
        do {
            /**
             Jul 26 15:27:21.774  HCI Event
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0401 (OGF: 0x01    OCF: 0x01) - [Link Control] HCI Inquiry
             Jul 26 15:27:21.774  HCI Event  0f 04 00 01 01 04
             */
            let eventHeader = HCIEventHeader(event: .commandStatus, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x00, 0x01, 0x01, 0x04]))
        }
        
        do {
            /**
             Parameter Length: 1 (0x01)
             Status: 0x00 - Success
             Jul 26 21:39:41.741  HCI Event 01 01 00                                  ...
             */
            let eventHeader = HCIEventHeader(event: .inquiryComplete, parameterLength: 0x01)
            
            hostController.queue.append(.event(eventHeader.data + [0x00]))
        }
        
        (try await hostController.inquiry(lap: lap,
                                                    duration: duration,
                                                    responses: responses,
                                                    timeout: 10000,
                                                    foundDevice: { _ in }))
    }
    
    func testInquiryResult() async throws {
        
        do {
            /**
             Jul 26 21:39:43.265  HCI Event
             RECV  0x0000  04:B1:67:1D:F4:ED  Inquiry Result - EIR  - 04:B1:67:1D:F4:ED - Phone : Phone - RSSI: -72 dBm
             Parameter Length: 255 (0xFF)
             Num Responses: 0x01
             Bluetooth Device Address: 04:B1:67:1D:F4:ED
             Page Scan Repetition Mode: 0x01
             Reserved: 0x00
             Class Of Device: 0x000000
             Service Class: 0x0000
             Major Class: 0x0000
             Miscellaneous
             Minor Class: 0x0000
             Clock Offset: 0x1E52
             RSSI: 0xB8 (-72 dBm)
             */
            
            let data = Data([0x2F, 0xFF, 0x01, 0xED, 0xF4, 0x1D, 0x67, 0xB1, 0x04, 0x01, 0x00, 0x0C, 0x02, 0x5A, 0x52, 0x1E, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
            
            guard let event = HCIInquiryResult(data: data)
                else { XCTFail("Could not parse"); return }
            
            XCTAssertEqual(event.reports[0].classOfDevice.majorDeviceClass, .miscellaneous)
            XCTAssertEqual(event.reports[0].address, BluetoothAddress(rawValue: "04:B1:67:1D:F4:ED"))
        }
    }
    
    func testInquiryCancel() async throws {
        
        let hostController = TestHostController()
        
        /**
         [0402] Opcode: 0x0402 (OGF: 0x01    OCF: 0x02)
         Parameter Length: 0 (0x00)
         Jul 26 21:39:51.983  HCI Command   02 04 00s
         */
        hostController.queue.append(.command(LinkControlCommand.inquiryCancel.opcode, [0x02, 0x04, 0x00]))
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0402 (OGF: 0x01    OCF: 0x02) - [Link Control] HCI Inquiry Cancel
             Jul 26 21:39:51.986  HCI Event  0e 04 01 02 04 00
            */
            let eventHeader = HCIEventHeader(event: .commandComplete, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x01, 0x02, 0x04, 0x00]))
        }
        
        (try await hostController.inquiryCancel())
    }
    
    func testPeriodicInquiryModeAndCancel() async throws {
        
        XCTAssertEqual(HCIPeriodicInquiryMode.Duration.min.seconds, 1.28, "Range: 1.28 – 61.44 Sec")
        XCTAssertEqual(HCIPeriodicInquiryMode.Duration.max.seconds, 61.44, "Range: 1.28 – 61.44 Sec")
        (0x01 ... 0x30).forEach { XCTAssertNotNil(HCIPeriodicInquiryMode.Duration(rawValue: UInt8($0)), "Could not initialize") }
        XCTAssertNil(HCIPeriodicInquiryMode.Duration(rawValue: 0))
        (UInt8(0x31) ..< .max).forEach { XCTAssertNil(HCIPeriodicInquiryMode.Duration(rawValue: $0), "Should not initialize") }
        
        XCTAssertEqual(HCIPeriodicInquiryMode.MaxDuration.min.seconds, 3.84)
        XCTAssertEqual(HCIPeriodicInquiryMode.MaxDuration.max.seconds, 83884.8)
        XCTAssertEqual(HCIPeriodicInquiryMode.MinDuration.min.seconds, 2.56)
        XCTAssertEqual(HCIPeriodicInquiryMode.MinDuration.max.seconds, 83883.52)
        XCTAssertEqual(HCIPeriodicInquiryMode.Responses.unlimited.rawValue, 0x00)
        
        let hostController = TestHostController()
        
        guard let maxDuration = HCIPeriodicInquiryMode.MaxDuration(rawValue: UInt16(bytes: (0x09, 0x00)))
            else { XCTFail("Unable to init variable"); return }
        
        guard let minDuration = HCIPeriodicInquiryMode.MinDuration(rawValue: UInt16(bytes: (0x05, 0x00)))
            else { XCTFail("Unable to init variable"); return }
        
        guard let lap = HCIPeriodicInquiryMode.LAP(rawValue: UInt24(bytes: (0x00, 0x8b, 0x9e)))
            else { XCTFail("Unable to init variable"); return }
        
        guard let duration = HCIPeriodicInquiryMode.Duration(rawValue: 0x03)
            else { XCTFail("Unable to init variable"); return }
        
        let responses = HCIPeriodicInquiryMode.Responses(rawValue: 0x20)
        
        /**
         [0403] Opcode: 0x0403 (OGF: 0x01 OCF: 0x03)
         Parameter Length: 9 (0x09)
         Max Period Length: 0x09
         Min Period Length: 0x05
         LAP: 0x9E8B00
         Inquiry Length: 0x03
         Number of Responses: 0x20
         Jul 27 10:46:57.461  HCI Command  00000000: 03 04 09 09 00 05 00 00 8b 9e 03 20
         */
        hostController.queue.append(.command(LinkControlCommand.periodicInquiry.opcode,
                                             [0x03, 0x04, 0x09, 0x09, 0x00, 0x05, 0x00, 0x00, 0x8b, 0x9e, 0x03, 0x20]))
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0403 (OGF: 0x01    OCF: 0x03) - [Link Control] Periodic Inquiry Mode
             Jul 27 10:46:57.462  HCI Event  0e 04 01 03 04 00
             */
            let eventHeader = HCIEventHeader(event: .commandComplete, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x01, 0x03, 0x04, 0x00]))
        }
        
        (try await hostController.periodicInquiryMode(maxDuration: maxDuration,
                                                                minDuration: minDuration,
                                                                lap: lap,
                                                                length: duration,
                                                                responses: responses))
    }
    
    func testExitPeriodicInquiryMode() async throws {
        
        /**
         [0404] Opcode: 0x0404 (OGF: 0x01    OCF: 0x04)
         Parameter Length: 0 (0x00)
         Jul 31 11:19:59.716  HCI Command  04 04 00 
        */
        let hostController = TestHostController()
        
        hostController.queue.append(.command(LinkControlCommand.exitPeriodicInquiry.opcode, [0x04, 0x04, 0x00]))
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0404 (OGF: 0x01    OCF: 0x04) - [Link Control] Exit Periodic Inquiry Mode
             Jul 31 11:19:59.716  HCI Event 0e 04 01 04 04 00
             */
            let eventHeader = HCIEventHeader(event: .commandComplete, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x01, 0x04, 0x04, 0x00]))
        }
        
        (try await hostController.exitPeriodicInquiry())
    }
    
    func testCreateConnection() async throws {
        
        typealias ClockOffset = HCICreateConnection.ClockOffset
        typealias AllowRoleSwitch = HCICreateConnection.AllowRoleSwitch
        /**
         [0405] Opcode: 0x0405 (OGF: 0x01    OCF: 0x05)
         Parameter Length: 13 (0x0D)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Packet Type: 0xCC18
         Page Scan Repetition Mode: 0x01
         Page Scan Mode: 0x00
         Clock Offset: 0x0000
         Allow Role Switch: 0x00
         Jul 31 12:06:31.407  HCI Command  0504 0daf d206 2d70 b018 cc01 0000 0000
        */
        let hostController = TestHostController()
        
        hostController.queue.append(.command(LinkControlCommand.createConnection.opcode,
                                             [0x05, 0x04, 0x0d, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x18, 0xcc, 0x01, 0x00, 0x00, 0x00, 0x00]))
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0405 (OGF: 0x01    OCF: 0x05) - [Link Control] Create Connection
             Jul 31 12:06:31.408  HCI Event 0f04 0001 0504
             */
            let eventHeader = HCIEventHeader(event: .commandStatus, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x00, 0x01, 0x05, 0x04]))
        }
        
        do {
            /**
             Parameter Length: 11 (0x0B)
             Status: 0x00 - Success
             Connection Handle: 0x000D
             Bluetooth Device Address: B0:70:2D:06:D2:AF
             Link Type: 0x01
             Encryption Mode: 0x00
             Jul 31 12:06:31.943  HCI Event 030b 000d 00af d206 2d70 b001 00
            */
            let eventHeader = HCIEventHeader(event: .connectionComplete, parameterLength: 0x0b)
            
            hostController.queue.append(.event(eventHeader.data + [0x00, 0x0d, 0x00, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x01, 0x00]))
        }
        
        guard let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")
            else { XCTFail("Unable to init variable"); return }
        
        let pageScanRepetitionMode = PageScanRepetitionMode(rawValue: 0x01)
        
        guard let allowSwitchRole = AllowRoleSwitch(rawValue: 0x00)
            else { XCTFail("Unable to init variable"); return }

        let event = try await hostController.createConnection(address: address,
                                                             packetType: 0xCC18,
                                                             pageScanRepetitionMode: pageScanRepetitionMode,
                                                             clockOffset: BitMaskOptionSet<ClockOffset>(rawValue: 0x0000),
                                                             allowRoleSwitch: allowSwitchRole)
        
        XCTAssertEqual(event.address, address)
        XCTAssertEqual(event.status, .success)
    }
    
    func testCreateConnectionCancel() async throws {
        
        let hostController = TestHostController()
        
        hostController.queue.append(.command(LinkControlCommand.createConnectionCancel.opcode,
                                             [0x08, 0x04, 0x06, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0]))
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0408 (OGF: 0x01    OCF: 0x03) - [Link Control] Create Connection
             Aug 02 10:46:57.462  HCI Event  0e 04 01 08 04 00
             */
            let eventHeader = HCIEventHeader(event: .commandComplete, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x01, 0x08, 0x04, 0x00]))
        }
        
        guard let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")
            else { XCTFail("Unable to init variable"); return }
        
        (try await hostController.cancelConnection(address: address))
    }
    
    func testConnectionComplete() async throws {
        
        /**
         Parameter Length: 11 (0x0B)
         Status: 0x00 - Success
         Connection Handle: 0x000D
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Link Type: 0x01
         Encryption Mode: 0x00
         Jul 31 12:06:31.943  HCI Event 030b 000d 00af d206 2d70 b001 00
         */
        let data = Data([0x00, 0x0d, 0x00, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x01, 0x00])
        
        guard let event = HCIConnectionComplete(data: data)
            else { XCTFail("Could not parse"); return }
        
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF"))
        XCTAssertEqual(event.status.rawValue, HCIStatus.success.rawValue)
        XCTAssertEqual(event.linkType, HCIConnectionComplete.LinkType(rawValue: 0x01))
        XCTAssertEqual(event.encryption, HCIConnectionComplete.Encryption(rawValue: 0x00))
    }
    
    func testConnectionRequest() async throws {
        
        
    }
    
    func testAcceptConnectionRequest() async throws {
        
        /**
         [0409] Opcode: 0x0409 (OGF: 0x01    OCF: 0x09)
         Parameter Length: 7 (0x07)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Role: 0x00
         Aug 02 17:19:16.408  HCI Command  09 04 07 af d2 06 2d 70 b0 00
        */
        let hostController = TestHostController()
        
        hostController.queue.append(.command(LinkControlCommand.acceptConnection.opcode,
                                             [0x09, 0x04, 0x07, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x00]))
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0409 (OGF: 0x01    OCF: 0x09) - [Link Control] Accept Connection Request
             Aug 02 17:19:16.408  HCI Event  0f 04 00 01 09 04
             */
            let eventHeader = HCIEventHeader(event: .commandStatus, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x00, 0x01, 0x09, 0x04]))
        }
        
        guard let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")
            else { XCTFail("Unable to init variable"); return }
        
        guard let role = HCIAcceptConnectionRequest.Role(rawValue: 0x00)
        else { XCTFail("Unable to init Role"); return }
        
        (try await hostController.acceptConnection(address: address, role: role))
    }
    
    func testDisconnect() async throws {
        
        let hostController = TestHostController()
        
        /**
         [0406] Opcode: 0x0406 (OGF: 0x01    OCF: 0x06)
         Parameter Length: 3 (0x03)
         Connection Handle: 0x000D
         Reason: 0x13 - Remote User Terminated Connection
         Jul 31 14:55:59.134  HCI Command  06 04 03 0d 00 13
         */
        
        hostController.queue.append(.command(LinkControlCommand.disconnect.opcode,
                                             [0x06, 0x04, 0x03, 0x0d, 0x00, 0x13]))
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x0406 (OGF: 0x01    OCF: 0x06) - [Link Control] Disconnect
             Jul 31 14:55:59.134  HCI Event  0f 04 00 01 06 04
             */
            let eventHeader = HCIEventHeader(event: .commandStatus, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x00, 0x01, 0x06, 0x04]))
        }
        
        do {
            /**
             Parameter Length: 4 (0x04)
             Status: 0x00 - Success
             Connection Handle: 0x000D
             Reason:  0x16 - Connection Terminated by Local Host
             Jul 31 14:55:59.296  HCI Event 05 04 00 0d 00 16
            */
            let eventHeader = HCIEventHeader(event: .disconnectionComplete, parameterLength: 0x04)
            
            hostController.queue.append(.event(eventHeader.data + [0x00, 0x0d, 0x00, 0x16]))
        }
        
        let event = try await hostController.disconnect(connectionHandle: 0x000D, error: .remoteUserEndedConnection)
        XCTAssertEqual(event.handle, 0x000D)
        XCTAssertEqual(event.error, .connectionTerminated)
        XCTAssertEqual(event.status, .success)
    }
    
    func testLinkKeyRequestReply() async throws {
        
        let hostController = TestHostController()
        
        /**
         [040B] Opcode: 0x040B (OGF: 0x01    OCF: 0x0B)
         Parameter Length: 22 (0x16)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Link Key: 0x2E95A8135CA3F466C26D7C63A0FCF53B
         Aug 02 17:19:16.713  HCI Command  0b 04 16 af d2 06 2d 70 b0 3b f5 fc a0 63 7c 6d c2 66 f4 a3 5c 13 a8 95 2e
         */
        hostController.queue.append(.command(LinkControlCommand.linkKeyReply.opcode,
                                             [0x0b, 0x04, 0x16, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x3b, 0xf5, 0xfc, 0xa0,
                                              0x63, 0x7c, 0x6d, 0xc2, 0x66, 0xf4, 0xa3, 0x5c, 0x13, 0xa8, 0x95, 0x2e]))
        
        do {
            /**
             Parameter Length: 10 (0x0A)
             Status: 0x00 - Success
             Num HCI Command Packets: 0x01
             Opcode: 0x040B (OGF: 0x01    OCF: 0x0B) - [Link Control] Link Key Request Reply
             Bluetooth Device Address: B0:70:2D:06:D2:AF
             Aug 02 17:19:16.714  HCI Event  0e 0a 01 0b 04 00 af d2 06 2d 70 b0
             */
            let eventHeader = HCIEventHeader(event: .commandComplete, parameterLength: 0x0a)
            
            hostController.queue.append(.event(eventHeader.data + [0x01, 0x0b, 0x04, 0x00, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x00]))
        }
        
        guard let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")
            else { XCTFail("Unable to init variable"); return }
        
        let linkKey = UInt128(littleEndian: UInt128(bytes: (0x3b, 0xf5, 0xfc, 0xa0, 0x63, 0x7c, 0x6d, 0xc2,
                                                            0x66, 0xf4, 0xa3, 0x5c, 0x13, 0xa8, 0x95, 0x2e)))
        
        (try await hostController.linkKeyRequestReply(address: address, linkKey: linkKey))
    }
    
    func testLinkKeyRequest() async throws {
        
        /**
         Parameter Length: 6 (0x06)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Aug 02 17:19:16.713  HCI Event  17 06 af d2 06 2d 70 b0
        */
        let data = Data([0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0])
        
        guard let event = HCILinkKeyRequest(data: data)
            else { XCTFail("Could not parse"); return }
        
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF"))
    }
    
    func testReadDataBlockSize() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 06 10:44:06.657  HCI Command      0x0000                     [100A] Read Data Block Size
         [100A] Opcode: 0x100A (OGF: 0x04    OCF: 0x0A)
         Parameter Length: 0 (0x00)
         Aug 06 10:44:06.657  HCI Command  0a 10 00
        */
        hostController.queue.append(.command(InformationalCommand.readDataBlockSize.opcode,
                                             [0x0a, 0x10, 0x00]))
        
        /**
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x100A (OGF: 0x04    OCF: 0x0A) - [Informational] Read Data Block Size
         Max ACL Data Packet Length: 4096 (0x1000)
         Max ACL Data Block Length: 22 (0x16)
         Total Number of Data Blocks: 64843 (0xFD4B)
         Aug 06 10:44:06.657  HCI Event  0e 04 01 0a 10 01
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x00, 0x0a, 0x10, 0x01]))
    }
    
    func testSetConnectionencryption() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 06 16:15:52.560  HCI Command      0x000D  00:00:00:00:00:00  [0413] Set Connection Encryption - 0x01 - Connection Handle: 0x000D
         [0413] Opcode: 0x0413 (OGF: 0x01    OCF: 0x13)
         Parameter Length: 3 (0x03)
         Connection Handle: 0x000D
         Encryption: 0x01
         Aug 06 16:15:52.560  HCI Command  13 04 03 0d 00 01
        */
        hostController.queue.append(.command(LinkControlCommand.setConnectionEncryption.opcode,
                                             [0x13, 0x04, 0x03, 0x0d, 0x00, 0x01]))
        
        /**
         Aug 06 16:15:52.561  HCI Event  0x0000  Command Status - Set Connection Encryption
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0413 (OGF: 0x01    OCF: 0x13) - [Link Control] Set Connection Encryption
         Aug 06 16:15:52.561  HCI Event  0f 04 00 01 13 04
         */
        hostController.queue.append(.event([0x0f, 0x04, 0x00, 0x01, 0x13, 0x04]))
        
        /**
         Aug 06 16:15:52.577  HCI Event  0x000D  00:00:00:00:00:00  Encryption Change Complete - Encryption Enabled
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Connection Handle: 0x000D
         Encryption Enable: 0x01
         Aug 06 16:15:52.577  HCI Event  0x0000 08 04 00 0d 00 01
        */
        hostController.queue.append(.event([0x08, 0x04, 0x00, 0x0d, 0x00, 0x01]))
        
        let event = try await hostController.setConnectionEncryption(handle: 0x000D, encryption: .enable)
        XCTAssertEqual(event.status, .success)
        XCTAssertEqual(event.handle, 0x000D)
        XCTAssertEqual(event.encryptionEnabled, .e0)
    }
    
    func testReadRemoteSupportedFeatures() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 06 19:30:32.896  HCI Command      0x000D  Carlos Duclos’s M  [041B] Read Remote Supported Features - Connection Handle: 0x000D
         [041B] Opcode: 0x041B (OGF: 0x01    OCF: 0x1B)
         Parameter Length: 2 (0x02)
         Connection Handle: 0x000D
         Aug 06 19:30:32.896  HCI Command  1b 04 02 0d 00
         */
        hostController.queue.append(.command(LinkControlCommand.readRemoteFeatures.opcode,
                                             [0x1b, 0x04, 0x02, 0x0d, 0x00]))
        
        /**
         Aug 06 19:30:32.896  HCI Event     0x0000    Command Status - Read Remote Supported Features
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x041B (OGF: 0x01    OCF: 0x1B) - [Link Control] Read Remote Supported Features
         Aug 06 19:30:32.896  HCI Event   0f 04 00 01 1b 04
         */
        hostController.queue.append(.event([0x0f, 0x04, 0x00, 0x01, 0x1b, 0x04]))
        
        /**
         Aug 06 19:30:32.896  HCI Event        0x000D  Carlos Duclos’s M  Read Remote Supported Features Complete
         Parameter Length: 11 (0x0B)
         Status: 0x00 - Success
         Connection Handle: 0x0D
         LMP Features: BD 02 04 38 08 00 00 00
         Aug 06 19:30:32.896  HCI Event        0x0000   0b 0b 00 0d 00 bd 02 04 38 08 00 00 00
         */
        hostController.queue.append(.event([0x0b, 0x0b, 0x00, 0x0d, 0x00, 0xbd, 0x02, 0x04, 0x38, 0x08, 0x00, 0x00, 0x00]))
        
        let data = Data([0xbd, 0x02, 0x04, 0x38, 0x08, 0x00, 0x00, 0x00])
        let value = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
        let features = BitMaskOptionSet<LMPFeature>(rawValue: value)
        
        var lmpFeatures: BitMaskOptionSet<LMPFeature>?
        (lmpFeatures = try await hostController.readRemoteSupportedFeatures(handle: 0x000D))
        XCTAssertEqual(lmpFeatures, features)
    }
    
    func testReadRemoteExtendedFeatures() async throws {
        
        let hostController = TestHostController()
        
        hostController.queue.append(.command(LinkControlCommand.readRemoteExtendedFeatures.opcode,
                                             [0x1c, 0x04, 0x03, 0x0d, 0x00, 0x01]))
     
        hostController.queue.append(.event([0x23, 0x0D, 0x00, 0x0c, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))
        
        let features = try await hostController.readRemoteExtendedFeatures(handle: 0x000D, pageNumber: 01)
        XCTAssert(features.isEmpty)
    }
    
    func testReadRemoteVersionInformation() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 06 19:30:32.895  HCI Command      0x000D  Carlos Duclos’s M  [041D] Read Remote Version Information - Connection Handle: 0x000D
         [041D] Opcode: 0x041D (OGF: 0x01    OCF: 0x1D)
         Parameter Length: 2 (0x02)
         Connection Handle: 0x000D
         Aug 06 19:30:32.895  HCI Command      0x0000  1d 04 02 0d 00
         */
        hostController.queue.append(.command(LinkControlCommand.readRemoteVersion.opcode,
                                             [0x1d, 0x04, 0x02, 0x0d, 0x00]))
        
        /**
         Aug 06 19:30:32.895  HCI Event  0x0000   Command Status - Read Remote Version Information
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x041D (OGF: 0x01    OCF: 0x1D) - [Link Control] Read Remote Version Information
         Aug 06 19:30:32.895  HCI Event   0x0000   0f 04 00 01 1d 04
         */
        hostController.queue.append(.event([0x0f, 0x04, 0x00, 0x01, 0x1d, 0x04]))
        
        /**
         Aug 06 19:30:32.895  HCI Event        0x000D  Carlos Duclos’s M  Read Remote Version Information Complete
         Parameter Length: 8 (0x08)
         Status: 0x00 - Success
         Connection Handle: 0x000D
         LMP Version: 0x03
         Manufacturer Name: 0x004C (Undecoded)
         LMP SubVersion: 0x031C
         Aug 06 19:30:32.895  HCI Event   0x0000   0c 08 00 0d 00 03 4c 00 1c 03
         */
        hostController.queue.append(.event([0x0c, 0x08, 0x00, 0x0d, 0x00, 0x03, 0x4c, 0x00, 0x1c, 0x03]))
        
        var versionInformation: HCIReadRemoteVersionInformationComplete?
        (versionInformation = try await hostController.readRemoteVersionInformation(handle: 0x000D))
        XCTAssertEqual(versionInformation?.version, 0x03)
        XCTAssertEqual(versionInformation?.companyId, 0x004c)
        XCTAssertEqual(versionInformation?.subversion, 0x031c)
    }
    
    func testAuthenticationRequested() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 06 19:30:33.031  HCI Command      0x000D  Carlos Duclos’s M  [0411] Authentication Requested - Connection Handle: 0x000D
         [0411] Opcode: 0x0411 (OGF: 0x01    OCF: 0x11)
         Parameter Length: 2 (0x02)
         Connection Handle: 0x000D
         Aug 06 19:30:33.031  HCI Command      0x0000     11 04 02 0d 00
         */
        hostController.queue.append(.command(LinkControlCommand.authenticationRequested.opcode,
                                             [0x11, 0x04, 0x02, 0x0d, 0x00]))
        
        /**
         Aug 06 19:30:33.032  HCI Event        0x0000                     Command Status - Authentication Requested
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0411 (OGF: 0x01    OCF: 0x11) - [Link Control] Authentication Requested
         Aug 06 19:30:33.032  HCI Event  0x0000  0f 04 00 01 11 04
         */
        hostController.queue.append(.event([0x0f, 0x04, 0x00, 0x01, 0x11, 0x04]))
        
        /**
         Aug 06 19:30:33.134  HCI Event        0x000D  Carlos Duclos’s M  Authentication Complete
         Parameter Length: 3 (0x03)
         Status: 0x00 - Success
         Connection Handle: 0x000D
         Aug 06 19:30:33.134  HCI Event    0x0000   06 03 00 0d 00
         */
        hostController.queue.append(.event([0x06, 0x03, 0x00, 0x0d, 0x00]))
        
        let event = try await hostController.authenticationRequested(handle: 0x000D)
        XCTAssertEqual(event.status, .success)
        XCTAssertEqual(event.handle, 0x000D)
    }
    
    func testChangeConnectionPacketType() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 06 19:30:32.896  HCI Command      0x000D  Carlos Duclos’s M  [040F] Change Connection Packet Type - Connection Handle: 0x000D
         [040F] Opcode: 0x040F (OGF: 0x01    OCF: 0x0F)
         Parameter Length: 4 (0x04)
         Connection Handle: 0x000D
         Packet Type: 0xCC18
         Aug 06 19:30:32.896  HCI Command    0x0000   0f 04 04 0d 00 18 cc                        .......
        */
        hostController.queue.append(.command(LinkControlCommand.authenticationRequested.opcode,
                                             [0x0f, 0x04, 0x04, 0x0d, 0x00, 0x18, 0xcc]))
        
        /**
         Aug 06 19:30:32.896  HCI Event        0x0000                     Command Status - Change Connection Packet Type
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x040F (OGF: 0x01    OCF: 0x0F) - [Link Control] Change Connection Packet Type
         Aug 06 19:30:32.896  HCI Event    0x0000    0f 04 00 01 0f 04                           ......
        */
        hostController.queue.append(.event([0x0f, 0x04, 0x00, 0x01, 0x0f, 0x04]))
        
        let packetType: PacketType = .acl(BitMaskOptionSet<ACLPacketType>(rawValue: 0xcc18))
        var caughtError: Error?
        do { let _ = try await hostController.changeConnectionPacketType(handle: 0x000D, packetType: packetType) }
        catch { caughtError = error }
        XCTAssertNotNil(caughtError)
    }
    
    func testLinkKeyRequestNegativeReply() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 09 17:22:43.298  HCI Command      0x0000  Carlos Duclos’s M  [040C] Link Key Request Negative Reply - 84:FC:FE:F3:F4:75
         [040C] Opcode: 0x040C (OGF: 0x01    OCF: 0x0C)
         Parameter Length: 6 (0x06)
         Bluetooth Device Address: 84:FC:FE:F3:F4:75
         Aug 09 17:22:43.298  HCI Command    0x0000    0c 04 06 75 f4 f3 fe fc 84
         */
        hostController.queue.append(.command(LinkControlCommand.linkKeyNegativeReply.opcode,
                                             [0x0c, 0x04, 0x06, 0x75, 0xf4, 0xf3, 0xfe, 0xfc, 0x84]))
        
        /**
         Aug 09 17:22:43.298  HCI Event        0x0000  Carlos Duclos’s M  Command Complete [040C] - Link Key Request Negative Reply - 84:FC:FE:F3:F4:75
         Parameter Length: 10 (0x0A)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x040C (OGF: 0x01    OCF: 0x0C) - [Link Control] Link Key Request Negative Reply
         Bluetooth Device Address: 84:FC:FE:F3:F4:75
         Aug 09 17:22:43.298  HCI Event        0x0000   0e 0a 01 0c 04 00 75 f4 f3 fe fc 84
         */
        hostController.queue.append(.event([0x0e, 0x0a, 0x01, 0x0c, 0x04, 0x00, 0x75, 0xf4, 0xf3, 0xfe, 0xfc, 0x84]))
        
        guard let address = BluetoothAddress(rawValue: "84:FC:FE:F3:F4:75")
            else { XCTFail("Unable to init variable"); return }
        
        let eventAddress = try await hostController.linkKeyRequestNegativeReply(address: address)
        XCTAssertEqual(eventAddress, address)
    }
    
    func testPINCodeRequestReply() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 09 17:22:43.300  HCI Command      0x0000  Carlos Duclos’s M  [040D] PIN Code Request Reply - 84:FC:FE:F3:F4:75
         [040D] Opcode: 0x040D (OGF: 0x01    OCF: 0x0D)
         Parameter Length: 23 (0x17)
         Bluetooth Device Address: 84:FC:FE:F3:F4:75
         PIN Code Length: 0x04
         PIN Code: 0000 (0x30 30 30 30 00 00 00 00 00 00 00 00 00 00 00 00)
         Aug 09 17:22:43.300  HCI Command      0x0000  0d 04 17 75 f4 f3 fe fc 84 04 30 30 30 30 00 00 00 00 00 00 00 00 00 00 00 00
         */
        hostController.queue.append(.command(LinkControlCommand.pinCodeReply.opcode,
                                             [0x0d, 0x04, 0x17, 0x75, 0xf4, 0xf3, 0xfe, 0xfc, 0x84, 0x04, 0x30, 0x30, 0x30,
                                              0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))
        
        /**
         Aug 09 17:22:43.302  HCI Event        0x0000  Carlos Duclos’s M  Command Complete [040D] - PIN Code Request Reply - 84:FC:FE:F3:F4:75
         Parameter Length: 10 (0x0A)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x040D (OGF: 0x01    OCF: 0x0D) - [Link Control] PIN Code Request Reply
         Bluetooth Device Address: 84:FC:FE:F3:F4:75
         Aug 09 17:22:43.302  HCI Event        0x0000    0e 0a 01 0d 04 00 75 f4 f3 fe fc 84
        */
        hostController.queue.append(.event([0x0e, 0x0a, 0x01, 0x0d, 0x04, 0x00, 0x75, 0xf4, 0xf3, 0xfe, 0xfc, 0x84]))
        
        guard let address = BluetoothAddress(rawValue: "84:FC:FE:F3:F4:75")
            else { XCTFail("Unable to init variable"); return }
        
        guard let length = HCIPINCodeRequestReply.PINCodeLength(rawValue: 0x04)
            else { XCTFail("Unable to init variable"); return }
        
        let data = Data([0x30, 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        let pinCode = UInt128(littleEndian: UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7],
                                                            data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15])))
        
        let eventAddress = try await hostController.pinCodeRequestReply(
            address: address,
            pinCodeLength: length,
            pinCode: pinCode
        )
        XCTAssertEqual(eventAddress, address)
    }
    
    func testPINCodeRequest() async throws {
        
        /**
         Aug 09 17:22:43.298  HCI Event        0x0000  Carlos Duclos’s M  PIN code request - 84:FC:FE:F3:F4:75
         Parameter Length: 6 (0x06)
         Bluetooth Device Address: 84:FC:FE:F3:F4:75
         Aug 09 17:22:43.298  HCI Event        0x0000  16 06 75 f4 f3 fe fc 84
        */
        let data = Data([0x75, 0xf4, 0xf3, 0xfe, 0xfc, 0x84])
        
        guard let event = HCIPINCodeRequest(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "84:FC:FE:F3:F4:75")!)
    }
    
    func testLinkKeyNotification() async throws {
        
        /**
         Aug 09 17:22:43.380  HCI Event        0x0000  Carlos Duclos’s M  Link Key Notification - 84:FC:FE:F3:F4:75
         Parameter Length: 23 (0x17)
         Bluetooth Device Address: 84:FC:FE:F3:F4:75
         Link Key: 0xCCE5E51BF2FD53D43C149F83EC55300F
         Key Type: 0x00
         */
        let data = Data([0x75, 0xf4, 0xf3, 0xfe, 0xfc, 0x84, 0x0f, 0x30, 0x55, 0xec, 0x83, 0x9f, 0x14, 0x3c, 0xd4, 0x53, 0xfd, 0xf2, 0x1b, 0xe5, 0xe5, 0xcc, 0x00])
        
        guard let event = HCILinkKeyNotification(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "84:FC:FE:F3:F4:75")!)
    }
    
    func testModeChange() async throws {
        
        /**
         Aug 09 17:22:45.417  HCI Event        0x000D  Carlos Duclos’s M  Mode Change - Sniff Mode - 0.011250 seconds -  - Handle: 0x000D
         Parameter Length: 6 (0x06)
         Status: 0x00 - Success
         Connection Handle: 0x000D
         Current Mode: Sniff - 2.880000 seconds (0x02)
         Interval: 0x0000 (0 ms)
         Aug 09 17:22:45.417  HCI Event        0x0000  14 06 00 0d 00 02 12 00
         */
        let data = Data([0x00, 0x0d, 0x00, 0x02, 0x12, 0x00])
        
        guard let event = HCIModeChange(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.status.rawValue, HCIStatus(rawValue: 0x00)?.rawValue)
        XCTAssertEqual(event.handle, 0x000D)
        XCTAssertEqual(event.currentMode, HCIModeChange.Mode(rawValue: 0x02)!)
    }
    
    func testWriteLinkPolicySettings() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 09 17:22:43.293  HCI Command      0x000D  Carlos Duclos’s M  [080D] Write Link Policy Settings - Connection Handle: 0x000D
         [080D] Opcode: 0x080D (OGF: 0x02    OCF: 0x0D)
         Parameter Length: 4 (0x04)
         Connection Handle: 0x000D
         Link Policy Settings: 0x000F
         Master/Slave Switch: Enabled
         Hold Mode:           Enabled
         Sniff Mode:          Enabled
         Park Mode:           Enabled
         Aug 09 17:22:43.293  HCI Command      0x0000  0d 08 04 0d 00 0f 00
         */
        hostController.queue.append(.command(LinkPolicyCommand.writeLinkPolicySettings.opcode,
                                             [0x0d, 0x08, 0x04, 0x0d, 0x00, 0x0f, 0x00]))
        /**
         Aug 09 17:22:43.293  HCI Event        0x0000                     Command Complete [080D] - Write Link Policy Settings
         Parameter Length: 6 (0x06)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x080D (OGF: 0x02    OCF: 0x0D) - [Link Policy] Write Link Policy Settings
         Connection Handle: 0x000D
         Aug 09 17:22:43.293  HCI Event        0x0000   0e 06 01 0d 08 00 0d 00
         */
        hostController.queue.append(.event([0x0e, 0x06, 0x01, 0x0d, 0x08, 0x00, 0x0d, 0x00]))
        
        let event = try await hostController.writeLinkPolicySettings(
            connectionHandle: 0x000D,
            settings: BitMaskOptionSet<HCIWriteLinkPolicySettings.LinkPolicySettings>(rawValue: 0x000F))
        XCTAssertEqual(event.connectionHandle, 0x000D)
    }
    
    func testQoSSetup() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 09 17:22:45.336  HCI Command      0x000D  Carlos Duclos’s M  [0807] QoS Setup - Connection Handle: 0x000D
         [0807] Opcode: 0x0807 (OGF: 0x02    OCF: 0x07)
         Parameter Length: 20 (0x14)
         Connection Handle: 0x000D
         Flags: 0x00
         Service Type: 0x02
         Token Rate: 0x00000000
         Peak Bandwidth: 0x00000000
         Latency: 0x00002BF2
         Delay Variation: 0xFFFFFFFF
         
         */
        hostController.queue.append(.command(LinkPolicyCommand.qosSetup.opcode,
                                             [0x07, 0x08, 0x14, 0x0d, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
                                              0x00, 0x00, 0x00, 0xf2, 0x2b, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff]))
        
        /**
         Aug 09 17:22:45.337  HCI Event        0x0000                     Command Status - QoS Setup
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0807 (OGF: 0x02    OCF: 0x07) - [Link Policy] QoS Setup
         Aug 09 17:22:45.337  HCI Event        0x0000  0f 04 00 01 07 08
         */
        hostController.queue.append(.event([0x0f, 0x04, 0x00, 0x01, 0x07, 0x08]))
        
        /**
         Aug 09 17:22:45.345  HCI Event        0x000D  Carlos Duclos’s M  QoS Setup Complete
         Parameter Length: 21 (0x15)
         Status: 0x00 - Success
         Connection Handle: 0x000D
         Flags: 0x00
         Service Type: 0x02
         Token Rate: 0x00000001
         Peak Bandwidth: 0x00000000
         Latency: 0x00002BF2
         Delay Variation: 0xFFFFFFFFx
        */
        hostController.queue.append(.event([0x0d, 0x15, 0x00, 0x0d, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00,
                                            0x00, 0x00, 0x00, 0x00, 0xf2, 0x2b, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff]))
        
        guard let serviceType = HCIQoSSetup.ServiceType(rawValue: 0x02)
            else { XCTFail("Unable to parse service type"); return }
        
        let event = try await hostController.qosSetup(connectionHandle: 0x000D,
                                                     serviceType: serviceType,
                                                     tokenRate: 0x00000000,
                                                     peakBandWidth: 0x00000000,
                                                     latency: 0x00002BF2,
                                                     delayVariation: 0xFFFFFFFF)
        XCTAssertEqual(event.connectionHandle, 0x000D)
        XCTAssertEqual(event.serviceType, serviceType)
    }
    
    func testReadPageTimeout() async throws {
        
        let hostController = TestHostController()
        
        /**
         [0C17] Opcode: 0x0C17 (OGF: 0x03    OCF: 0x17)
         Parameter Length: 0 (0x00)
         Aug 09 17:22:36.898  HCI Command      0x0000    17 0c 00
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.readPageTimeout.opcode, [0x17, 0x0c, 0x00]))
        
        /**
         Aug 09 17:22:36.899  HCI Event        0x0000  Command Complete [0C17] - Read Page Timeout - Page Timeout: 0x4000 (10.24 s)
         Parameter Length: 6 (0x06)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C17 (OGF: 0x03    OCF: 0x17) - [Host Controller] Read Page Timeout
         Page Timeout: 0x4000 (10.24 s)
         Aug 09 17:22:36.899  HCI Event        0x0000  0e 06 01 17 0c 00 00 40
         */
        hostController.queue.append(.event([0x0e, 0x06, 0x01, 0x17, 0x0c, 0x00, 0x00, 0x40]))
        
        var readPageTimeout: HCIReadPageTimeoutReturn?
        (readPageTimeout = try await hostController.readPageTimeout())
        XCTAssertEqual(readPageTimeout?.pageTimeout.rawValue, 0x4000)
        XCTAssertEqual(readPageTimeout?.pageTimeout.duration, 10.24)
    }
    
    func testWriteLinkSupervisionTimeout() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 09 17:22:45.318  HCI Command      0x000D  Carlos Duclos’s M  [0C37] Write Link Supervision Timeout - Connection Handle: 0x000D
         [0C37] Opcode: 0x0C37 (OGF: 0x03    OCF: 0x37)
         Parameter Length: 4 (0x04)
         Connection Handle: 0x000D
         Link Supervision Timeout: 0x1F40
         5000.000000 ms
         Aug 09 17:22:45.318  HCI Command      0x0000   37 0c 04 0d 00 40 1f
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.writeLinkSupervisionTimeout.opcode,
                                             [0x37, 0x0c, 0x04, 0x0d, 0x00, 0x40, 0x1f]))
        
        /**
         Aug 09 17:22:45.318  HCI Event        0x0000                     Command Complete [0C37] - Write Link Supervision Timeout - Connection Handle: 0x000D
         Parameter Length: 6 (0x06)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C37 (OGF: 0x03    OCF: 0x37) - [Host Controller] Write Link Supervision Timeout
         Connection Handle: 0x000D
         Aug 09 17:22:45.318  HCI Event        0x0000   0e 06 01 37 0c 00 0d 00
         */
        hostController.queue.append(.event([0x0e, 0x06, 0x01, 0x37, 0x0c, 0x00, 0x0d, 0x00]))
        
        let timeout = HCIWriteLinkSupervisionTimeout.LinkSupervisionTimeout(rawValue: 0x1F40)
        
        var writeTimeout: HCIWriteLinkSupervisionTimeoutReturn?
        (writeTimeout = try await hostController.writeLinkSupervisionTimeout(handle: 0x000D,
                                                                                       linkSupervisionTimeout: timeout))
        XCTAssertEqual(writeTimeout?.handle, 0x000D)
    }
    
    func testNumberOfCompletedPackets() async throws {
        
        /**
         Aug 09 17:22:45.343  HCI Event        0x000D  Carlos Duclos’s M  Number of Completed Packets - Handle: 0x000D - Packets: 0x0001
         Parameter Length: 5 (0x05)
         Number of Handles: 0x01
         Connection Handle: 0x000D
         Number of Packets: 0x0001
         Aug 09 17:22:45.343  HCI Event        0x0000   13 05 01 0d 00 01 00
         */
        let data = Data([0x01, 0x0d, 0x00, 0x01, 0x00])
        
        guard let event = HCINumberOfCompletedPackets(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.numberOfHandles, 0x01)
        XCTAssertEqual(event.connectionHandle, 0x000D)
        XCTAssertEqual(event.numberOfCompletedPackets, 0x0001)
    }
    
    func testReset() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:08.054  HCI Command      0x0000                     [0C03] Reset
         [0C03] Opcode: 0x0C03 (OGF: 0x03    OCF: 0x03)
         Parameter Length: 0 (0x00)
         Aug 02 17:18:08.054  HCI Command      0x0000   03 0c 00
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.reset.opcode,
                                             [0x03, 0x0c, 0x00]))
        
        /**
         Aug 02 17:18:08.550  HCI Event        0x0000                     Command Complete [0C03] - Reset
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C03 (OGF: 0x03    OCF: 0x03) - [Host Controller] Reset
         Aug 02 17:18:08.550  HCI Event        0x0000   0e 04 01 03 0c 00
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x03, 0x0c, 0x00]))
        
        (try await hostController.reset())
    }
    
    func testReadStoredLinkKey() async throws {
    
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:10.102  HCI Command      0x0000                     [0C0D] Read Stored Link Key
         [0C0D] Opcode: 0x0C0D (OGF: 0x03    OCF: 0x0D)
         Parameter Length: 7 (0x07)
         Bluetooth Device Address: (null)
         Read All Flag: 0x01
         Return link key for Device Address.
         Aug 02 17:18:10.102  HCI Command      0x0000  0d 0c 07 7e 8a 94 90 85 8c 01
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.readStoredLinkKey.opcode,
                                             [0x0d, 0x0c, 0x07, 0x7e, 0x8a, 0x94, 0x90, 0x85, 0x8c, 0x01]))
        
        /**
         Aug 02 17:18:10.102  HCI Event        0x0000                     Command Complete [0C0D] - Read Stored Link Key - Num Keys Read: 0x0000
         Parameter Length: 8 (0x08)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C0D (OGF: 0x03    OCF: 0x0D) - [Host Controller] Read Stored Link Key
         Max Num Keys: 0x0007
         Num Keys Read: 0x0000
         Aug 02 17:18:10.102  HCI Event        0x0000   0e 08 01 0d 0c 00 07 00 00 00
         */
        hostController.queue.append(.event([0x0e, 0x08, 0x01, 0x0d, 0x0c, 0x00, 0x07, 0x00, 0x00, 0x00]))
        
        let event = try await hostController.readStoredLinkKey(
            address: BluetoothAddress(rawValue: "8C:85:90:94:8A:7E")!,
            readFlag: HCIReadStoredLinkKey.ReadFlag(rawValue: 0x01)!
        )
        XCTAssertEqual(event.maxNumberKeys, 7)
        XCTAssertEqual(event.numberKeysRead, 0)
    }
    
    func testReadLocalSupportedFeatures() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:10.101  HCI Command      0x0000                     [1003] Read Local Supported Features
         [1003] Opcode: 0x1003 (OGF: 0x04    OCF: 0x03)
         Parameter Length: 0 (0x00)
         Aug 02 17:18:10.101  HCI Command      0x0000   03 10 00
         */
        hostController.queue.append(.command(InformationalCommand.readLocalSupportedFeatures.opcode,
                                             [0x03, 0x10, 0x00]))
        
        /**
         Aug 02 17:18:10.102  HCI Event        0x0000                     Command Complete [1003] - Read Local Supported Features
         Parameter Length: 12 (0x0C)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x1003 (OGF: 0x04    OCF: 0x03) - [Informational] Read Local Supported Features
         LMP Features:
         0, BF 1 1 1 1 1 1 0 1
         1, FE 0 1 1 1 1 1 1 1
         2, CF 1 1 1 1 0 0 1 1
         3, FE 0 1 1 1 1 1 1 1
         4, DB 1 1 0 1 1 0 1 1
         5, FF 1 1 1 1 1 1 1 1
         6, 7B 1 1 0 1 1 1 1 0
         7, 87 1 1 1 0 0 0 0 1
         Aug 02 17:18:10.102  HCI Event        0x0000  0e 0c 01 03 10 00 bf fe cf fe db ff 7b 87
         */
        hostController.queue.append(.event([0x0e, 0x0c, 0x01, 0x03, 0x10, 0x00, 0xbf,
                                            0xfe, 0xcf, 0xfe, 0xdb, 0xff, 0x7b, 0x87]))
        
        let data = Data([0xbf, 0xfe, 0xcf, 0xfe, 0xdb, 0xff, 0x7b, 0x87])
        let value = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
        let features = BitMaskOptionSet<LMPFeature>(rawValue: value)

        var lmpFeatures: BitMaskOptionSet<LMPFeature>?
        (lmpFeatures = try await hostController.readLocalSupportedFeatures())
        XCTAssertEqual(lmpFeatures, features)
    }
    
    func testWriteClassOfDevice() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:10.112  HCI Command      0x0000                     [0C24] Write Class of Device
         [0C24] Opcode: 0x0C24 (OGF: 0x03    OCF: 0x24)
         Parameter Length: 3 (0x03)
         Class of device: 0x38010C
         Service Class: 0x01C0
         Capturing
         Object Transfer
         Audio
         Major Class: 0x0001
         Computer
         Minor Class: 0x0003
         Laptop
         Aug 02 17:18:10.112  HCI Command      0x0000   24 0c 03 0c 01 38
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.writeClassOfDevice.opcode,
                                             [0x24, 0x0c, 0x03, 0x0c, 0x01, 0x38]))
        
        /**
         Aug 02 17:18:10.112  HCI Event        0x0000                     Command Complete [0C24] - Write Class of Device
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C24 (OGF: 0x03    OCF: 0x24) - [Host Controller] Write Class of Device
         Aug 02 17:18:10.112  HCI Event        0x0000  0e 04 01 24 0c 00
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x24, 0x0c, 0x00]))
        
        guard let classOfDevice = ClassOfDevice(data: Data([0x0C, 0x01, 0x38]))
            else { XCTFail("Failed to init class of device"); return }
        
        (try await hostController.writeClassOfDevice(classOfDevice: classOfDevice))
    }
    
    func testReadClassOfDevice() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:10.124  HCI Command      0x0000                     [0C23] Read Class of Device
         [0C23] Opcode: 0x0C23 (OGF: 0x03    OCF: 0x23)
         Parameter Length: 0 (0x00)
         Aug 02 17:18:10.124  HCI Command      0x0000   23 0c 00
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.readClassOfDevice.opcode,
                                             [0x23, 0x0c, 0x00]))
        
        /**
         Aug 02 17:18:10.124  HCI Event        0x0000                     Command Complete [0C23] - Read Class of Device
         Parameter Length: 7 (0x07)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C23 (OGF: 0x03    OCF: 0x23) - [Host Controller] Read Class of Device
         Class of Device: 0x38010C
         Service Class: 0x01C0
         Capturing
         Object Transfer
         Audio
         Major Class: 0x0001
         Computer
         Minor Class: 0x0003
         Laptop
         Aug 02 17:18:10.124  HCI Event        0x0000   0e 07 01 23 0c 00 0c 01 38
         */
        hostController.queue.append(.event([0x0e, 0x07, 0x01, 0x23, 0x0c, 0x00, 0x0c, 0x01, 0x38]))
        
        var readClassOfDevice: ClassOfDevice?
        (readClassOfDevice = try await hostController.readClassOfDevice())
        
        guard let classOfDevice = readClassOfDevice
            else { XCTFail("Failed to init class of device"); return }
        
        XCTAssertTrue(classOfDevice.majorServiceClass.contains(.capturing))
        XCTAssertTrue(classOfDevice.majorServiceClass.contains(.objectTransfer))
        XCTAssertTrue(classOfDevice.majorServiceClass.contains(.audio))
        
        guard case let .computer(computer) = classOfDevice.majorDeviceClass
            else { XCTFail("Incorrect major device class"); return }
        
        guard computer == .laptop
            else { XCTFail("minor device class is wrong"); return }
    }
    
    func testWriteScanEnable() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:10.227  HCI Command      0x0000                     [0C1A] Write Scan Enable - Requesting Scan State: 0x03
         [0C1A] Opcode: 0x0C1A (OGF: 0x03    OCF: 0x1A)
         Parameter Length: 1 (0x01)
         Scan Enable: 0x03
         Inquiry Scan Enabled, Page Scan Enabled
         Aug 02 17:18:10.227  HCI Command      0x0000   1a 0c 01 03
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.writeScanEnable.opcode,
                                             [0x1a, 0x0c, 0x01, 0x03]))
        
        /**
         Aug 02 17:18:10.227  HCI Event        0x0000                     Command Complete [0C1A] - Write Scan Enable
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C1A (OGF: 0x03    OCF: 0x1A) - [Host Controller] Write Scan Enable
         Aug 02 17:18:10.227  HCI Event        0x0000  0e 04 01 1a 0c 00

         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x1a, 0x0c, 0x00]))
        
        let scanEnable = HCIWriteScanEnable.ScanEnable(rawValue: 0x03)
        (try await hostController.writeScanEnable(scanEnable: scanEnable!))
    }
    
    func testWritePageScanType() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:10.128  HCI Command      0x0000                     [0C47] Write Page Scan Type
         [0C47] Opcode: 0x0C47 (OGF: 0x03    OCF: 0x47)
         Parameter Length: 1 (0x01)
         Page Scan Type: 0x01
         Interlaced Page Scan Type. Optional
         Aug 02 17:18:10.128  HCI Command      0x0000  47 0c 01 01
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.writePageScanType.opcode,
                                             [0x47, 0x0c, 0x01, 0x01]))
        
        /**
         Aug 02 17:18:10.128  HCI Event        0x0000                     Command Complete [0C47] - Write Page Scan Type
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C47 (OGF: 0x03    OCF: 0x47) - [Host Controller] Write Page Scan Type
         Aug 02 17:18:10.128  HCI Event        0x0000  0e 04 01 47 0c 00
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x47, 0x0c, 0x00]))
        
        let pageScanType = HCIWritePageScanType.PageScanType(rawValue: 0x01)
        (try await hostController.writePageScanType(pageScanType: pageScanType!))
    }
    
    func testWritePageScanActivity() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 02 17:18:10.128  HCI Command      0x0000                     [0C1C] Write Page Scan Activity - 11.25/640 (ms)
         [0C1C] Opcode: 0x0C1C (OGF: 0x03    OCF: 0x1C)
         Parameter Length: 4 (0x04)
         Page Scan Interval: 0x0400 (640 ms)
         Page Scan Window: 0x0012 (11.25 ms)
         Aug 02 17:18:10.128  HCI Command      0x0000   1c 0c 04 00 04 12 00
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.writePageScanActivity.opcode,
                                             [0x1c, 0x0c, 0x04, 0x00, 0x04, 0x12, 0x00]))
        
        /**
         Aug 02 17:18:10.129  HCI Event        0x0000                     Command Complete [0C1C] - Write Page Scan Activity
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C1C (OGF: 0x03    OCF: 0x1C) - [Host Controller] Write Page Scan Activity
         Aug 02 17:18:10.129  HCI Event        0x0000   0e 04 01 1c 0c 00
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x1c, 0x0c, 0x00]))
        
        let scanInterval = HCIWritePageScanActivity.PageScanInterval(rawValue: 0x0400)
        let scanWindow = HCIWritePageScanActivity.PageScanWindow(rawValue: 0x0012)
        
        (try await hostController.writePageScanActivity(scanInterval: scanInterval!,
                                                                  scanWindow: scanWindow!))
    }
    
    func testIOCapabilityRequestReply() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 16 17:57:32.832  HCI Command      0x0000  iPhone             [042B] IO Capability Request Reply - B0:70:2D:06:D2:AF
         [042B] Opcode: 0x042B (OGF: 0x01    OCF: 0x2B)
         Parameter Length: 9 (0x09)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         IO Capability: 0x01 (Display Yes No)
         OOB Data Present: 0x00
         Authentication Requirements: 0x02 (MITM protection not required and dedicated bonding required)
         Aug 16 17:57:32.832  HCI Command      0x0000   2b 04 09 af d2 06 2d 70 b0 01 00 02
         */
        hostController.queue.append(.command(LinkControlCommand.ioCapabilityRequestReply.opcode,
                                             [0x2b, 0x04, 0x09, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x01, 0x00, 0x02]))
        
        /**
         Aug 16 17:57:32.832  HCI Event        0x0000                     Command Complete [042B] - IO Capability Request Reply
         Parameter Length: 10 (0x0A)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x042B (OGF: 0x01    OCF: 0x2B) - [Link Control] IO Capability Request Reply
         Aug 16 17:57:32.832  HCI Event        0x0000   0e 0a 01 2b 04 00 af d2 06 2d 70 b0
         */
        hostController.queue.append(.event([0x0e, 0x0a, 0x01, 0x2b, 0x04, 0x00, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0]))
        
        guard let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")
            else { XCTFail("Cannot init address"); return }
        
        guard let ioCapability = HCIIOCapabilityRequestReply.IOCapability(rawValue: 0x01)
            else { XCTFail("Cannot init ioCapability"); return }
        
        guard let dataPresent = HCIIOCapabilityRequestReply.OBBDataPresent(rawValue: 0x00)
            else { XCTFail("Cannot init daatPresent"); return }
        
        guard let authenticationRequeriments = HCIIOCapabilityRequestReply.AuthenticationRequirements(rawValue: 0x02)
            else { XCTFail("Cannot init daatPresent"); return }
        
        let eventAddress = try await hostController.ioCapabilityRequestReply(
            address: address,
            ioCapability: ioCapability,
            obbDataPresent: dataPresent,
            authenticationRequirements: authenticationRequeriments
        )
        XCTAssertEqual(eventAddress, address)
    }
    
    func testIOCapabilityRequest() async throws {
        
        /**
         Aug 16 17:57:32.829  HCI Event        0x0000  iPhone             IO Capability Request - B0:70:2D:06:D2:AF
         Parameter Length: 6 (0x06)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Aug 16 17:57:32.829  HCI Event        0x0000  31 06 af d2 06 2d 70 b0
         */
        let data = Data([0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0])
        
        guard let event = HCIIOCapabilityRequest(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")!)
    }
    
    func testIOCapabilityResponse() async throws {
        
        /**
         Aug 17 09:58:05.836  HCI Event        0x0000  iPhone             IO Capability Response - B0:70:2D:06:D2:AF
         Parameter Length: 9 (0x09)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         IO Capability: 0x01 (Display Yes No)
         OOB Data Present: 0x00
         Authentication Requirements: 0x03 (MTIM prorection and dedicated bonding required)
         Aug 17 09:58:05.836  HCI Event        0x0000                     00000000: 32 09 af d2 06 2d 70 b0 01 00 03
         */
        let data = Data([0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0x01, 0x00, 0x03])
        
        guard let event = HCIIOCapabilityResponse(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")!)
    }
    
    func testUserConfirmationRequestReply() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 17 09:58:05.937  HCI Command      0x0000  iPhone             [042C] User Confirmation Request Reply - B0:70:2D:06:D2:AF
         [042C] Opcode: 0x042C (OGF: 0x01    OCF: 0x2C)
         Parameter Length: 6 (0x06)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Aug 17 09:58:05.937  HCI Command      0x0000                     00000000: 2c 04 06 af d2 06 2d 70 b0
         */
        hostController.queue.append(.command(LinkControlCommand.userConfirmationRequestReply.opcode,
                                             [0x2c, 0x04, 0x06, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0]))
        
        /**
         Aug 17 09:58:05.939  HCI Event        0x0000                     Command Complete [042C] - User Confirmation Request Reply
         Parameter Length: 10 (0x0A)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x042C (OGF: 0x01    OCF: 0x2C) - [Link Control] User Confirmation Request Reply
         Aug 17 09:58:05.939  HCI Event        0x0000                     00000000: 0e 0a 01 2c 04 00 af d2 06 2d 70 b0
         */
        hostController.queue.append(.event([0x0e, 0x0a, 0x01, 0x2c, 0x04, 0x00, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0]))
        
        guard let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")
            else { XCTFail("Unable to init address"); return }
        
        let eventAddress = try await hostController.userConfirmationRequestReply(address: address)
        XCTAssertEqual(eventAddress, address)
    }
    
    func testUserConfirmationRequest() async throws {
        
        /**
         Aug 17 09:58:05.935  HCI Event        0x0000  iPhone             User Confirmation Request - B0:70:2D:06:D2:AF
         Parameter Length: 10 (0x0A)
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Numeric Value: 715438
         Aug 17 09:58:05.935  HCI Event        0x0000   33 0a af d2 06 2d 70 b0 ae ea 0a 00
         */
        let data = Data([0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0, 0xae, 0xea, 0x0a, 0x00])
        
        guard let event = HCIUserConfirmationRequest(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")!)
    }
    
    func testConnectionPacketTypeChange() async throws {
        
        /**
         Aug 17 09:58:05.811  HCI Event        0x000B  iPhone             Connection Packet Type Changed
         Parameter Length: 5 (0x05)
         Status: 0x00 - Success
         Connection Handle: 0x000B
         Packet Type: 0xCC18
         Aug 17 09:58:05.811  HCI Event        0x0000                     00000000: 1d 05 00 0b 00 18 cc
         */
        let data = Data([0x00, 0x0b, 0x00, 0x18, 0xcc])
        
        guard let event = HCIConnectionPacketTypeChange(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.status.rawValue, 0x00)
        XCTAssertEqual(event.connectionHandle, 0x000B)
        XCTAssertEqual(event.packetType, 0xCC18)
    }
    
    func testMaxSlotsChange() async throws {
        
        /**
         Aug 17 09:58:05.806  HCI Event        0x000B  iPhone             Max slots change - Max slots: 0x05 -
         Parameter Length: 3 (0x03)
         Connection Handle: 0x000B
         LMP Max Slots: 0x05
         Aug 17 09:58:05.806  HCI Event        0x0000                     00000000: 1b 03 0b 00 05

         */
        let data = Data([0x0b, 0x00, 0x05])
        
        guard let event = HCIMaxSlotsChange(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.connectionHandle, 0x000B)
        XCTAssertEqual(event.maxSlotsLMP, 0x05)
    }
    
    func testWritePageTimeout() async throws {
        
        let hostController = TestHostController()
        
        /**
         Aug 17 09:58:04.840  HCI Command      0x0000                     [0C18] Write Page Timeout - 0x4000 (10.24 s)
         [0C18] Opcode: 0x0C18 (OGF: 0x03    OCF: 0x18)
         Parameter Length: 2 (0x02)
         Page Timeout: 0x4000 (10240 ms)
         Aug 17 09:58:04.840  HCI Command      0x0000                     00000000: 18 0c 02 00 40
         */
        hostController.queue.append(.command(HostControllerBasebandCommand.writePageTimeout.opcode,
                                             [0x18, 0x0c, 0x02, 0x00, 0x40]))
        
        /**
         Aug 17 09:58:04.840  HCI Event        0x0000                     Command Complete [0C18] - Write Page Timeout
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x0C18 (OGF: 0x03    OCF: 0x18) - [Host Controller] Write Page Timeout
         Aug 17 09:58:04.840  HCI Event        0x0000                     00000000: 0e 04 01 18 0c 00
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x18, 0x0c, 0x00]))
        
        guard let pageTimeout = HCIWritePageTimeout.PageTimeout(rawValue: 0x4000)
            else { XCTFail("Unable to init pageTimeout"); return }
        
        (try await hostController.writePageTimeout(pageTimeout: pageTimeout))
    }
    
    func testSimplePairingComplete() async throws {
        
        /**
         Aug 17 09:58:58.511  HCI Event        0x0000  iPhone             Simple Pairing Complete - B0:70:2D:06:D2:AF
         Parameter Length: 7 (0x07)
         Status: 0x00 - Success
         Bluetooth Device Address: B0:70:2D:06:D2:AF
         Aug 17 09:58:58.511  HCI Event        0x0000                     00000000: 36 07 00 af d2 06 2d 70 b0
         */
        let data = Data([0x00, 0xaf, 0xd2, 0x06, 0x2d, 0x70, 0xb0])
        
        guard let event = HCISimplePairingComplete(data: data)
            else { XCTFail("Unable to parse event"); return }
        
        XCTAssertEqual(event.status.rawValue, 0x00)
        XCTAssertEqual(event.address, BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")!)
    }
}

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
