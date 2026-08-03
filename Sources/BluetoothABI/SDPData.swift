//
//  SDPData.swift
//  Bluetooth
//
//  Swift implementations of the `sdp_data_t` allocator, bound to the
//  declarations in the vendored `sdp_lib.h`.
//
//  `sdp_data_t` is a transparent, recursive tagged union — every DTD
//  (data type descriptor) case, its `next` sibling pointer and its
//  `dataseq` child pointer are public fields every consumer reads
//  directly — so, as with `sdp_list_t`, these functions operate on the
//  imported C type itself rather than an idiomatic Swift value.
//
//  Two allocation asymmetries are reproduced exactly because they are
//  externally observable, not incidental: the node itself is allocated
//  with `bt_malloc0` but released with plain `free` (`sdp_data_free`
//  calls `free`, not `bt_free`); and `SDP_URL_STR32`/`SDP_TEXT_STR32`
//  are accepted by `sdp_data_alloc_with_length` but leave the node's
//  value unset (a reference quirk: strings over `USHRT_MAX` bytes are
//  "unsupported", but the function logs and returns an empty node
//  rather than failing).
//

import Bluetooth
import CBluetooth

/// `sdp_data_t *sdp_data_alloc_with_length(uint8_t dtd, const void *value, uint32_t length)`
@c(sdp_data_alloc_with_length)
public func sdp_data_alloc_with_length(
    _ dtd: UInt8,
    _ value: UnsafeRawPointer?,
    _ length: UInt32
) -> UnsafeMutablePointer<sdp_data_t>? {
    guard let d = bt_malloc0(MemoryLayout<sdp_data_t>.size)?
        .assumingMemoryBound(to: sdp_data_t.self) else {
        return nil
    }
    d.pointee.dtd = dtd
    d.pointee.unitSize = Int32(MemoryLayout<UInt8>.size)

    switch Int32(dtd) {
    case SDP_DATA_NIL:
        break
    case SDP_UINT8:
        d.pointee.val.uint8 = value!.loadUnaligned(as: UInt8.self)
        d.pointee.unitSize += Int32(MemoryLayout<UInt8>.size)
    case SDP_INT8, SDP_BOOL:
        d.pointee.val.int8 = value!.loadUnaligned(as: Int8.self)
        d.pointee.unitSize += Int32(MemoryLayout<Int8>.size)
    case SDP_UINT16:
        d.pointee.val.uint16 = value!.loadUnaligned(as: UInt16.self)
        d.pointee.unitSize += Int32(MemoryLayout<UInt16>.size)
    case SDP_INT16:
        d.pointee.val.int16 = value!.loadUnaligned(as: Int16.self)
        d.pointee.unitSize += Int32(MemoryLayout<Int16>.size)
    case SDP_UINT32:
        d.pointee.val.uint32 = value!.loadUnaligned(as: UInt32.self)
        d.pointee.unitSize += Int32(MemoryLayout<UInt32>.size)
    case SDP_INT32:
        d.pointee.val.int32 = value!.loadUnaligned(as: Int32.self)
        d.pointee.unitSize += Int32(MemoryLayout<Int32>.size)
    case SDP_INT64:
        d.pointee.val.int64 = value!.loadUnaligned(as: Int64.self)
        d.pointee.unitSize += Int32(MemoryLayout<Int64>.size)
    case SDP_UINT64:
        d.pointee.val.uint64 = value!.loadUnaligned(as: UInt64.self)
        d.pointee.unitSize += Int32(MemoryLayout<UInt64>.size)
    case SDP_UINT128:
        withUnsafeMutableBytes(of: &d.pointee.val.uint128) {
            $0.copyMemory(from: UnsafeRawBufferPointer(start: value, count: 16))
        }
        d.pointee.unitSize += 16
    case SDP_INT128:
        withUnsafeMutableBytes(of: &d.pointee.val.int128) {
            $0.copyMemory(from: UnsafeRawBufferPointer(start: value, count: 16))
        }
        d.pointee.unitSize += 16
    case SDP_UUID16:
        _ = sdp_uuid16_create(&d.pointee.val.uuid, value!.loadUnaligned(as: UInt16.self))
        d.pointee.unitSize += Int32(MemoryLayout<UInt16>.size)
    case SDP_UUID32:
        _ = sdp_uuid32_create(&d.pointee.val.uuid, value!.loadUnaligned(as: UInt32.self))
        d.pointee.unitSize += Int32(MemoryLayout<UInt32>.size)
    case SDP_UUID128:
        _ = sdp_uuid128_create(&d.pointee.val.uuid, value)
        d.pointee.unitSize += 16
    case SDP_URL_STR8, SDP_URL_STR16, SDP_TEXT_STR8, SDP_TEXT_STR16:
        guard let value else {
            free(d)
            return nil
        }
        d.pointee.unitSize += Int32(length)
        guard length <= UInt32(UInt16.max) else {
            // Reference behavior: logs and leaves the node valid but empty.
            break
        }
        guard let str = bt_malloc0(Int(length) + 1)?.assumingMemoryBound(to: CChar.self) else {
            free(d)
            return nil
        }
        memcpy(str, value, Int(length))
        d.pointee.val.str = str
    case SDP_URL_STR32, SDP_TEXT_STR32:
        // Reference behavior: logs "not supported" and returns as-is.
        break
    case SDP_ALT8, SDP_ALT16, SDP_ALT32, SDP_SEQ8, SDP_SEQ16, SDP_SEQ32:
        switch Int32(dtd) {
        case SDP_ALT8, SDP_SEQ8:
            d.pointee.unitSize += Int32(MemoryLayout<UInt8>.size)
        case SDP_ALT16, SDP_SEQ16:
            d.pointee.unitSize += Int32(MemoryLayout<UInt16>.size)
        case SDP_ALT32, SDP_SEQ32:
            d.pointee.unitSize += Int32(MemoryLayout<UInt32>.size)
        default:
            break
        }
        let seq = value?.assumingMemoryBound(to: sdp_data_t.self)
        d.pointee.val.dataseq = UnsafeMutablePointer(mutating: seq)
        var node = seq
        while let current = node {
            d.pointee.unitSize += current.pointee.unitSize
            node = UnsafePointer(current.pointee.next)
        }
    default:
        free(d)
        return nil
    }

    return d
}

