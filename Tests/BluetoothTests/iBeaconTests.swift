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
        ("testData", testData)
    ]
    
    func testData() {
        
        let value = iBeacon(uuid: UUID(uuidString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")!,
                            major: 0xAA,
                            minor: 0xBB,
                            rssi: Int8(bitPattern: 0xb3))
        
        let advertisingData = value.advertisingData
        
        let testData: LowEnergyResponseData = (
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
            0xAA, //    Major 1st byte    set major value
            0x00, //    Major 2nd byte    set major value
            0xBB, //    Minor 1st byte    set minor value
            0x00, //    Minor 2nd byte    set minor value
            0xb3 , //   Signal power (calibrated RSSI@1m)    signal power value
            0x00)
        
        XCTAssertEqual(advertisingData.length, 30)
        
        XCTAssertEqual(advertisingData.data.0, testData.0)
        XCTAssertEqual(advertisingData.data.1, testData.1)
        XCTAssertEqual(advertisingData.data.2, testData.2)
        XCTAssertEqual(advertisingData.data.3, testData.3)
        XCTAssertEqual(advertisingData.data.4, testData.4)
        XCTAssertEqual(advertisingData.data.5, testData.5)
        XCTAssertEqual(advertisingData.data.6, testData.6)
        XCTAssertEqual(advertisingData.data.7, testData.7)
        XCTAssertEqual(advertisingData.data.8, testData.8)
        XCTAssertEqual(advertisingData.data.9, testData.9)
        XCTAssertEqual(advertisingData.data.10, testData.10)
        XCTAssertEqual(advertisingData.data.11, testData.11)
        XCTAssertEqual(advertisingData.data.12, testData.12)
        XCTAssertEqual(advertisingData.data.13, testData.13)
        XCTAssertEqual(advertisingData.data.14, testData.14)
        XCTAssertEqual(advertisingData.data.15, testData.15)
        XCTAssertEqual(advertisingData.data.16, testData.16)
        XCTAssertEqual(advertisingData.data.17, testData.17)
        XCTAssertEqual(advertisingData.data.18, testData.18)
        XCTAssertEqual(advertisingData.data.19, testData.19)
        XCTAssertEqual(advertisingData.data.20, testData.20)
        XCTAssertEqual(advertisingData.data.21, testData.21)
        XCTAssertEqual(advertisingData.data.22, testData.22)
        XCTAssertEqual(advertisingData.data.23, testData.23)
        XCTAssertEqual(advertisingData.data.24, testData.24)
        XCTAssertEqual(advertisingData.data.25, testData.25)
        XCTAssertEqual(advertisingData.data.26, testData.26)
        XCTAssertEqual(advertisingData.data.27, testData.27)
        XCTAssertEqual(advertisingData.data.28, testData.28)
        XCTAssertEqual(advertisingData.data.29, testData.29)
        XCTAssertEqual(advertisingData.data.30, testData.30)
    }
}
