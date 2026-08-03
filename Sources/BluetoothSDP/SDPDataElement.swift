//
//  SDPDataElement.swift
//  Bluetooth
//
//  The SDP data element: every value inside an SDP PDU or service
//  record — attribute values, search patterns, attribute ID lists —
//  is one of these, self-describing via a one-byte type/size-descriptor
//  header (SDP Protocol, Bluetooth Core Spec Vol 3, Part B, §3.1).
//

import Bluetooth

/// An SDP (Service Discovery Protocol) data element.
///
/// Every element starts with a header byte: the upper 5 bits are the
/// type, the lower 3 bits are a size descriptor — either the value's
/// width directly (fixed-width types) or which of a 1/2/4-byte length
/// field follows (variable-width types).
@frozen
public enum SDPDataElement: Hashable, Sendable {

    /// The nil value — no associated data.
    case null

    case unsignedInt8(UInt8)
    case unsignedInt16(UInt16)
    case unsignedInt32(UInt32)
    case unsignedInt64(UInt64)
    case unsignedInt128(UInt128)

    case signedInt8(Int8)
    case signedInt16(Int16)
    case signedInt32(Int32)
    case signedInt64(Int64)

    /// A 128-bit signed integer, stored as its raw two's-complement bit
    /// pattern — SDP's own reference implementation has no dedicated
    /// 128-bit signed integer storage either, and reuses the unsigned
    /// 128-bit representation for it.
    case signedInt128(UInt128)

    case uuid(BluetoothUUID)

    /// A UTF-8 text string.
    case text(String)

    case boolean(Bool)

    /// An ordered sequence of data elements — SDP's equivalent of an
    /// array or tuple; used for attribute values (service class ID
    /// lists, protocol descriptor lists) and for search patterns.
    case sequence([SDPDataElement])

    /// A set of alternative representations of the same value, of
    /// which a consumer picks one. Rare in practice; included for
    /// completeness.
    case alternative([SDPDataElement])

    case url(String)
}

// MARK: - Type / Size Descriptor

internal extension SDPDataElement {

    /// The upper 5 bits of the header byte.
    enum ElementType: UInt8 {
        case null = 0
        case unsignedInteger = 1
        case signedInteger = 2
        case uuid = 3
        case text = 4
        case boolean = 5
        case sequence = 6
        case alternative = 7
        case url = 8
    }

    /// Smallest size descriptor (5, 6, or 7) whose 1/2/4-byte explicit
    /// length field can hold `byteCount`.
    static func lengthSizeDescriptor(for byteCount: Int) -> UInt8 {
        if byteCount <= Int(UInt8.max) { return 5 }
        if byteCount <= Int(UInt16.max) { return 6 }
        return 7
    }

    static func header(_ type: ElementType, _ sizeDescriptor: UInt8) -> UInt8 {
        (type.rawValue << 3) | sizeDescriptor
    }
}

// MARK: - DataConvertible

extension SDPDataElement: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {
        var consumed = 0
        guard let element = SDPDataElement(parsing: Array(data), consumed: &consumed),
              consumed == data.count
        else { return nil }
        self = element
    }

    public func append<Data: DataContainer>(to data: inout Data) {
        data += encodedBytes
    }

    /// The number of bytes encoding this element produces, without
    /// actually encoding — used to size a containing sequence's length
    /// field without an O(n²) double-encode.
    public var dataLength: Int {
        switch self {
        case .null:
            return 1
        case .unsignedInt8, .signedInt8, .boolean:
            return 2
        case .unsignedInt16, .signedInt16:
            return 3
        case .unsignedInt32, .signedInt32:
            return 5
        case .unsignedInt64, .signedInt64:
            return 9
        case .unsignedInt128, .signedInt128:
            return 17
        case let .uuid(value):
            switch value {
            case .bit16: return 3
            case .bit32: return 5
            case .bit128: return 17
            }
        case let .text(value):
            return Self.variableLengthTotal(Array(value.utf8).count)
        case let .url(value):
            return Self.variableLengthTotal(Array(value.utf8).count)
        case let .sequence(elements):
            return Self.variableLengthTotal(elements.reduce(0) { $0 + $1.dataLength })
        case let .alternative(elements):
            return Self.variableLengthTotal(elements.reduce(0) { $0 + $1.dataLength })
        }
    }
}

