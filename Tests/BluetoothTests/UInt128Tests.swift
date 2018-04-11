//
//  UInt128Tests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class UInt128Tests: XCTestCase {
    
    static let allTests = [
        ("testBitWidth", testBitWidth),
        ("testUUID", testUUID),
        ("testHashable", testHashable),
        ("testExpressibleByIntegerLiteral", testExpressibleByIntegerLiteral)
    ]
    
    func testBitWidth() {
        
        XCTAssertEqual(UInt128.bitWidth, MemoryLayout<UInt128.ByteValue>.size * 8)
        XCTAssertEqual(UInt128.bitWidth, 128)
    }
    
    func testUUID() {
        
        let uuid = UUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!
        let value = UInt128(uuid: uuid)
        
        XCTAssertEqual(UUID(value), uuid)
        XCTAssertEqual(value.description, "60F14FE2F97211E5B84F23E070D5A8C7")
    }
    
    func testHashable() {
        
        XCTAssertEqual(UInt128.zero.hashValue, 0)
        XCTAssertNotEqual(UInt128.max.hashValue, 0)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt128, String)] = [
            (UInt128.zero, "00000000000000000000000000000000"),
            (0x00000000000000000000000000000000, "00000000000000000000000000000000"),
            (0x00000000000000000000000000000001, "00000000000000000000000000000001"),
            (0x00000000000000000000000000000020, "00000000000000000000000000000020"),
            (0x0000000000000000DCBABEBAAFDE0001, "0000000000000000DCBABEBAAFDE0001")
        ]
        
        values.forEach { XCTAssertEqual($0.0.description, $0.1) }
        
        XCTAssertEqual(UInt128.zero, 0)
    }
}
