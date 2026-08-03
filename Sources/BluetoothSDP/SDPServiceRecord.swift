//
//  SDPServiceRecord.swift
//  Bluetooth
//
//  An SDP service record: the set of attributes describing one
//  service, as returned by a ServiceAttributeResponse /
//  ServiceSearchAttributeResponse, or built up to register one.
//
//  On the wire, a record is a data element sequence containing, for
//  each attribute, its ID (encoded as a UINT16 data element) directly
//  followed by its value — not further nested into pairs.
//

import Bluetooth

/// An SDP service record: a service's attributes, keyed by attribute ID.
public struct SDPServiceRecord: Hashable, Sendable {

    public var attributes: [SDPAttributeID: SDPDataElement]

    public init(attributes: [SDPAttributeID: SDPDataElement] = [:]) {
        self.attributes = attributes
    }

    public subscript(attributeID: SDPAttributeID) -> SDPDataElement? {
        get { attributes[attributeID] }
        set { attributes[attributeID] = newValue }
    }
}

// MARK: - DataConvertible

extension SDPServiceRecord: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {
        guard let sequence = SDPDataElement(data: data),
              case let .sequence(elements) = sequence,
              elements.count % 2 == 0
        else { return nil }

        var attributes: [SDPAttributeID: SDPDataElement] = [:]
        attributes.reserveCapacity(elements.count / 2)
        var index = elements.startIndex
        while index < elements.endIndex {
            guard case let .unsignedInt16(rawAttributeID) = elements[index] else { return nil }
            let value = elements[index + 1]
            attributes[SDPAttributeID(rawValue: rawAttributeID)] = value
            index += 2
        }
        self.init(attributes: attributes)
    }

    public func append<Data: DataContainer>(to data: inout Data) {
        sequenceElement.append(to: &data)
    }

    public var dataLength: Int {
        sequenceElement.dataLength
    }

    /// This record's attributes, sorted by ID, as the flat data element
    /// sequence the wire format expects.
    private var sequenceElement: SDPDataElement {
        var elements: [SDPDataElement] = []
        elements.reserveCapacity(attributes.count * 2)
        for (attributeID, value) in attributes.sorted(by: { $0.key.rawValue < $1.key.rawValue }) {
            elements.append(.unsignedInt16(attributeID.rawValue))
            elements.append(value)
        }
        return .sequence(elements)
    }
}

// MARK: - Well-known attribute accessors

public extension SDPServiceRecord {

    /// The 32-bit handle a server assigns this record — usually only
    /// meaningful on records read back from a server, not ones being
    /// built for registration.
    var handle: UInt32? {
        get {
            guard case let .unsignedInt32(value)? = self[.serviceRecordHandle] else { return nil }
            return value
        }
        set {
            self[.serviceRecordHandle] = newValue.map { .unsignedInt32($0) }
        }
    }

    /// The service class UUIDs, most specific first.
    var serviceClassIDList: [BluetoothUUID]? {
        get { uuidList(for: .serviceClassIDList) }
        set { self[.serviceClassIDList] = newValue.map { .sequence($0.map(SDPDataElement.uuid)) } }
    }

    /// The Bluetooth profile UUIDs (with version) this record conforms
    /// to.
    var bluetoothProfileDescriptorList: [(uuid: BluetoothUUID, version: UInt16)]? {
        guard case let .sequence(profiles)? = self[.bluetoothProfileDescriptorList] else { return nil }
        return profiles.compactMap { profile in
            guard case let .sequence(pair) = profile,
                  pair.count == 2,
                  case let .uuid(uuid) = pair[0],
                  case let .unsignedInt16(version) = pair[1]
            else { return nil }
            return (uuid, version)
        }
    }

    /// This record's primary language's base offset for the
    /// string attributes below (``SDPAttributeID/primaryLanguageBase``
    /// if the record has no `languageBaseAttributeIDList`).
    private var primaryLanguageBase: UInt16 {
        guard case let .sequence(triples)? = self[.languageBaseAttributeIDList],
              triples.count >= 3,
              case let .unsignedInt16(base) = triples[2]
        else { return SDPAttributeID.primaryLanguageBase }
        return base
    }

    var serviceName: String? {
        get { string(.serviceName) }
        set { setString(.serviceName, newValue) }
    }

    var serviceDescription: String? {
        get { string(.serviceDescription) }
        set { setString(.serviceDescription, newValue) }
    }

    var providerName: String? {
        get { string(.providerName) }
        set { setString(.providerName, newValue) }
    }

    private func string(_ offset: SDPAttributeID.PrimaryLanguageOffset) -> String? {
        guard case let .text(value)? = self[.string(offset, base: primaryLanguageBase)] else { return nil }
        return value
    }

    private mutating func setString(_ offset: SDPAttributeID.PrimaryLanguageOffset, _ newValue: String?) {
        self[.string(offset, base: primaryLanguageBase)] = newValue.map { .text($0) }
    }

    private func uuidList(for attributeID: SDPAttributeID) -> [BluetoothUUID]? {
        guard case let .sequence(elements)? = self[attributeID] else { return nil }
        return elements.compactMap { element in
            guard case let .uuid(uuid) = element else { return nil }
            return uuid
        }
    }
}
