//
//  UInt40Tests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/28/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class UInt40Tests: XCTestCase {
    
    func testBitWidth() {
        
        XCTAssertEqual(UInt40.bitWidth, MemoryLayout<UInt40.ByteValue>.size * 8)
        XCTAssertEqual(UInt40.bitWidth, 40)
    }
    
    func testEquatable() {
        
        XCTAssertEqual(UInt40.zero, 0)
        XCTAssertEqual(UInt40.min, 0)
        XCTAssertEqual(UInt40.max, 1099511627775)
        XCTAssertEqual(UInt40.max, 0xFFFFFFFFFF)
    }

    func testHashable() {
        
        XCTAssertNotEqual(UInt40.max.hashValue, UInt64.max.hashValue)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt40, String)] = [
            (UInt40.zero,   "0"),
            (0x0000000000,  "0"),
            (0x0000000001,  "1"),
            (0x0000000020,  "32"),
            (12345678,      "12345678"),
            (1099511627775, "1099511627775"),
            (0xFFFFFFFFFF,  "1099511627775")
        ]
        
        values.forEach { XCTAssertEqual($0.description, $1) }
    }
}