/// `sdp_data_t *sdp_data_alloc(uint8_t dtd, const void *value)`
@c(sdp_data_alloc)
public func sdp_data_alloc(
    _ dtd: UInt8,
    _ value: UnsafeRawPointer?
) -> UnsafeMutablePointer<sdp_data_t>? {
    let length: UInt32
    switch Int32(dtd) {
    case SDP_URL_STR8, SDP_URL_STR16, SDP_TEXT_STR8, SDP_TEXT_STR16:
        guard let value else { return nil }
        length = UInt32(strlen(value.assumingMemoryBound(to: CChar.self)))
    default:
        length = 0
    }
    return sdp_data_alloc_with_length(dtd, value, length)
}

/// `sdp_data_t *sdp_seq_append(sdp_data_t *seq, sdp_data_t *d)`
@c(sdp_seq_append)
public func sdp_seq_append(
    _ seq: UnsafeMutablePointer<sdp_data_t>?,
    _ d: UnsafeMutablePointer<sdp_data_t>?
) -> UnsafeMutablePointer<sdp_data_t>? {
    var head = seq
    if let seq {
        var tail = seq
        while let next = tail.pointee.next {
            tail = next
        }
        tail.pointee.next = d
    } else {
        head = d
    }
    d?.pointee.next = nil
    return head
}

