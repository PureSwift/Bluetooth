//
//  ABITests.swift
//  BluetoothABITests
//
//  Round-trip tests for the Phase 1 `libbluetooth` ABI surface,
//  asserting reference behavior byte for byte.
//

import Testing
import CBluetooth
@testable import BluetoothABI

@Suite("Address ABI")
struct AddressABITests {

    /// `bdaddr_t` stores the least significant byte first.
    static let address = bdaddr_t(b: (0x13, 0x71, 0xDA, 0x7D, 0x1A, 0x00))
    static let string = "00:1A:7D:DA:71:13"

    @Test func testBa2str() {
        var str = [CChar](repeating: 0x7F, count: 18)
        var ba = Self.address
        #expect(BluetoothABI.ba2str(&ba, &str) == 17)
        #expect(String(cString: str) == Self.string)
    }

    @Test func testBa2strlc() {
        var str = [CChar](repeating: 0x7F, count: 18)
        var ba = Self.address
        #expect(BluetoothABI.ba2strlc(&ba, &str) == 17)
        #expect(String(cString: str) == Self.string.lowercased())
    }

    @Test func testStr2ba() {
        var ba = bdaddr_t()
        var result = Self.string.withCString { BluetoothABI.str2ba($0, &ba) }
        #expect(result == 0)
        #expect(ba.b == Self.address.b)
        // lowercase accepted
        result = Self.string.lowercased().withCString { BluetoothABI.str2ba($0, &ba) }
        #expect(result == 0)
        #expect(ba.b == Self.address.b)
        // malformed input zeroes the output
        result = "00:1A:7D:DA:71:1G".withCString { BluetoothABI.str2ba($0, &ba) }
        #expect(result == -1)
        #expect(ba.b == (0, 0, 0, 0, 0, 0))
    }

    @Test func testBachk() {
        #expect(BluetoothABI.bachk(nil) == -1)
        #expect("00:1A:7D:DA:71:13".withCString { BluetoothABI.bachk($0) } == 0)
        #expect("00:1a:7d:da:71:13".withCString { BluetoothABI.bachk($0) } == 0)
        #expect("00:1A:7D:DA:71:1".withCString { BluetoothABI.bachk($0) } == -1)
        #expect("00:1A:7D:DA:71:133".withCString { BluetoothABI.bachk($0) } == -1)
        #expect("00-1A-7D-DA-71-13".withCString { BluetoothABI.bachk($0) } == -1)
        #expect("00:1A:7D:DA:71:1G".withCString { BluetoothABI.bachk($0) } == -1)
    }

    @Test func testBaswap() {
        var swapped = bdaddr_t()
        var ba = Self.address
        BluetoothABI.baswap(&swapped, &ba)
        #expect(swapped.b == (0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13))
    }

    @Test func testBatostr() {
        // Historical behavior: prints storage order, not display order.
        var ba = Self.address
        let str = BluetoothABI.batostr(&ba)
        #expect(str != nil)
        #expect(String(cString: str!) == "13:71:DA:7D:1A:00")
        bt_free(str)
    }

    @Test func testStrtoba() {
        let ba = Self.string.withCString { BluetoothABI.strtoba($0) }
        #expect(ba != nil)
        // Returns the big-endian (display order) address.
        #expect(ba!.pointee.b == (0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13))
        bt_free(ba)
    }

    @Test func testBa2oui() {
        var str = [CChar](repeating: 0x7F, count: 9)
        var ba = Self.address
        #expect(BluetoothABI.ba2oui(&ba, &str) == 8)
        #expect(String(cString: str) == "00-1A-7D")
    }
}

@Suite("UUID ABI")
struct UUIDABITests {

    @Test func testCreate16() {
        var uuid = bt_uuid_t()
        #expect(BluetoothABI.bt_uuid16_create(&uuid, 0x180D) == 0)
        #expect(uuid.type == BT_UUID16)
        #expect(uuid.value.u16 == 0x180D)
    }

    @Test func testToUUID128() {
        var uuid = bt_uuid_t()
        _ = BluetoothABI.bt_uuid16_create(&uuid, 0x180D)
        var uuid128 = bt_uuid_t()
        BluetoothABI.bt_uuid_to_uuid128(&uuid, &uuid128)
        #expect(uuid128.type == BT_UUID128)
        let bytes = withUnsafeBytes(of: uuid128.value.u128.data) { [UInt8]($0) }
        #expect(bytes == [0x00, 0x00, 0x18, 0x0D, 0x00, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB])
    }

    @Test func testToString() {
        var uuid = bt_uuid_t()
        _ = BluetoothABI.bt_uuid16_create(&uuid, 0x180D)
        var str = [CChar](repeating: 0x7F, count: 37)
        #expect(BluetoothABI.bt_uuid_to_string(&uuid, &str, 37) == 0)
        #expect(String(cString: str) == "0000180d-0000-1000-8000-00805f9b34fb")
        // Truncation
        #expect(BluetoothABI.bt_uuid_to_string(&uuid, &str, 9) == 0)
        #expect(String(cString: str) == "0000180d")
        // NULL / unspec
        #expect(BluetoothABI.bt_uuid_to_string(nil, &str, 37) == -EINVAL)
        #expect(String(cString: str) == "NULL")
    }

