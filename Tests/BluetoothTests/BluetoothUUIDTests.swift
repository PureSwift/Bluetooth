//
//  UUIDTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Testing
#if canImport(BluetoothGATT)
import Bluetooth
@testable import BluetoothGATT
#else
@testable import Bluetooth
#endif

@Suite struct BluetoothUUIDTests {

    @Test func malformed() {
        
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
        
        malformed.forEach { #expect(BluetoothUUID(rawValue: $0) == nil)  }
    }
    
    @Test func foundation() {
        
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
            #expect(foundationUUID == test.foundation)
            #expect(foundationUUID.uuidString == test.bluetooth.bit128.rawValue)
            #expect(UInt128(bigEndian: UInt128(bytes: test.bytes)) == UInt128(uuid: test.foundation))
            switch test.bluetooth {
            case .bit16:
                #expect(test.bluetooth.rawValue.utf8.count == 4)
            case .bit32:
                #expect(test.bluetooth.rawValue.utf8.count == 8)
            case .bit128:
                #expect(test.bluetooth.rawValue.utf8.count == 36)
            }
        }
    }
    
    @Test func primaryServiceUUID() {
        
        let uuidString = "2800" // big endian representation
        #if canImport(BluetoothGATT)
        let uuidValue = GATTUUID.primaryService.rawValue // 0x2800
        #else
        let uuidValue: UInt16 = 0x2800
        #endif
        let uuid = BluetoothUUID.bit16(uuidValue)
        
        #expect(uuid.rawValue == uuidString)
        #expect(BluetoothUUID(rawValue: uuidString)?.rawValue == uuidString)
        #expect(Data(uuid.littleEndian) == Data([0x00, 0x28]))
        #expect(Data(uuid.littleEndian) != Data([0x28, 0x00]))
        #expect(Data(uuid.bigEndian) == Data([0x28, 0x00]))
        #expect(uuid == BluetoothUUID(data: Data(uuid)))
        #expect(uuid == #BluetoothUUID("2800"))
    }
    
    @Test func test128BitUUID() {
        
        /// reversed == C7A8D570-E023-4FB8-E511-72F9E24FF160
        let uuidString = "60F14FE2-F972-11E5-B84F-23E070D5A8C7"
        let uuidValue = UInt128(bigEndian: UInt128(bytes: (0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7)))
        
        guard let uuid = BluetoothUUID(rawValue: uuidString)
            else { Issue.record("Could not parse UUID string"); return }
        
        #expect(uuid.rawValue == uuidString)
        #expect(Data(uuid) == Data(uuidValue))
        #expect(Data(uuid.littleEndian) == Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))
        #expect(Data(uuid.bigEndian) == Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]))
        #expect(uuid.bigEndian == .bit128(UInt128(bytes: (0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7))))
        #expect(Data(uuid.littleEndian) == Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))
        #expect(Data(uuid.bigEndian) == Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]))
        #expect(BluetoothUUID.init(littleEndian: BluetoothUUID.init(data: Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))!) == uuid)
        #expect(BluetoothUUID(littleEndian: BluetoothUUID(data: Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))!) == uuid)
        #expect(uuid == BluetoothUUID(data: Data(uuid)))
        #expect(uuid == #BluetoothUUID("60F14FE2-F972-11E5-B84F-23E070D5A8C7"))
    }
    
    @Test func definedUUID() {
        
        let uuidString = "FEA9"
        let uuidValue: UInt16 = 0xFEA9 // 65193 Savant Systems LLC
        
        guard let uuid = BluetoothUUID(rawValue: uuidString)
            else { Issue.record("Could not parse UUID string"); return }
        
        #if !os(WASI)
        #expect(uuid == .savantSystems2)
        #expect(uuid.name == "Savant Systems LLC")
        #expect("\(uuid)" == "FEA9 (Savant Systems LLC)", "\(uuid)")
        #endif
        #expect(uuid.rawValue == uuidString)
        #expect(uuid.hashValue != 0)
        #expect(uuid == .bit16(uuidValue))
        #expect(uuid != .bit16(0xFEAA))
        if #available(macOS 15, iOS 18, *) {
            #expect(uuid != .bit128(0x00))
        }
        #expect(uuid != .bit32(0x12345678))
        
