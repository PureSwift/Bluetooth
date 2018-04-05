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

#if os(macOS) || os(iOS) || os(tvOS) || (os(watchOS) && swift(>=3.2))
import CoreBluetooth
#endif

final class UUIDTests: XCTestCase {
    
    static let allTests = [
        ("testMalformed", testMalformed),
        ("testFoundation", testFoundation)
    ]
    
    lazy var randomUUIDs = (1 ... 100000).map { _ in UUID() }
    
    func testMalformed() {
        
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
            "00001234-0000-1000-8000-00805F9B34F",
            "00001234-0000-1000-8000 00805F9B34FB",
            "00001234-0000-1000-8000-00805F9B34FBC",
            "00001234-0000-1000-800G-00805F9B34FB"
        ]
        
        malformed.forEach { XCTAssertNil(BluetoothUUID(rawValue: $0)) }
    }
    
    func testFoundation() {
        
        struct TestData {
            
            let bluetooth: BluetoothUUID
            
            let foundation: Foundation.UUID
            
            let bytes: UInt128.ByteValue
        }
        
        let testData: [TestData] = [
            TestData(bluetooth: .bit16(0x0000),
                     foundation: UUID(uuidString: "00000000-0000-1000-8000-00805F9B34FB")!,
                     bytes: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                             0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb)),
            TestData(bluetooth: .bit16(0x1234),
                     foundation: UUID(uuidString: "00001234-0000-1000-8000-00805F9B34FB")!,
                     bytes: (0x00, 0x00, 0x12, 0x34, 0x00, 0x00, 0x10, 0x00,
                             0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb)),
            TestData(bluetooth: .bit32(0x12345678),
                     foundation: UUID(uuidString: "12345678-0000-1000-8000-00805F9B34FB")!,
                     bytes: (0x12, 0x34, 0x56, 0x78, 0x00, 0x00, 0x10, 0x00,
                             0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb)),
            TestData(bluetooth: .bit128(UInt128(bigEndian: UInt128(bytes: (0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                                                                           0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb)))),
                     foundation: UUID.init(uuidString: "F0000000-0000-1000-8000-00805F9B34FB")!,
                     bytes: (0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                            0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb))
        ]
        
        for test in testData {
            
            let foundationUUID = UUID(bluetooth: test.bluetooth)
            
            XCTAssert(foundationUUID == test.foundation, "\(foundationUUID) == \(test.foundation)")
            XCTAssert(foundationUUID.uuidString == test.bluetooth.bit128.rawValue, foundationUUID.uuidString + " == " + test.bluetooth.rawValue)
            XCTAssert(UInt128(bigEndian: UInt128(bytes: test.bytes)) == UInt128(uuid: test.foundation))
        }
    }
    
    func testPrimaryServiceUUID() {
        
        let uuidString = "2800" // big endian representation
        let uuidValue = GATT.UUID.primaryService.rawValue // 0x2800
        let uuid = BluetoothUUID.bit16(uuidValue)
        
        XCTAssert(uuid.rawValue == uuidString)
        XCTAssert(BluetoothUUID(rawValue: uuidString)?.rawValue == uuidString)
        XCTAssert(uuid.littleEndian.data == Data([0x00, 0x28]))
        XCTAssert(uuid.littleEndian.data != Data([0x28, 0x00]))
        XCTAssert(uuid.bigEndian.data == Data([0x28, 0x00]))
    }
    
    func test128BitUUID() {
        
        /// reversed == C7A8D570-E023-4FB8-E511-72F9E24FF160
        let uuidString = "60F14FE2-F972-11E5-B84F-23E070D5A8C7"
        let uuidValue = UInt128(bigEndian: UInt128(bytes: (0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7)))
        
        guard let uuid = BluetoothUUID(rawValue: uuidString)
            else { XCTFail("Could not parse UUID string"); return }
        
        XCTAssert(uuid.rawValue == uuidString)
        XCTAssert(uuid.data == uuidValue.data)
        XCTAssert(uuid.littleEndian.data == Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))
        XCTAssert(uuid.bigEndian.data == Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]))
        XCTAssert(uuid.bigEndian == .bit128(UInt128(bytes: (0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7))))
        XCTAssert(uuid.littleEndian.data == Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))
        XCTAssert(uuid.bigEndian.data == Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]))
        XCTAssert(BluetoothUUID.init(littleEndian: BluetoothUUID.init(data: Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))!) == uuid)
        XCTAssert(BluetoothUUID(littleEndian: BluetoothUUID(data: Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))!) == uuid)
        
    }
    
    func testDefinedUUID() {
        
        let uuidString = "FEA9"
        let uuidValue: UInt16 = 0xFEA9 // 65193 Savant Systems LLC
        
        guard let uuid = BluetoothUUID(rawValue: uuidString)
            else { XCTFail("Could not parse UUID string"); return }
        
        XCTAssert(uuid.rawValue == uuidString)
        XCTAssert(uuid.littleEndian.data == Data([uuidValue.littleEndian.bytes.0, uuidValue.littleEndian.bytes.1]))
        XCTAssert(uuid.name == "Savant Systems LLC")
        XCTAssert("\(uuid)" == "FEA9 (Savant Systems LLC)", "\(uuid)")
    }
    
    func testPerformanceStringParse() {
        
        let uuids = randomUUIDs.map { $0.uuidString }
        
        measure { uuids.forEach { _ = BluetoothUUID(rawValue: $0) } }
    }
    
    func testPerformanceString() {
        
        let uuids = randomUUIDs.map { BluetoothUUID(uuid: $0) }
        
        measure { uuids.forEach { let _ = $0.rawValue } }
    }
    
    func testPerformanceDataParse() {
        
        let uuids = randomUUIDs.map { $0.data }
        
        measure { uuids.forEach { _ = BluetoothUUID(data: $0) } }
    }
    
    func testPerformanceData() {
        
        let uuids = randomUUIDs.map { BluetoothUUID(uuid: $0) }
        
        measure { uuids.forEach { let _ = $0.data } }
    }
    
    #if os(macOS) || os(iOS) || os(tvOS) || (os(watchOS) && swift(>=3.2))
    
    func testCoreBluetooth() {
        
        do {
            
            let uuid = BluetoothUUID.bit16(0xFEA9)
            
            let coreBluetoothUUID = uuid.toCoreBluetooth()
            
            XCTAssert(coreBluetoothUUID.uuidString == uuid.rawValue)
            
            XCTAssert(uuid.bigEndian.data == coreBluetoothUUID.data, "\(uuid.data) == \(coreBluetoothUUID.data)")
        }
        
        do {
            
            let uuid = BluetoothUUID() // 128 bit
            
            let coreBluetoothUUID = uuid.toCoreBluetooth()
            
            XCTAssert(coreBluetoothUUID.uuidString == uuid.rawValue)
            
            XCTAssert(uuid.bigEndian.data == coreBluetoothUUID.data, "\(uuid.data) == \(coreBluetoothUUID.data)")
        }
        
        do {
            
            let coreBluetoothUUID = CBUUID(string: "FEA9")
            
            let uuid = BluetoothUUID(coreBluetooth: coreBluetoothUUID)
            
            XCTAssert(coreBluetoothUUID.uuidString == uuid.rawValue)
            
            XCTAssert(uuid.bigEndian.data == coreBluetoothUUID.data, "\(uuid.data) == \(coreBluetoothUUID.data)")
        }
        
        do {
            
            let coreBluetoothUUID = CBUUID(string: "68753A44-4D6F-1226-9C60-0050E4C00067")
            
            let uuid = BluetoothUUID(coreBluetooth: coreBluetoothUUID)
            
            XCTAssert(coreBluetoothUUID.uuidString == uuid.rawValue)
            
            XCTAssert(uuid.bigEndian.data == coreBluetoothUUID.data, "\(uuid.data) == \(coreBluetoothUUID.data)")
        }
    }
    
    func testPerfomanceStringParseCoreBluetooth() {
        
        let uuids = randomUUIDs.map { $0.uuidString }
        
        measure { uuids.forEach { _ = CBUUID(string: $0) } }
    }
    
    func testPerfomanceStringCoreBluetooth() {
        
        let uuids = randomUUIDs.map { CBUUID(nsuuid: $0) }
        
        measure { uuids.forEach { let _ = $0.uuidString } }
    }
    
    func testPerformanceDataParseCoreBluetooth() {
        
        let uuids = randomUUIDs.map { $0.data }
        
        measure { uuids.forEach { _ = CBUUID(data: $0) } }
    }
    
    func testPerformanceDataCoreBluetooth() {
        
        let uuids = randomUUIDs.map { CBUUID(nsuuid: $0) }
        
        measure { uuids.forEach { let _ = $0.data } }
    }
    
    #endif
}
