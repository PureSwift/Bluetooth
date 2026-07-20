//
//  SFloat.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// IEEE-11073 16-bit SFLOAT
///
/// A 16-bit value composed of a 4-bit signed exponent followed by a 12-bit signed mantissa,
/// both encoded as two's complement. The represented value is `mantissa * 10 ^ exponent`.
///
/// A small set of mantissa values is reserved to encode NaN, infinity and "not at this resolution".
@frozen
public struct SFloat: Equatable, Hashable, Sendable {

    /// The bit pattern of the value’s encoding.
    public private(set) var bitPattern: UInt16

    /// Creates a new value with the given bit pattern.
    public init(bitPattern: UInt16) {
        self.bitPattern = bitPattern
    }

    /// Creates a value initialized to zero.
    public init() {
        self.bitPattern = 0
    }

    public init(_ value: Float) {
        self.init(bitPattern: SFloat.bitPattern(for: value))
    }
}

// MARK: - Reserved Values

internal extension SFloat {

    /// Mantissa values reserved by IEEE-11073 for special quantities.
    enum Reserved {

        /// Positive infinity.
        static var infinity: UInt16 { 0x07FE }

        /// Not a number.
        static var nan: UInt16 { 0x07FF }

        /// Not at this resolution.
        static var notAtThisResolution: UInt16 { 0x0800 }

        /// Reserved for future use.
        static var reservedForFutureUse: UInt16 { 0x0801 }

        /// Negative infinity.
        static var negativeInfinity: UInt16 { 0x0802 }
    }

    /// The largest magnitude a mantissa may take without colliding with a reserved value.
    static var maxMantissa: Int32 { 2045 }
}

// MARK: - Components

public extension SFloat {

    /// The base-10 exponent, sign extended from the high 4 bits.
    var exponent: Int {
        let raw = Int(bitPattern >> 12)
        return raw >= 0x08 ? raw - 0x10 : raw
    }

    /// The mantissa, sign extended from the low 12 bits.
    ///
    /// This is the raw encoded value and is only meaningful when ``isFinite`` is `true`.
    var mantissa: Int {
        let raw = Int(bitPattern & 0x0FFF)
        return raw >= 0x0800 ? raw - 0x1000 : raw
    }

    /// A Boolean value indicating whether this instance is NaN.
    ///
    /// The IEEE-11073 "not at this resolution" and "reserved for future use" quantities have no
    /// floating point counterpart and are also reported as NaN.
    var isNaN: Bool {
        switch bitPattern & 0x0FFF {
        case Reserved.nan, Reserved.notAtThisResolution, Reserved.reservedForFutureUse:
            return true
        default:
            return false
        }
    }

    /// A Boolean value indicating whether this instance is infinite.
    var isInfinite: Bool {
        switch bitPattern & 0x0FFF {
        case Reserved.infinity, Reserved.negativeInfinity:
            return true
        default:
            return false
        }
    }

    /// A Boolean value indicating whether this instance is finite.
    var isFinite: Bool {
        return isNaN == false && isInfinite == false
    }
}

// MARK: - Conversion

internal extension SFloat {

    static func bitPattern(for value: Float) -> UInt16 {

        guard value.isNaN == false
        else { return Reserved.nan }

        guard value.isInfinite == false
        else { return value < 0 ? Reserved.negativeInfinity : Reserved.infinity }

        guard value != 0
        else { return 0 }

        let maxMantissa = Float(self.maxMantissa)
        var mantissa = value
        var exponent = 0

        // Scale up to retain as many significant digits as the mantissa can hold.
        while exponent > -8, mantissa.magnitude * 10 <= maxMantissa {
            mantissa *= 10
            exponent -= 1
        }

        // Scale down until the mantissa fits.
        while exponent < 7, mantissa.magnitude > maxMantissa {
            mantissa /= 10
            exponent += 1
        }

        // Too large to encode at any exponent.
        guard mantissa.magnitude <= maxMantissa
        else { return value < 0 ? Reserved.negativeInfinity : Reserved.infinity }

        var rounded = Int32(mantissa.rounded())

        // Rounding may have pushed the mantissa over the limit.
        if rounded.magnitude > self.maxMantissa, exponent < 7 {
            rounded = Int32((mantissa / 10).rounded())
            exponent += 1
        }

        guard rounded.magnitude <= self.maxMantissa
        else { return value < 0 ? Reserved.negativeInfinity : Reserved.infinity }

        let exponentBits = UInt16(UInt8(bitPattern: Int8(exponent)) & 0x0F) << 12
        let mantissaBits = UInt16(bitPattern: Int16(rounded)) & 0x0FFF
        return exponentBits | mantissaBits
    }
}

public extension Float {

    init(_ value: SFloat) {

        if value.isNaN {
            self = .nan
            return
        }

        if value.isInfinite {
            self = value.bitPattern & 0x0FFF == SFloat.Reserved.negativeInfinity ? -.infinity : .infinity
            return
        }

        var result = Float(value.mantissa)
        let exponent = value.exponent

        // `pow()` lives in Foundation, which is unavailable in Embedded Swift.
        if exponent > 0 {
            for _ in 0..<exponent {
                result *= 10
            }
        } else if exponent < 0 {
            for _ in 0..<(-exponent) {
                result /= 10
            }
        }

        self = result
    }
}

#if !os(macOS) && !(os(iOS) && targetEnvironment(macCatalyst))
@available(iOS 14.0, watchOS 7.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
public extension SFloat {

    init(_ float: Float16) {
        self.init(Float(float))
    }
}

@available(iOS 14.0, watchOS 7.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
public extension Float16 {

    init(_ float: SFloat) {
        self.init(Float(float))
    }
}
#endif

#if !hasFeature(Embedded)
extension SFloat: Codable {}
#endif

// MARK: - CustomStringConvertible

extension SFloat: CustomStringConvertible {

    public var description: String {
        return Float(self).description
    }
}

// MARK: - Byte Swap

extension SFloat: ByteSwap {

    /// A representation of this float with the byte order swapped.
    public var byteSwapped: SFloat {
        return SFloat(bitPattern: bitPattern.byteSwapped)
    }
}
