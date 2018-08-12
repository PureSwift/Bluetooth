//
//  iBeaconTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class iBeaconTests: XCTestCase {
    
    static let allTests = [
        ("testData", testData),
        ("testCommand", testCommand),
        ("testEstimoteBeacon", testEstimoteBeacon)
    ]
    
    func testData() {
        
        let flags: GAPFlags = 0x1a
        
        let beacon = AppleBeacon(uuid: UUID(uuidString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")!,
                                 major: 0xAA,
                                 minor: 0xBB,
                                 rssi: Int8(bitPattern: 0xb3))
        
        let advertisingData = LowEnergyAdvertisingData(beacon: beacon, flags: flags)
        
        let testData = LowEnergyAdvertisingData(length: 30, bytes: (
            0x02, //    Data length – 2 bytes    constant preamble
            0x01, //    Data type – flags    constant preamble
            0x1a, //    LE and BR/EDR flag    constant preamble
            0x1a, //    Data length – 26 bytes    constant preamble
            0xff, //    Data type - manufacturer specific data    constant preamble
            0x4c, //    Manufacturer data    constant preamble
            0x00, //    Manufacturer data    constant preamble
            0x02, //    Manufacturer data    constant preamble
            0x15, //    Manufacturer data    constant preamble
            0xf7, //    Proximity UUID 1st byte    set user UUID
            0x82, //    Proximity UUID 2nd byte    set user UUID
            0x6d, //    Proximity UUID 3rd byte    set user UUID
            0xa6, //    Proximity UUID 4th byte    set user UUID
            0x4f, //    Proximity UUID 5th byte    set user UUID
            0xa2, //    Proximity UUID 6th byte    set user UUID
            0x4e, //    Proximity UUID 7th byte    set user UUID
            0x98, //    Proximity UUID 8th byte    set user UUID
            0x80, //    Proximity UUID 9th byte    set user UUID
            0x24, //    Proximity UUID 10th byte    set user UUID
            0xbc, //    Proximity UUID 11th byte    set user UUID
            0x5b, //    Proximity UUID 12th byte    set user UUID
            0x71, //    Proximity UUID 13th byte    set user UUID
            0xe0, //    Proximity UUID 14th byte    set user UUID
            0x89, //    Proximity UUID 15th byte    set user UUID
            0x3e, //    Proximity UUID 16th byte    set user UUID
            0x00, //    Major 1st byte    set major value
            0xAA, //    Major 2nd byte    set major value
            0x00, //    Minor 1st byte    set minor value
            0xBB, //    Minor 2nd byte    set minor value
            0xb3 , //   Signal power (calibrated RSSI@1m)    signal power value
            0x00))
        
        XCTAssertEqual(advertisingData, testData)
        
        guard let decoded = AppleBeacon.from(advertisingData: testData)
            else { XCTFail(); return }
        
        XCTAssertEqual(decoded.flags, flags)
        XCTAssertEqual(decoded.beacon.uuid, beacon.uuid)
        XCTAssertEqual(decoded.beacon.major, beacon.major)
        XCTAssertEqual(decoded.beacon.minor, beacon.minor)
        XCTAssertEqual(decoded.beacon.rssi, beacon.rssi)
    }
    
    func testEstimoteBeacon() {
        
        let expectedData = Data([0x4c, 0x00, 0x02, 0x15, 0xb9, 0x40, 0x7f, 0x30, 0xf5, 0xf8, 0x46, 0x6e, 0xaf, 0xf9, 0x25, 0x55, 0x6b, 0x57, 0xfe, 0x6d, 0x29, 0x4c, 0x90, 0x39, 0x74])
        
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
        
        let major: UInt16 = 0x294c
        
        let minor: UInt16 = 0x9039
        
        let rssi: Int8 = 116
        
        let beacon = AppleBeacon(uuid: uuid, major: major, minor: minor, rssi: rssi)
        
        guard let manufactererData = GAPManufacturerSpecificData(data: expectedData)
            else { XCTFail(); return }
        
        XCTAssertEqual(beacon.manufactererData, manufactererData)

        XCTAssertEqual(manufactererData.companyIdentifier, .apple)
        
        guard let decodedBeacon = AppleBeacon(manufactererData: manufactererData)
            else { XCTFail(); return }
        
        XCTAssertEqual(decodedBeacon.uuid, uuid)
        XCTAssertEqual(decodedBeacon.major, major)
        XCTAssertEqual(decodedBeacon.minor, minor)
        XCTAssertEqual(decodedBeacon.rssi, rssi)
    }
    
    func testCommand() {
        
        let uuid = UUID(rawValue: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
        
        let beacon = AppleBeacon(uuid: uuid, major: 1, minor: 1, rssi: -29)
        
        let hostController = TestHostController()
        
        /**
         SEND  [200A] LE Set Advertise Enable - 0x00
         [200A] Opcode: 0x200A (OGF: 0x08    OCF: 0x0A)
         Parameter Length: 1 (0x01)
         Advertising Enable: 00
         */
        
        hostController.queue.append(
            .command(HCILowEnergyCommand.setAdvertiseEnable.opcode,
                     [0x0a, 0x20, 0x01, 0x00]
            )
        )
        
        /**
         RECV  Command Complete [200A] - LE Set Advertise Enable
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x200A (OGF: 0x08    OCF: 0x0A) - [Low Energy] LE Set Advertise Enable
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x0a, 0x20, 0x00]))
        
        // LE Set Advertising Parameters (15 bytes)
        hostController.queue.append(
            .command(HCILowEnergyCommand.setAdvertisingParameters.opcode,
                     [6, 32, 15, 100, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0])
        )
        
        /**
         RECV  Command Complete [2006] - LE Set Advertising Parameters
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x2006 (OGF: 0x08    OCF: 0x06) - [Low Energy] LE Set Advertising Parameters
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x06, 0x20, 0x00]))
        
        /**
         SEND  [200A] LE Set Advertise Enable - 0x01
         [200A] Opcode: 0x200A (OGF: 0x08    OCF: 0x0A)
         Parameter Length: 1 (0x01)
         Advertising Enable: 01
         */
        
        hostController.queue.append(
            .command(HCILowEnergyCommand.setAdvertiseEnable.opcode,
            [0x0a, 0x20, 0x01, 0x01]
            )
        )
        
        /**
         RECV  Command Complete [200A] - LE Set Advertise Enable
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x200A (OGF: 0x08    OCF: 0x0A) - [Low Energy] LE Set Advertise Enable
         */
        hostController.queue.append(.event([0x0e, 0x04, 0x01, 0x0a, 0x20, 0x00]))
        
        /**
         SEND  [2008] LE Set Advertising Data
         [2008] Opcode: 0x2008 (OGF: 0x08    OCF: 0x08)
         Parameter Length: 32 (0x20)
         Advertising Data Length: 1E
         Flags: 0X1A
         Apple Manufacturing Data
         Length: 26 (0x1A)
         */
        hostController.queue.append(
            .command(HCILowEnergyCommand.setAdvertisingData.opcode, [0x08, 0x20, 0x20, 0x1E, 0x02, 0x01, 0x1A, 0x1A, 0xFF, 0x4C, 0x00, 0x02, 0x15, 0xE2, 0xC5, 0x6D, 0xB5, 0xDF, 0xFB, 0x48, 0xD2, 0xB0, 0x60, 0xD0, 0xF5, 0xA7, 0x10, 0x96, 0xE0, 0x00, 0x01, 0x00, 0x01, 0xE3, 0x00]
            )
        )
        
        /**
         Command Complete [2008] - LE Set Advertising Data
         Parameter Length: 4 (0x04)
         Status: 0x00 - Success
         Num HCI Command Packets: 0x01
         Opcode: 0x2008 (OGF: 0x08    OCF: 0x08) - [Low Energy] LE Set Advertising Data
         */
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x08, 0x20, 0x00]))
        
        XCTAssertNoThrow(try hostController.iBeacon(beacon,
                                                    flags: 0x1A,
                                                    interval: AdvertisingInterval(rawValue: 100)!))
    }
}