    @Test func testStringToUUID() {
        var uuid = bt_uuid_t()
        // Base UUID downgrades to 16-bit.
        var result = "0000180d-0000-1000-8000-00805f9b34fb".withCString { BluetoothABI.bt_string_to_uuid(&uuid, $0) }
        #expect(result == 0)
        #expect(uuid.type == BT_UUID16)
        #expect(uuid.value.u16 == 0x180D)
        // Non-base 128-bit stays 128-bit.
        result = "60f14fe2-f972-11e5-b84f-23e070d5a8c7".withCString { BluetoothABI.bt_string_to_uuid(&uuid, $0) }
        #expect(result == 0)
        #expect(uuid.type == BT_UUID128)
        var str = [CChar](repeating: 0, count: 37)
        _ = BluetoothABI.bt_uuid_to_string(&uuid, &str, 37)
        #expect(String(cString: str) == "60f14fe2-f972-11e5-b84f-23e070d5a8c7")
        // 16-bit
        result = "180d".withCString { BluetoothABI.bt_string_to_uuid(&uuid, $0) }
        #expect(result == 0)
        #expect(uuid.type == BT_UUID16)
        #expect(uuid.value.u16 == 0x180D)
        // 16-bit with 0x prefix (strtol semantics, length 6)
        result = "0x180d".withCString { BluetoothABI.bt_string_to_uuid(&uuid, $0) }
        #expect(result == 0)
        #expect(uuid.type == BT_UUID16)
        #expect(uuid.value.u16 == 0x180D)
        // 32-bit
        result = "0000180d".withCString { BluetoothABI.bt_string_to_uuid(&uuid, $0) }
        #expect(result == 0)
        #expect(uuid.type == BT_UUID32)
        #expect(uuid.value.u32 == 0x180D)
        // Rejects
        result = "nonsense".withCString { BluetoothABI.bt_string_to_uuid(&uuid, $0) }
        #expect(result == -EINVAL)
        #expect(BluetoothABI.bt_string_to_uuid(&uuid, nil) == -EINVAL)
    }

    @Test func testCompare() {
        var a = bt_uuid_t()
        var b = bt_uuid_t()
        _ = BluetoothABI.bt_uuid16_create(&a, 0x180D)
        _ = BluetoothABI.bt_uuid32_create(&b, 0x180D)
        // A 16-bit and 32-bit value of the same number expand identically.
        #expect(BluetoothABI.bt_uuid_cmp(&a, &b) == 0)
        _ = BluetoothABI.bt_uuid32_create(&b, 0x180E)
        #expect(BluetoothABI.bt_uuid_cmp(&a, &b) < 0)
        // The reference returns glibc `memcmp`'s signed byte difference,
        // not a normalized ±1 — 0x0D - 0x0E at the first differing byte.
        #expect(BluetoothABI.bt_uuid_cmp(&a, &b) == -1)
        // 0000180d… vs 0000ffff…: first differ at byte 2, 0x18 - 0xFF.
        _ = BluetoothABI.bt_uuid32_create(&b, 0xFFFF)
        #expect(BluetoothABI.bt_uuid_cmp(&a, &b) == -231)
        // Inverted convention: 1 means equal.
        #expect(BluetoothABI.bt_uuid16_cmp(&a, 0x180D) == 1)
        #expect(BluetoothABI.bt_uuid16_cmp(&a, 0x180E) == 0)
        #expect(BluetoothABI.bt_uuid16_cmp(nil, 0x180D) == 0)
        #expect(BluetoothABI.bt_uuid16_cmp(&b, 0x180E) == 0)  // not BT_UUID16
    }

    @Test func testStrcmp() {
        let equal = "180d".withCString { a in
            "0000180d-0000-1000-8000-00805f9b34fb".withCString { b in
                BluetoothABI.bt_uuid_strcmp(a, b)
            }
        }
        #expect(equal == 0)
        let invalid = "bogus!".withCString { a in
            "180d".withCString { b in
                BluetoothABI.bt_uuid_strcmp(a, b)
            }
        }
        #expect(invalid == -EINVAL)
    }

    @Test func testToLE() {
        var uuid = bt_uuid_t()
        _ = BluetoothABI.bt_uuid16_create(&uuid, 0x180D)
        var le16 = [UInt8](repeating: 0, count: 2)
        #expect(BluetoothABI.bt_uuid_to_le(&uuid, &le16) == 0)
        #expect(le16 == [0x0D, 0x18])
        var uuid128 = bt_uuid_t()
        BluetoothABI.bt_uuid_to_uuid128(&uuid, &uuid128)
        var le128 = [UInt8](repeating: 0, count: 16)
        #expect(BluetoothABI.bt_uuid_to_le(&uuid128, &le128) == 0)
        #expect(le128 == [0xFB, 0x34, 0x9B, 0x5F, 0x80, 0x00, 0x00, 0x80, 0x00, 0x10, 0x00, 0x00, 0x0D, 0x18, 0x00, 0x00])
    }
}

@Suite("Error ABI")
struct ErrorABITests {

    @Test func testBtError() {
        #expect(BluetoothABI.bt_error(0) == 0)
        #expect(BluetoothABI.bt_error(0x02) == ENOTCONN)  // HCI_NO_CONNECTION
        #expect(BluetoothABI.bt_error(0x08) == ETIMEDOUT)  // HCI_CONNECTION_TIMEOUT
        #expect(BluetoothABI.bt_error(0x12) == EINVAL)  // HCI_INVALID_PARAMETERS
        #expect(BluetoothABI.bt_error(0xFF) == ENOSYS)  // unknown
    }
}

@Suite("Company ID ABI")
struct CompanyIDABITests {

    @Test func testCompidtostr() {
        let apple = BluetoothABI.bt_compidtostr(76)
        #expect(apple != nil)
        #expect(String(cString: apple!) == "Apple, Inc.")
        // Static lifetime: identical pointer on repeated calls.
        #expect(BluetoothABI.bt_compidtostr(76) == apple)
        #expect(String(cString: BluetoothABI.bt_compidtostr(65535)!) == "internal use")
        #expect(String(cString: BluetoothABI.bt_compidtostr(-1)!) == "not assigned")
    }
}
