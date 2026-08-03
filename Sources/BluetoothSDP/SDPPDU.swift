//
//  SDPPDU.swift
//  Bluetooth
//
//  The fixed 5-byte header every SDP PDU starts with (SDP Protocol,
//  Bluetooth Core Spec Vol 3, Part B, §4.2) — PDU ID, transaction ID,
//  and the byte length of everything that follows.
//
//  This covers PDU framing and the data model/record codec
//  (`SDPDataElement`, `SDPServiceRecord`); it does not define the
//  individual request/response parameter layouts (ServiceSearchRequest
//  and friends) or continuation-state fragmentation/reassembly, which
//  belong with a socket-based session layer, not this pure data model.
//

import Bluetooth

/// The PDU ID identifying an SDP PDU's kind (SDP Protocol, Bluetooth
/// Core Spec Vol 3, Part B, §4.2).
public struct SDPPDUID: RawRepresentable, Hashable, Sendable, Codable {

    public let rawValue: UInt8

    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

public extension SDPPDUID {

    static var errorResponse: SDPPDUID { SDPPDUID(rawValue: 0x01) }
    static var serviceSearchRequest: SDPPDUID { SDPPDUID(rawValue: 0x02) }
    static var serviceSearchResponse: SDPPDUID { SDPPDUID(rawValue: 0x03) }
    static var serviceAttributeRequest: SDPPDUID { SDPPDUID(rawValue: 0x04) }
    static var serviceAttributeResponse: SDPPDUID { SDPPDUID(rawValue: 0x05) }
    static var serviceSearchAttributeRequest: SDPPDUID { SDPPDUID(rawValue: 0x06) }
    static var serviceSearchAttributeResponse: SDPPDUID { SDPPDUID(rawValue: 0x07) }
}

extension SDPPDUID: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

/// The fixed 5-byte header every SDP PDU starts with.
@frozen
public struct SDPPDUHeader: Equatable, Hashable, Sendable {

    /// The kind of PDU this is.
    public var pduID: SDPPDUID

    /// Identifies a request/response pair; the response echoes the
    /// request's transaction ID unchanged.
    public var transactionID: UInt16

    /// The byte length of everything following this header.
    public var parameterLength: UInt16

    public init(pduID: SDPPDUID, transactionID: UInt16, parameterLength: UInt16) {
        self.pduID = pduID
        self.transactionID = transactionID
        self.parameterLength = parameterLength
    }
}

public extension SDPPDUHeader {

    static var length: Int { 5 }
}

// MARK: - DataConvertible

extension SDPPDUHeader: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length else { return nil }
        let bytes = Array(data)
        self.init(
            pduID: SDPPDUID(rawValue: bytes[0]),
            transactionID: UInt16(bigEndianBytes: bytes[1 ..< 3]),
            parameterLength: UInt16(bigEndianBytes: bytes[3 ..< 5])
        )
    }

    public func append<Data: DataContainer>(to data: inout Data) {
        data += pduID.rawValue
        data += transactionID.bigEndianBytes
        data += parameterLength.bigEndianBytes
    }

    public var dataLength: Int { Self.length }
}