// MARK: - Encoding

private extension SDPDataElement {

    /// This element encoded as SDP wire bytes.
    var encodedBytes: [UInt8] {
        switch self {
        case .null:
            return [Self.header(.null, 0)]
        case let .unsignedInt8(value):
            return [Self.header(.unsignedInteger, 0), value]
        case let .unsignedInt16(value):
            return [Self.header(.unsignedInteger, 1)] + value.bigEndianBytes
        case let .unsignedInt32(value):
            return [Self.header(.unsignedInteger, 2)] + value.bigEndianBytes
        case let .unsignedInt64(value):
            return [Self.header(.unsignedInteger, 3)] + value.bigEndianBytes
        case let .unsignedInt128(value):
            return [Self.header(.unsignedInteger, 4)] + value.bigEndianBytes
        case let .signedInt8(value):
            return [Self.header(.signedInteger, 0), UInt8(bitPattern: value)]
        case let .signedInt16(value):
            return [Self.header(.signedInteger, 1)] + UInt16(bitPattern: value).bigEndianBytes
        case let .signedInt32(value):
            return [Self.header(.signedInteger, 2)] + UInt32(bitPattern: value).bigEndianBytes
        case let .signedInt64(value):
            return [Self.header(.signedInteger, 3)] + UInt64(bitPattern: value).bigEndianBytes
        case let .signedInt128(value):
            return [Self.header(.signedInteger, 4)] + value.bigEndianBytes
        case let .uuid(value):
            return Self.encodeUUID(value)
        case let .text(value):
            return Self.encodeVariableLength(.text, Array(value.utf8))
        case let .boolean(value):
            return [Self.header(.boolean, 0), value ? 1 : 0]
        case let .sequence(elements):
            return Self.encodeVariableLength(.sequence, elements.flatMap(\.encodedBytes))
        case let .alternative(elements):
            return Self.encodeVariableLength(.alternative, elements.flatMap(\.encodedBytes))
        case let .url(value):
            return Self.encodeVariableLength(.url, Array(value.utf8))
        }
    }

    static func encodeUUID(_ uuid: BluetoothUUID) -> [UInt8] {
        switch uuid {
        case let .bit16(value):
            return [header(.uuid, 1)] + value.bigEndianBytes
        case let .bit32(value):
            return [header(.uuid, 2)] + value.bigEndianBytes
        case let .bit128(value):
            return [header(.uuid, 4)] + value.bigEndianBytes
        }
    }

    static func encodeVariableLength(_ type: ElementType, _ bytes: [UInt8]) -> [UInt8] {
        let sizeDescriptor = lengthSizeDescriptor(for: bytes.count)
        var result = [header(type, sizeDescriptor)]
        switch sizeDescriptor {
        case 5: result.append(UInt8(bytes.count))
        case 6: result.append(contentsOf: UInt16(bytes.count).bigEndianBytes)
        default: result.append(contentsOf: UInt32(bytes.count).bigEndianBytes)
        }
        result.append(contentsOf: bytes)
        return result
    }

    static func variableLengthTotal(_ byteCount: Int) -> Int {
        let lengthFieldSize: Int
        switch lengthSizeDescriptor(for: byteCount) {
        case 5: lengthFieldSize = 1
        case 6: lengthFieldSize = 2
        default: lengthFieldSize = 4
        }
        return 1 + lengthFieldSize + byteCount
    }
}

// MARK: - Decoding

internal extension SDPDataElement {

