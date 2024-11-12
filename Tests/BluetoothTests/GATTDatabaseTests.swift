//
//  GATTDatabaseTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import XCTest
import Foundation
import Bluetooth
@testable import BluetoothGATT

final class GATTDatabaseTests: XCTestCase {
   
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
            
            let value: String = BluetoothUUID(data: attribute.value)?.littleEndian.description
                ?? String(utf8: attribute.value)
                ?? attribute.value.toHexadecimal()
            
            print("\(attribute.handle) - \(attribute.uuid)")
            print("Permissions: \(attribute.permissions)")
            print("Value: \(value)")
        }
    }
}
#endif
