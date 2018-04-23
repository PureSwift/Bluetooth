//
//  UInt512Tests.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class UInt512Tests: XCTestCase {
    
    static let allTests = [
        ("testBitWidth", testBitWidth),
        ("testHashable", testHashable),
        ("testExpressibleByIntegerLiteral", testExpressibleByIntegerLiteral)
    ]
    
    func testBitWidth() {
        
        XCTAssertEqual(UInt512.bitWidth, MemoryLayout<UInt512.ByteValue>.size * 8)
        XCTAssertEqual(UInt512.bitWidth, 512)
    }
    
    func testHashable() {
        
        XCTAssertEqual(UInt512.zero.hashValue, 0)
        XCTAssertNotEqual(UInt512.max.hashValue, 0)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt512, String)] = [
            (UInt512.zero, "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
            (0x0, "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
            (0x1, "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001"),
            (0x20, "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020"),
            (0xDCBABEBAAFDE0001, "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000DCBABEBAAFDE0001")
        ]
        
        values.forEach { XCTAssertEqual($0.0.description, $0.1) }
        
        XCTAssertEqual(UInt512.zero, 0)
    }
}

