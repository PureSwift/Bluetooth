//
//  Address.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/6/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

/// Bluetooth address.
@frozen
public struct BluetoothAddress: Comparable, Sendable {

    // MARK: - Properties

    /// Underlying address bytes (host endianess).
    public var bytes: ByteValue

    // MARK: - Initialization

    /// Initialize with the specifed bytes (in host endianess).
    @_alwaysEmitIntoClient
    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0)) {
        self.bytes = bytes
    }
}

public extension BluetoothAddress {

    /// The minimum representable value in this type.
    @_alwaysEmitIntoClient
    static var min: BluetoothAddress { BluetoothAddress(bytes: (.min, .min, .min, .min, .min, .min)) }

    /// The maximum representable value in this type.
    @_alwaysEmitIntoClient
    static var max: BluetoothAddress { BluetoothAddress(bytes: (.max, .max, .max, .max, .max, .max)) }

    /// A zero address.
    @_alwaysEmitIntoClient
    static var zero: BluetoothAddress { BluetoothAddress(bytes: (.zero, .zero, .zero, .zero, .zero, .zero)) }
}

// MARK: - Equatable

extension BluetoothAddress: Equatable {

    public static func == (lhs: BluetoothAddress, rhs: BluetoothAddress) -> Bool {
        return lhs.bytes.0 == rhs.bytes.0
            && lhs.bytes.1 == rhs.bytes.1
            && lhs.bytes.2 == rhs.bytes.2
            && lhs.bytes.3 == rhs.bytes.3
            && lhs.bytes.4 == rhs.bytes.4
            && lhs.bytes.5 == rhs.bytes.5
    }
}

// MARK: - Hashable

extension BluetoothAddress: Hashable {

    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - ByteValue

extension BluetoothAddress: ByteValue {

    /// Raw Bluetooth Address 6 byte (48 bit) value.
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

    @_alwaysEmitIntoClient
    public static var bitWidth: Int { 48 }
}

// MARK: - Byte Swap

extension BluetoothAddress: ByteSwap {

    /// A representation of this address with the byte order swapped.
    public var byteSwapped: BluetoothAddress {
        return BluetoothAddress(bytes: (bytes.5, bytes.4, bytes.3, bytes.2, bytes.1, bytes.0))
    }
}

// MARK: - RawRepresentable

extension BluetoothAddress: RawRepresentable {

    /// Initialize a Bluetooth Address from its big endian string representation (e.g. `00:1A:7D:DA:71:13`).
    @_alwaysEmitIntoClient
    public init?(rawValue: String) {
        self.init(rawValue)
    }

    /// Convert a Bluetooth Address to its big endian string representation (e.g. `00:1A:7D:DA:71:13`).
    @_alwaysEmitIntoClient
    public var rawValue: String {
        description
    }
}

// MARK: - String Conversion

internal extension BluetoothAddress {
    
    var stringValue: String {
        let bytes = self.bigEndian.bytes
        return bytes.0.toHexadecimal()
            + ":" + bytes.1.toHexadecimal()
            + ":" + bytes.2.toHexadecimal()
            + ":" + bytes.3.toHexadecimal()
            + ":" + bytes.4.toHexadecimal()
            + ":" + bytes.5.toHexadecimal()
    }
    
    /// Initialize a Bluetooth Address from its big endian string representation (e.g. `00:1A:7D:DA:71:13`).
    static func parse<S: StringProtocol>(_ rawValue: S) -> Self? {

        // verify string length
        let characters = rawValue.utf8
        guard characters.count == 17,
            let separator = ":".utf8.first
        else { return nil }

        var bytes: ByteValue = (0, 0, 0, 0, 0, 0)
        let components = characters.split(whereSeparator: { $0 == separator })
        guard components.count == 6
            else { return nil }

        for (index, subsequence) in components.enumerated() {
            guard subsequence.count == 2,
                let byte = UInt8(hexadecimal: subsequence)
            else { return nil }

            withUnsafeMutablePointer(to: &bytes) {
                $0.withMemoryRebound(to: UInt8.self, capacity: 6) {
                    $0.advanced(by: index).pointee = byte
                }
            }
        }
        return BluetoothAddress(bigEndian: BluetoothAddress(bytes: bytes))
    }
}

// MARK: - CustomStringConvertible

extension BluetoothAddress: CustomStringConvertible {
    
