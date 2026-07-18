//
//  UInt128CoverageTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Testing
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
@testable import Bluetooth

@Suite struct UInt128CoverageTests {

    // MARK: - Constants

    @Test func constants() {

        #expect(Bluetooth.UInt128.zero == Bluetooth.UInt128(_low: 0, _high: 0))
        #expect(Bluetooth.UInt128.min == Bluetooth.UInt128(_low: 0, _high: 0))
        #expect(Bluetooth.UInt128.max == Bluetooth.UInt128(_low: .max, _high: .max))
    }

    // MARK: - Accessors

    @Test func accessors() {

        let value = Bluetooth.UInt128(_low: 0xABCD, _high: 0x1234)
        #expect(value._low == 0xABCD)
        #expect(value._high == 0x1234)

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // _value round trips through Int128
        #expect(Bluetooth.UInt128(value._value) == value)

        // init(_ Int128)
        #expect(Bluetooth.UInt128(Int128(5)) == Bluetooth.UInt128(_low: 5, _high: 0))

        // init(bitPattern:) reinterprets bits: Int128(-1) is all ones == .max
        #expect(Bluetooth.UInt128(bitPattern: Int128(-1)) == .max)

        // Swift.UInt128 <-> Bluetooth.UInt128 round trip
        #expect(Swift.UInt128(value) == Swift.UInt128(_low: 0xABCD, _high: 0x1234))
        #expect(Bluetooth.UInt128(Swift.UInt128(_low: 0xABCD, _high: 0x1234)) == value)

        // mutate through _value setter
        var mutable = Bluetooth.UInt128.zero
        mutable._value = Int128(42)
        #expect(mutable == Bluetooth.UInt128(_low: 42, _high: 0))
    }

    // MARK: - Additive arithmetic

