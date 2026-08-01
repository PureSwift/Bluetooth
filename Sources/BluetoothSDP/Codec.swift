//
//  Codec.swift
//  Bluetooth
//
//  Swift implementations of the SDP PDU wire-format codec, bound to
//  the declarations in the vendored `sdp_lib.h`.
//
//  This is the one place arbitrary remote bytes reach the library
//  (`sdp_extract_pdu`/`sdp_extract_attr`), so it is translated as
//  closely to the reference control flow as practical rather than
//  written "cleaner" — a byte-precise codec is exactly the kind of
//  code where a tidier restructuring risks silently changing behavior.
//
//  Two reference quirks are load-bearing, not incidental, and are
//  reproduced exactly:
//
//  - `sdp_gen_pdu` mutates `d->dtd` in place from `SDP_SEQ8` to
//    `SDP_SEQ16` when the encoded length would overflow a byte, and
//    retries. This is externally observable: encoding the same node
//    twice sees the upgraded tag the second time. `SDP_ALT8` has no
//    such upgrade — an oversized alternatives sequence writes a
//    silently truncated length byte, matching the reference exactly.
//  - `sdp_gen_buffer` (used only to size the scratch allocation before
//    the real write pass) adds a flat 3-byte "attribute length"
//    overhead at every node, including recursive children — a
//    deliberate over-estimate, not a bug; only `data_size` (what
//    `sdp_gen_pdu` actually writes) is ever copied anywhere, so the
//    over-allocation is harmless and not worth "fixing" away from the
//    reference's exact arithmetic.
//

import Bluetooth
import CBluetooth

/// `void sdp_set_seq_len(uint8_t *ptr, uint32_t length)`
@c(sdp_set_seq_len)
public func sdp_set_seq_len(
    _ ptr: UnsafeMutablePointer<UInt8>?,
    _ length: UInt32
) {
    let dtd = ptr!.pointee
    let valuePointer = ptr! + 1
    switch Int32(dtd) {
    case SDP_SEQ8, SDP_ALT8, SDP_TEXT_STR8, SDP_URL_STR8:
        valuePointer.pointee = UInt8(truncatingIfNeeded: length)
    case SDP_SEQ16, SDP_ALT16, SDP_TEXT_STR16, SDP_URL_STR16:
        bt_put_be16(UInt16(truncatingIfNeeded: length), valuePointer)
    case SDP_SEQ32, SDP_ALT32, SDP_TEXT_STR32, SDP_URL_STR32:
        bt_put_be32(length, valuePointer)
    default:
        break
    }
}

/// `void sdp_set_attrid(sdp_buf_t *buf, uint16_t attr)`
@c(sdp_set_attrid)
public func sdp_set_attrid(
    _ buf: UnsafeMutablePointer<sdp_buf_t>?,
    _ attr: UInt16
) {
    let p = buf!.pointee.data!
    p.pointee = UInt8(SDP_UINT16)
    buf!.pointee.data_size = UInt32(MemoryLayout<UInt8>.size)
    bt_put_be16(attr, p + 1)
    buf!.pointee.data_size += UInt32(MemoryLayout<UInt16>.size)
}

