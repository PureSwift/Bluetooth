//
//  CoreTypeCoverageTests.swift
//  BluetoothTests
//
//  Additional coverage for ClassOfDevice, UUID and Hexadecimal helpers.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
import Testing
@testable import Bluetooth

@Suite("Core Type Coverage Tests")
struct CoreTypeCoverageTests {

    // MARK: - ClassOfDevice

    @Test func classOfDeviceLength() {
        #expect(ClassOfDevice.length == 3)
    }

    @Test func classOfDeviceInvalidDataLength() {
        // Only 3-byte data is accepted.
        #expect(ClassOfDevice(data: Data()) == nil)
        #expect(ClassOfDevice(data: Data([0x00])) == nil)
        #expect(ClassOfDevice(data: Data([0x00, 0x01])) == nil)
        #expect(ClassOfDevice(data: Data([0x00, 0x01, 0x02, 0x03])) == nil)
    }

    @Test func classOfDeviceComputerLaptop() throws {
        let data = Data([0b00001101, 0b00000001, 0b11000010])
        let cod = try #require(ClassOfDevice(data: data))

        #expect(cod.dataLength == 3)
        #expect(cod.formatType == ClassOfDevice.FormatType(rawValue: 0b01))
        #expect(cod.majorServiceClass.contains(.networking))

        guard case let .computer(computer) = cod.majorDeviceClass else {
            Issue.record("Expected computer major device class")
            return
        }
        #expect(computer == .laptop)
        #expect(cod.majorDeviceClass.type == .computer)

        // Round-trip back to the exact same bytes.
        #expect(Data(cod) == data)

        // Equality against a manually constructed value.
        let manual = ClassOfDevice(
            formatType: try #require(ClassOfDevice.FormatType(rawValue: 0b01)),
            majorServiceClass: ClassOfDevice.MajorServiceClass(rawValue: 0b110_00010000),
            majorDeviceClass: .computer(.laptop)
        )
        #expect(cod == manual)
    }

    @Test func classOfDevicePhoneSmartphone() throws {
        let data = Data([0b00001101, 0b00100010, 0b11000000])
        let cod = try #require(ClassOfDevice(data: data))

        #expect(cod.majorServiceClass.contains(.limitedDiscoverable))
        #expect(cod.majorServiceClass.contains(.telephony))
        #expect(cod.majorServiceClass.contains(.information))
        #expect(cod.majorServiceClass.contains(.audio) == false)

        guard case let .phone(phone) = cod.majorDeviceClass else {
            Issue.record("Expected phone major device class")
            return
        }
        #expect(phone == .smartphone)
        #expect(cod.majorDeviceClass.type == .phone)
        #expect(Data(cod) == data)
    }

    @Test func classOfDevicePeripheral() throws {
        let data = Data([0b01000100, 0b00100101, 0b11100000])
        let cod = try #require(ClassOfDevice(data: data))

        #expect(cod.majorServiceClass.contains(.audio))

        guard case let .peripheral(keyboard, device) = cod.majorDeviceClass else {
            Issue.record("Expected peripheral major device class")
            return
        }
        #expect(keyboard == .keyboard)
        #expect(device == .joystick)
        #expect(cod.majorDeviceClass.type == .peripheral)
        #expect(cod.formatType == ClassOfDevice.FormatType(rawValue: 0b00))
        #expect(Data(cod) == data)
    }

    @Test func classOfDeviceWearable() throws {
        let data = Data([0b00000100, 0b00000111, 0b11100110])
        let cod = try #require(ClassOfDevice(data: data))

        #expect(cod.majorServiceClass.contains(.telephony))

        guard case let .wearable(wearable) = cod.majorDeviceClass else {
            Issue.record("Expected wearable major device class")
            return
        }
        #expect(wearable == .wristwatch)
        #expect(cod.majorDeviceClass.type == .wearable)
        #expect(Data(cod) == data)
    }

    @Test func classOfDeviceMiscellaneous() throws {
        // Byte 1 lower 5 bits == 0 => miscellaneous major device class type.
        let data = Data([0b00000001, 0b00000000, 0b00000000])
        let cod = try #require(ClassOfDevice(data: data))
        #expect(cod.majorDeviceClass == .miscellaneous)
        #expect(cod.majorDeviceClass.type == .miscellaneous)
        #expect(cod.majorDeviceClass.minorClassValue == 0)
        #expect(Data(cod) == data)
    }

    @Test func classOfDeviceInequality() throws {
        let a = try #require(ClassOfDevice(data: Data([0b00001101, 0b00000001, 0b11000010])))
        let b = try #require(ClassOfDevice(data: Data([0b00000100, 0b00000111, 0b11100110])))
        #expect(a != b)
    }

