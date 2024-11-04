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
    
    func testEquality() {
        let uuidA = _UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")
        let uuidB = _UUID(uuidString: "e621e1f8-c36c-495a-93fc-0c247a3e6e5f")
        let uuidC = _UUID(uuid: (0xe6,0x21,0xe1,0xf8,0xc3,0x6c,0x49,0x5a,0x93,0xfc,0x0c,0x24,0x7a,0x3e,0x6e,0x5f))
        let uuidD = _UUID()

        XCTAssertEqual(uuidA, uuidB, "String case must not matter.")
        XCTAssertEqual(uuidA, uuidC, "A UUID initialized with a string must be equal to the same UUID initialized with its UnsafePointer<UInt8> equivalent representation.")
        XCTAssertNotEqual(uuidC, uuidD, "Two different UUIDs must not be equal.")
    }

    func testInvalid() {
        let invalid = _UUID(uuidString: "Invalid UUID")
        XCTAssertNil(invalid, "The convenience initializer `init?(uuidString string:)` must return nil for an invalid UUID string.")
    }

    // `uuidString` should return an uppercase string
    // See: https://bugs.swift.org/browse/SR-865
    func testString() {
        let uuid = _UUID(uuid: (0xe6,0x21,0xe1,0xf8,0xc3,0x6c,0x49,0x5a,0x93,0xfc,0x0c,0x24,0x7a,0x3e,0x6e,0x5f))
        XCTAssertEqual(uuid.uuidString, "E621E1F8-C36C-495A-93FC-0C247A3E6E5F", "The uuidString representation must be uppercase.")
    }

    func testDescription() {
        let uuid = _UUID()
        let description: String = uuid.description
        let uuidString: String = uuid.uuidString
        XCTAssertEqual(description, uuidString, "The description must be the same as the uuidString.")
    }

    func testAnyHashableContainingUUID() {
        let values: [_UUID] = [
            _UUID(uuidString: "e621e1f8-c36c-495a-93fc-0c247a3e6e5f")!,
            _UUID(uuidString: "f81d4fae-7dec-11d0-a765-00a0c91e6bf6")!,
            _UUID(uuidString: "f81d4fae-7dec-11d0-a765-00a0c91e6bf6")!,
        ]
        let anyHashables = values.map(AnyHashable.init)
        XCTAssertTrue(_UUID.self == type(of: anyHashables[0].base))
        XCTAssertTrue(_UUID.self == type(of: anyHashables[1].base))
        XCTAssertTrue(_UUID.self == type(of: anyHashables[2].base))
        XCTAssertNotEqual(anyHashables[0], anyHashables[1])
        XCTAssertEqual(anyHashables[1], anyHashables[2])
    }

    func testCustomMirror() {
        let uuid = _UUID(uuidString: "89E90DC6-5EBA-41A8-A64D-81D3576EE46E")!
        XCTAssertEqual(String(reflecting: uuid), "89E90DC6-5EBA-41A8-A64D-81D3576EE46E")
    }

    func testComparable() throws {
        var uuid1 = try XCTUnwrap(_UUID(uuidString: "00000000-0000-0000-0000-000000000001"))
        var uuid2 = try XCTUnwrap(_UUID(uuidString: "00000000-0000-0000-0000-000000000002"))
        XCTAssertTrue(uuid1 < uuid2)
        XCTAssertFalse(uuid2 < uuid1)
        XCTAssertFalse(uuid2 == uuid1)
        
        uuid1 = try XCTUnwrap(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        uuid2 = try XCTUnwrap(_UUID(uuidString: "9807CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        XCTAssertTrue(uuid1 < uuid2)
        XCTAssertFalse(uuid2 < uuid1)
        XCTAssertFalse(uuid2 == uuid1)
        
        uuid1 = try XCTUnwrap(_UUID(uuidString: "9707CE8D-261F-4858-8BF9-C9EC3D690FCE"))
        uuid2 = try XCTUnwrap(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        XCTAssertTrue(uuid1 > uuid2)
        XCTAssertFalse(uuid2 > uuid1)
        XCTAssertFalse(uuid2 == uuid1)
        
        uuid1 = try XCTUnwrap(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        uuid2 = try XCTUnwrap(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        XCTAssertFalse(uuid1 > uuid2)
        XCTAssertFalse(uuid2 > uuid1)
        XCTAssertTrue(uuid2 == uuid1)
    }
}
