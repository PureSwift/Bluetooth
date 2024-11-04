//
//  UInt128.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/4/17.
//

#if canImport(Foundation)
import Foundation
#endif

// MARK: - ByteValue

extension UInt128: ByteValue {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
        
    public var bytes: ByteValue {
      @_transparent
      get {
          unsafeBitCast(self, to: ByteValue.self)
      }
    
      @_transparent
      set {
          self = .init(bytes: newValue)
      }
    }
    
    public init(bytes: ByteValue) {
        self = unsafeBitCast(bytes, to: Self.self)
    }
}

// MARK: - Data Convertible

public extension UInt128 {
    
    static var length: Int { return 16 }
    
    init?<C>(_ data: C) where C: RandomAccessCollection, C.Element == UInt8, C.Index == Int {
        guard data.count == UInt128.length
            else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
}

#if canImport(Foundation)
public extension UInt128 {
    
    init?(data: Data) {
        self.init(data)
    }
    
    var data: Data {
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
    }
}
#endif

// MARK: - Byte Swap

// TODO: Conflicts with FixedWidthInteger
#if canImport(Darwin)
extension UInt128: ByteSwap { }
#endif

// MARK: - UUID

public extension UInt128 {
    
    init(uuid: UUID) {
        /// UUID is always big endian
        let bigEndian = UInt128(bytes: uuid.uuid)
        self.init(bigEndian: bigEndian)
    }
}

public extension UUID {
    
    init(_ value: UInt128) {
        
        // UUID is always stored in big endian bytes
        let bytes = value.bigEndian.bytes
        
        self.init(bytes: (bytes.0,
                          bytes.1,
                          bytes.2,
                          bytes.3,
                          bytes.4,
                          bytes.5,
                          bytes.6,
                          bytes.7,
                          bytes.8,
                          bytes.9,
                          bytes.10,
                          bytes.11,
                          bytes.12,
                          bytes.13,
                          bytes.14,
                          bytes.15))
    }
}

// MARK: - Backwards compatibility

internal extension UInt128 {
    
    var hexadecimal: String {
        let bytes = self.bigEndian.bytes
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal()
            + bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal()
            + bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal()
            + bytes.8.toHexadecimal()
            + bytes.9.toHexadecimal()
            + bytes.10.toHexadecimal()
            + bytes.11.toHexadecimal()
            + bytes.12.toHexadecimal()
            + bytes.13.toHexadecimal()
            + bytes.14.toHexadecimal()
            + bytes.15.toHexadecimal()
    }
}

#if canImport(Darwin)
/// A 128-bit signed integer value type.
@frozen
public struct UInt128: Sendable {
    
#if _endian(little)
  public var _low: UInt64
  public var _high: UInt64
#else
  public var _high: UInt64
  public var _low: UInt64
#endif

  @_transparent
  public init(_low: UInt64, _high: UInt64) {
    self._low = _low
    self._high = _high
  }
  
  // Allow conversion if type is available.
  @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  public var _value: Int128 {
    @_transparent
    get {
      unsafeBitCast(self, to: Int128.self)
    }

    @_transparent
    set {
      self = Self(newValue)
    }
  }
  
  @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  @_transparent
  public init(_ _value: Int128) {
    self = unsafeBitCast(_value, to: Self.self)
  }

  /// Creates a new instance with the same memory representation as the given
  /// value.
  ///
  /// This initializer does not perform any range or overflow checking. The
  /// resulting instance may not have the same numeric value as
  /// `bitPattern`---it is only guaranteed to use the same pattern of bits in
  /// its binary representation.
  ///
  /// - Parameter bitPattern: A value to use as the source of the new instance's
  ///   binary representation.
  @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  @_transparent
  public init(bitPattern: Int128) {
    self.init(bitPattern)
  }
}

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
public extension Bluetooth.UInt128 {
    
    init(_ value: Swift.UInt128) {
        self.init(_low: value._low, _high: value._high)
    }
}

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
public extension Swift.UInt128 {
    
    init(_ value: Bluetooth.UInt128) {
        self.init(bitPattern: value._value)
    }
}

// MARK: - Constants

extension Bluetooth.UInt128 {
  @_transparent
  public static var zero: Self {
      Self(_low: .min, _high: .min)
  }

  @_transparent
  public static var min: Self {
    zero
  }

  @_transparent
  public static var max: Self {
    Self(_low: .max, _high: .max)
  }
}

// MARK: - ExpressibleByIntegerLiteral

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension Bluetooth.UInt128: ExpressibleByIntegerLiteral {
    
    public typealias IntegerLiteralType = Swift.UInt128
    
    public init(integerLiteral value: Swift.UInt128) {
        self.init(_low: value._low, _high: value._high)
    }
}

// MARK: - Conversions

extension Bluetooth.UInt128 {

  @inlinable
  public init?<T>(exactly source: T) where T: BinaryInteger {
    guard let high = UInt64(exactly: source >> 64) else { return nil }
    let low = UInt64(truncatingIfNeeded: source)
    self.init(_low: low, _high: high)
  }

  @inlinable
  public init<T>(_ source: T) where T: BinaryInteger {
    guard let value = Self(exactly: source) else {
      fatalError("value cannot be converted to UInt128 because it is outside the representable range")
    }
    self = value
  }

  @inlinable
  public init<T>(clamping source: T) where T: BinaryInteger {
    guard let value = Self(exactly: source) else {
      self = source < .zero ? .zero : .max
      return
    }
    self = value
  }

  @inlinable
  public init<T>(truncatingIfNeeded source: T) where T: BinaryInteger {
    let high = UInt64(truncatingIfNeeded: source >> 64)
    let low = UInt64(truncatingIfNeeded: source)
    self.init(_low: low, _high: high)
  }

  @_transparent
  public init(_truncatingBits source: UInt) {
    self.init(_low: UInt64(source), _high: .zero)
  }
}

extension UInt128 {
  @inlinable
  public init?<T>(exactly source: T) where T: BinaryFloatingPoint {
    let highAsFloat = (source * 0x1.0p-64).rounded(.towardZero)
    guard let high = UInt64(exactly: highAsFloat) else { return nil }
    guard let low = UInt64(
      exactly: high == 0 ? source : source - 0x1.0p64*highAsFloat
    ) else { return nil }
    self.init(_low: low, _high: high)
  }

  @inlinable
  public init<T>(_ source: T) where T: BinaryFloatingPoint {
    guard let value = Self(exactly: source.rounded(.towardZero)) else {
      fatalError("value cannot be converted to UInt128 because it is outside the representable range")
    }
    self = value
  }
}

// MARK: - Equatable

extension Bluetooth.UInt128: Equatable {
    
    public static func == (lhs: UInt128, rhs: UInt128) -> Bool {
        return lhs._low == rhs._low
            && lhs._high == rhs._high
    }
}

// MARK: - Hashable

extension Bluetooth.UInt128: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_low)
        hasher.combine(_high)
    }
}

// MARK: - Comparable

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension Bluetooth.UInt128: Comparable {
    
    @_transparent
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs._value < rhs._value
    }
}

// MARK: - CustomStringConvertible

extension Bluetooth.UInt128: CustomStringConvertible {
    
    public var description: String {
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            return Swift.UInt128(self).description
        } else {
            return hexadecimal
        }
    }
}

// TODO: Implement Integer protocols
extension Bluetooth.UInt128 {
    
    @_transparent
    public static var bitWidth: Int { 128 }
    
    public var byteSwapped: Self {
      return Self(_low: _high.byteSwapped, _high: _low.byteSwapped)
    }
}

#else
public typealias UInt128 = Swift.UInt128
#endif
