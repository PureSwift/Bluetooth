//
//  UInt128Tests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth

@Suite struct UInt128Tests {

    @Test func bitWidth() {

        #expect(Bluetooth.UInt128.bitWidth == MemoryLayout<Bluetooth.UInt128.ByteValue>.size * 8)
        #expect(Bluetooth.UInt128.bitWidth == 128)
    }

    @Test func uUID() {

        let uuid = UUID(uuidString: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!
        let number = Bluetooth.UInt128(uuid: uuid)

        #expect(UUID(number) == uuid)
        #expect(number.uuidString == uuid.uuidString)
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            #expect(number.description == "128858851431381903469711580150894012615")
        } else {
            #expect(number.description == "0x60F14FE2F97211E5B84F23E070D5A8C7")
        }
    }

    @Test func hashable() {

        #expect(Bluetooth.UInt128.max.hashValue != 0)
    }

    @Test func hexadecimal() {

        var testData: [(UInt128, String)] = [
            (.min, "00000000000000000000000000000000"),
            (.max, "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        ]

        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            testData += [
                (0x60F1_4FE2_F972_11E5_B84F_23E0_70D5_A8C7, "60F14FE2F97211E5B84F23E070D5A8C7")
            ]
        }

        for (value, hexadecimal) in testData {
            #expect(value.hexadecimal == hexadecimal)
            if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
                #expect(UInt128(parse: hexadecimal, radix: 16) == value)
            }
        }
    }

    @Test func expressibleByIntegerLiteral() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else {
            print("Skipping \(#function), requires macOS 15")
            return
        }

        let values: [(UInt128, String)] = [
            (0x0000_0000_0000_0000_0000_0000_0000_0000, "0"),
            (0x0000_0000_0000_0000_0000_0000_0000_0001, "1"),
            (100_000_000_000_000_000_000_000_000_000, "100000000000000000000000000000"),
            (0xFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF, "340282366920938463463374607431768211455")
        ]

        values.forEach { #expect($0.description == $1) }

        #expect(UInt128.zero == 0)
        #expect(UInt128.min == 0)
        #expect(UInt128.max == 0xFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF)
    }
}