/// `int sdp_gen_pdu(sdp_buf_t *buf, sdp_data_t *d)`
@c(sdp_gen_pdu)
public func sdp_gen_pdu(
    _ buf: UnsafeMutablePointer<sdp_buf_t>?,
    _ d: UnsafeMutablePointer<sdp_data_t>?
) -> Int32 {
    let buf = buf!
    let d = d!
    var pduSize: UInt32
    var dataSize: UInt32
    var source: UnsafeRawPointer? = nil
    var isSeqValue = false
    var isAltValue = false

    let seqp = buf.pointee.data! + Int(buf.pointee.data_size)
    let originalDataSize = buf.pointee.data_size

    var u16: UInt16 = 0
    var u32: UInt32 = 0
    var u64: UInt64 = 0
    var u128 = uint128_t()

    while true {
        pduSize = sdpDataTypeEnvelopeSize(d.pointee.dtd)
        buf.pointee.data_size += pduSize

        dataSize = sdpDataValueSize(buf, d)
        if dataSize > UInt32(UInt8.max) && Int32(d.pointee.dtd) == SDP_SEQ8 {
            buf.pointee.data_size = originalDataSize
            d.pointee.dtd = UInt8(SDP_SEQ16)
            continue
        }
        break
    }

    seqp.pointee = d.pointee.dtd

    switch Int32(d.pointee.dtd) {
    case SDP_DATA_NIL:
        break
    case SDP_UINT8:
        source = UnsafeRawPointer(rawValue(d))
    case SDP_UINT16:
        u16 = d.pointee.val.uint16.bigEndian
        source = withUnsafePointer(to: &u16) { UnsafeRawPointer($0) }
    case SDP_UINT32:
        u32 = d.pointee.val.uint32.bigEndian
        source = withUnsafePointer(to: &u32) { UnsafeRawPointer($0) }
    case SDP_UINT64:
        u64 = d.pointee.val.uint64.bigEndian
        source = withUnsafePointer(to: &u64) { UnsafeRawPointer($0) }
    case SDP_UINT128:
        ntoh128(&d.pointee.val.uint128, &u128)
        source = withUnsafePointer(to: &u128) { UnsafeRawPointer($0) }
    case SDP_INT8, SDP_BOOL:
        source = UnsafeRawPointer(rawValue(d))
    case SDP_INT16:
        u16 = UInt16(bitPattern: d.pointee.val.int16).bigEndian
        source = withUnsafePointer(to: &u16) { UnsafeRawPointer($0) }
    case SDP_INT32:
        u32 = UInt32(bitPattern: d.pointee.val.int32).bigEndian
        source = withUnsafePointer(to: &u32) { UnsafeRawPointer($0) }
    case SDP_INT64:
        u64 = UInt64(bitPattern: d.pointee.val.int64).bigEndian
        source = withUnsafePointer(to: &u64) { UnsafeRawPointer($0) }
    case SDP_INT128:
        ntoh128(&d.pointee.val.int128, &u128)
        source = withUnsafePointer(to: &u128) { UnsafeRawPointer($0) }
    case SDP_TEXT_STR8, SDP_TEXT_STR16, SDP_TEXT_STR32,
         SDP_URL_STR8, SDP_URL_STR16, SDP_URL_STR32:
        source = d.pointee.val.str.map { UnsafeRawPointer($0) }
        sdp_set_seq_len(seqp, dataSize)
    case SDP_SEQ8, SDP_SEQ16, SDP_SEQ32:
        isSeqValue = true
        sdp_set_seq_len(seqp, dataSize)
    case SDP_ALT8, SDP_ALT16, SDP_ALT32:
        isAltValue = true
        sdp_set_seq_len(seqp, dataSize)
    case SDP_UUID16:
        u16 = d.pointee.val.uuid.value.uuid16.bigEndian
        source = withUnsafePointer(to: &u16) { UnsafeRawPointer($0) }
    case SDP_UUID32:
        u32 = d.pointee.val.uuid.value.uuid32.bigEndian
        source = withUnsafePointer(to: &u32) { UnsafeRawPointer($0) }
    case SDP_UUID128:
        source = UnsafeRawPointer(rawUUIDValue(d))
    default:
        break
    }

    if !isSeqValue && !isAltValue {
        if let source, buf.pointee.buf_size >= buf.pointee.data_size + dataSize {
            memcpy(buf.pointee.data! + Int(buf.pointee.data_size), source, Int(dataSize))
            buf.pointee.data_size += dataSize
        }
    }

    pduSize += dataSize
    return Int32(bitPattern: pduSize)
}

