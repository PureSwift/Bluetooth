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
        ("testCoding", testCoding)
    ]
    
    func testCoding() {
        
        do {
            
            /**
             Length Data: 0X0C
             Local Name: BlueZ 5.43
             Data: 0B 09 42 6C 75 65 5A 20 35 2E 34 33
             */
            let data = Data([0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
            let name = "BlueZ 5.43"
            XCTAssertEqual(data.count, 0x0C)
            XCTAssertEqual(data.count, 12)
            
            var decoded = [GAPData]()
            XCTAssertNoThrow(decoded = try GAPDataDecoder.decode(data, types: [GAPCompleteLocalName.self], ignoreUnknownType: false))
            
            XCTAssert(decoded.isEmpty == false)
            XCTAssertEqual(decoded.count, 1)
            
            guard let nameData = decoded.first as? GAPCompleteLocalName
                else { XCTFail(); return }
            
            XCTAssertEqual(nameData.rawValue, name)
            XCTAssertEqual(GAPDataEncoder.encode([GAPCompleteLocalName(rawValue: name)]), data)
        }
    }
}
