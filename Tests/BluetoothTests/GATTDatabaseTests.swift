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
        ("testDatabase", testDatabase)
    ]
    
    func testDatabase() {
        
        var database = GATTDatabase()
        
        database.add(service: TestProfile.TestService)
        database.add(service: TestProfile.TestDefinedService)
        
        XCTAssertEqual(database.attributeGroups.count, 2)
        XCTAssertEqual(database.attributes[0x01].uuid, TestProfile.TestService.uuid)
        XCTAssertEqual(database.attributes[0x01].uuid, TestProfile.TestService.uuid)
        
        database.removeAll()
        
        XCTAssert(database.isEmpty)
        XCTAssert(database.attributes.isEmpty)
        XCTAssert(database.attributeGroups.isEmpty)
    }
}
