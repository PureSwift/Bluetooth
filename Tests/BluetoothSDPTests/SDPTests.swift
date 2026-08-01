//
//  SDPTests.swift
//  BluetoothSDPTests
//
//  Round-trip and behavior tests for the SDP data model, PDU codec,
//  and attribute accessors, asserting reference behavior byte for byte.
//

import Testing
import CBluetooth
@testable import BluetoothSDP

@Suite("SDP List")
struct SDPListTests {

    @Test func appendRemove() {
        var a = 1
        var b = 2
        let list1 = withUnsafeMutablePointer(to: &a) { BluetoothSDP.sdp_list_append(nil, UnsafeMutableRawPointer($0)) }
        let list2 = withUnsafeMutablePointer(to: &b) { BluetoothSDP.sdp_list_append(list1, UnsafeMutableRawPointer($0)) }
        #expect(list2 != nil)
        #expect(list2!.pointee.data!.load(as: Int.self) == 1)
        #expect(list2!.pointee.next!.pointee.data!.load(as: Int.self) == 2)

        let removed = withUnsafeMutablePointer(to: &a) {
            BluetoothSDP.sdp_list_remove(list2, UnsafeMutableRawPointer($0))
        }
        #expect(removed!.pointee.data!.load(as: Int.self) == 2)
        #expect(removed!.pointee.next == nil)
        BluetoothSDP.sdp_list_free(removed, nil)
    }
}

@Suite("SDP UUID")
struct SDPUUIDTests {

    @Test func create() {
        var u = uuid_t()
        BluetoothSDP.sdp_uuid16_create(&u, 0x180D)
        #expect(u.type == UInt8(SDP_UUID16))
        #expect(u.value.uuid16 == 0x180D)
    }

    @Test func toUUID128() {
        var u16 = uuid_t()
        BluetoothSDP.sdp_uuid16_create(&u16, 0x180D)
        let u128 = BluetoothSDP.sdp_uuid_to_uuid128(&u16)
        #expect(u128!.pointee.type == UInt8(SDP_UUID128))
        let bytes = withUnsafeBytes(of: u128!.pointee.value.uuid128) { [UInt8]($0) }
        #expect(bytes == [0x00, 0x00, 0x18, 0x0D, 0x00, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB])
        bt_free(u128)
    }

    @Test func cmp() {
        var u1 = uuid_t()
        var u2 = uuid_t()
        BluetoothSDP.sdp_uuid16_create(&u1, 0x180D)
        BluetoothSDP.sdp_uuid16_create(&u2, 0x180D)
        #expect(BluetoothSDP.sdp_uuid_cmp(&u1, &u2) == 0)
        BluetoothSDP.sdp_uuid16_create(&u2, 0x180E)
        #expect(BluetoothSDP.sdp_uuid_cmp(&u1, &u2) != 0)
    }

    @Test func uuid128ToUUID() {
        var u = uuid_t()
        BluetoothSDP.sdp_uuid32_create(&u, 0x0000180D)
        let u128 = BluetoothSDP.sdp_uuid_to_uuid128(&u)!
        let shortened = BluetoothSDP.sdp_uuid128_to_uuid(u128)
        #expect(shortened == 1)
        #expect(u128.pointee.type == UInt8(SDP_UUID16))
        #expect(u128.pointee.value.uuid16 == 0x180D)
        bt_free(u128)
    }
}

@Suite("SDP Data")
struct SDPDataTests {

    @Test func allocInt() {
        var value: UInt32 = 42
        let d = withUnsafePointer(to: &value) { BluetoothSDP.sdp_data_alloc(UInt8(SDP_UINT32), $0) }
        #expect(d != nil)
        #expect(d!.pointee.dtd == UInt8(SDP_UINT32))
        #expect(d!.pointee.val.uint32 == 42)
        BluetoothSDP.sdp_data_free(d)
    }