    @Test func classOfDeviceFormatType() {
        #expect(ClassOfDevice.FormatType.min.rawValue == 0b00)
        #expect(ClassOfDevice.FormatType.max.rawValue == 0b11)
        // Valid raw values.
        #expect(ClassOfDevice.FormatType(rawValue: 0b00) != nil)
        #expect(ClassOfDevice.FormatType(rawValue: 0b11) != nil)
        // Out of range rejected.
        #expect(ClassOfDevice.FormatType(rawValue: 0b100) == nil)
        #expect(ClassOfDevice.FormatType(rawValue: .max) == nil)
        // Hashable / Equatable.
        #expect(ClassOfDevice.FormatType(rawValue: 0b01) == ClassOfDevice.FormatType(rawValue: 0b01))
        #expect(ClassOfDevice.FormatType(rawValue: 0b01) != ClassOfDevice.FormatType(rawValue: 0b10))
        let set: Set<ClassOfDevice.FormatType> = [
            ClassOfDevice.FormatType.min,
            ClassOfDevice.FormatType.max,
            ClassOfDevice.FormatType.min
        ]
        #expect(set.count == 2)
    }

    @Test func classOfDeviceMajorDeviceClassType() {
        #expect(ClassOfDevice.MajorDeviceClassType.miscellaneous.rawValue == 0b00)
        #expect(ClassOfDevice.MajorDeviceClassType.computer.rawValue == 0b1)
        #expect(ClassOfDevice.MajorDeviceClassType.uncategorized.rawValue == 0b11111)
    }

    @Test func classOfDeviceMajorServiceClassOptionSet() {
        let all = ClassOfDevice.MajorServiceClass.allCases
        #expect(all.contains(.limitedDiscoverable))
        #expect(all.contains(.positioning))
        #expect(all.contains(.networking))
        #expect(all.contains(.rendering))
        #expect(all.contains(.capturing))
        #expect(all.contains(.objectTransfer))
        #expect(all.contains(.audio))
        #expect(all.contains(.telephony))
        #expect(all.contains(.information))

        let empty = ClassOfDevice.MajorServiceClass(rawValue: 0)
        #expect(empty.contains(.audio) == false)
    }

    // MARK: - UUID

    // Known UUID whose big-endian bytes match the string byte order.
    private static let knownUUIDString = "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"
    private static let knownUUIDBytes: [UInt8] = [
        0xE6, 0x21, 0xE1, 0xF8, 0xC3, 0x6C, 0x49, 0x5A,
        0x93, 0xFC, 0x0C, 0x24, 0x7A, 0x3E, 0x6E, 0x5F
    ]

    @Test func uuidBitWidthAndLength() {
        #expect(UUID.bitWidth == 128)
        #expect(UUID.length == 16)
    }

    @Test func uuidBytesRoundTrip() throws {
        let uuid = try #require(UUID(uuidString: Self.knownUUIDString))
        let bytes = uuid.bytes

        // Assert exact byte tuple for the known UUID.
        #expect(bytes.0 == 0xE6)
        #expect(bytes.1 == 0x21)
        #expect(bytes.2 == 0xE1)
        #expect(bytes.3 == 0xF8)
        #expect(bytes.4 == 0xC3)
        #expect(bytes.5 == 0x6C)
        #expect(bytes.6 == 0x49)
        #expect(bytes.7 == 0x5A)
        #expect(bytes.8 == 0x93)
        #expect(bytes.9 == 0xFC)
        #expect(bytes.10 == 0x0C)
        #expect(bytes.11 == 0x24)
        #expect(bytes.12 == 0x7A)
        #expect(bytes.13 == 0x3E)
        #expect(bytes.14 == 0x6E)
        #expect(bytes.15 == 0x5F)

        // Reconstruct from the byte tuple.
        let reconstructed = UUID(bytes: bytes)
        #expect(reconstructed == uuid)
        #expect(reconstructed.uuidString.uppercased() == Self.knownUUIDString)
    }

