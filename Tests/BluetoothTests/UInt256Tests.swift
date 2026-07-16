//
//  UInt256Tests.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
@testable import Bluetooth

@Suite struct UInt256Tests {

    @Test func bitWidth() {

        #expect(UInt256.bitWidth == MemoryLayout<UInt256.ByteValue>.size * 8)
        #expect(UInt256.bitWidth == 256)
    }

    @Test func hashable() {

        #expect(UInt256.max.hashValue != 0)
    }

    @Test func expressibleByIntegerLiteral() {

        let values: [(UInt256, String)] = [
            (UInt256.zero, "0x0000000000000000000000000000000000000000000000000000000000000000"),
            (0x0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000, "0x0000000000000000000000000000000000000000000000000000000000000000"),
            (0x0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001, "0x0000000000000000000000000000000000000000000000000000000000000001"),
            (0x0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0020, "0x0000000000000000000000000000000000000000000000000000000000000020"),
            (0x0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_DCBA_BEBA_AFDE_0001, "0x000000000000000000000000000000000000000000000000DCBABEBAAFDE0001"),
            // Exercises all four 64-bit words of `StaticBigInt`, not just the low word.
            (
                0x0102030405060708_1112131415161718_2122232425262728_3132333435363738,
                "0x0102030405060708111213141516171821222324252627283132333435363738"
            ),
            (UInt256.max, "0x" + String(repeating: "F", count: 64))
        ]

        values.forEach { #expect($0.description == $1) }

        #expect(UInt256.zero == 0)
    }
}
