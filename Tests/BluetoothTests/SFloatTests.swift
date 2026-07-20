//
//  SFloatTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing

@testable import Bluetooth

@Suite struct SFloatTests {

    @Test func components() {
        // exponent 0, mantissa 114
        let value = SFloat(bitPattern: 0x0072)
        #expect(value.exponent == 0)
        #expect(value.mantissa == 114)
        #expect(value.isFinite)
        #expect(Float(value) == 114)
    }

    @Test func negativeExponentAndMantissa() {
        // exponent -1, mantissa -162
        let value = SFloat(bitPattern: 0xFF5E)
        #expect(value.exponent == -1)
        #expect(value.mantissa == -162)
        #expect(Float(value) == -16.2)
    }

    @Test func positiveExponent() {
        // exponent 2, mantissa 36
        let value = SFloat(bitPattern: 0x2024)
        #expect(value.exponent == 2)
        #expect(value.mantissa == 36)
        #expect(Float(value) == 3600)
    }

    @Test func reservedValues() {
        #expect(SFloat(bitPattern: 0x07FF).isNaN)
        #expect(Float(SFloat(bitPattern: 0x07FF)).isNaN)
        #expect(SFloat(bitPattern: 0x0800).isNaN)  // NRes
        #expect(SFloat(bitPattern: 0x0801).isNaN)  // reserved
        #expect(SFloat(bitPattern: 0x07FE).isInfinite)
        #expect(Float(SFloat(bitPattern: 0x07FE)) == .infinity)
        #expect(SFloat(bitPattern: 0x0802).isInfinite)
        #expect(Float(SFloat(bitPattern: 0x0802)) == -.infinity)
        #expect(SFloat(bitPattern: 0x0000).isFinite)
    }

    @Test func encodeSpecialValues() {
        #expect(SFloat(Float.nan).isNaN)
        #expect(SFloat(Float.infinity).bitPattern == 0x07FE)
        #expect(SFloat(-Float.infinity).bitPattern == 0x0802)
        #expect(SFloat(0).bitPattern == 0)
    }

    @Test func roundTrip() {
        // A 12-bit mantissa capped at 2045 bounds the relative error at roughly 0.25%.
        let values: [Float] = [0, 1, -1, 60, 120.5, -16.2, 0.001, 98.6, 2045, -2045, 36.75]
        for value in values {
            let decoded = Float(SFloat(value))
            #expect(
                (decoded - value).magnitude <= value.magnitude * 0.0025,
                "\(value) round tripped as \(decoded)"
            )
        }
    }

    @Test func encodedMantissaNeverCollidesWithReservedValues() {
        // A finite encoding must never land on a reserved mantissa.
        var value: Float = -3000
        while value <= 3000 {
            let encoded = SFloat(value)
            if value.magnitude <= 2045 {
                #expect(encoded.isFinite, "\(value) encoded as \(encoded.bitPattern)")
            }
            value += 0.25
        }
    }

    @Test func overflowsToInfinity() {
        #expect(SFloat(Float.greatestFiniteMagnitude).bitPattern == 0x07FE)
        #expect(SFloat(-Float.greatestFiniteMagnitude).bitPattern == 0x0802)
    }

    @Test func byteSwapped() {
        #expect(SFloat(bitPattern: 0x00FF).byteSwapped.bitPattern == 0xFF00)
    }
}
