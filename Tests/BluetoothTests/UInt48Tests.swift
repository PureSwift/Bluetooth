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
    
    static let allTests = [
        ("testBitWidth", testBitWidth),
        ("testComparable", testComparable),
        ("testHashable", testHashable),
        ("testExpressibleByIntegerLiteral", testExpressibleByIntegerLiteral),
        ("testData", testData)
    ]
    
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
        
        XCTAssertEqual(UInt48.zero.hashValue, 0)
        XCTAssertNotEqual(UInt48.max.hashValue, 0)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt48, String)] = [
            (UInt48.zero, "000000000000"),
            (0x0000000000, "000000000000"),
            (0x0000000001, "000000000001"),
            (0x0000000020, "000000000020"),
            (0xFFFE9ABCDE, "00FFFE9ABCDE"),
            (281474976710655, "FFFFFFFFFFFF")
        ]
        
        values.forEach { XCTAssertEqual($0.0.description, $0.1) }
    }
    
    func testData() {
        
        let data = Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])
        
        XCTAssertEqual(UInt48(data: data), 281474976710655)
        XCTAssertEqual(UInt48.max.data, data)
    }
}
