//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/5/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

internal extension UUID {
    
    static var length: Int { return 16 }
    static var stringLength: Int { return 36 }
    static var unformattedStringLength: Int { return 32 }
}

extension UUID: ByteValue {
        
    public static var bitWidth: Int { return 128 }
    
    public init(bytes: ByteValue) {
        self.init(uuid: bytes)
    }
    
    public var bytes: ByteValue {
        get { return uuid }
        set { self = UUID(uuid: newValue) }
    }
}

#if canImport(Foundation)
public extension Foundation.UUID {
    
    typealias ByteValue = uuid_t
}

internal extension Foundation.UUID {
    
    init?(data: Foundation.Data) {
        guard data.count == UUID.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
    
    var data: Foundation.Data {
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
    }
}

/// Internal UUID type.
internal struct _UUID: Sendable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public let uuid: ByteValue
    
    /// Create a UUID from a `uuid_t`.
    public init(uuid: ByteValue) {
        self.uuid = uuid
    }
}

#else

/// Represents UUID strings, which can be used to uniquely identify types, interfaces, and other items.
public struct UUID: Sendable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public let uuid: ByteValue
    
    /// Create a UUID from a `uuid_t`.
    public init(uuid: ByteValue) {
        self.uuid = uuid
    }
}

internal typealias _UUID = Bluetooth.UUID // Built-in UUID type

#endif

extension _UUID {
    
    /// Create a new UUID with RFC 4122 version 4 random bytes.
    public init() {
        var uuidBytes: ByteValue = (
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255)
        )
        
        // Set the version to 4 (random UUID)
        uuidBytes.6 = (uuidBytes.6 & 0x0F) | 0x40
        
        // Set the variant to RFC 4122
        uuidBytes.8 = (uuidBytes.8 & 0x3F) | 0x80
        
        self.init(uuid: uuidBytes)
    }
    
    @inline(__always)
    internal func withUUIDBytes<R>(_ work: (UnsafeBufferPointer<UInt8>) throws -> R) rethrows -> R {
        return try withExtendedLifetime(self) {
            try withUnsafeBytes(of: uuid) { rawBuffer in
                return try rawBuffer.withMemoryRebound(to: UInt8.self) { buffer in
                    return try work(buffer)
                }
            }
        }
    }
    
    /// Create a UUID from a string such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F".
    ///
    /// Returns nil for invalid strings.
    public init?(uuidString string: String) {
        guard let value = UInt128.bigEndian(uuidString: string) else {
            return nil
        }
        self.init(uuid: value.bytes)
    }
    
    /// Returns a string created from the UUID, such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"
    public var uuidString: String {
        UInt128(bytes: uuid).bigEndianUUIDString
    }
}

extension _UUID: Equatable {
    
    public static func ==(lhs: _UUID, rhs: _UUID) -> Bool {
        withUnsafeBytes(of: lhs) { lhsPtr in
            withUnsafeBytes(of: rhs) { rhsPtr in
                let lhsTuple = lhsPtr.loadUnaligned(as: (UInt64, UInt64).self)
                let rhsTuple = rhsPtr.loadUnaligned(as: (UInt64, UInt64).self)
                return (lhsTuple.0 ^ rhsTuple.0) | (lhsTuple.1 ^ rhsTuple.1) == 0
            }
        }
    }
}

extension _UUID: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        withUnsafeBytes(of: uuid) { buffer in
            hasher.combine(bytes: buffer)
        }
    }
}

extension _UUID: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return uuidString
    }

    public var debugDescription: String {
        return description
    }
}

#if !hasFeature(Embedded)
@available(macOS 10.8, iOS 6.0, tvOS 9.0, watchOS 2.0, *)
extension _UUID : CustomReflectable {
    public var customMirror: Mirror {
        let c : [(label: String?, value: Any)] = []
        let m = Mirror(self, children:c, displayStyle: .struct)
        return m
    }
}

