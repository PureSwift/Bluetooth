//
//  Record.swift
//  Bluetooth
//
//  Swift implementations of `sdp_record_t` allocation, attribute
//  mutation, and the search pattern, bound to the declarations in the
//  vendored `sdp_lib.h`.
//
//  `rec->pattern` is a sorted, deduplicated (by 128-bit expansion) set
//  of every UUID that has appeared in specific attributes — maintained
//  as a side effect of `sdp_pattern_add_uuid`/`sdp_pattern_add_uuidseq`,
//  which the setter functions in `Attributes.swift` call. It exists to
//  support service-search matching, done by the socket-dependent
//  functions this repository does not implement, but it is a real,
//  directly-read field of a transparent struct, so it is maintained
//  faithfully regardless.
//

import Bluetooth
import CBluetooth

/// `sdp_record_t *sdp_record_alloc(void)`
@c(sdp_record_alloc)
public func sdp_record_alloc() -> UnsafeMutablePointer<sdp_record_t>? {
    guard let rec = bt_malloc0(MemoryLayout<sdp_record_t>.size)?
        .assumingMemoryBound(to: sdp_record_t.self) else {
        return nil
    }
    rec.pointee.handle = 0xffffffff
    return rec
}

/// `void sdp_record_free(sdp_record_t *rec)`
@c(sdp_record_free)
public func sdp_record_free(_ rec: UnsafeMutablePointer<sdp_record_t>?) {
    guard let rec else { return }
    sdp_list_free(rec.pointee.attrlist) { data in
        sdp_data_free(data?.assumingMemoryBound(to: sdp_data_t.self))
    }
    sdp_list_free(rec.pointee.pattern) { free($0) }
    free(rec)
}

/// `int sdp_attr_add(sdp_record_t *rec, uint16_t attr, sdp_data_t *data)`
@c(sdp_attr_add)
public func sdp_attr_add(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ attr: UInt16,
    _ data: UnsafeMutablePointer<sdp_data_t>?
) -> Int32 {
    guard sdp_data_get(rec, attr) == nil, let data else { return -1 }
    data.pointee.attrId = attr
    rec!.pointee.attrlist = sdp_list_insert_sorted(
        rec!.pointee.attrlist,
        UnsafeMutableRawPointer(data),
        sdp_attrid_comp_func
    )
    if attr == UInt16(SDP_ATTR_SVCLASS_ID_LIST) {
        extractServiceClassUUID(data, &rec!.pointee.svclass)
    }
    return 0
}

/// `void sdp_attr_remove(sdp_record_t *rec, uint16_t attr)`
@c(sdp_attr_remove)
public func sdp_attr_remove(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ attr: UInt16
) {
    if let d = sdp_data_get(rec, attr) {
        rec!.pointee.attrlist = sdp_list_remove(rec!.pointee.attrlist, UnsafeMutableRawPointer(d))
    }
    if attr == UInt16(SDP_ATTR_SVCLASS_ID_LIST) {
        rec!.pointee.svclass = uuid_t()
    }
}

/// `void sdp_attr_replace(sdp_record_t *rec, uint16_t attr, sdp_data_t *d)`
@c(sdp_attr_replace)
public func sdp_attr_replace(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ attr: UInt16,
    _ data: UnsafeMutablePointer<sdp_data_t>?
) {
    guard let rec else { return }
    if let existing = sdp_data_get(rec, attr) {
        rec.pointee.attrlist = sdp_list_remove(rec.pointee.attrlist, UnsafeMutableRawPointer(existing))
        sdp_data_free(existing)
    }
    guard let data else { return }
    data.pointee.attrId = attr
    rec.pointee.attrlist = sdp_list_insert_sorted(
        rec.pointee.attrlist,
        UnsafeMutableRawPointer(data),
        sdp_attrid_comp_func
    )
    if attr == UInt16(SDP_ATTR_SVCLASS_ID_LIST) {
        extractServiceClassUUID(data, &rec.pointee.svclass)
    }
}