    /// Parses a single data element from the start of `bytes`, which
    /// may contain trailing data after it (as it does when parsing one
    /// element out of a sequence). `consumed` is set to the number of
    /// bytes the element occupied.
    init?(parsing bytes: some Collection<UInt8>, consumed: inout Int) {
        let bytes = Array(bytes)
        guard let first = bytes.first,
              let type = ElementType(rawValue: first >> 3)
        else { return nil }
        let sizeDescriptor = first & 0x07

        func fixedWidthValue(_ width: Int) -> [UInt8]? {
            guard bytes.count >= 1 + width else { return nil }
            return Array(bytes[1 ..< 1 + width])
        }

        switch type {
        case .null:
            self = .null
            consumed = 1

        case .unsignedInteger, .signedInteger:
            let width: Int
            switch sizeDescriptor {
            case 0: width = 1
            case 1: width = 2
            case 2: width = 4
            case 3: width = 8
            case 4: width = 16
            default: return nil
            }
            guard let valueBytes = fixedWidthValue(width) else { return nil }
            consumed = 1 + width
            if type == .unsignedInteger {
                switch width {
                case 1: self = .unsignedInt8(valueBytes[0])
                case 2: self = .unsignedInt16(UInt16(bigEndianBytes: valueBytes))
                case 4: self = .unsignedInt32(UInt32(bigEndianBytes: valueBytes))
                case 8: self = .unsignedInt64(UInt64(bigEndianBytes: valueBytes))
                default: self = .unsignedInt128(UInt128(bigEndianBytes: valueBytes))
                }
            } else {
                switch width {
                case 1: self = .signedInt8(Int8(bitPattern: valueBytes[0]))
                case 2: self = .signedInt16(Int16(bitPattern: UInt16(bigEndianBytes: valueBytes)))
                case 4: self = .signedInt32(Int32(bitPattern: UInt32(bigEndianBytes: valueBytes)))
                case 8: self = .signedInt64(Int64(bitPattern: UInt64(bigEndianBytes: valueBytes)))
                default: self = .signedInt128(UInt128(bigEndianBytes: valueBytes))
                }
            }

        case .uuid:
            let width: Int
            switch sizeDescriptor {
            case 1: width = 2
            case 2: width = 4
            case 4: width = 16
            default: return nil
            }
            guard let valueBytes = fixedWidthValue(width) else { return nil }
            consumed = 1 + width
            switch width {
            case 2: self = .uuid(.bit16(UInt16(bigEndianBytes: valueBytes)))
            case 4: self = .uuid(.bit32(UInt32(bigEndianBytes: valueBytes)))
            default: self = .uuid(.bit128(UInt128(bigEndianBytes: valueBytes)))
            }

        case .boolean:
            guard let valueBytes = fixedWidthValue(1) else { return nil }
            consumed = 2
            self = .boolean(valueBytes[0] != 0)

        case .text, .url, .sequence, .alternative:
            guard let (length, headerSize) = Self.variableLength(sizeDescriptor, bytes) else { return nil }
            let valueStart = 1 + headerSize
            guard bytes.count >= valueStart + length else { return nil }
            let valueBytes = Array(bytes[valueStart ..< valueStart + length])
            consumed = valueStart + length

            switch type {
            case .text:
                self = .text(String(decoding: valueBytes, as: UTF8.self))
            case .url:
                self = .url(String(decoding: valueBytes, as: UTF8.self))
            case .sequence, .alternative:
                var elements: [SDPDataElement] = []
                var offset = 0
                while offset < valueBytes.count {
                    var elementConsumed = 0
                    guard let element = SDPDataElement(parsing: valueBytes[offset...], consumed: &elementConsumed),
                          elementConsumed > 0
                    else { return nil }
                    elements.append(element)
                    offset += elementConsumed
                }
                self = type == .sequence ? .sequence(elements) : .alternative(elements)
            default:
                return nil
            }
        }
    }

    private static func variableLength(_ sizeDescriptor: UInt8, _ bytes: [UInt8]) -> (length: Int, headerSize: Int)? {
        switch sizeDescriptor {
        case 5:
            guard bytes.count >= 2 else { return nil }
            return (Int(bytes[1]), 1)
        case 6:
            guard bytes.count >= 3 else { return nil }
            return (Int(UInt16(bigEndianBytes: bytes[1 ..< 3])), 2)
        case 7:
            guard bytes.count >= 5 else { return nil }
            return (Int(UInt32(bigEndianBytes: bytes[1 ..< 5])), 4)
        default:
            return nil
        }
    }
}
