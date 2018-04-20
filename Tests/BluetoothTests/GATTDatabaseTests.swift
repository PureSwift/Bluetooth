//
//  GATTDatabaseTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GATTDatabaseTests: XCTestCase {
    
    static let allTests = [
        ("testTestProfile", testTestProfile)
    ]
    
    func testTestProfile() {
        
        var database = GATTDatabase(services: TestProfile.services)
        database.dump()
        
        XCTAssertEqual(database.attributeGroups.count, TestProfile.services.count)
        XCTAssertEqual(database.attributes[0x01].uuid, .characteristic)
        
        database.removeAll()
        
        XCTAssert(database.isEmpty)
        XCTAssert(database.attributes.isEmpty)
        XCTAssert(database.attributeGroups.isEmpty)
    }
}

extension GATTDatabase {
    
    func dump() {
        
        print("GATT Database:")
        
        for attribute in self {
            
            let value: Any = BluetoothUUID(data: attribute.value)?.littleEndian
                ?? String(data: attribute.value, encoding: .utf8)
                ?? attribute.value
            
            print("\(attribute.handle) - \(attribute.uuid)")
            print("Permissions: \(attribute.permissions)")
            print("Value: \(value)")
        }
    }
}