/// `int sdp_gen_record_pdu(const sdp_record_t *rec, sdp_buf_t *buf)`
@c(sdp_gen_record_pdu)
public func sdp_gen_record_pdu(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ buf: UnsafeMutablePointer<sdp_buf_t>?
) -> Int32 {
    buf!.pointee = sdp_buf_t()
    sdp_list_foreach(
        UnsafeMutablePointer(mutating: rec!.pointee.attrlist),
        { value, userData in
            let buf = userData!.assumingMemoryBound(to: sdp_buf_t.self)
            _ = sdpGenerateBuffer(buf, value!.assumingMemoryBound(to: sdp_data_t.self))
        },
        UnsafeMutableRawPointer(buf!)
    )

    guard let data = bt_malloc0(Int(buf!.pointee.buf_size))?.assumingMemoryBound(to: UInt8.self) else {
        return -ENOMEM
    }
    buf!.pointee.data = data
    buf!.pointee.data_size = 0

    sdp_list_foreach(
        UnsafeMutablePointer(mutating: rec!.pointee.attrlist),
        { value, userData in
            let buf = userData!.assumingMemoryBound(to: sdp_buf_t.self)
            sdp_append_to_pdu(buf, value!.assumingMemoryBound(to: sdp_data_t.self))
        },
        UnsafeMutableRawPointer(buf!)
    )

    return 0
}

/// `void sdp_append_to_buf(sdp_buf_t *dst, uint8_t *data, uint32_t len)`
@c(sdp_append_to_buf)
public func sdp_append_to_buf(
    _ dst: UnsafeMutablePointer<sdp_buf_t>?,
    _ data: UnsafePointer<UInt8>?,
    _ length: UInt32
) {
    let dst = dst!
    var p = dst.pointee.data!
    var dtd = p.pointee

    guard dst.pointee.data_size + length <= dst.pointee.buf_size else {
        return
    }

    if dst.pointee.data_size == 0 && dtd == 0 {
        p.pointee = UInt8(SDP_SEQ8)
        dst.pointee.data_size += UInt32(MemoryLayout<UInt8>.size)
        dst.pointee.data_size += UInt32(MemoryLayout<UInt8>.size)
    }

    memcpy(dst.pointee.data! + Int(dst.pointee.data_size), data!, Int(length))
    dst.pointee.data_size += length

    dtd = dst.pointee.data!.pointee
    if dst.pointee.data_size > UInt32(UInt8.max) && Int32(dtd) == SDP_SEQ8 {
        let offset = MemoryLayout<UInt8>.size + MemoryLayout<UInt8>.size
        memmove(
            dst.pointee.data! + (offset + 1),
            dst.pointee.data! + offset,
            Int(dst.pointee.data_size) - offset
        )
        p.pointee = UInt8(SDP_SEQ16)
        dst.pointee.data_size += 1
    }

    dtd = p.pointee
    p += 1
    switch Int32(dtd) {
    case SDP_SEQ8:
        p.pointee = UInt8(truncatingIfNeeded: dst.pointee.data_size - 2)
    case SDP_SEQ16:
        bt_put_be16(UInt16(truncatingIfNeeded: dst.pointee.data_size - 3), p)
    case SDP_SEQ32:
        bt_put_be32(dst.pointee.data_size - 5, p)
    default:
        break
    }
}

/// `void sdp_append_to_pdu(sdp_buf_t *pdu, sdp_data_t *d)`
@c(sdp_append_to_pdu)
public func sdp_append_to_pdu(
    _ pdu: UnsafeMutablePointer<sdp_buf_t>?,
    _ d: UnsafeMutablePointer<sdp_data_t>?
) {
    var append = sdp_buf_t()
    _ = sdpGenerateBuffer(&append, d!)
    guard let data = malloc(Int(append.buf_size))?.assumingMemoryBound(to: UInt8.self) else {
        return
    }
    append.data = data
    withUnsafeMutablePointer(to: &append) { appendPointer in
        sdp_set_attrid(appendPointer, d!.pointee.attrId)
        _ = sdp_gen_pdu(appendPointer, d)
    }
    sdp_append_to_buf(pdu, append.data, append.data_size)
    free(append.data)
}

// MARK: - Decode

