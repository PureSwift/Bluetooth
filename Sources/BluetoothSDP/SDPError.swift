//
//  SDPError.swift
//  Bluetooth
//
//  The error codes an SDP server returns in an ErrorResponse PDU (SDP
//  Protocol, Bluetooth Core Spec Vol 3, Part B, §4.4.1).
//

/// An SDP `ErrorResponse` error code.
public struct SDPError: RawRepresentable, Hashable, Sendable, Error, Codable {

    public let rawValue: UInt16

    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

public extension SDPError {

    static var invalidVersion: SDPError { SDPError(rawValue: 0x0001) }
    static var invalidServiceRecordHandle: SDPError { SDPError(rawValue: 0x0002) }
    static var invalidRequestSyntax: SDPError { SDPError(rawValue: 0x0003) }
    static var invalidPDUSize: SDPError { SDPError(rawValue: 0x0004) }
    static var invalidContinuationState: SDPError { SDPError(rawValue: 0x0005) }
    static var insufficientResources: SDPError { SDPError(rawValue: 0x0006) }
}

extension SDPError: CustomStringConvertible {

    public var description: String {
        switch self {
        case .invalidVersion: return "Invalid/unsupported SDP version"
        case .invalidServiceRecordHandle: return "Invalid service record handle"
        case .invalidRequestSyntax: return "Invalid request syntax"
        case .invalidPDUSize: return "Invalid PDU size"
        case .invalidContinuationState: return "Invalid continuation state"
        case .insufficientResources: return "Insufficient resources"
        default: return "SDP error 0x" + String(rawValue, radix: 16, uppercase: true)
        }
    }
}
