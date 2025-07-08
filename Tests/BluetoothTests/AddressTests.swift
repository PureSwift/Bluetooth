//
//  AddressTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import CoreFoundation
import Testing
import Bluetooth
#if canImport(CBluetooth)
import CBluetooth
import CBluetoothShim
#endif

@Suite("Bluetooth Address Tests")
struct BluetoothAddressTests {

    @Test func properties() throws {

        #expect(BluetoothAddress.bitWidth == MemoryLayout<BluetoothAddress.ByteValue>.size * 8)
        #expect(BluetoothAddress.bitWidth == 48)

        Data(BluetoothAddress.min).forEach { #expect($0 == .min) }
        Data(BluetoothAddress.max).forEach { #expect($0 == .max) }
        Data(BluetoothAddress.zero).forEach { #expect($0 == 0) }
        #expect(BluetoothAddress.zero == BluetoothAddress.min)

        let address = try #require(BluetoothAddress(rawValue: "00:1A:7D:DA:71:13"))

        #expect(address.hashValue != 0)
        #expect(address.description == "00:1A:7D:DA:71:13")
        #expect(address == #BluetoothAddress("00:1A:7D:DA:71:13"))
    }

    @Test func bytes() throws {

        let testData: [(rawValue: String, bytes: BluetoothAddress.ByteValue)] = [
            ("00:1A:7D:DA:71:13", (0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13)),
            ("59:80:ED:81:EE:35", (0x59, 0x80, 0xED, 0x81, 0xEE, 0x35)),
            ("AC:BC:32:A6:67:42", (0xAC, 0xBC, 0x32, 0xA6, 0x67, 0x42))
        ]

        for test in testData {

            let address = try #require(BluetoothAddress(rawValue: test.rawValue))

            #expect(address.rawValue == test.rawValue)
            #expect(address == BluetoothAddress(bigEndian: BluetoothAddress(bytes: test.bytes)))

            #expect(address.bigEndian.bytes.0 == test.bytes.0)
            #expect(address.bigEndian.bytes.1 == test.bytes.1)
            #expect(address.bigEndian.bytes.2 == test.bytes.2)
            #expect(address.bigEndian.bytes.3 == test.bytes.3)
            #expect(address.bigEndian.bytes.4 == test.bytes.4)
            #expect(address.bigEndian.bytes.5 == test.bytes.5)
        }
    }

    @Test func malformedString() throws {

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
            "@aXX:XX:XX:XX:&&",
            "AA:BB:CC:DD:$$",
            "AA:BB:CC:DD:^^",
            "12C:BB:CC:DD:EE",
            "12C:BB:CC:DD:E",
            "FFFF::7D:DA:71:13",
            "00:1A:7D:DA:71:13a",
            "0:1A:7D:DA:71:13",
            "00:1A:7D:DA:71;13"
        ]

        for string in malformed {
            #expect(BluetoothAddress(rawValue: string) == nil)
        }
    }

    func validString() {

        let rawValues = [
            "00:1A:7D:DA:71:13",
            "59:80:ED:81:EE:35",
            "AC:BC:32:A6:67:42"
        ]

        for string in rawValues {
            #expect(BluetoothAddress(rawValue: string)?.rawValue == string)
        }
    }

    func validData() throws {

        let testData: [(rawValue: String, data: Data)] = [
            ("00:1A:7D:DA:71:13", Data([0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13])),
            ("59:80:ED:81:EE:35", Data([0x59, 0x80, 0xED, 0x81, 0xEE, 0x35])),
            ("AC:BC:32:A6:67:42", Data([0xAC, 0xBC, 0x32, 0xA6, 0x67, 0x42]))
        ]

        for test in testData {

            let address = try #require(BluetoothAddress(rawValue: test.rawValue))

            #expect(address.rawValue == test.rawValue)
            #expect(address == BluetoothAddress(bigEndian: BluetoothAddress(data: test.data)!))
            #expect(Data(address.bigEndian) == test.data)
            
            #if canImport(CBluetooth)
            // C APIs
            var cValue = unsafeBitCast(address, to: BTAddress.self)
            var zero = unsafeBitCast(BluetoothAddress.zero, to: BTAddress.self)
            
            #expect(BTAddressEqual(&cValue, &zero) == true)
            #endif
        }
    }

    func malformedData() {

        let malformed = [
            Data(),
            Data([0x00]),
            Data([0x00, 0x1A]),
            Data([0x00, 0x1A, 0x7D]),
            Data([0x00, 0x1A, 0x7D, 0xDA]),
            Data([0x00, 0x1A, 0x7D, 0xDA, 0x71]),
            Data([0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13, 0xAA])
        ]

        for data in malformed {
            #expect(BluetoothAddress(data: data) == nil)
        }
    }
}