    @Test func uuidBytesSetter() throws {
        let uuid = try #require(UUID(uuidString: Self.knownUUIDString))
        var other = UUID(bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
        #expect(other != uuid)
        other.bytes = uuid.bytes
        #expect(other == uuid)
    }

    @Test func uuidDataInitValid() throws {
        let data = Data(Self.knownUUIDBytes)
        let uuid = try #require(UUID(data: data))
        #expect(uuid.uuidString.uppercased() == Self.knownUUIDString)
    }

    @Test func uuidDataInitInvalidLength() {
        #expect(UUID(data: Data()) == nil)
        #expect(UUID(data: Data(Self.knownUUIDBytes.dropLast())) == nil)     // 15 bytes
        #expect(UUID(data: Data(Self.knownUUIDBytes + [0x00])) == nil)        // 17 bytes
    }

    // MARK: - Hexadecimal

    @Test func fixedWidthIntegerToHexadecimal() {
        // Uppercase, zero-padded to twice the byte width, no "0x" prefix.
        #expect(UInt8(0x0A).toHexadecimal() == "0A")
        #expect(UInt8(0xFF).toHexadecimal() == "FF")
        #expect(UInt8(0x00).toHexadecimal() == "00")
        #expect(UInt16(0x00FF).toHexadecimal() == "00FF")
        #expect(UInt16(0xABCD).toHexadecimal() == "ABCD")
        #expect(UInt32(0x0000_00FF).toHexadecimal() == "000000FF")
        #expect(UInt32(0xDEAD_BEEF).toHexadecimal() == "DEADBEEF")
    }

    @Test func collectionToHexadecimal() {
        let bytes: [UInt8] = [0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13]
        #expect(bytes.toHexadecimal() == "001A7DDA7113")
        #expect([UInt8]().toHexadecimal() == "")
        #expect([UInt8]([0xFF]).toHexadecimal() == "FF")
    }

    @Test func stringHexadecimalByteInit() {
        #expect(String(hexadecimal: UInt8(0x00)) == "00")
        #expect(String(hexadecimal: UInt8(0x0A)) == "0A")
        #expect(String(hexadecimal: UInt8(0xFF)) == "FF")
    }

    @Test func fixedWidthIntegerFromHexadecimalString() {
        #expect(UInt8(hexadecimal: "AB") == 0xAB)
        #expect(UInt8(hexadecimal: "ab") == 0xAB)          // lowercase accepted
        #expect(UInt16(hexadecimal: "ABCD") == 0xABCD)
        #expect(UInt32(hexadecimal: "DEADBEEF") == 0xDEADBEEF)

        // Wrong length rejected (must be exactly size * 2).
        #expect(UInt8(hexadecimal: "A") == nil)
        #expect(UInt8(hexadecimal: "ABC") == nil)
        #expect(UInt16(hexadecimal: "AB") == nil)

        // Invalid hex characters rejected.
        #expect(UInt8(hexadecimal: "GG") == nil)
        #expect(UInt8(hexadecimal: "0x") == nil)
    }

    @Test func fixedWidthIntegerFromHexadecimalUTF8() {
        #expect(UInt8(hexadecimal: "AB".utf8) == 0xAB)
        #expect(UInt16(hexadecimal: "ABCD".utf8) == 0xABCD)
        // Wrong length.
        #expect(UInt8(hexadecimal: "ABC".utf8) == nil)
        // Invalid character.
        #expect(UInt8(hexadecimal: "GG".utf8) == nil)
    }

    @Test func fixedWidthIntegerParseRadix() {
        #expect(UInt8(parse: "FF", radix: 16) == 0xFF)
        #expect(UInt16(parse: "10", radix: 10) == 10)
        // Digit out of range for radix.
        #expect(UInt8(parse: "2", radix: 2) == nil)
        // Invalid character.
        #expect(UInt8(parse: "!", radix: 16) == nil)
    }

    #if !hasFeature(Embedded)
    @Test func byteArrayFromHexadecimalString() {
        #expect([UInt8](hexadecimal: "001A7D") == [0x00, 0x1A, 0x7D])
        #expect([UInt8](hexadecimal: "deadbeef") == [0xDE, 0xAD, 0xBE, 0xEF])
        #expect([UInt8](hexadecimal: "") == [])
        // Odd length gets a leading zero nibble prepended.
        #expect([UInt8](hexadecimal: "ABC") == [0x0A, 0xBC])
        // Invalid hex returns nil.
        #expect([UInt8](hexadecimal: "XY") == nil)
        #expect([UInt8](hexadecimal: "0G") == nil)
    }

    @Test func decodeHexNibble() {
        #expect(("0".utf16.first!).decodeHexNibble() == 0)
        #expect(("9".utf16.first!).decodeHexNibble() == 9)
        #expect(("A".utf16.first!).decodeHexNibble() == 10)
        #expect(("F".utf16.first!).decodeHexNibble() == 15)
        #expect(("a".utf16.first!).decodeHexNibble() == 10)
        #expect(("f".utf16.first!).decodeHexNibble() == 15)
        #expect(("g".utf16.first!).decodeHexNibble() == nil)
        #expect(("!".utf16.first!).decodeHexNibble() == nil)
    }
    #endif
}
