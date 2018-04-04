//
//  UUIDTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

#if os(macOS) || os(iOS) || os(tvOS) || (os(watchOS) && swift(>=3.2))
import CoreBluetooth
#endif

final class UUIDTests: XCTestCase {
    
    static let allTests = [
        ("testMalformed", testMalformed),
        ("testFoundation", testFoundation)
    ]
    
    func testMalformed() {
        
        let malformed = [
            "0",
            "01",
            "012",
            "xxxx",
            "xxxxx",
            "0xxxxx",
            "0123456",
            "012g4567",
            "012345678",
            "0x234567u9",
            "01234567890",
            "00001234-0000-1000-8000-00805F9B34F",
            "00001234-0000-1000-8000 00805F9B34FB",
            "00001234-0000-1000-8000-00805F9B34FBC",
            "00001234-0000-1000-800G-00805F9B34FB"
        ]
        
        malformed.forEach { XCTAssertNil(BluetoothUUID(rawValue: $0)) }
    }
    
    func testFoundation() {
        
        struct TestData {
            
            let bluetooth: BluetoothUUID
            
            let foundation: Foundation.UUID
            
            let bytes: UInt128
        }
        
        let testData: [TestData] = [
            TestData(bluetooth: .bit16(0x0000),
                     foundation: UUID.init(uuidString: "00000000-0000-1000-8000-00805F9B34FB")!,
                     bytes: UInt128(bytes: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                                            0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb))),
            TestData(bluetooth: .bit16(0x1234),
                     foundation: UUID.init(uuidString: "00001234-0000-1000-8000-00805F9B34FB")!,
                     bytes: UInt128(bytes: (0x00, 0x00, 0x12, 0x34, 0x00, 0x00, 0x10, 0x00,
                                            0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb))),
            TestData(bluetooth: .bit32(0x12345678),
                     foundation: UUID.init(uuidString: "12345678-0000-1000-8000-00805F9B34FB")!,
                     bytes: UInt128(bytes: (0x12, 0x34, 0x56, 0x78, 0x00, 0x00, 0x10, 0x00,
                                            0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb))),
            TestData(bluetooth: .bit128(UInt128(bytes: (0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                                                        0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb))),
                     foundation: UUID.init(uuidString: "F0000000-0000-1000-8000-00805F9B34FB")!,
                     bytes: UInt128(bytes: (0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                                            0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb)))
        ]
        
        for test in testData {
            
            let foundationUUID = UUID(bluetooth: test.bluetooth)
            
            XCTAssert(foundationUUID == test.foundation, "\(foundationUUID) == \(test.foundation)")
            XCTAssert(foundationUUID.uuidString == test.bluetooth.rawValue)
            XCTAssert(test.bytes == UInt128(uuid: test.foundation))
        }
    }
    
    func testUInt128() {
        
        let uuid = UUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!
        
        let value = UInt128(uuid: uuid)
        
        XCTAssert(value.description == "60F14FE2F97211E5B84F23E070D5A8C7")
    }
}
