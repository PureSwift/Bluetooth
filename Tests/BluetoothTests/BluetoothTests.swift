//
//  BluetoothTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/28/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class BluetoothTests: XCTestCase {
    
    static let allTests = [
        ("testAddress", testAddress)
        ]
    
    func testAddress() {
        
        let addressString = "00:1A:7D:DA:71:13"
        //59:80:ED:81:EE:35
        //AC:BC:32:A6:67:42
        let addressBytes: Address.ByteValue = (0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13)
        
        guard let address = Address(rawValue: addressString)
            else { XCTFail("Could not parse"); return }
        
        XCTAssert(address.rawValue == addressString, "\(address.rawValue)")
        
        XCTAssert(address == Address(bigEndian: Address(bytes: addressBytes)))
    }
    
    func testUUID() {
        
        do {
            
            /// refersed C7A8D570-E023-4FB8-E511-72F9E24FF160
            let uuidString = "60F14FE2-F972-11E5-B84F-23E070D5A8C7"
            let uuid = BluetoothUUID.bit128(UUID(rawValue: uuidString)!)
            
            XCTAssert(uuid.rawValue == uuidString)
        }
    }
}