/// `int sdp_extract_seqtype(const uint8_t *buf, int bufsize, uint8_t *dtdp, int *size)`
@c(sdp_extract_seqtype)
public func sdp_extract_seqtype(
    _ buf: UnsafePointer<UInt8>?,
    _ bufferSize: Int32,
    _ dtd: UnsafeMutablePointer<UInt8>?,
    _ size: UnsafeMutablePointer<Int32>?
) -> Int32 {
    guard bufferSize >= 1 else { return 0 }
    var scanned: Int32 = 1
    let tag = buf!.pointee
    let value = buf! + 1
    let remaining = bufferSize - 1
    dtd!.pointee = tag

    switch Int32(tag) {
    case SDP_SEQ8, SDP_ALT8:
        guard remaining >= 1 else { return 0 }
        size!.pointee = Int32(value.pointee)
        scanned += 1
    case SDP_SEQ16, SDP_ALT16:
        guard remaining >= 2 else { return 0 }
        size!.pointee = Int32(bt_get_be16(value))
        scanned += 2
    case SDP_SEQ32, SDP_ALT32:
        guard remaining >= 4 else { return 0 }
        size!.pointee = Int32(bitPattern: bt_get_be32(value))
        scanned += 4
    default:
        return 0
    }
    return scanned
}

/// `sdp_data_t *sdp_extract_attr(const uint8_t *p, int bufsize, int *size, sdp_record_t *rec)`
@c(sdp_extract_attr)
public func sdp_extract_attr(
    _ p: UnsafePointer<UInt8>?,
    _ bufferSize: Int32,
    _ size: UnsafeMutablePointer<Int32>?,
    _ rec: UnsafeMutablePointer<sdp_record_t>?
) -> UnsafeMutablePointer<sdp_data_t>? {
    guard bufferSize >= 1 else { return nil }
    let dtd = p!.pointee
    var n: Int32 = 0
    let element: UnsafeMutablePointer<sdp_data_t>?

    switch Int32(dtd) {
    case SDP_DATA_NIL, SDP_BOOL, SDP_UINT8, SDP_UINT16, SDP_UINT32, SDP_UINT64,
         SDP_UINT128, SDP_INT8, SDP_INT16, SDP_INT32, SDP_INT64, SDP_INT128:
        element = extractInteger(p!, bufferSize, &n)
    case SDP_UUID16, SDP_UUID32, SDP_UUID128:
        element = extractUUID(p!, bufferSize, &n, rec)
    case SDP_TEXT_STR8, SDP_TEXT_STR16, SDP_TEXT_STR32,
         SDP_URL_STR8, SDP_URL_STR16, SDP_URL_STR32:
        element = extractString(p!, bufferSize, &n)
    case SDP_SEQ8, SDP_SEQ16, SDP_SEQ32, SDP_ALT8, SDP_ALT16, SDP_ALT32:
        element = extractSequence(p!, bufferSize, &n, rec)
    default:
        return nil
    }

    size!.pointee += n
    return element
}

/// `sdp_record_t *sdp_extract_pdu(const uint8_t *buf, int bufsize, int *scanned)`
@c(sdp_extract_pdu)
public func sdp_extract_pdu(
    _ buf: UnsafePointer<UInt8>?,
    _ bufferSize: Int32,
    _ scanned: UnsafeMutablePointer<Int32>?
) -> UnsafeMutablePointer<sdp_record_t>? {
    var extracted: Int32 = 0
    var dtd: UInt8 = 0
    var seqlen: Int32 = 0
    let rec = sdp_record_alloc()!
    var p = buf!
    var remaining = bufferSize

    scanned!.pointee = sdp_extract_seqtype(buf, bufferSize, &dtd, &seqlen)
    p += Int(scanned!.pointee)
    remaining -= scanned!.pointee
    rec.pointee.attrlist = nil

    while extracted < seqlen && remaining > 0 {
        var n = Int32(MemoryLayout<UInt8>.size)
        var attrlen: Int32 = 0

        guard remaining >= n + Int32(MemoryLayout<UInt16>.size) else { break }

        let attr = bt_get_be16(p + Int(n))
        n += Int32(MemoryLayout<UInt16>.size)

        guard let data = sdp_extract_attr(p + Int(n), remaining - n, &attrlen, rec) else {
            break
        }

        n += attrlen

        if attr == UInt16(SDP_ATTR_RECORD_HANDLE) {
            rec.pointee.handle = data.pointee.val.uint32
        }
        if attr == UInt16(SDP_ATTR_SVCLASS_ID_LIST) {
            extractServiceClassUUID(data, &rec.pointee.svclass)
        }

        extracted += n
        p += Int(n)
        remaining -= n
        sdp_attr_replace(rec, attr, data)
    }

    scanned!.pointee += seqlen
    return rec
}

