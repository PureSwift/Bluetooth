//
//  SDPTests.swift
//  BluetoothTests
//

#if canImport(BluetoothSDP)
import Testing
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
import Bluetooth
@testable import BluetoothSDP

@Suite struct SDPTests {

    @Test func uint128BigEndianBytes() {

        // 15 leading zero bytes then 0x01, most-significant byte
        // first, must equal the numeric value 1 — not just round-trip
        // with itself, which a consistently-reversed implementation
        // would also pass.
        let one = [UInt8](repeating: 0, count: 15) + [0x01]
        #expect(UInt128(bigEndianBytes: one) == 1)
        #expect((1 as UInt128).bigEndianBytes == one)

        let value = UInt128(bigEndianBytes: Array(0 ..< 16))
        #expect(value.bigEndianBytes == Array(0 ..< 16))
        #expect(value == UInt128(0x000102030405060708090A0B0C0D0E0F))
    }

    @Test func dataElementRoundTrip() {

        let elements: [SDPDataElement] = [
            .null,
            .unsignedInt8(0xFF),
            .unsignedInt16(0x1234),
            .unsignedInt32(0xDEADBEEF),
            .unsignedInt64(0x0102030405060708),
            .unsignedInt128(UInt128(bigEndianBytes: Array(0 ..< 16))),
            .signedInt8(-1),
            .signedInt16(-1234),
            .signedInt32(-1),
            .signedInt64(-1),
            .uuid(.bit16(0x1101)),
            .uuid(.bit32(0x00001101)),
            .uuid(.bit128(UInt128(bigEndianBytes: Array(0 ..< 16)))),
            .text("Serial Port"),
            .text(""),
            .boolean(true),
            .boolean(false),
            .url("https://www.bluetooth.com"),
            .sequence([.uuid(.bit16(0x1101)), .unsignedInt16(1)]),
            .alternative([.unsignedInt8(1), .unsignedInt16(2)])
        ]

        for element in elements {
            let data = Data(element)
            #expect(data.count == element.dataLength)
            let decoded = SDPDataElement(data: data)
            #expect(decoded == element)
        }
    }

    @Test func nestedSequence() {

        let element = SDPDataElement.sequence([
            .sequence([.uuid(.bit16(0x0100))]),
            .sequence([.uuid(.bit16(0x0003)), .unsignedInt8(9)])
        ])

        let data = Data(element)
        #expect(SDPDataElement(data: data) == element)
    }

    @Test func largeTextUsesWiderLengthField() {

        // 300 bytes doesn't fit an 8-bit length field (max 255), so
        // this must pick the 16-bit size descriptor, not truncate.
        let text = String(repeating: "a", count: 300)
        let element = SDPDataElement.text(text)
        let data = Data(element)

        // header (1) + 16-bit length field (2) + payload
        #expect(data.count == 1 + 2 + 300)
        #expect(SDPDataElement(data: data) == element)
    }

    @Test func malformedDataFailsToDecode() {

        #expect(SDPDataElement(data: Data()) == nil)
        // UUID tag claiming 16 bytes but only 2 provided
        #expect(SDPDataElement(data: Data([0x1C, 0x11, 0x01])) == nil)
        // trailing byte after a complete element
        #expect(SDPDataElement(data: Data([0x00, 0x00])) == nil)
    }

    @Test func serviceRecordRoundTrip() {

        var record = SDPServiceRecord()
        record.handle = 0x00010001
        record.serviceClassIDList = [.bit16(0x1101)]
        record.serviceName = "Serial Port"
        record.serviceDescription = "COM Port"
        record.providerName = "PureSwift"
        record[.protocolDescriptorList] = .sequence([
            .sequence([.uuid(.bit16(0x0100))]),
            .sequence([.uuid(.bit16(0x0003)), .unsignedInt8(1)])
        ])

        let data = Data(record)
        let decoded = SDPServiceRecord(data: data)

        #expect(decoded?.handle == record.handle)
        #expect(decoded?.serviceClassIDList == record.serviceClassIDList)
        #expect(decoded?.serviceName == record.serviceName)
        #expect(decoded?.serviceDescription == record.serviceDescription)
        #expect(decoded?.providerName == record.providerName)
        #expect(decoded == record)
    }

    @Test func serviceRecordAttributesSortedOnEncode() {

        var record = SDPServiceRecord()
        record[.serviceInfoTimeToLive] = .unsignedInt32(30)
        record[.serviceRecordHandle] = .unsignedInt32(1)
        record[.serviceClassIDList] = .sequence([.uuid(.bit16(0x1101))])

        let data = Data(record)
        #expect(SDPServiceRecord(data: data) == record)

        // first attribute ID element, right after the outer sequence's
        // own header bytes (SEQ8 tag + 1-byte length = 2 bytes), must
        // be the smallest one, 0x0000 — encoded as a UINT16 element:
        // tag 0x09, then the two value bytes.
        let bytes = [UInt8](data)
        #expect(Array(bytes[2 ..< 5]) == [0x09, 0x00, 0x00])
    }

    @Test func attributeID() {

        #expect(SDPAttributeID.serviceClassIDList.rawValue == 0x0001)
        #expect(SDPAttributeID.protocolDescriptorList.rawValue == 0x0004)
        #expect(SDPAttributeID.string(.serviceName).rawValue == 0x0100)
        #expect(SDPAttributeID.string(.serviceName, base: 0x0200).rawValue == 0x0200)
        #expect(SDPAttributeID.serviceClassIDList.description == "0x0001")
    }

    @Test func pduHeaderRoundTrip() {

        let header = SDPPDUHeader(pduID: .serviceSearchRequest, transactionID: 0x0102, parameterLength: 0x0304)
        let data = Data(header)

        #expect(data.count == SDPPDUHeader.length)
        #expect([UInt8](data) == [0x02, 0x01, 0x02, 0x03, 0x04])
        #expect(SDPPDUHeader(data: data) == header)
    }

    @Test func error() {

        #expect(SDPError.invalidPDUSize.rawValue == 0x0004)
        #expect(SDPError.invalidPDUSize.description == "Invalid PDU size")
    }
}
#endif
