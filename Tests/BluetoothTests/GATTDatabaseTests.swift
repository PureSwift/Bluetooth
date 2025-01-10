//
//  GATTDatabaseTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import Testing
import Foundation
import Bluetooth
@testable import BluetoothGATT

@Suite struct GATTDatabaseTests {
   
    @Test func testProfile() {
        
        var database = GATTDatabase(services: TestProfile.services)
        database.dump()
        
        #expect(database.attributeGroups.count == TestProfile.services.count)
        #expect(database.attributes[0x01].uuid == .characteristic)
        #expect(Array(database) == database.attributes)
        
        database.removeAll()
        
        #expect(database.isEmpty)
        #expect(database.attributes.isEmpty)
        #expect(database.attributeGroups.isEmpty)
    }
}

extension GATTDatabase {
    
    func dump() {
        
        print("GATT Database:")
        
        for attribute in self {
            
            let value: String = BluetoothUUID(data: attribute.value)?.littleEndian.description
                ?? ((attribute.value.count > 1) ? String(utf8: attribute.value) : attribute.value.toHexadecimal())
                ?? attribute.value.toHexadecimal()
            
            print("\(attribute.handle) - \(attribute.uuid)")
            print("Permissions: \(attribute.permissions)")
            print("Value: \(value)")
        }
    }
}
#endif