// MARK: - Internal: size computation

/// `static int sdp_get_data_type_size(uint8_t dtd)`
///
/// The envelope size: the DTD byte itself, plus (for the
/// variable-length categories) the bytes that hold the value's length.
internal func sdpDataTypeEnvelopeSize(_ dtd: UInt8) -> UInt32 {
    var size = UInt32(MemoryLayout<UInt8>.size)
    switch Int32(dtd) {
    case SDP_SEQ8, SDP_TEXT_STR8, SDP_URL_STR8, SDP_ALT8:
        size += UInt32(MemoryLayout<UInt8>.size)
    case SDP_SEQ16, SDP_TEXT_STR16, SDP_URL_STR16, SDP_ALT16:
        size += UInt32(MemoryLayout<UInt16>.size)
    case SDP_SEQ32, SDP_TEXT_STR32, SDP_URL_STR32, SDP_ALT32:
        size += UInt32(MemoryLayout<UInt32>.size)
    default:
        break
    }
    return size
}

/// `static uint32_t sdp_get_data_size(sdp_buf_t *buf, sdp_data_t *d)` — the
/// value size only, not including the envelope from
/// `sdpDataTypeEnvelopeSize`.
internal func sdpDataValueSize(
    _ buf: UnsafeMutablePointer<sdp_buf_t>,
    _ d: UnsafeMutablePointer<sdp_data_t>
) -> UInt32 {
    switch Int32(d.pointee.dtd) {
    case SDP_DATA_NIL:
        return 0
    case SDP_UINT8:
        return UInt32(MemoryLayout<UInt8>.size)
    case SDP_UINT16:
        return UInt32(MemoryLayout<UInt16>.size)
    case SDP_UINT32:
        return UInt32(MemoryLayout<UInt32>.size)
    case SDP_UINT64:
        return UInt32(MemoryLayout<UInt64>.size)
    case SDP_UINT128:
        return 16
    case SDP_INT8, SDP_BOOL:
        return UInt32(MemoryLayout<Int8>.size)
    case SDP_INT16:
        return UInt32(MemoryLayout<Int16>.size)
    case SDP_INT32:
        return UInt32(MemoryLayout<Int32>.size)
    case SDP_INT64:
        return UInt32(MemoryLayout<Int64>.size)
    case SDP_INT128:
        return 16
    case SDP_TEXT_STR8, SDP_TEXT_STR16, SDP_TEXT_STR32,
         SDP_URL_STR8, SDP_URL_STR16, SDP_URL_STR32:
        return UInt32(d.pointee.unitSize) - UInt32(MemoryLayout<UInt8>.size)
    case SDP_SEQ8, SDP_SEQ16, SDP_SEQ32, SDP_ALT8, SDP_ALT16, SDP_ALT32:
        return sdpChildrenSize(buf, d)
    case SDP_UUID16:
        return UInt32(MemoryLayout<UInt16>.size)
    case SDP_UUID32:
        return UInt32(MemoryLayout<UInt32>.size)
    case SDP_UUID128:
        return 16
    default:
        return 0
    }
}

