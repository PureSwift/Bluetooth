//
//  UInt48.swift
//  BluetoothTests
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class UInt48Tests: XCTestCase {
    
    func testBitWidth() {
        
        XCTAssertEqual(UInt48.bitWidth, MemoryLayout<UInt48.ByteValue>.size * 8)
        XCTAssertEqual(UInt48.bitWidth, 48)
    }
    
    func testComparable() {
        
        XCTAssertEqual(UInt48.zero, 0)
        XCTAssertEqual(UInt48.min, 0)
        XCTAssertEqual(UInt48.max, 281474976710655)
        XCTAssertEqual(UInt48.max, 0xFFFFFFFFFFFF)
        XCTAssert(0xFFFFFFFFFFFF <= UInt48.max)
        XCTAssert(0xFFFFFFFFFFFE < UInt48.max)
        XCTAssert(0xFFFFFFFFFFFF >= UInt48.max)
        XCTAssert(UInt48.max > 0xFFFFFFFFFFFE)
    }
    
    func testHashable() {
        
        XCTAssertNotEqual(UInt48.max.hashValue, 0)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt48, String)] = [
            (.zero,             "0"),
            (0x0000000000,      "0"),
            (0x0000000001,      "1"),
            (0x0000000020,      "32"),
            (123456789,         "123456789"),
            (281474976710655,   "281474976710655"),
            (0xFFFFFFFFFFFF,    "281474976710655")
        ]
        
        values.forEach { XCTAssertEqual($0.description, $1) }
    }
    
    func testData() {
        
        let data = Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])
        
        XCTAssertEqual(UInt48(data: data), 281474976710655)
        XCTAssertEqual(Data(UInt48.max), data)
    }
}
