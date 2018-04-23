//
//  UInt256Tests.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class UInt256Tests: XCTestCase {
    
    static let allTests = [
        ("testBitWidth", testBitWidth),
        ("testHashable", testHashable),
        ("testExpressibleByIntegerLiteral", testExpressibleByIntegerLiteral)
    ]
    
    func testBitWidth() {
        
        XCTAssertEqual(UInt256.bitWidth, MemoryLayout<UInt256.ByteValue>.size * 8)
        XCTAssertEqual(UInt256.bitWidth, 256)
    }
    
    func testHashable() {
        
        XCTAssertEqual(UInt256.zero.hashValue, 0)
        XCTAssertNotEqual(UInt256.max.hashValue, 0)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        let values: [(UInt256, String)] = [
            (UInt256.zero, "0000000000000000000000000000000000000000000000000000000000000000"),
            (0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, "0000000000000000000000000000000000000000000000000000000000000000"),
            (0x0000000000000000000000000000000000000000000000000000000000000001, "0000000000000000000000000000000000000000000000000000000000000001"),
            (0x0000000000000000000000000000000000000000000000000000000000000020, "0000000000000000000000000000000000000000000000000000000000000020"),
            (0x000000000000000000000000000000000000000000000000DCBABEBAAFDE0001, "000000000000000000000000000000000000000000000000DCBABEBAAFDE0001")
        ]
        
        values.forEach { XCTAssertEqual($0.0.description, $0.1) }
        
        XCTAssertEqual(UInt256.zero, 0)
    }
}