/// `static int get_data_size(sdp_buf_t *buf, sdp_data_t *sdpdata)`
///
/// Walks `sdpdata`'s children, sizing (`buf->data == NULL`) or writing
/// (`buf->data != NULL`) each in turn — the same `sdp_buf_t` doubles as
/// "am I in the size pass or the write pass" state.
internal func sdpChildrenSize(
    _ buf: UnsafeMutablePointer<sdp_buf_t>,
    _ sdpData: UnsafeMutablePointer<sdp_data_t>
) -> UInt32 {
    var n: UInt32 = 0
    var node = sdpData.pointee.val.dataseq
    while let d = node {
        if buf.pointee.data != nil {
            n += UInt32(bitPattern: sdp_gen_pdu(buf, d))
        } else {
            n += UInt32(bitPattern: sdpGenerateBuffer(buf, d))
        }
        node = d.pointee.next
    }
    return n
}

/// `static int sdp_gen_buffer(sdp_buf_t *buf, sdp_data_t *d)`
///
/// The size-only pass: accumulates into `buf->buf_size` (never writes
/// bytes). See the file-level note on why this deliberately
/// over-estimates by a flat 3 bytes per node.
@discardableResult
internal func sdpGenerateBuffer(
    _ buf: UnsafeMutablePointer<sdp_buf_t>,
    _ d: UnsafeMutablePointer<sdp_data_t>
) -> Int32 {
    let original = buf.pointee.buf_size

    if buf.pointee.buf_size == 0 && d.pointee.dtd == 0 {
        buf.pointee.buf_size += UInt32(MemoryLayout<UInt8>.size)
        buf.pointee.buf_size += UInt32(MemoryLayout<UInt8>.size)
    }

    buf.pointee.buf_size += UInt32(MemoryLayout<UInt8>.size) + UInt32(MemoryLayout<UInt16>.size)
    buf.pointee.buf_size += sdpDataTypeEnvelopeSize(d.pointee.dtd)
    buf.pointee.buf_size += sdpDataValueSize(buf, d)

    if buf.pointee.buf_size > UInt32(UInt8.max) && Int32(d.pointee.dtd) == SDP_SEQ8 {
        buf.pointee.buf_size += UInt32(MemoryLayout<UInt8>.size)
    }

    return Int32(bitPattern: buf.pointee.buf_size - original)
}

// MARK: - Internal: decode helpers

/// `static sdp_data_t *extract_int(const void *p, int bufsize, int *len)`
internal func extractInteger(
    _ p: UnsafePointer<UInt8>,
    _ bufferSize: Int32,
    _ length: inout Int32
) -> UnsafeMutablePointer<sdp_data_t>? {
    guard bufferSize >= 1 else { return nil }
    guard let d = bt_malloc0(MemoryLayout<sdp_data_t>.size)?
        .assumingMemoryBound(to: sdp_data_t.self) else {
        return nil
    }
    d.pointee.dtd = p.pointee
    let value = p + 1
    length += 1
    let remaining = bufferSize - 1

    switch Int32(d.pointee.dtd) {
    case SDP_DATA_NIL:
        break
    case SDP_BOOL, SDP_INT8, SDP_UINT8:
        guard remaining >= 1 else { free(d); return nil }
        length += 1
        d.pointee.val.uint8 = value.pointee
    case SDP_INT16, SDP_UINT16:
        guard remaining >= 2 else { free(d); return nil }
        length += 2
        d.pointee.val.uint16 = bt_get_be16(value)
    case SDP_INT32, SDP_UINT32:
        guard remaining >= 4 else { free(d); return nil }
        length += 4
        d.pointee.val.uint32 = bt_get_be32(value)
    case SDP_INT64, SDP_UINT64:
        guard remaining >= 8 else { free(d); return nil }
        length += 8
        d.pointee.val.uint64 = bt_get_be64(value)
    case SDP_INT128, SDP_UINT128:
        guard remaining >= 16 else { free(d); return nil }
        length += 16
        value.withMemoryRebound(to: uint128_t.self, capacity: 1) { source in
            ntoh128(source, &d.pointee.val.uint128)
        }
    default:
        free(d)
        return nil
    }
    return d
}

