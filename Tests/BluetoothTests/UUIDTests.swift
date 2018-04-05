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

final class UUIDTests: XCTestCase {
    
    static let allTests = [
        ("testLength", testLength),
        ("testByteValue", testByteValue),
        ("testData", testData),
        ("testRawRepresentable", testRawRepresentable)
    ]
    
    func testLength() {
        
        let uuid = UUID()
        
        XCTAssertEqual(uuid.data.count, UUID.length)
        XCTAssertEqual(uuid.uuidString.utf8.count, UUID.stringLength)
        XCTAssertEqual(uuid.uuidString.replacingOccurrences(of: "-", with: "").utf8.count, UUID.unformattedStringLength)
    }
    
    func testByteValue() {
        
        XCTAssertEqual(UUID.bitWidth, MemoryLayout<UUID.ByteValue>.size * 8)
        XCTAssertEqual(UUID.bitWidth, 128)
        
        let uuid = UUID()
        
        XCTAssertEqual(uuid.bytes.0, uuid.uuid.0)
        XCTAssertEqual(uuid.bytes.1, uuid.uuid.1)
        XCTAssertEqual(uuid.bytes.2, uuid.uuid.2)
        XCTAssertEqual(uuid.bytes.3, uuid.uuid.3)
        XCTAssertEqual(uuid.bytes.4, uuid.uuid.4)
        XCTAssertEqual(uuid.bytes.5, uuid.uuid.5)
        XCTAssertEqual(uuid.bytes.6, uuid.uuid.6)
        XCTAssertEqual(uuid.bytes.7, uuid.uuid.7)
        XCTAssertEqual(uuid.bytes.8, uuid.uuid.8)
        XCTAssertEqual(uuid.bytes.9, uuid.uuid.9)
        XCTAssertEqual(uuid.bytes.10, uuid.uuid.10)
        XCTAssertEqual(uuid.bytes.11, uuid.uuid.11)
        XCTAssertEqual(uuid.bytes.12, uuid.uuid.12)
        
        XCTAssertEqual(UUID(uuid: uuid.bytes), uuid)
        
        var mutatedUUID = uuid
        mutatedUUID.bytes = UUID().bytes
        XCTAssertNotEqual(mutatedUUID, uuid)
    }
    
    func testData() {
        
        let uuid = UUID()
        
        XCTAssertEqual(uuid.data.count, UUID.length)
        XCTAssertEqual(UUID(data: uuid.data), uuid)
    }
    
    func testRawRepresentable() {
        
        let uuid = UUID()
        
        XCTAssertEqual(uuid.rawValue, uuid.uuidString)
        XCTAssertEqual(UUID(rawValue: uuid.rawValue), uuid)
    }
}