    public var description: String { stringValue }
}

// MARK: - LosslessStringConvertible

extension BluetoothAddress: LosslessStringConvertible {
    
    public init?(_ string: String) {
        guard let value = Self.parse(string) else {
            return nil
        }
        self = value
    }
}

// MARK: - Data

extension BluetoothAddress: DataConvertible {

    @_alwaysEmitIntoClient
    public init?<Data: DataContainer>(data: Data) {
        guard data.isEmpty == false else {
            return nil
        }
        guard let value = data.withContiguousStorageIfAvailable({ storage in
            storage.baseAddress.flatMap { BluetoothAddress(data: $0, count: storage.count) }
        }), let value else { return nil }
        self = value
    }
    
    public init?(data: UnsafePointer<UInt8>?, count: Int) {
        var address = BluetoothAddress.zero
        guard withUnsafeMutablePointer(to: &address, {
            BTAddressCreateWithData(OpaquePointer($0), data, count)
        }) else {
            return nil
        }
        self = address
    }
}

// MARK: - Codable

#if !hasFeature(Embedded)
extension BluetoothAddress: Codable {}
#endif

// MARK: - Macro

#if !hasFeature(Embedded) && SWIFTPM_ENABLE_MACROS
@freestanding(expression)
public macro BluetoothAddress(_ string: StaticString) -> BluetoothAddress = #externalMacro(module: "BluetoothMacros", type: "BluetoothAddressMacro")
#endif

// MARK: - C ABI

@_cdecl("BTAddressEqual")
internal func BTAddressEqual(_ lhs: OpaquePointer, _ rhs: OpaquePointer) -> Bool {
    UnsafePointer<BluetoothAddress>(lhs).pointee == UnsafePointer<BluetoothAddress>(rhs).pointee
}

@_cdecl("BTAddressCreateWithString")
internal func BTAddressCreateWithString(
    _ address: OpaquePointer,
    _ string: UnsafePointer<CChar>
) -> Bool {
    let pointer = UnsafeMutablePointer<BluetoothAddress>(address)
    assert(pointer.pointee == .zero)
    let string = String(cString: string)
    guard let value = BluetoothAddress(string) else {
        return false
    }
    pointer.pointee = value
    return true
}

@_cdecl("BTAddressCreateWithData")
@inline(never)
internal func BTAddressCreateWithData(
    _ address: OpaquePointer,
    _ data: UnsafePointer<UInt8>?,
    _ size: Int
) -> Bool {
    guard let data, size == BluetoothAddress.length
        else { return false }
    let pointer = UnsafeMutablePointer<BluetoothAddress>(address)
    assert(pointer.pointee == .zero)
    pointer.pointee.bytes = (data[0], data[1], data[2], data[3], data[4], data[5])
    return false
}

// MARK: - CoreFoundation

#if canImport(CoreFoundation)
import CoreFoundation

public extension BluetoothAddress {
    
    init?(_ string: CFString) {
        var address = BluetoothAddress.zero
        guard withUnsafeMutablePointer(to: &address, {
            BTAddressCreateWithCFString(OpaquePointer($0), string)
        }) else {
            return nil
        }
        self = address
    }
}

/// `BOOL BTAddressCreateWithCFString(*BTAddress address, CFStringRef string)`
@_cdecl("BTAddressCreateWithCFString")
internal func BTAddressCreateWithCFString(_ address: OpaquePointer, _ string: CFString) -> Bool {
    // get C string
    guard let cString = CFStringGetCStringPtr(string, CFStringBuiltInEncodings.UTF8.rawValue) else {
        return false
    }
    return BTAddressCreateWithString(address, cString)
}

public extension BluetoothAddress {
    
    init?(data: CFData) {
        var address = BluetoothAddress.zero
        guard withUnsafeMutablePointer(to: &address, {
            BTAddressCreateWithCFData(OpaquePointer($0), data)
        }) else {
            return nil
        }
        self = address
    }
}

@_cdecl("BTAddressCreateWithCFData")
internal func BTAddressCreateWithCFData(_ address: OpaquePointer, _ data: CFData) -> Bool {
    // get byte pointer
    let dataPointer = CFDataGetBytePtr(data)
    let size = CFDataGetLength(data)
    return BTAddressCreateWithData(address, dataPointer, size)
}

#endif