/// `static sdp_data_t *extract_uuid(const uint8_t *p, int bufsize, int *len, sdp_record_t *rec)`
internal func extractUUID(
    _ p: UnsafePointer<UInt8>,
    _ bufferSize: Int32,
    _ length: inout Int32,
    _ rec: UnsafeMutablePointer<sdp_record_t>?
) -> UnsafeMutablePointer<sdp_data_t>? {
    guard let d = bt_malloc0(MemoryLayout<sdp_data_t>.size)?
        .assumingMemoryBound(to: sdp_data_t.self) else {
        return nil
    }
    let scanned = withUnsafeMutablePointer(to: &d.pointee.val.uuid) { uuid in
        sdp_uuid_extract(p, bufferSize, uuid, &length)
    }
    guard scanned >= 0 else {
        free(d)
        return nil
    }
    d.pointee.dtd = p.pointee
    if let rec {
        sdp_pattern_add_uuid(rec, &d.pointee.val.uuid)
    }
    return d
}

/// `static sdp_data_t *extract_str(const void *p, int bufsize, int *len)`
internal func extractString(
    _ p: UnsafePointer<UInt8>,
    _ bufferSize: Int32,
    _ length: inout Int32
) -> UnsafeMutablePointer<sdp_data_t>? {
    guard bufferSize >= 1 else { return nil }
    guard let d = bt_malloc0(MemoryLayout<sdp_data_t>.size)?
        .assumingMemoryBound(to: sdp_data_t.self) else {
        return nil
    }
    d.pointee.dtd = p.pointee
    var value = p + 1
    length += 1
    var remaining = bufferSize - 1
    var n: Int32

    switch Int32(d.pointee.dtd) {
    case SDP_TEXT_STR8, SDP_URL_STR8:
        guard remaining >= 1 else { free(d); return nil }
        n = Int32(value.pointee)
        value += 1
        length += 1
        remaining -= 1
    case SDP_TEXT_STR16, SDP_URL_STR16:
        guard remaining >= 2 else { free(d); return nil }
        n = Int32(bt_get_be16(value))
        value += 2
        length += 2
        remaining -= 2
    default:
        free(d)
        return nil
    }

    guard remaining >= n else {
        free(d)
        return nil
    }

    guard let str = bt_malloc0(Int(n) + 1)?.assumingMemoryBound(to: CChar.self) else {
        free(d)
        return nil
    }
    memcpy(str, value, Int(n))

    length += n
    d.pointee.val.str = str
    d.pointee.unitSize = n + Int32(MemoryLayout<UInt8>.size)
    return d
}

/// `static sdp_data_t *extract_seq(const void *p, int bufsize, int *len, sdp_record_t *rec)`
internal func extractSequence(
    _ p: UnsafePointer<UInt8>,
    _ bufferSize: Int32,
    _ length: inout Int32,
    _ rec: UnsafeMutablePointer<sdp_record_t>?
) -> UnsafeMutablePointer<sdp_data_t>? {
    guard let d = bt_malloc0(MemoryLayout<sdp_data_t>.size)?
        .assumingMemoryBound(to: sdp_data_t.self) else {
        return nil
    }
    var seqlen: Int32 = 0
    length = withUnsafeMutablePointer(to: &d.pointee.dtd) { dtd in
        sdp_extract_seqtype(p, bufferSize, dtd, &seqlen)
    }

    guard length != 0 else { return d }
    guard length <= bufferSize else {
        free(d)
        return nil
    }

    var current = p + Int(length)
    var remaining = bufferSize - length
    var previous: UnsafeMutablePointer<sdp_data_t>? = nil
    var n: Int32 = 0

    while n < seqlen {
        var attrlen: Int32 = 0
        guard let element = sdp_extract_attr(current, remaining, &attrlen, rec) else {
            break
        }
        if let previous {
            previous.pointee.next = element
        } else {
            d.pointee.val.dataseq = element
        }
        previous = element
        current += Int(attrlen)
        n += attrlen
        remaining -= attrlen
    }

    length += n
    return d
}