/// `int sdp_attr_add_new(sdp_record_t *rec, uint16_t attr, uint8_t dtd, const void *value)`
@c(sdp_attr_add_new)
public func sdp_attr_add_new(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ attr: UInt16,
    _ dtd: UInt8,
    _ value: UnsafeRawPointer?
) -> Int32 {
    guard let d = sdp_data_alloc(dtd, value) else { return -1 }
    sdp_attr_replace(rec, attr, d)
    return 0
}

/// `int sdp_attrid_comp_func(const void *key1, const void *key2)`
@c(sdp_attrid_comp_func)
public func sdp_attrid_comp_func(
    _ key1: UnsafeRawPointer?,
    _ key2: UnsafeRawPointer?
) -> Int32 {
    guard let key1, let key2 else { return 0 }
    let d1 = key1.assumingMemoryBound(to: sdp_data_t.self)
    let d2 = key2.assumingMemoryBound(to: sdp_data_t.self)
    return Int32(d1.pointee.attrId) - Int32(d2.pointee.attrId)
}

/// `void sdp_pattern_add_uuid(sdp_record_t *rec, uuid_t *uuid)`
@c(sdp_pattern_add_uuid)
public func sdp_pattern_add_uuid(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ uuid: UnsafeMutablePointer<uuid_t>?
) {
    guard let rec else { return }
    let uuid128 = sdp_uuid_to_uuid128(uuid)
    if sdp_list_find(rec.pointee.pattern, uuid128.map(UnsafeMutableRawPointer.init), sdp_uuid128_cmp) == nil {
        rec.pointee.pattern = sdp_list_insert_sorted(
            rec.pointee.pattern,
            uuid128.map(UnsafeMutableRawPointer.init),
            sdp_uuid128_cmp
        )
    } else {
        bt_free(uuid128)
    }
}

/// `void sdp_pattern_add_uuidseq(sdp_record_t *rec, sdp_list_t *seq)`
@c(sdp_pattern_add_uuidseq)
public func sdp_pattern_add_uuidseq(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ seq: UnsafeMutablePointer<sdp_list_t>?
) {
    var node = seq
    while let current = node {
        sdp_pattern_add_uuid(rec, current.pointee.data?.assumingMemoryBound(to: uuid_t.self))
        node = current.pointee.next
    }
}

/// `sdp_record_t *sdp_copy_record(sdp_record_t *rec)`
@c(sdp_copy_record)
public func sdp_copy_record(
    _ rec: UnsafeMutablePointer<sdp_record_t>?
) -> UnsafeMutablePointer<sdp_record_t>? {
    guard let rec, let copy = sdp_record_alloc() else { return nil }
    copy.pointee.handle = rec.pointee.handle

    sdp_list_foreach(rec.pointee.pattern, { value, userData in
        let copy = userData!.assumingMemoryBound(to: sdp_record_t.self)
        sdp_pattern_add_uuid(copy, value?.assumingMemoryBound(to: uuid_t.self))
    }, UnsafeMutableRawPointer(copy))

    sdp_list_foreach(rec.pointee.attrlist, { value, userData in
        let copy = userData!.assumingMemoryBound(to: sdp_record_t.self)
        let data = value!.assumingMemoryBound(to: sdp_data_t.self)
        var length: UInt32 = 0
        guard let raw = dataValue(data, &length) else { return }
        if length == 0 {
            _ = sdp_attr_add_new(copy, data.pointee.attrId, data.pointee.dtd, raw)
        } else {
            if let d = sdp_data_alloc_with_length(data.pointee.dtd, raw, length) {
                sdp_attr_replace(copy, data.pointee.attrId, d)
            }
        }
    }, UnsafeMutableRawPointer(copy))

    copy.pointee.svclass = rec.pointee.svclass
    return copy
}

// MARK: - Internal helpers

