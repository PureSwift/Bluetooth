//
//  UInt24Tests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/28/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//


import XCTest
import Foundation
@testable import Bluetooth

final class UInt24Tests: XCTestCase {
    
    static let allTests = [
        ("testBitWidth", testBitWidth),
        ("testComparable", testComparable),
        ("testHashable", testHashable),
        ("testExpressibleByIntegerLiteral", testExpressibleByIntegerLiteral),
        ("testData", testData)
    ]
    
    func testBitWidth() {
        
        XCTAssertEqual(UInt24.bitWidth, MemoryLayout<UInt24.ByteValue>.size * 8)
        XCTAssertEqual(UInt24.bitWidth, 24)
    }
    
    func testComparable() {
        XCTAssertEqual(UInt24.zero, 0)
        XCTAssertEqual(UInt24.min, 0)
        XCTAssertEqual(UInt24.max, 16777215)
        XCTAssertEqual(UInt24.max, 0xFFFFFF)
        XCTAssert(0xFFFFFF <= UInt24.max)
        XCTAssert(0xFFFFFE < UInt24.max)
        XCTAssert(0xFFFFFF >= UInt24.max)
        XCTAssert(UInt24.max > 0xFFFFFE)
    }
    
    func testHashable() {
        
        XCTAssertEqual(UInt24.zero.hashValue, 0)
        XCTAssertNotEqual(UInt24.max.hashValue, 0)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt24, String)] = [
            (UInt24.zero, "000000"),
            (0x000000, "000000"),
            (0x000001, "000001"),
            (0x000020, "000020"),
            (0xABCDEF, "ABCDEF"),
            (16777215, "FFFFFF"),
            (0xFFFFFF, "FFFFFF")
        ]
        
        values.forEach { XCTAssertEqual($0.0.description, $0.1) }
    }
    
    func testData() {
        
        let data = Data([0xFF, 0xFF, 0xFF])
        
        XCTAssertEqual(UInt24(data: data), 16777215)
        XCTAssertEqual(UInt24.max.data, data)
    }
}