    @Test func allocString() {
        let d = "hello".withCString { BluetoothSDP.sdp_data_alloc(UInt8(SDP_TEXT_STR8), $0) }
        #expect(d != nil)
        #expect(String(cString: d!.pointee.val.str) == "hello")
        BluetoothSDP.sdp_data_free(d)
    }

    @Test func seqAppend() {
        var v1: UInt8 = 1
        var v2: UInt8 = 2
        let d1 = withUnsafePointer(to: &v1) { BluetoothSDP.sdp_data_alloc(UInt8(SDP_UINT8), $0) }!
        let d2 = withUnsafePointer(to: &v2) { BluetoothSDP.sdp_data_alloc(UInt8(SDP_UINT8), $0) }!
        let seq = BluetoothSDP.sdp_seq_append(d1, d2)
        #expect(seq == d1)
        #expect(seq!.pointee.next == d2)
        BluetoothSDP.sdp_data_free(seq)
    }
}

@Suite("SDP Record")
struct SDPRecordTests {

    @Test func allocFree() {
        let rec = BluetoothSDP.sdp_record_alloc()
        #expect(rec != nil)
        #expect(rec!.pointee.handle == 0xffffffff)
        BluetoothSDP.sdp_record_free(rec)
    }

    @Test func attrAddGetRemove() {
        let rec = BluetoothSDP.sdp_record_alloc()!
        var value: UInt32 = 7
        let d = withUnsafePointer(to: &value) { BluetoothSDP.sdp_data_alloc(UInt8(SDP_UINT32), $0) }!
        #expect(BluetoothSDP.sdp_attr_add(rec, 0x0002, d) == 0)

        let fetched = BluetoothSDP.sdp_data_get(rec, 0x0002)
        #expect(fetched != nil)
        #expect(fetched!.pointee.val.uint32 == 7)

        BluetoothSDP.sdp_attr_remove(rec, 0x0002)
        #expect(BluetoothSDP.sdp_data_get(rec, 0x0002) == nil)

        BluetoothSDP.sdp_record_free(rec)
    }

    @Test func infoAttrRoundTrip() {
        let rec = BluetoothSDP.sdp_record_alloc()!
        "My Service".withCString { name in
            "My Provider".withCString { provider in
                "My Description".withCString { description in
                    BluetoothSDP.sdp_set_info_attr(rec, name, provider, description)
                }
            }
        }

        var value = [CChar](repeating: 0, count: 64)
        #expect(BluetoothSDP.sdp_get_string_attr(rec, UInt16(SDP_ATTR_SVCNAME_PRIMARY), &value, 64) == 0)
        #expect(String(cString: value) == "My Service")

        BluetoothSDP.sdp_record_free(rec)
    }

    @Test func serviceIdRoundTrip() {
        let rec = BluetoothSDP.sdp_record_alloc()!
        var uuid = uuid_t()
        BluetoothSDP.sdp_uuid16_create(&uuid, 0x1101)
        BluetoothSDP.sdp_set_service_id(rec, uuid)

        var fetched = uuid_t()
        #expect(BluetoothSDP.sdp_get_service_id(rec, &fetched) == 0)
        #expect(fetched.type == UInt8(SDP_UUID16))
        #expect(fetched.value.uuid16 == 0x1101)

        // sdp_pattern_add_uuid should have populated rec->pattern.
        #expect(rec.pointee.pattern != nil)

        BluetoothSDP.sdp_record_free(rec)
    }

    @Test func copyRecord() {
        let rec = BluetoothSDP.sdp_record_alloc()!
        var uuid = uuid_t()
        BluetoothSDP.sdp_uuid16_create(&uuid, 0x1101)
        BluetoothSDP.sdp_set_service_id(rec, uuid)

        let copy = BluetoothSDP.sdp_copy_record(rec)!
        var fetched = uuid_t()
        #expect(BluetoothSDP.sdp_get_service_id(copy, &fetched) == 0)
        #expect(fetched.value.uuid16 == 0x1101)

        BluetoothSDP.sdp_record_free(rec)
        BluetoothSDP.sdp_record_free(copy)
    }
}