/// `static void extract_svclass_uuid(sdp_data_t *data, uuid_t *uuid)`
internal func extractServiceClassUUID(
    _ data: UnsafeMutablePointer<sdp_data_t>?,
    _ uuid: UnsafeMutablePointer<uuid_t>
) {
    guard let data, isSequence(data.pointee.dtd) else { return }
    guard let child = data.pointee.val.dataseq else { return }
    guard child.pointee.dtd >= UInt8(SDP_UUID16) && child.pointee.dtd <= UInt8(SDP_UUID128) else { return }
    uuid.pointee = child.pointee.val.uuid
}

/// `static void *sdp_data_value(sdp_data_t *data, uint32_t *len)`
///
/// A pointer to `data`'s value suitable for re-allocating an equal
/// node via `sdp_data_alloc_with_length`. For sequences/alternates this
/// recurses and returns a freshly copied chain (matching the
/// reference's `sdp_copy_seq`), which the caller is responsible for —
/// exactly as in the reference, where the raw pointer becomes the new
/// node's `val.dataseq` directly, no further copy.
internal func dataValue(
    _ data: UnsafeMutablePointer<sdp_data_t>,
    _ length: inout UInt32
) -> UnsafeRawPointer? {
    switch Int32(data.pointee.dtd) {
    case SDP_DATA_NIL:
        return nil
    case SDP_UINT8, SDP_INT8, SDP_BOOL, SDP_UINT16, SDP_INT16, SDP_UINT32, SDP_INT32,
         SDP_INT64, SDP_UINT64, SDP_UINT128, SDP_INT128:
        return UnsafeRawPointer(rawValue(data))
    case SDP_UUID16, SDP_UUID32, SDP_UUID128:
        return UnsafeRawPointer(rawUUIDValue(data))
    case SDP_URL_STR8, SDP_URL_STR16, SDP_TEXT_STR8, SDP_TEXT_STR16, SDP_URL_STR32, SDP_TEXT_STR32:
        length = UInt32(data.pointee.unitSize) - UInt32(MemoryLayout<UInt8>.size)
        return data.pointee.val.str.map { UnsafeRawPointer($0) }
    case SDP_ALT8, SDP_ALT16, SDP_ALT32, SDP_SEQ8, SDP_SEQ16, SDP_SEQ32:
        return copySequence(data.pointee.val.dataseq).map { UnsafeRawPointer($0) }
    default:
        return nil
    }
}

/// `static sdp_data_t *sdp_copy_seq(sdp_data_t *data)`
internal func copySequence(
    _ data: UnsafeMutablePointer<sdp_data_t>?
) -> UnsafeMutablePointer<sdp_data_t>? {
    var current: UnsafeMutablePointer<sdp_data_t>? = nil
    var seq: UnsafeMutablePointer<sdp_data_t>? = nil
    var node = data

    while let element = node {
        var length: UInt32 = 0
        let value = dataValue(element, &length)
        guard let copy = sdp_data_alloc_with_length(element.pointee.dtd, value, length) else {
            sdp_data_free(seq)
            return nil
        }
        if let current {
            current.pointee.next = copy
        } else {
            seq = copy
        }
        current = copy
        node = element.pointee.next
    }
    return seq
}

@usableFromInline
internal func isSequence(_ dtd: UInt8) -> Bool {
    Int32(dtd) == SDP_SEQ8 || Int32(dtd) == SDP_SEQ16 || Int32(dtd) == SDP_SEQ32
}

@usableFromInline
internal func isAlternative(_ dtd: UInt8) -> Bool {
    Int32(dtd) == SDP_ALT8 || Int32(dtd) == SDP_ALT16 || Int32(dtd) == SDP_ALT32
}

@usableFromInline
internal func isTextString(_ dtd: UInt8) -> Bool {
    Int32(dtd) == SDP_TEXT_STR8 || Int32(dtd) == SDP_TEXT_STR16 || Int32(dtd) == SDP_TEXT_STR32
}

@usableFromInline
internal func isUUID(_ dtd: UInt8) -> Bool {
    Int32(dtd) == SDP_UUID16 || Int32(dtd) == SDP_UUID32 || Int32(dtd) == SDP_UUID128
}
