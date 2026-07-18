//
//  GAPDecoderTests.swift
//  Bluetooth
//
//  Exercises GAPDataDecoder error and edge paths: malformed lengths, unknown
//  types, the ignoreUnknownType flag, the instance decoder, and .notFound.
//

#if canImport(BluetoothGAP)
import Testing
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
@testable import Bluetooth
@testable import BluetoothGAP

@Suite struct GAPDecoderTests {

    // A valid AD structure: length 0x0B, type 0x08 (short local name), 10 bytes.
    static let shortNameData = Data([0x0B, 0x08, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])

    @Test func emptyData() throws {
        var decoder = GAPDataDecoder<Data>()
        decoder.types = [GAPShortLocalName.self]
        let decoded = try decoder.decode(from: Data())
        #expect(decoded.isEmpty)
    }

    @Test func instanceDecodeValid() throws {
        var decoder = GAPDataDecoder<Data>()
        decoder.types = [GAPShortLocalName.self]
        let decoded = try decoder.decode(from: Self.shortNameData)
        #expect(decoded.count == 1)
        #expect((decoded.first as? GAPShortLocalName)?.name == "BlueZ 5.43")
    }

    @Test func unknownTypeThrows() throws {
        // Decoder only knows short local name; data holds a complete local name (0x09).
        let data = Data([0x03, 0x09, 0x41, 0x42])  // length 3, type 0x09, "AB"
        var decoder = GAPDataDecoder<Data>()
        decoder.types = [GAPShortLocalName.self]
        decoder.ignoreUnknownType = false
        #expect(throws: GAPDataDecoderError.self) {
            _ = try decoder.decode(from: data)
        }
    }

    @Test func unknownTypeIgnored() throws {
        let data = Data([0x03, 0x09, 0x41, 0x42])  // complete local name, not registered
        var decoder = GAPDataDecoder<Data>()
        decoder.types = [GAPShortLocalName.self]
        decoder.ignoreUnknownType = true
        let decoded = try decoder.decode(from: data)
        #expect(decoded.isEmpty)
    }

    @Test func insufficientBytesThrows() throws {
        // length byte claims 0x0B bytes but only a couple follow.
        let data = Data([0x0B, 0x08, 0x42, 0x6C])
        var decoder = GAPDataDecoder<Data>()
        decoder.types = [GAPShortLocalName.self]
        #expect(throws: GAPDataDecoderError.self) {
            _ = try decoder.decode(from: data)
        }
    }

    @Test func trailingZeroPaddingStops() throws {
        // Valid structure followed by zero padding; decoding stops cleanly.
        var padded = Self.shortNameData
        padded.append(contentsOf: [0x00, 0x00])
        var decoder = GAPDataDecoder<Data>()
        decoder.types = [GAPShortLocalName.self]
        let decoded = try decoder.decode(from: padded)
        #expect(decoded.count == 1)
    }

    @Test func typedDecodeNotFound() throws {
        // Ask for a complete local name in data that only has a short local name.
        #expect(throws: GAPDataDecoderError.self) {
            _ = try GAPDataDecoder.decode(GAPCompleteLocalName.self, from: Self.shortNameData)
        }
    }

    @Test func typedDecodeSingle() throws {
        let value = try GAPDataDecoder.decode(GAPShortLocalName.self, from: Self.shortNameData)
        #expect(value.name == "BlueZ 5.43")
    }
}
#endif