/// `sdp_data_t *sdp_seq_alloc_with_length(void **dtds, void **values, int *length, int len)`
@c(sdp_seq_alloc_with_length)
public func sdp_seq_alloc_with_length(
    _ dtds: UnsafeMutablePointer<UnsafeMutableRawPointer?>?,
    _ values: UnsafeMutablePointer<UnsafeMutableRawPointer?>?,
    _ lengths: UnsafeMutablePointer<Int32>?,
    _ count: Int32
) -> UnsafeMutablePointer<sdp_data_t>? {
    var current: UnsafeMutablePointer<sdp_data_t>? = nil
    var seq: UnsafeMutablePointer<sdp_data_t>? = nil

    for index in 0..<Int(count) {
        let dtd = dtds![index]!.load(as: UInt8.self)
        let data: UnsafeMutablePointer<sdp_data_t>?
        if dtd >= UInt8(SDP_SEQ8) && dtd <= UInt8(SDP_ALT32) {
            data = values![index]?.assumingMemoryBound(to: sdp_data_t.self)
        } else {
            data = sdp_data_alloc_with_length(dtd, values![index].map(UnsafeRawPointer.init), UInt32(lengths![index]))
        }

        guard let data else {
            sdp_data_free(seq)
            return nil
        }

        if let current {
            current.pointee.next = data
        } else {
            seq = data
        }
        current = data
    }

    return sdp_data_alloc(UInt8(SDP_SEQ8), seq.map(UnsafeRawPointer.init))
}

/// `sdp_data_t *sdp_seq_alloc(void **dtds, void **values, int len)`
@c(sdp_seq_alloc)
public func sdp_seq_alloc(
    _ dtds: UnsafeMutablePointer<UnsafeMutableRawPointer?>?,
    _ values: UnsafeMutablePointer<UnsafeMutableRawPointer?>?,
    _ count: Int32
) -> UnsafeMutablePointer<sdp_data_t>? {
    var current: UnsafeMutablePointer<sdp_data_t>? = nil
    var seq: UnsafeMutablePointer<sdp_data_t>? = nil

    for index in 0..<Int(count) {
        let dtd = dtds![index]!.load(as: UInt8.self)
        let data: UnsafeMutablePointer<sdp_data_t>?
        if dtd >= UInt8(SDP_SEQ8) && dtd <= UInt8(SDP_ALT32) {
            data = values![index]?.assumingMemoryBound(to: sdp_data_t.self)
        } else {
            data = sdp_data_alloc(dtd, values![index].map(UnsafeRawPointer.init))
        }

        guard let data else {
            sdp_data_free(seq)
            return nil
        }

        if let current {
            current.pointee.next = data
        } else {
            seq = data
        }
        current = data
    }

    return sdp_data_alloc(UInt8(SDP_SEQ8), seq.map(UnsafeRawPointer.init))
}

/// `void sdp_data_free(sdp_data_t *d)`
@c(sdp_data_free)
public func sdp_data_free(_ d: UnsafeMutablePointer<sdp_data_t>?) {
    guard let d else { return }
    switch Int32(d.pointee.dtd) {
    case SDP_SEQ8, SDP_SEQ16, SDP_SEQ32:
        var node = d.pointee.val.dataseq
        while let current = node {
            let next = current.pointee.next
            sdp_data_free(current)
            node = next
        }
    case SDP_URL_STR8, SDP_URL_STR16, SDP_URL_STR32,
         SDP_TEXT_STR8, SDP_TEXT_STR16, SDP_TEXT_STR32:
        free(d.pointee.val.str)
    default:
        break
    }
    free(d)
}

/// `sdp_data_t *sdp_data_get(const sdp_record_t *rec, uint16_t attr_id)`
@c(sdp_data_get)
public func sdp_data_get(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ attrId: UInt16
) -> UnsafeMutablePointer<sdp_data_t>? {
    guard let rec, rec.pointee.attrlist != nil else { return nil }
    var template = sdp_data_t()
    template.attrId = attrId
    return withUnsafeMutablePointer(to: &template) { templatePointer in
        let node = sdp_list_find(
            rec.pointee.attrlist,
            UnsafeMutableRawPointer(templatePointer),
            sdp_attrid_comp_func
        )
        return node?.pointee.data.map {
            $0.assumingMemoryBound(to: sdp_data_t.self)
        }
    }
}
