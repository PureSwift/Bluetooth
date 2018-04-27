//
//  GAPTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GAPTests: XCTestCase {
    
    static let allTests = [
        ("testBit16UUIDList", testBit16UUIDList),
        ("testDataType", testDataType),
        ("testCoding", testCoding)
    ]
    
    func testDataType() {
        
        XCTAssertEqual(GAPDataType.flags.description, "Flags")
        XCTAssertEqual(GAPDataType(rawValue: 0).description, "Data Type (0)")
    }
    
    func testBit16UUIDList() {
        
        XCTAssertNil(Bit16UUIDList(data: Data([0x03, 0x18, 0x04, 0x18, 0x02])),
                     "Can only initialize from multiples of 2 bytes")
        
        XCTAssertEqual(Bit16UUIDList(data: Data())?.uuids, [], "Should initialize from empty data")
        
        do {
            
            // 16 bit UUIDs: 0X1803 0X1804 0X1802
            let data = Data([0x03, 0x18, 0x04, 0x18, 0x02, 0x18])
            
            guard let list = Bit16UUIDList(data: data)
                else { XCTFail("Could not parse from data"); return }
            
            XCTAssertEqual(list.data, data)
            XCTAssertEqual(list.uuids, [0x1803, 0x1804, 0x1802])
            XCTAssertEqual(list.uuids.map { BluetoothUUID.bit16($0) }, [.linkLoss, .txPower, .immediateAlert])

        }
    }
    
    func testCoding() {
        
        do {
            
            /**
             Length Data: 0X0C
             Local Name: BlueZ 5.43
             Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
             */
            let data = Data([0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
            let name: GAPCompleteLocalName = "BlueZ 5.43"
            XCTAssertEqual(data.count, 0x0C)
            XCTAssertEqual(data.count, 12)
            
            var decoded = [GAPData]()
            XCTAssertNoThrow(decoded = try GAPDataDecoder.decode(data, types: [GAPCompleteLocalName.self], ignoreUnknownType: false))
            
            XCTAssert(decoded.isEmpty == false)
            XCTAssertEqual(decoded.count, 1)
            
            guard let nameData = decoded.first as? GAPCompleteLocalName
                else { XCTFail(); return }
            
            XCTAssertEqual(nameData, name)
            XCTAssertEqual(GAPDataEncoder.encode([name]), data)
        }
        
        do {
            
            /**
             Length Data: 0X16
             Flags: 0X1A
             16 bit UUIDs: 0X1803 0X1804 0X1802
             Local Name: Proximity
             Data: 02 01 1A 07 03 03 18 04 18 02 18 0A 09 50 72 6F 78 69 6D 69 74 79
             */
            
            let data = Data([0x02, 0x01, 0x1A, 0x07, 0x03, 0x03, 0x18, 0x04, 0x18, 0x02, 0x18, 0x0A, 0x09, 0x50, 0x72, 0x6F, 0x78, 0x69, 0x6D, 0x69, 0x74, 0x79])
            XCTAssertEqual(data.count, 0x16)
            
            let flags: GAPFlags = 0x1A
            let uuidList: GAPCompleteListOf16BitServiceClassUUIDs = [0x1803, 0x1804, 0x1802]
            let localName: GAPCompleteLocalName = "Proximity"
            
            let expectedData: [GAPData] = [flags, uuidList, localName]
            let types = expectedData.map { type(of: $0) }
            
            guard let decoded = try? GAPDataDecoder.decode(data, types: types, ignoreUnknownType: false)
                else { XCTFail("Could not decode"); return }
            
            XCTAssert(decoded.isEmpty == false)
            XCTAssertEqual(decoded.count, 3)
            XCTAssertEqual(GAPDataEncoder.encode(expectedData), data)
            
            XCTAssertEqual(decoded[0] as! GAPFlags, flags)
            XCTAssertEqual(decoded[1] as! GAPCompleteListOf16BitServiceClassUUIDs, uuidList)
            XCTAssertEqual(decoded[2] as! GAPCompleteLocalName, localName)
        }
    }
}
