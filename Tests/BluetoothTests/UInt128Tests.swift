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
    
    func testBitWidth() {
        
        XCTAssertEqual(Bluetooth.UInt128.bitWidth, MemoryLayout<Bluetooth.UInt128.ByteValue>.size * 8)
        XCTAssertEqual(Bluetooth.UInt128.bitWidth, 128)
    }
    
    func testUUID() {
        
        let uuid = UUID(uuidString: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!
        let number = Bluetooth.UInt128(uuid: uuid)
        
        XCTAssertEqual(UUID(number), uuid)
        XCTAssertEqual(number.uuidString, uuid.uuidString)
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            XCTAssertEqual(number.description, "128858851431381903469711580150894012615")
        } else {
            XCTAssertEqual(number.description, "60F14FE2F97211E5B84F23E070D5A8C7")
        }
    }
    
    func testHashable() {
        
        XCTAssertNotEqual(Bluetooth.UInt128.max.hashValue, 0)
    }
    
    func testExpressibleByIntegerLiteral() {
        
        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else {
            print("Skipping \(#function), requires macOS 15")
            return
        }
        
        let values: [(UInt128, String)] = [
            (0x00000000000000000000000000000000,    "0"),
            (0x00000000000000000000000000000001,    "1"),
            (100000000000000000000000000000,        "100000000000000000000000000000"),
            (0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,    "340282366920938463463374607431768211455")
        ]
        
        values.forEach { XCTAssertEqual($0.description, $1) }
        
        XCTAssertEqual(UInt128.zero, 0)
        XCTAssertEqual(UInt128.min, 0)
        XCTAssertEqual(UInt128.max, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
    }
}