        #expect(Data(uuid.littleEndian) == Data([uuidValue.littleEndian.bytes.0,
                                                     uuidValue.littleEndian.bytes.1]))
        
        #expect(Data(uuid.bigEndian) == Data([uuidValue.bigEndian.bytes.0,
                                                  uuidValue.bigEndian.bytes.1]))
        
        #expect(uuid == BluetoothUUID(data: Data(uuid)))
        #expect(uuid == #BluetoothUUID("FEA9"))
    }
    
    @Test func test32BitUUID() {
        
        let uuidString = "12345678"
        let uuidValue: UInt32 = 0x12345678
        
        guard let uuid = BluetoothUUID(rawValue: uuidString)
            else { Issue.record("Could not parse UUID string"); return }
        
        #if !os(WASI)
        #expect(uuid.name == nil)
        #endif
        #expect(uuid.rawValue == uuidString)
        #expect(uuid.description == uuidString)
        #expect(uuid == uuid)
        #expect(uuid == .bit32(uuidValue))
        #expect(uuid != .bit32(0x1234))
        #expect(uuid != .bit16(0xFEA9))
        if #available(macOS 15, iOS 18, *) {
            #expect(uuid != .bit128(0x00))
        }
        
        #expect(Data(uuid.littleEndian) == Data([uuidValue.littleEndian.bytes.0,
                                                     uuidValue.littleEndian.bytes.1,
                                                     uuidValue.littleEndian.bytes.2,
                                                     uuidValue.littleEndian.bytes.3]))
        
        #expect(Data(uuid.bigEndian) == Data([uuidValue.bigEndian.bytes.0,
                                                  uuidValue.bigEndian.bytes.1,
                                                  uuidValue.bigEndian.bytes.2,
                                                  uuidValue.bigEndian.bytes.3]))
        
        #expect(uuid == BluetoothUUID(data: Data(uuid)))
        #expect(uuid == #BluetoothUUID("12345678"))
    }
    
    @Test func test16BitBaseUUID() {
        
        #expect(UInt16(bluetooth: UUID()) == nil)
        
        let uuids: [UInt16: UUID] = [
            0x1800: UUID(uuidString: "00001800-0000-1000-8000-00805F9B34FB")!,
            0x1801: UUID(uuidString: "00001801-0000-1000-8000-00805F9B34FB")!,
            0xFE59: UUID(uuidString: "0000FE59-0000-1000-8000-00805F9B34FB")!
        ]
        
        uuids.forEach {
            #expect($0.key == UInt16(bluetooth: $0.value))
            #expect(UInt128(.bit16($0.key)) == UInt128(uuid: $0.value))
        }
    }
    
    @Test func test32BitBaseUUID() {
        
        #expect(UInt32(bluetooth: UUID()) == nil)
        
        let uuids: [UInt32: UUID] = [
            0x00001800: UUID(uuidString: "00001800-0000-1000-8000-00805F9B34FB")!,
            0x00001801: UUID(uuidString: "00001801-0000-1000-8000-00805F9B34FB")!,
            0x0000FE59: UUID(uuidString: "0000FE59-0000-1000-8000-00805F9B34FB")!,
            0x00000000: UUID(uuidString: "00000000-0000-1000-8000-00805F9B34FB")!,
            0x12345678: UUID(uuidString: "12345678-0000-1000-8000-00805F9B34FB")!
        ]
        
        uuids.forEach {
            #expect($0.key == UInt32(bluetooth: $0.value))
            #expect(UInt128(.bit32($0.key)) == UInt128(uuid: $0.value))
        }
    }
    
    @Test func losslessStringConvertible() throws {
        
        let data: [(BluetoothUUID, String)] = [
            (.bit16(0x1800), "1800"),
            (.bit16(0x1800), "1800 (Generic Access Profile)"),
            (.bit16(0xFEA9), "FEA9"),
            (.bit16(0xFEA9), "FEA9 (Savant Systems LLC)"),
            (.bit32(0x12345678).bit128, "12345678-0000-1000-8000-00805F9B34FB")
        ]
        
        for (uuid, string) in data {
            let parsed = try #require(BluetoothUUID(string))
            #expect(parsed == uuid)
        }
    }
}

// MARK: - Performance Tests

#if canImport(XCTest) && ENABLE_PERFORMANCE_TESTS
import XCTest

final class BluetoothUUIDPerformanceTests: XCTestCase {
    
    let randomUUIDs = (1 ... 100000).map { _ in UUID() }
    
    func testPerformanceStringParse() {
        
        let uuids = randomUUIDs.map { $0.uuidString }
        
        measure { uuids.forEach { _ = BluetoothUUID(rawValue: $0) } }
    }
    
    func testPerformanceString() {
        
        let uuids = randomUUIDs.map { BluetoothUUID(uuid: $0) }
        
        measure { uuids.forEach { let _ = $0.rawValue } }
    }
    
    func testPerformanceDataParse() {
        
        let uuids = randomUUIDs.map { Data($0) }
        
        measure { uuids.forEach { _ = BluetoothUUID(data: $0) } }
    }
    
    func testPerformanceData() {
        
        let uuids = randomUUIDs.map { BluetoothUUID(uuid: $0) }
        
        measure { uuids.forEach { let _ = Data($0) } }
    }
}
#endif
