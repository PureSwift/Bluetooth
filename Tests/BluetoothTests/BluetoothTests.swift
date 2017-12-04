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
        ("testAddress", testAddress),
        ("testUUID", testUUID)
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
            
            let uuidValue = GATT.UUID.PrimaryService.rawValue // 0x2800
            let uuid = BluetoothUUID.bit16(uuidValue)
            
            XCTAssert(uuid.rawValue == "0x2800") // big endian representation
            XCTAssert(uuid.littleEndian.data == Data([0x00, 0x28]))
            XCTAssert(uuid.littleEndian.data != Data([0x28, 0x00]))
        }
        
        do {
            
            /// reversed == C7A8D570-E023-4FB8-E511-72F9E24FF160
            let uuidString = "60F14FE2-F972-11E5-B84F-23E070D5A8C7"
            let uuidBytes: uuid_t = (0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7)
            let uuid = BluetoothUUID.bit128(UUID(rawValue: uuidString)!)
            
            XCTAssert(uuid.rawValue == uuidString)
            XCTAssert(UUID(data: Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]))!.rawValue == uuidString)
            XCTAssert(uuid == BluetoothUUID(bigEndian: .bit128(UUID(bytes: uuidBytes))))
            
            XCTAssert(uuid.littleEndian.data == Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))
            XCTAssert([UInt8](uuid.bigEndian.data) == [0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7])
            //XCTAssert(BluetoothUUID.bit128(UUID(data: Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]))!) == BluetoothUUID.bit128(UUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!))
        }
    }
}