    @Test func addition() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // Carry across the 64-bit word boundary
        #expect(Bluetooth.UInt128(_low: .max, _high: 0) + 1 == Bluetooth.UInt128(_low: 0, _high: 1))
        #expect(Bluetooth.UInt128(_low: 0, _high: 1) - 1 == Bluetooth.UInt128(_low: .max, _high: 0))
        #expect(Bluetooth.UInt128(_low: 5, _high: 2) + Bluetooth.UInt128(_low: 5, _high: 3) == Bluetooth.UInt128(_low: 10, _high: 5))
    }

    // MARK: - Multiplication and division

    @Test func multiplication() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // (2^64 - 1) * 2 == 2^65 - 2
        #expect(Bluetooth.UInt128(_low: .max, _high: 0) * 2 == Bluetooth.UInt128(_low: .max - 1, _high: 1))

        var product = Bluetooth.UInt128(_low: .max, _high: 0)
        product *= 2
        #expect(product == Bluetooth.UInt128(_low: .max - 1, _high: 1))
    }

    @Test func division() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // 2^64 / 2 == 2^63
        #expect(Bluetooth.UInt128(_low: 0, _high: 1) / 2 == Bluetooth.UInt128(_low: 0x8000_0000_0000_0000, _high: 0))

        var quotient = Bluetooth.UInt128(_low: 0, _high: 1)
        quotient /= 2
        #expect(quotient == Bluetooth.UInt128(_low: 0x8000_0000_0000_0000, _high: 0))

        // Small values
        #expect(Bluetooth.UInt128(_low: 10, _high: 0) / Bluetooth.UInt128(_low: 3, _high: 0) == Bluetooth.UInt128(_low: 3, _high: 0))
    }

    @Test func remainder() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // (2^64 + 5) % 2 == 1 (odd)
        #expect(Bluetooth.UInt128(_low: 5, _high: 1) % 2 == Bluetooth.UInt128(_low: 1, _high: 0))
        #expect(Bluetooth.UInt128(_low: 10, _high: 0) % Bluetooth.UInt128(_low: 3, _high: 0) == Bluetooth.UInt128(_low: 1, _high: 0))

        var value = Bluetooth.UInt128(_low: 10, _high: 0)
        value %= Bluetooth.UInt128(_low: 3, _high: 0)
        #expect(value == Bluetooth.UInt128(_low: 1, _high: 0))
    }

    // MARK: - Overflow-reporting arithmetic

    @Test func addingReportingOverflow() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let overflowing = Bluetooth.UInt128.max.addingReportingOverflow(1)
        #expect(overflowing.partialValue == .zero)
        #expect(overflowing.overflow == true)

        let ok = Bluetooth.UInt128(_low: .max, _high: 0).addingReportingOverflow(1)
        #expect(ok.partialValue == Bluetooth.UInt128(_low: 0, _high: 1))
        #expect(ok.overflow == false)
    }

    @Test func subtractingReportingOverflow() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let overflowing = Bluetooth.UInt128.zero.subtractingReportingOverflow(1)
        #expect(overflowing.partialValue == .max)
        #expect(overflowing.overflow == true)

        let ok = Bluetooth.UInt128(_low: 0, _high: 1).subtractingReportingOverflow(1)
        #expect(ok.partialValue == Bluetooth.UInt128(_low: .max, _high: 0))
        #expect(ok.overflow == false)
    }

    @Test func multipliedReportingOverflow() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let overflowing = Bluetooth.UInt128.max.multipliedReportingOverflow(by: 2)
        #expect(overflowing.overflow == true)

        let ok = Bluetooth.UInt128(_low: .max, _high: 0).multipliedReportingOverflow(by: 2)
        #expect(ok.partialValue == Bluetooth.UInt128(_low: .max - 1, _high: 1))
        #expect(ok.overflow == false)
    }

    @Test func dividedReportingOverflow() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // Unsigned division never overflows
        let result = Bluetooth.UInt128(_low: 10, _high: 0).dividedReportingOverflow(by: Bluetooth.UInt128(_low: 3, _high: 0))
        #expect(result.partialValue == Bluetooth.UInt128(_low: 3, _high: 0))
        #expect(result.overflow == false)
    }

    @Test func remainderReportingOverflow() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let result = Bluetooth.UInt128(_low: 10, _high: 0).remainderReportingOverflow(dividingBy: Bluetooth.UInt128(_low: 3, _high: 0))
        #expect(result.partialValue == Bluetooth.UInt128(_low: 1, _high: 0))
        #expect(result.overflow == false)
    }

    // MARK: - Bitwise

    @Test func bitwiseAnd() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        var value = Bluetooth.UInt128(_low: 0xFF00, _high: 0xFFFF)
        value &= Bluetooth.UInt128(_low: 0x0FF0, _high: 0x00FF)
        #expect(value == Bluetooth.UInt128(_low: 0x0F00, _high: 0x00FF))
    }

    @Test func bitwiseOr() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        var value = Bluetooth.UInt128(_low: 0xFF00, _high: 0x00FF)
        value |= Bluetooth.UInt128(_low: 0x00FF, _high: 0xFF00)
        #expect(value == Bluetooth.UInt128(_low: 0xFFFF, _high: 0xFFFF))
    }

    @Test func bitwiseXor() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        var value = Bluetooth.UInt128(_low: 0xFF0F, _high: 0x0FF0)
        value ^= Bluetooth.UInt128(_low: 0x00FF, _high: 0xFF00)
        #expect(value == Bluetooth.UInt128(_low: 0xFFF0, _high: 0xF0F0))
    }

    @Test func shiftLeftAcrossBoundary() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // 1 << 64 == 2^64
        var value = Bluetooth.UInt128(_low: 1, _high: 0)
        value &<<= Bluetooth.UInt128(_low: 64, _high: 0)
        #expect(value == Bluetooth.UInt128(_low: 0, _high: 1))
    }

    @Test func shiftRightAcrossBoundary() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // 2^64 >> 64 == 1
        var value = Bluetooth.UInt128(_low: 0, _high: 1)
        value &>>= Bluetooth.UInt128(_low: 64, _high: 0)
        #expect(value == Bluetooth.UInt128(_low: 1, _high: 0))
    }

    // MARK: - BinaryInteger conversions

    @Test func initExactlyBinaryInteger() {

        // Fits: UInt64.max maps to the low word
        #expect(Bluetooth.UInt128(exactly: UInt64.max) == Bluetooth.UInt128(_low: .max, _high: 0))
        #expect(Bluetooth.UInt128(exactly: Int(42)) == Bluetooth.UInt128(_low: 42, _high: 0))

        // Out of range: negative signed integer cannot be represented
        #expect(Bluetooth.UInt128(exactly: Int(-1)) == nil)
    }

    @Test func initBinaryInteger() {

        #expect(Bluetooth.UInt128(UInt(42)) == Bluetooth.UInt128(_low: 42, _high: 0))
        #expect(Bluetooth.UInt128(UInt64.max) == Bluetooth.UInt128(_low: .max, _high: 0))
    }

    @Test func initClampingBinaryInteger() {

        // Fits exactly
        #expect(Bluetooth.UInt128(clamping: UInt64.max) == Bluetooth.UInt128(_low: .max, _high: 0))

        // Negative clamps to zero
        #expect(Bluetooth.UInt128(clamping: Int(-5)) == .zero)
        #expect(Bluetooth.UInt128(clamping: Int8.min) == .zero)
    }

    @Test func initTruncatingIfNeeded() {

        // -1 truncated to 128 bits is all ones
        #expect(Bluetooth.UInt128(truncatingIfNeeded: Int(-1)) == .max)
        #expect(Bluetooth.UInt128(truncatingIfNeeded: UInt64.max) == Bluetooth.UInt128(_low: .max, _high: 0))
        #expect(Bluetooth.UInt128(truncatingIfNeeded: Int(0)) == .zero)
    }

    @Test func initTruncatingBits() {

        #expect(Bluetooth.UInt128(_truncatingBits: 0xABCD) == Bluetooth.UInt128(_low: 0xABCD, _high: 0))
        #expect(Bluetooth.UInt128(_truncatingBits: 0) == .zero)
    }

    // MARK: - BinaryFloatingPoint conversions

    @Test func initExactlyFloatingPoint() {

        // Integral values convert exactly
        #expect(Bluetooth.UInt128(exactly: Double(0)) == .zero)
        #expect(Bluetooth.UInt128(exactly: Double(42)) == Bluetooth.UInt128(_low: 42, _high: 0))

        // Value exceeding UInt64 exercises the high word: 2^64
        #expect(Bluetooth.UInt128(exactly: 0x1.0p64 as Double) == Bluetooth.UInt128(_low: 0, _high: 1))

        // Non-integral values are not exactly representable
        #expect(Bluetooth.UInt128(exactly: 1.5 as Double) == nil)
    }

    @Test func initFloatingPoint() {

        // init(_:) rounds toward zero
        #expect(Bluetooth.UInt128(3.9 as Double) == Bluetooth.UInt128(_low: 3, _high: 0))
        #expect(Bluetooth.UInt128(0x1.0p64 as Double) == Bluetooth.UInt128(_low: 0, _high: 1))
    }

    // MARK: - Properties

    @Test func magnitude() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let value = Bluetooth.UInt128(_low: 0xABCD, _high: 0x1234)
        #expect(value.magnitude == value)
    }

    @Test func words() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let value = Bluetooth.UInt128(_low: 0x1111, _high: 0x2222)
        #expect(Array(value.words) == Array(Swift.UInt128(value).words))
    }

    @Test func trailingZeroBitCount() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // Low word nonzero
        #expect(Bluetooth.UInt128(_low: 8, _high: 0).trailingZeroBitCount == 3)
        // Low word zero, count continues into high word
        #expect(Bluetooth.UInt128(_low: 0, _high: 1).trailingZeroBitCount == 64)
        #expect(Bluetooth.UInt128(_low: 0, _high: 2).trailingZeroBitCount == 65)
        // Zero: full width
        #expect(Bluetooth.UInt128.zero.trailingZeroBitCount == 128)
    }

    @Test func leadingZeroBitCount() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // High word nonzero
        #expect(Bluetooth.UInt128(_low: 0, _high: 1).leadingZeroBitCount == 63)
        // High word zero, count continues from low word
        #expect(Bluetooth.UInt128(_low: 1, _high: 0).leadingZeroBitCount == 127)
        #expect(Bluetooth.UInt128.zero.leadingZeroBitCount == 128)
    }

    @Test func nonzeroBitCount() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        #expect(Bluetooth.UInt128.zero.nonzeroBitCount == 0)
        #expect(Bluetooth.UInt128.max.nonzeroBitCount == 128)
        #expect(Bluetooth.UInt128(_low: 0b1011, _high: 0b11).nonzeroBitCount == 5)
    }

    @Test func lowWord() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        #expect(Bluetooth.UInt128(_low: 0xABCD, _high: 0x1234)._lowWord == 0xABCD)
    }

    @Test func byteSwapped() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let value = Bluetooth.UInt128(_low: 0x1122_3344_5566_7788, _high: 0x99AA_BBCC_DDEE_FF00)
        #expect(value.byteSwapped == Bluetooth.UInt128(_low: 0x00FF_EEDD_CCBB_AA99, _high: 0x8877_6655_4433_2211))
        #expect(value.byteSwapped.byteSwapped == value)
    }

    // MARK: - Description

    @Test func descriptionDecimal() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // 2^64 + 1 == 18446744073709551617
        #expect(Bluetooth.UInt128(_low: 1, _high: 1).description == "18446744073709551617")
        #expect(Bluetooth.UInt128.zero.description == "0")
    }

    // MARK: - Comparison

    @Test func comparison() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        // Difference in the high word
        #expect(Bluetooth.UInt128(_low: 0, _high: 1) < Bluetooth.UInt128(_low: 0, _high: 2))
        // Difference in the low word only
        #expect(Bluetooth.UInt128(_low: 5, _high: 1) < Bluetooth.UInt128(_low: 6, _high: 1))
        #expect(Bluetooth.UInt128.min < Bluetooth.UInt128.max)

        #expect(Bluetooth.UInt128(_low: 5, _high: 1) <= Bluetooth.UInt128(_low: 5, _high: 1))
        #expect(Bluetooth.UInt128(_low: 6, _high: 1) > Bluetooth.UInt128(_low: 5, _high: 1))
        #expect(Bluetooth.UInt128(_low: 6, _high: 1) >= Bluetooth.UInt128(_low: 6, _high: 1))
        #expect(Bluetooth.UInt128(_low: 5, _high: 1) != Bluetooth.UInt128(_low: 6, _high: 1))
    }

    // MARK: - Hashable

    @Test func hashable() {

        let a = Bluetooth.UInt128(_low: 0xABCD, _high: 0x1234)
        let b = Bluetooth.UInt128(_low: 0xABCD, _high: 0x1234)
        let c = Bluetooth.UInt128(_low: 0xABCD, _high: 0x5678)

        #expect(a.hashValue == b.hashValue)

        let set: Set<Bluetooth.UInt128> = [a, b, c]
        #expect(set.count == 2)
    }

    // MARK: - Integer literal

    @Test func integerLiteral() {

        guard #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) else { return }

        let value: Bluetooth.UInt128 = 18446744073709551617 // 2^64 + 1
        #expect(value == Bluetooth.UInt128(_low: 1, _high: 1))
    }
}
