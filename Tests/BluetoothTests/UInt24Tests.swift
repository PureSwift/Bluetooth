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
        
        XCTAssertEqual(UInt24.zero.hashValue, UInt32(UInt24.zero).hashValue)
        XCTAssertEqual(UInt24.max.hashValue, UInt32(UInt24.max).hashValue)
        XCTAssertNotEqual(UInt24.max.hashValue, 0)
    }
    
    func testHexadecimal() {
        
        let testData: [(UInt24, String)] = [
            (.zero,     "000000"),
            (0x000000,  "000000"),
            (0x000001,  "000001"),
            (0x000020,  "000020"),
            (0xABCDEF,  "ABCDEF"),
            (16777215,  "FFFFFF"),
            (0xFFFFFF,  "FFFFFF"),
            (.max,      "FFFFFF")
        ]
        
        for (value, hexadecimal) in testData {
            XCTAssertEqual(String(UInt32(value).toHexadecimal().suffix(6)), hexadecimal)
            XCTAssertEqual(UInt32(hexadecimal, radix: 16), UInt32(value))
            XCTAssertEqual(UInt32(parse: hexadecimal, radix: 16), UInt32(value))
        }
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt24, String)] = [
            (.zero,     "000000"),
            (0x000000,  "000000"),
            (0x000001,  "000001"),
            (0x000020,  "000020"),
            (0xABCDEF,  "ABCDEF"),
            (16777215,  "FFFFFF"),
            (0xFFFFFF,  "FFFFFF")
        ]
        
        values.forEach { XCTAssertEqual($0.description, $1) }
    }
    
    func testData() {
        
        let data = Data([0xFF, 0xFF, 0xFF])
        
        XCTAssertEqual(UInt24(data: data), 16777215)
        XCTAssertEqual(Data(UInt24.max), data)
    }
    
    func testCodable() throws {
        
        struct Value: Equatable, Hashable, Codable {
            let id: UInt24
        }
        
        let value = Value(id: UInt24.max)
        let encoder = JSONEncoder()
        let data = try encoder.encode(value)
        XCTAssertEqual(String(data: data, encoding: .utf8), #"{"id":16777215}"#)
        let decoder = JSONDecoder()
        let decodedValue = try decoder.decode(Value.self, from: data)
        XCTAssertEqual(value, decodedValue)
    }
}
