//
//  AddressTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class AddressTests: XCTestCase {
    
    static let allTests = [
        ("testMalformedString", testMalformedString)
    ]
    
    func testMalformedString() {
        
        let malformed = [
            "0",
            "01",
            "012",
            "xxxx",
            "xxxxx",
            "0xxxxx",
            "0123456",
            "012g4567",
            "012345678",
            "0x234567u9",
            "01234567890",
            "@aXX:XX:XX:XX:&&",
            "00:1A:7D:DA:71:13a"
        ]
        
        malformed.forEach { XCTAssertNil(Address(rawValue: $0), $0) }
    }
    
    func testString() {
        
        let rawValues = [
            "00:1A:7D:DA:71:13",
            "59:80:ED:81:EE:35",
            "AC:BC:32:A6:67:42"
        ]
        
        rawValues.forEach { XCTAssertEqual(Address(rawValue: $0)?.rawValue, $0) }
    }
    
    func testBytes() {
        
        let testData: [(rawValue: String, bytes: Address.ByteValue)] = [
            ("00:1A:7D:DA:71:13", (0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13)),
            ("59:80:ED:81:EE:35", (0x59, 0x80, 0xED, 0x81, 0xEE, 0x35)),
            ("AC:BC:32:A6:67:42", (0xAC, 0xBC, 0x32, 0xA6, 0x67, 0x42))
        ]
        
        for test in testData {
            
            guard let address = Address(rawValue: test.rawValue)
                else { XCTFail("Could not parse"); continue }
            
            XCTAssertEqual(address.rawValue, test.rawValue)
            XCTAssertEqual(address, Address(bigEndian: Address(bytes: test.bytes)))
            
            XCTAssertEqual(address.bigEndian.bytes.0, test.bytes.0)
            XCTAssertEqual(address.bigEndian.bytes.1, test.bytes.1)
            XCTAssertEqual(address.bigEndian.bytes.2, test.bytes.2)
            XCTAssertEqual(address.bigEndian.bytes.3, test.bytes.3)
            XCTAssertEqual(address.bigEndian.bytes.4, test.bytes.4)
            XCTAssertEqual(address.bigEndian.bytes.5, test.bytes.5)
            
            XCTAssertNotEqual(address.hashValue, 0)
        }
    }
    
    func testData() {
        
        let testData: [(rawValue: String, data: Data)] = [
            ("00:1A:7D:DA:71:13", Data([0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13])),
            ("59:80:ED:81:EE:35", Data([0x59, 0x80, 0xED, 0x81, 0xEE, 0x35])),
            ("AC:BC:32:A6:67:42", Data([0xAC, 0xBC, 0x32, 0xA6, 0x67, 0x42]))
        ]
        
        for test in testData {
            
            guard let address = Address(rawValue: test.rawValue)
                else { XCTFail("Could not parse"); continue }
            
            XCTAssertEqual(address.rawValue, test.rawValue)
            XCTAssertEqual(address, Address(bigEndian: Address(data: test.data)!))
            XCTAssertEqual(address.bigEndian.data, test.data)
        }
    }
}
