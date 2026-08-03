//
//  SDPAttributeID.swift
//  Bluetooth
//
//  The universal attribute IDs every SDP service record shares (SDP
//  Protocol, Bluetooth Core Spec Vol 3, Part B, §5.1), plus the
//  per-record language-base offset scheme the string attributes
//  (name/description/provider) are defined relative to.
//

/// An SDP service record attribute ID.
public struct SDPAttributeID: RawRepresentable, Hashable, Sendable, Codable {

    public let rawValue: UInt16

    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

public extension SDPAttributeID {

    /// A 32-bit number that uniquely identifies each service record.
    static var serviceRecordHandle: SDPAttributeID { SDPAttributeID(rawValue: 0x0000) }

    /// A list of service class UUIDs, most specific first.
    static var serviceClassIDList: SDPAttributeID { SDPAttributeID(rawValue: 0x0001) }

    static var serviceRecordState: SDPAttributeID { SDPAttributeID(rawValue: 0x0002) }

    /// A UUID identifying this particular service instance.
    static var serviceID: SDPAttributeID { SDPAttributeID(rawValue: 0x0003) }

    /// One entry per protocol in the protocol stack used to gain
    /// access to the service, outermost protocol first — the entry
    /// after the outermost typically carries the L2CAP PSM or RFCOMM
    /// channel number the service listens on.
    static var protocolDescriptorList: SDPAttributeID { SDPAttributeID(rawValue: 0x0004) }

    static var browseGroupList: SDPAttributeID { SDPAttributeID(rawValue: 0x0005) }

    /// A sequence of (language, encoding, attribute ID base) triples;
    /// the base offset into which the string attributes below are
    /// added to get the actual attribute ID used for a given language.
    static var languageBaseAttributeIDList: SDPAttributeID { SDPAttributeID(rawValue: 0x0006) }

    static var serviceInfoTimeToLive: SDPAttributeID { SDPAttributeID(rawValue: 0x0007) }

    static var serviceAvailability: SDPAttributeID { SDPAttributeID(rawValue: 0x0008) }

    /// One entry per Bluetooth profile the service conforms to: a
    /// (profile UUID, version) pair.
    static var bluetoothProfileDescriptorList: SDPAttributeID { SDPAttributeID(rawValue: 0x0009) }

    static var documentationURL: SDPAttributeID { SDPAttributeID(rawValue: 0x000A) }

    static var clientExecutableURL: SDPAttributeID { SDPAttributeID(rawValue: 0x000B) }

    static var iconURL: SDPAttributeID { SDPAttributeID(rawValue: 0x000C) }

    static var additionalProtocolDescriptorLists: SDPAttributeID { SDPAttributeID(rawValue: 0x000D) }
}

public extension SDPAttributeID {

    /// The offsets added to a language base (from
    /// ``languageBaseAttributeIDList``) to get the actual attribute ID
    /// of a language-specific string attribute.
    enum PrimaryLanguageOffset: UInt16, Sendable {
        case serviceName = 0x0000
        case serviceDescription = 0x0001
        case providerName = 0x0002
    }

    /// The default primary-language base offset (0x0100), used when a
    /// record doesn't have its own ``languageBaseAttributeIDList``.
    static var primaryLanguageBase: UInt16 { 0x0100 }

    /// The attribute ID for `offset` under `base` (the primary
    /// language's base, from ``languageBaseAttributeIDList``, or
    /// ``primaryLanguageBase`` for the default language).
    static func string(_ offset: PrimaryLanguageOffset, base: UInt16 = primaryLanguageBase) -> SDPAttributeID {
        SDPAttributeID(rawValue: base + offset.rawValue)
    }
}

extension SDPAttributeID: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

extension SDPAttributeID: CustomStringConvertible {

    public var description: String {
        let hex = String(rawValue, radix: 16, uppercase: true)
        return "0x" + String(repeating: "0", count: max(0, 4 - hex.count)) + hex
    }
}
