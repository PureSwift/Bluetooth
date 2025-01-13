//
//  UInt48.swift
//  BluetoothTests
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth

@Suite struct UInt48Tests {

    @Test func bitWidth() {

        #expect(UInt48.bitWidth == MemoryLayout<UInt48.ByteValue>.size * 8)
        #expect(UInt48.bitWidth == 48)
    }

    @Test func comparable() {

        #expect(UInt48.zero == 0)
        #expect(UInt48.min == 0)
        #expect(UInt48.max == 281_474_976_710_655)
        #expect(UInt48.max == 0xFFFF_FFFF_FFFF)
        #expect(0xFFFF_FFFF_FFFF <= UInt48.max)
        #expect(0xFFFF_FFFF_FFFE < UInt48.max)
        #expect(0xFFFF_FFFF_FFFF >= UInt48.max)
        #expect(UInt48.max > 0xFFFF_FFFF_FFFE)
    }

    @Test func hashable() {

        #expect(UInt48.max.hashValue != 0)
    }

    @Test func expressibleByIntegerLiteral() {

        let values: [(UInt48, String)] = [
            (.zero, "0"),
            (0x00_0000_0000, "0"),
            (0x00_0000_0001, "1"),
            (0x00_0000_0020, "32"),
            (123_456_789, "123456789"),
            (281_474_976_710_655, "281474976710655"),
            (0xFFFF_FFFF_FFFF, "281474976710655")
        ]

        values.forEach { #expect($0.description == $1) }
    }

    @Test func data() {

        let data = Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])

        #expect(UInt48(data: data) == 281_474_976_710_655)
        #expect(Data(UInt48.max) == data)
    }
}