@Suite("SDP PDU codec")
struct SDPCodecTests {

    /// Encodes a minimal record (just a ServiceClassIDList with one
    /// 16-bit UUID), then decodes it, and checks the round trip.
    @Test func recordPDURoundTrip() throws {
        let rec = BluetoothSDP.sdp_record_alloc()!
        var uuid16 = UInt8(SDP_UUID16)
        var uuid: UInt16 = 0x1101
        let dtds: [UnsafeMutableRawPointer?] = [UnsafeMutableRawPointer(&uuid16)]
        let values: [UnsafeMutableRawPointer?] = [UnsafeMutableRawPointer(&uuid)]
        let seq = dtds.withUnsafeBufferPointer { dtdBuffer in
            values.withUnsafeBufferPointer { valueBuffer in
                BluetoothSDP.sdp_seq_alloc(
                    UnsafeMutablePointer(mutating: dtdBuffer.baseAddress),
                    UnsafeMutablePointer(mutating: valueBuffer.baseAddress),
                    1
                )
            }
        }
        #expect(BluetoothSDP.sdp_attr_add(rec, UInt16(SDP_ATTR_SVCLASS_ID_LIST), seq) == 0)

        var buf = sdp_buf_t()
        #expect(BluetoothSDP.sdp_gen_record_pdu(rec, &buf) == 0)
        #expect(buf.data_size > 0)

        var scanned: Int32 = 0
        let decoded = buf.data!.withMemoryRebound(to: UInt8.self, capacity: Int(buf.data_size)) {
            BluetoothSDP.sdp_extract_pdu($0, Int32(buf.data_size), &scanned)
        }
        #expect(decoded != nil)
        #expect(scanned == Int32(buf.data_size))

        let decodedList = BluetoothSDP.sdp_data_get(decoded, UInt16(SDP_ATTR_SVCLASS_ID_LIST))
        #expect(decodedList != nil)
        #expect(decodedList!.pointee.val.dataseq!.pointee.val.uuid.value.uuid16 == 0x1101)

        free(buf.data)
        BluetoothSDP.sdp_record_free(rec)
        BluetoothSDP.sdp_record_free(decoded)
    }

    @Test func seq8UpgradesToSeq16OnOverflow() {
        // 60 UINT32 elements * 5 bytes (dtd + uint32) = 300 bytes of
        // value data, comfortably over UCHAR_MAX (255) — the encoded
        // length no longer fits an SDP_SEQ8, so sdp_gen_pdu mutates
        // d->dtd to SDP_SEQ16 in place.
        let count = 60
        var tags = [UInt8](repeating: UInt8(SDP_UINT32), count: count)
        var values = [UInt32](repeating: 0x11223344, count: count)
        let dtds: [UnsafeMutableRawPointer?] = (0..<count).map { UnsafeMutableRawPointer(&tags[$0]) }
        let valuePointers: [UnsafeMutableRawPointer?] = (0..<count).map { UnsafeMutableRawPointer(&values[$0]) }

        let seq = dtds.withUnsafeBufferPointer { dtdBuffer in
            valuePointers.withUnsafeBufferPointer { valueBuffer in
                BluetoothSDP.sdp_seq_alloc(
                    UnsafeMutablePointer(mutating: dtdBuffer.baseAddress),
                    UnsafeMutablePointer(mutating: valueBuffer.baseAddress),
                    Int32(count)
                )
            }
        }!
        #expect(seq.pointee.dtd == UInt8(SDP_SEQ8))

        var buf = sdp_buf_t()
        let size = BluetoothSDP.sdpGenerateBuffer(&buf, seq)
        #expect(size > 0)
        buf.data = malloc(Int(buf.buf_size))?.assumingMemoryBound(to: UInt8.self)
        buf.data_size = 0
        _ = BluetoothSDP.sdp_gen_pdu(&buf, seq)

        #expect(seq.pointee.dtd == UInt8(SDP_SEQ16))

        free(buf.data)
        BluetoothSDP.sdp_data_free(seq)
    }
}