@available(macOS 10.8, iOS 6.0, tvOS 9.0, watchOS 2.0, *)
extension _UUID : Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let uuidString = try container.decode(String.self)

        guard let uuid = _UUID(uuidString: uuidString) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                    debugDescription: "Attempted to decode UUID from invalid UUID string."))
        }

        self = uuid
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.uuidString)
    }
}
#endif

extension _UUID : Comparable {

    public static func < (lhs: _UUID, rhs: _UUID) -> Bool {
        var leftUUID = lhs.uuid
        var rightUUID = rhs.uuid
        var result: Int = 0
        var diff: Int = 0
        withUnsafeBytes(of: &leftUUID) { leftPtr in
            withUnsafeBytes(of: &rightUUID) { rightPtr in
                for offset in (0 ..< MemoryLayout<uuid_t>.size).reversed() {
                    diff = Int(leftPtr.load(fromByteOffset: offset, as: UInt8.self)) -
                        Int(rightPtr.load(fromByteOffset: offset, as: UInt8.self))
                    // Constant time, no branching equivalent of
                    // if (diff != 0) {
                    //     result = diff;
                    // }
                    result = (result & (((diff - 1) & ~diff) >> 8)) | diff
                }
            }
        }

        return result < 0
    }
}

fileprivate extension UInt128 {
    
    /// Parse a UUID string and return a value in big endian order.
    static func bigEndian(uuidString string: String) -> UInt128? {
        let separator: Character = "-"
        guard string.count == 36 else {
            return nil
        }
        guard string[string.index(string.startIndex, offsetBy: 8)] == separator,
              string[string.index(string.startIndex, offsetBy: 13)] == separator,
              string[string.index(string.startIndex, offsetBy: 18)] == separator,
              string[string.index(string.startIndex, offsetBy: 23)] == separator
            else { return nil }
        let a = string[string.startIndex ..< string.index(string.startIndex, offsetBy: 8)]
        let b = string[string.index(string.startIndex, offsetBy: 9) ..< string.index(string.startIndex, offsetBy: 13)]
        let c = string[string.index(string.startIndex, offsetBy: 14) ..< string.index(string.startIndex, offsetBy: 18)]
        let d = string[string.index(string.startIndex, offsetBy: 19) ..< string.index(string.startIndex, offsetBy: 23)]
        let e = string[string.index(string.startIndex, offsetBy: 24) ..< string.index(string.startIndex, offsetBy: 36)]
        let hexadecimal = (a + b + c + d + e)
        guard hexadecimal.count == 32,
              let bytes = [UInt8].init(hexadecimal: hexadecimal),
              let value = UInt128.init(bytes) else {
            return nil
        }
        return value
    }
    
    /// Generate UUID string, e.g. `0F4DD6A4-0F71-48EF-98A5-996301B868F9` from a value initialized in its big endian order.
    var bigEndianUUIDString: String {
        
        let a = (bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal())
            
        let b = (bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal())
        
        let c = (bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal())

        let d = (bytes.8.toHexadecimal()
            + bytes.9.toHexadecimal())

        let e = (bytes.10.toHexadecimal()
            + bytes.11.toHexadecimal()
            + bytes.12.toHexadecimal()
            + bytes.13.toHexadecimal()
            + bytes.14.toHexadecimal()
            + bytes.15.toHexadecimal())
        
        return a + "-" + b + "-" + c + "-" + d + "-" + e
    }
}

internal extension UInt128 {
    
    /// Parse a UUID string.
    init?(uuidString string: String) {
        guard let value = Self.bigEndian(uuidString: string) else {
            return nil
        }
        self.init(bigEndian: value)
    }
    
    /// Generate UUID string, e.g. `0F4DD6A4-0F71-48EF-98A5-996301B868F9`.
    var uuidString: String {
        self.bigEndian.bigEndianUUIDString
    }
}
