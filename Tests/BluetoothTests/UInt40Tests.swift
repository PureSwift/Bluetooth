//
//  UInt40Tests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/28/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth

@Suite struct UInt40Tests {

    @Test func bitWidth() {

        #expect(UInt40.bitWidth == MemoryLayout<UInt40.ByteValue>.size * 8)
        #expect(UInt40.bitWidth == 40)
    }

    @Test func equatable() {

        #expect(UInt40.zero == 0)
        #expect(UInt40.min == 0)
        #expect(UInt40.max == 1_099_511_627_775)
        #expect(UInt40.max == 0xFF_FFFF_FFFF)
    }

    @Test func hashable() {

        #expect(UInt40.max.hashValue != UInt64.max.hashValue)
    }

    @Test func expressibleByIntegerLiteral() {

        let values: [(UInt40, String)] = [
            (UInt40.zero, "0"),
            (0x00_0000_0000, "0"),
            (0x00_0000_0001, "1"),
            (0x00_0000_0020, "32"),
            (12_345_678, "12345678"),
            (1_099_511_627_775, "1099511627775"),
            (0xFF_FFFF_FFFF, "1099511627775")
        ]

        values.forEach { #expect($0.description == $1) }
    }
}
