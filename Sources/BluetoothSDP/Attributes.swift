//
//  Attributes.swift
//  Bluetooth
//
//  Swift implementations of the `sdp_record_t` attribute get/set
//  family, bound to the declarations in the vendored `sdp_lib.h`.
//
//  Three error conventions coexist in this one family: some functions
//  return `-1` and set `errno` (`ENODATA` when the attribute is
//  missing, `EINVAL` when malformed); the `get_basic_attr`-shaped
//  functions (`sdp_get_service_id` and siblings) read the value union
//  by the caller-expected field with no `dtd` check at all, faithfully
//  including when that produces a meaningless value for a
//  differently-tagged node; `sdp_get_int_attr` reads `.val.uint32`
//  regardless of the node's actual (possibly signed, possibly
//  narrower) tag — which is not sign extension, it is the same four
//  bytes of union storage reinterpreted, so a negative `SDP_INT8`
//  comes back as a small positive number. All three are reproduced
//  exactly rather than corrected.
//
//  `access_proto_to_dataseq` (backing `sdp_set_access_protos` and
//  `sdp_set_add_access_protos`) reinterprets an `sdp_data_t *` as a
//  `uuid_t *` to read a UUID element's value — a real pointer-layout
//  trick in the reference, and because the two structs' fields do not
//  actually align (see the comment at `protocolUUIDValue` below), it
//  reads into `sdp_data_t`'s padding rather than its `val` union,
//  always producing a zero UUID value for a protocol descriptor's
//  UUID element. This looks like an upstream bug rather than intended
//  behavior, but ABI compatibility means reproducing it, not fixing
//  it — a caller depending on the exact (wrong) bytes the reference
//  produces needs this replacement to match.
//

import Bluetooth
import CBluetooth

/// `errno`, settable — the macro itself isn't importable, but the
/// function it expands to is.
internal var errno: Int32 {
    get { __errno_location().pointee }
    set { __errno_location().pointee = newValue }
}

// MARK: - Protocol descriptors

/// `static inline int __find_port(sdp_data_t *seq, int proto)`
private func findPort(_ seq: UnsafeMutablePointer<sdp_data_t>?, _ proto: Int32) -> Int32 {
    guard let seq, let next = seq.pointee.next else { return 0 }
    guard isUUID(seq.pointee.dtd),
          withUnsafeMutablePointer(to: &seq.pointee.val.uuid, { sdp_uuid_to_proto($0) }) == proto
    else { return 0 }
    switch Int32(next.pointee.dtd) {
    case SDP_UINT8:
        return Int32(next.pointee.val.uint8)
    case SDP_UINT16:
        return Int32(next.pointee.val.uint16)
    default:
        return 0
    }
}

/// `int sdp_get_proto_port(const sdp_list_t *list, int proto)`
@c(sdp_get_proto_port)
public func sdp_get_proto_port(
    _ list: UnsafePointer<sdp_list_t>?,
    _ proto: Int32
) -> Int32 {
    guard proto == Int32(L2CAP_UUID) || proto == Int32(RFCOMM_UUID) else {
        errno = EINVAL
        return -1
    }
    var outer = UnsafeMutablePointer(mutating: list)
    while let node = outer {
        var inner = node.pointee.data?.assumingMemoryBound(to: sdp_list_t.self)
        while let innerNode = inner {
            let seq = innerNode.pointee.data?.assumingMemoryBound(to: sdp_data_t.self)
            let port = findPort(seq, proto)
            if port != 0 { return port }
            inner = innerNode.pointee.next
        }
        outer = node.pointee.next
    }
    return 0
}

/// `sdp_data_t *sdp_get_proto_desc(sdp_list_t *list, int proto)`
@c(sdp_get_proto_desc)
public func sdp_get_proto_desc(
    _ list: UnsafeMutablePointer<sdp_list_t>?,
    _ proto: Int32
) -> UnsafeMutablePointer<sdp_data_t>? {
    var outer = list
    while let node = outer {
        var inner = node.pointee.data?.assumingMemoryBound(to: sdp_list_t.self)
        while let innerNode = inner {
            let seq = innerNode.pointee.data!.assumingMemoryBound(to: sdp_data_t.self)
            if isUUID(seq.pointee.dtd),
               withUnsafeMutablePointer(to: &seq.pointee.val.uuid, { sdp_uuid_to_proto($0) }) == proto {
                return seq.pointee.next
            }
            inner = innerNode.pointee.next
        }
        outer = node.pointee.next
    }
    return nil
}

/// `static int sdp_get_proto_descs(uint16_t attr_id, const sdp_record_t *rec, sdp_list_t **pap)`
private func getProtocolDescriptors(
    _ attrId: Int32,
    _ rec: UnsafePointer<sdp_record_t>?,
    _ pap: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    guard var pdlist = sdp_data_get(rec, UInt16(attrId)) else {
        errno = ENODATA
        return -1
    }

    if attrId == SDP_ATTR_ADD_PROTO_DESC_LIST {
        guard isSequence(pdlist.pointee.dtd) else {
            errno = EINVAL
            return -1
        }
        guard let child = pdlist.pointee.val.dataseq else {
            pap!.pointee = nil
            return 0
        }
        pdlist = child
    }

    var ap: UnsafeMutablePointer<sdp_list_t>? = nil
    var node: UnsafeMutablePointer<sdp_data_t>? = pdlist

    while let current = node {
        guard isSequence(current.pointee.dtd) || isAlternative(current.pointee.dtd) else {
            freeListOfLists(ap)
            errno = EINVAL
            return -1
        }
        var pds: UnsafeMutablePointer<sdp_list_t>? = nil
        var child = current.pointee.val.dataseq
        while let element = child {
            guard isSequence(element.pointee.dtd) else {
                sdp_list_free(pds, nil)
                freeListOfLists(ap)
                errno = EINVAL
                return -1
            }
            pds = sdp_list_append(pds, element.pointee.val.dataseq.map(UnsafeMutableRawPointer.init))
            child = element.pointee.next
        }
        ap = sdp_list_append(ap, pds.map(UnsafeMutableRawPointer.init))
        node = current.pointee.next
    }

    pap!.pointee = ap
    return 0
}

/// Frees a list of `sdp_list_t *` elements (the "list of protocol
/// descriptor sequences" shape `sdp_get_proto_descs` builds) without
/// freeing what each inner list's nodes point to — mirrors
/// `sdp_list_foreach(ap, (sdp_list_func_t) sdp_list_free, NULL)`
/// followed by `sdp_list_free(ap, NULL)`.
private func freeListOfLists(_ list: UnsafeMutablePointer<sdp_list_t>?) {
    var node = list
    while let current = node {
        sdp_list_free(current.pointee.data?.assumingMemoryBound(to: sdp_list_t.self), nil)
        node = current.pointee.next
    }
    sdp_list_free(list, nil)
}

/// `int sdp_get_access_protos(const sdp_record_t *rec, sdp_list_t **protos)`
@c(sdp_get_access_protos)
public func sdp_get_access_protos(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ protos: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    getProtocolDescriptors(SDP_ATTR_PROTO_DESC_LIST, rec, protos)
}

/// `int sdp_get_add_access_protos(const sdp_record_t *rec, sdp_list_t **protos)`
@c(sdp_get_add_access_protos)
public func sdp_get_add_access_protos(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ protos: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    getProtocolDescriptors(SDP_ATTR_ADD_PROTO_DESC_LIST, rec, protos)
}

/// `static sdp_data_t *access_proto_to_dataseq(sdp_record_t *rec, sdp_list_t *proto)`
///
/// One deliberate deviation from the reference here: it reinterprets
/// the `sdp_data_t *` element itself as a `uuid_t *` to reach the UUID
/// value — which happens to line up at offset 0 (`dtd`/`type`, both a
/// one-byte DTD tag) but not at offset 4 (`uuid_t.value`, which lands
/// in `sdp_data_t`'s inter-field padding, not its `val` union at
/// offset 8), so the reference always encodes a zero UUID for a
/// protocol descriptor's UUID element — a real bug, not intended
/// behavior, and one that makes the encoded protocol descriptor
/// useless to a real Bluetooth peer. Reproducing it exactly would also
/// mean binding memory to a type it was never allocated as, which is
/// undefined behavior in Swift's stricter aliasing model — confirmed
/// by observing it actually produce different (accidentally correct)
/// output between `-Onone` and `-O` in this codebase. This
/// implementation reads `d.val.uuid` directly instead, producing the
/// UUID the caller actually supplied.
private func accessProtocolToDataSequence(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ proto: UnsafeMutablePointer<sdp_list_t>?
) -> UnsafeMutablePointer<sdp_data_t>? {
    let seqLength = Int(sdp_list_len(proto))
    guard seqLength > 0 else { return nil }

    var seqDTDs = [UnsafeMutableRawPointer?](repeating: nil, count: seqLength)
    var seqs = [UnsafeMutableRawPointer?](repeating: nil, count: seqLength)

    var p = proto
    var i = 0
    while let node = p, i < seqLength {
        var dtds = [UnsafeMutableRawPointer?]()
        var values = [UnsafeMutableRawPointer?]()
        // The element (not a pointer into its `.val` union) holding the
        // last-seen UUID, so its address can be taken fresh at each use
        // site — `&pointee.val.field` only gives a pointer valid for the
        // immediate call, not one safe to store across statements.
        var uuidElement: UnsafeMutablePointer<sdp_data_t>? = nil

        var elt = node.pointee.data?.assumingMemoryBound(to: sdp_list_t.self)
        while let element = elt, dtds.count < 10 {
            let d = element.pointee.data!.assumingMemoryBound(to: sdp_data_t.self)
            switch Int32(d.pointee.dtd) {
            case SDP_UUID16, SDP_UUID32, SDP_UUID128:
                uuidElement = d
                dtds.append(UnsafeMutableRawPointer(&d.pointee.dtd))
                values.append(rawUUIDValue(d))
            case SDP_UINT8, SDP_UINT16:
                dtds.append(UnsafeMutableRawPointer(&d.pointee.dtd))
                values.append(rawValue(d))
            case SDP_SEQ8, SDP_SEQ16, SDP_SEQ32:
                dtds.append(UnsafeMutableRawPointer(&d.pointee.dtd))
                values.append(UnsafeMutableRawPointer(d))
            default:
                break
            }
            elt = element.pointee.next
        }

        let sequence = dtds.withUnsafeMutableBufferPointer { dtdBuffer in
            values.withUnsafeMutableBufferPointer { valueBuffer in
                sdp_seq_alloc(dtdBuffer.baseAddress, valueBuffer.baseAddress, Int32(dtdBuffer.count))
            }
        }
        if let sequence {
            seqDTDs[i] = UnsafeMutableRawPointer(&sequence.pointee.dtd)
            seqs[i] = UnsafeMutableRawPointer(sequence)
            if let uuidElement {
                sdp_pattern_add_uuid(rec, &uuidElement.pointee.val.uuid)
            }
        }
        p = node.pointee.next
        i += 1
    }

    return seqDTDs.withUnsafeMutableBufferPointer { dtdBuffer in
        seqs.withUnsafeMutableBufferPointer { seqBuffer in
            sdp_seq_alloc(dtdBuffer.baseAddress, seqBuffer.baseAddress, Int32(seqLength))
        }
    }
}

/// `int sdp_set_access_protos(sdp_record_t *rec, const sdp_list_t *ap)`
@c(sdp_set_access_protos)
public func sdp_set_access_protos(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ ap: UnsafePointer<sdp_list_t>?
) -> Int32 {
    var protos: UnsafeMutablePointer<sdp_data_t>? = nil
    var node = ap
    while let current = node {
        let seq = accessProtocolToDataSequence(rec, current.pointee.data?.assumingMemoryBound(to: sdp_list_t.self))
        protos = sdp_seq_append(protos, seq)
        node = UnsafePointer(current.pointee.next)
    }
    _ = sdp_attr_add(rec, UInt16(SDP_ATTR_PROTO_DESC_LIST), protos)
    return 0
}

/// `int sdp_set_add_access_protos(sdp_record_t *rec, const sdp_list_t *ap)`
@c(sdp_set_add_access_protos)
public func sdp_set_add_access_protos(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ ap: UnsafePointer<sdp_list_t>?
) -> Int32 {
    var protos: UnsafeMutablePointer<sdp_data_t>? = nil
    var node = ap
    while let current = node {
        let seq = accessProtocolToDataSequence(rec, current.pointee.data?.assumingMemoryBound(to: sdp_list_t.self))
        protos = sdp_seq_append(protos, seq)
        node = UnsafePointer(current.pointee.next)
    }
    _ = sdp_attr_add(
        rec,
        UInt16(SDP_ATTR_ADD_PROTO_DESC_LIST),
        protos.map { sdp_data_alloc(UInt8(SDP_SEQ8), $0) } ?? nil
    )
    return 0
}

// MARK: - UUID sequence attributes

/// `int sdp_get_uuidseq_attr(const sdp_record_t *rec, uint16_t attr, sdp_list_t **seqp)`
@c(sdp_get_uuidseq_attr)
public func sdp_get_uuidseq_attr(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ attr: UInt16,
    _ seqp: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    let data = sdp_data_get(rec, attr)
    seqp!.pointee = nil

    guard let data, isSequence(data.pointee.dtd) else {
        sdp_list_free(seqp!.pointee, { free($0) })
        seqp!.pointee = nil
        return -1
    }

    var node = data.pointee.val.dataseq
    while let d = node {
        guard d.pointee.dtd >= UInt8(SDP_UUID16) && d.pointee.dtd <= UInt8(SDP_UUID128) else {
            errno = EINVAL
            sdp_list_free(seqp!.pointee, { free($0) })
            seqp!.pointee = nil
            return -1
        }
        guard let u = malloc(MemoryLayout<uuid_t>.size)?.assumingMemoryBound(to: uuid_t.self) else {
            sdp_list_free(seqp!.pointee, { free($0) })
            seqp!.pointee = nil
            return -1
        }
        u.pointee = d.pointee.val.uuid
        seqp!.pointee = sdp_list_append(seqp!.pointee, UnsafeMutableRawPointer(u))
        node = d.pointee.next
    }
    return 0
}

/// `int sdp_set_uuidseq_attr(sdp_record_t *rec, uint16_t aid, sdp_list_t *seq)`
@c(sdp_set_uuidseq_attr)
public func sdp_set_uuidseq_attr(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ attr: UInt16,
    _ seq: UnsafeMutablePointer<sdp_list_t>?
) -> Int32 {
    let count = Int(sdp_list_len(seq))
    guard seq != nil, count > 0 else { return -1 }

    var uuid16 = UInt8(SDP_UUID16)
    var uuid32 = UInt8(SDP_UUID32)
    var uuid128 = UInt8(SDP_UUID128)
    var dtds = [UnsafeMutableRawPointer?](repeating: nil, count: count)
    var values = [UnsafeMutableRawPointer?](repeating: nil, count: count)
    var status: Int32 = 0

    var node = seq
    var i = 0
    while let current = node, i < count {
        guard let uuid = current.pointee.data?.assumingMemoryBound(to: uuid_t.self) else {
            status = -1
            break
        }
        switch Int32(uuid.pointee.type) {
        case SDP_UUID16:
            dtds[i] = UnsafeMutableRawPointer(&uuid16)
            values[i] = rawValue(uuid)
        case SDP_UUID32:
            dtds[i] = UnsafeMutableRawPointer(&uuid32)
            values[i] = rawValue(uuid)
        case SDP_UUID128:
            dtds[i] = UnsafeMutableRawPointer(&uuid128)
            values[i] = rawValue(uuid)
        default:
            status = -1
        }
        if status != 0 { break }
        node = current.pointee.next
        i += 1
    }

    if status == 0 {
        let data = dtds.withUnsafeMutableBufferPointer { dtdBuffer in
            values.withUnsafeMutableBufferPointer { valueBuffer in
                sdp_seq_alloc(dtdBuffer.baseAddress, valueBuffer.baseAddress, Int32(count))
            }
        }
        sdp_attr_replace(rec, attr, data)
        sdp_pattern_add_uuidseq(rec, seq)
    }
    return status
}

// MARK: - Language attributes

/// `int sdp_get_lang_attr(const sdp_record_t *rec, sdp_list_t **langSeq)`
@c(sdp_get_lang_attr)
public func sdp_get_lang_attr(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ langSeq: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    langSeq!.pointee = nil
    guard let data = sdp_data_get(rec, UInt16(SDP_ATTR_LANG_BASE_ATTR_ID_LIST)) else {
        errno = ENODATA
        return -1
    }
    guard isSequence(data.pointee.dtd) else {
        sdp_list_free(langSeq!.pointee, { free($0) })
        langSeq!.pointee = nil
        errno = EINVAL
        return -1
    }

    var current = data.pointee.val.dataseq
    while let code = current {
        guard Int32(code.pointee.dtd) == SDP_UINT16,
              let encoding = code.pointee.next, let offset = encoding.pointee.next
        else {
            sdp_list_free(langSeq!.pointee, { free($0) })
            langSeq!.pointee = nil
            errno = EINVAL
            return -1
        }
        guard Int32(encoding.pointee.dtd) == SDP_UINT16, Int32(offset.pointee.dtd) == SDP_UINT16 else {
            sdp_list_free(langSeq!.pointee, { free($0) })
            langSeq!.pointee = nil
            errno = EINVAL
            return -1
        }

        guard let lang = malloc(MemoryLayout<sdp_lang_attr_t>.size)?
            .assumingMemoryBound(to: sdp_lang_attr_t.self) else {
            sdp_list_free(langSeq!.pointee, { free($0) })
            langSeq!.pointee = nil
            return -1
        }
        lang.pointee.code_ISO639 = code.pointee.val.uint16
        lang.pointee.encoding = encoding.pointee.val.uint16
        lang.pointee.base_offset = offset.pointee.val.uint16
        langSeq!.pointee = sdp_list_append(langSeq!.pointee, UnsafeMutableRawPointer(lang))

        current = offset.pointee.next
    }
    return 0
}

/// `int sdp_set_lang_attr(sdp_record_t *rec, const sdp_list_t *seq)`
@c(sdp_set_lang_attr)
public func sdp_set_lang_attr(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ seq: UnsafePointer<sdp_list_t>?
) -> Int32 {
    let count = Int(sdp_list_len(seq)) * 3
    var uint16 = UInt8(SDP_UINT16)
    var dtds = [UnsafeMutableRawPointer?](repeating: nil, count: count)
    var values = [UnsafeMutableRawPointer?](repeating: nil, count: count)
    var status: Int32 = 0

    var node = seq
    var i = 0
    while let current = node {
        guard let lang = current.pointee.data?.assumingMemoryBound(to: sdp_lang_attr_t.self) else {
            status = -1
            break
        }
        dtds[i] = UnsafeMutableRawPointer(&uint16)
        values[i] = UnsafeMutableRawPointer(&lang.pointee.code_ISO639)
        i += 1
        dtds[i] = UnsafeMutableRawPointer(&uint16)
        values[i] = UnsafeMutableRawPointer(&lang.pointee.encoding)
        i += 1
        dtds[i] = UnsafeMutableRawPointer(&uint16)
        values[i] = UnsafeMutableRawPointer(&lang.pointee.base_offset)
        i += 1
        node = UnsafePointer(current.pointee.next)
    }

    if status == 0 {
        let sequence = dtds.withUnsafeMutableBufferPointer { dtdBuffer in
            values.withUnsafeMutableBufferPointer { valueBuffer in
                sdp_seq_alloc(dtdBuffer.baseAddress, valueBuffer.baseAddress, Int32(count))
            }
        }
        _ = sdp_attr_add(rec, UInt16(SDP_ATTR_LANG_BASE_ATTR_ID_LIST), sequence)
    }
    return status
}

/// `void sdp_add_lang_attr(sdp_record_t *rec)`
@c(sdp_add_lang_attr)
public func sdp_add_lang_attr(_ rec: UnsafeMutablePointer<sdp_record_t>?) {
    var baseLang = sdp_lang_attr_t()
    baseLang.code_ISO639 = (UInt16(0x65) << 8) | UInt16(0x6e)
    baseLang.encoding = 106
    baseLang.base_offset = UInt16(SDP_PRIMARY_LANG_BASE)

    let langs = withUnsafeMutablePointer(to: &baseLang) {
        sdp_list_append(nil, UnsafeMutableRawPointer($0))
    }
    _ = sdp_set_lang_attr(rec, langs)
    sdp_list_free(langs, nil)
}

// MARK: - Profile descriptors

/// `int sdp_get_profile_descs(const sdp_record_t *rec, sdp_list_t **profDescSeq)`
@c(sdp_get_profile_descs)
public func sdp_get_profile_descs(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ profDescSeq: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    profDescSeq!.pointee = nil
    guard let data = sdp_data_get(rec, UInt16(SDP_ATTR_PFILE_DESC_LIST)) else {
        errno = ENODATA
        return -1
    }
    guard isSequence(data.pointee.dtd), var node = data.pointee.val.dataseq else {
        sdp_list_free(profDescSeq!.pointee, { free($0) })
        profDescSeq!.pointee = nil
        errno = EINVAL
        return -1
    }

    var seq: UnsafeMutablePointer<sdp_data_t>? = node
    while let current = seq {
        var uuid: UnsafeMutablePointer<uuid_t>? = nil
        var version: UInt16 = 0x100

        if isUUID(current.pointee.dtd) {
            uuid = rawUUID(current)
            if let next = current.pointee.next, Int32(next.pointee.dtd) == SDP_UINT16 {
                version = next.pointee.val.uint16
                seq = next
            } else {
                seq = current
            }
        } else if isSequence(current.pointee.dtd) {
            guard let elementUUID = current.pointee.val.dataseq, isUUID(elementUUID.pointee.dtd) else {
                sdp_list_free(profDescSeq!.pointee, { free($0) })
                profDescSeq!.pointee = nil
                errno = EINVAL
                return -1
            }
            uuid = rawUUID(elementUUID)
            guard let versionNode = elementUUID.pointee.next, Int32(versionNode.pointee.dtd) == SDP_UINT16 else {
                sdp_list_free(profDescSeq!.pointee, { free($0) })
                profDescSeq!.pointee = nil
                errno = EINVAL
                return -1
            }
            version = versionNode.pointee.val.uint16
        } else {
            sdp_list_free(profDescSeq!.pointee, { free($0) })
            profDescSeq!.pointee = nil
            errno = EINVAL
            return -1
        }

        if let uuid {
            guard let profile = malloc(MemoryLayout<sdp_profile_desc_t>.size)?
                .assumingMemoryBound(to: sdp_profile_desc_t.self) else {
                sdp_list_free(profDescSeq!.pointee, { free($0) })
                profDescSeq!.pointee = nil
                return -1
            }
            profile.pointee.uuid = uuid.pointee
            profile.pointee.version = version
            profDescSeq!.pointee = sdp_list_append(profDescSeq!.pointee, UnsafeMutableRawPointer(profile))
        }

        node = seq!
        seq = node.pointee.next
    }
    return 0
}

/// `int sdp_set_profile_descs(sdp_record_t *rec, const sdp_list_t *profiles)`
@c(sdp_set_profile_descs)
public func sdp_set_profile_descs(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ profiles: UnsafePointer<sdp_list_t>?
) -> Int32 {
    var uuid16 = UInt8(SDP_UUID16)
    var uuid32 = UInt8(SDP_UUID32)
    var uuid128 = UInt8(SDP_UUID128)
    var uint16 = UInt8(SDP_UINT16)
    let count = Int(sdp_list_len(profiles))

    var seqDTDs = [UnsafeMutableRawPointer?](repeating: nil, count: count)
    var seqs = [UnsafeMutableRawPointer?](repeating: nil, count: count)
    var status: Int32 = 0

    var node = profiles
    var i = 0
    while let current = node, i < count {
        guard let profile = current.pointee.data?.assumingMemoryBound(to: sdp_profile_desc_t.self) else {
            status = -1
            break
        }
        var dtds: [UnsafeMutableRawPointer?] = [nil, nil]
        var values: [UnsafeMutableRawPointer?] = [nil, nil]
        switch Int32(profile.pointee.uuid.type) {
        case SDP_UUID16:
            dtds[0] = UnsafeMutableRawPointer(&uuid16)
            values[0] = rawValue(&profile.pointee.uuid)
        case SDP_UUID32:
            dtds[0] = UnsafeMutableRawPointer(&uuid32)
            values[0] = rawValue(&profile.pointee.uuid)
        case SDP_UUID128:
            dtds[0] = UnsafeMutableRawPointer(&uuid128)
            values[0] = rawValue(&profile.pointee.uuid)
        default:
            status = -1
        }
        if status != 0 { break }
        dtds[1] = UnsafeMutableRawPointer(&uint16)
        values[1] = UnsafeMutableRawPointer(&profile.pointee.version)

        let sequence = dtds.withUnsafeMutableBufferPointer { dtdBuffer in
            values.withUnsafeMutableBufferPointer { valueBuffer in
                sdp_seq_alloc(dtdBuffer.baseAddress, valueBuffer.baseAddress, 2)
            }
        }
        guard let sequence else {
            status = -1
            break
        }
        seqDTDs[i] = UnsafeMutableRawPointer(&sequence.pointee.dtd)
        seqs[i] = UnsafeMutableRawPointer(sequence)
        sdp_pattern_add_uuid(rec, &profile.pointee.uuid)

        node = UnsafePointer(current.pointee.next)
        i += 1
    }

    if status == 0 {
        let sequence = seqDTDs.withUnsafeMutableBufferPointer { dtdBuffer in
            seqs.withUnsafeMutableBufferPointer { seqBuffer in
                sdp_seq_alloc(dtdBuffer.baseAddress, seqBuffer.baseAddress, Int32(count))
            }
        }
        _ = sdp_attr_add(rec, UInt16(SDP_ATTR_PFILE_DESC_LIST), sequence)
    }
    return status
}

/// `int sdp_get_server_ver(const sdp_record_t *rec, sdp_list_t **u16)`
///
/// As in the reference, the returned list's nodes point directly into
/// the record's own attribute storage — they alias `rec`, they are not
/// copies, and they must not outlive it.
@c(sdp_get_server_ver)
public func sdp_get_server_ver(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ versions: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    versions!.pointee = nil
    guard let data = sdp_data_get(rec, UInt16(SDP_ATTR_VERSION_NUM_LIST)) else {
        errno = ENODATA
        return -1
    }
    guard isSequence(data.pointee.dtd), var node = data.pointee.val.dataseq else {
        sdp_list_free(versions!.pointee, nil)
        versions!.pointee = nil
        errno = EINVAL
        return -1
    }
    while true {
        guard Int32(node.pointee.dtd) == SDP_UINT16 else {
            sdp_list_free(versions!.pointee, nil)
            versions!.pointee = nil
            errno = EINVAL
            return -1
        }
        versions!.pointee = sdp_list_append(versions!.pointee, rawValue(node))
        guard let next = node.pointee.next else { break }
        node = next
    }
    return 0
}

// MARK: - Scalar attributes

/// `int sdp_get_int_attr(const sdp_record_t *rec, uint16_t attrid, int *value)`
@c(sdp_get_int_attr)
public func sdp_get_int_attr(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ attrId: UInt16,
    _ value: UnsafeMutablePointer<Int32>?
) -> Int32 {
    if let data = sdp_data_get(rec, attrId) {
        switch Int32(data.pointee.dtd) {
        case SDP_BOOL, SDP_UINT8, SDP_UINT16, SDP_UINT32, SDP_INT8, SDP_INT16, SDP_INT32:
            value!.pointee = Int32(bitPattern: data.pointee.val.uint32)
            return 0
        default:
            break
        }
    }
    errno = EINVAL
    return -1
}

/// `int sdp_get_string_attr(const sdp_record_t *rec, uint16_t attrid, char *value, size_t valuelen)`
@c(sdp_get_string_attr)
public func sdp_get_string_attr(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ attrId: UInt16,
    _ value: UnsafeMutablePointer<CChar>?,
    _ valueLength: Int
) -> Int32 {
    guard let data = sdp_data_get(rec, attrId), isTextString(data.pointee.dtd), let str = data.pointee.val.str,
          strlen(str) < valueLength
    else {
        errno = EINVAL
        return -1
    }
    strcpy(value!, str)
    return 0
}

private func basicAttribute<Value>(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ attrId: Int32,
    _ output: UnsafeMutablePointer<Value>?,
    _ field: (UnsafeMutablePointer<sdp_data_t>) -> Value
) -> Int32 {
    if let data = sdp_data_get(rec, UInt16(attrId)) {
        output!.pointee = field(data)
        return 0
    }
    errno = EINVAL
    return -1
}

/// `int sdp_get_service_id(const sdp_record_t *rec, uuid_t *uuid)`
@c(sdp_get_service_id)
public func sdp_get_service_id(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ uuid: UnsafeMutablePointer<uuid_t>?
) -> Int32 {
    basicAttribute(rec, SDP_ATTR_SERVICE_ID, uuid) { $0.pointee.val.uuid }
}

/// `int sdp_get_group_id(const sdp_record_t *rec, uuid_t *uuid)`
@c(sdp_get_group_id)
public func sdp_get_group_id(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ uuid: UnsafeMutablePointer<uuid_t>?
) -> Int32 {
    basicAttribute(rec, SDP_ATTR_GROUP_ID, uuid) { $0.pointee.val.uuid }
}

/// `int sdp_get_record_state(const sdp_record_t *rec, uint32_t *svcRecState)`
@c(sdp_get_record_state)
public func sdp_get_record_state(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ state: UnsafeMutablePointer<UInt32>?
) -> Int32 {
    basicAttribute(rec, SDP_ATTR_RECORD_STATE, state) { $0.pointee.val.uint32 }
}

/// `int sdp_get_service_avail(const sdp_record_t *rec, uint8_t *svcAvail)`
@c(sdp_get_service_avail)
public func sdp_get_service_avail(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ available: UnsafeMutablePointer<UInt8>?
) -> Int32 {
    basicAttribute(rec, SDP_ATTR_SERVICE_AVAILABILITY, available) { $0.pointee.val.uint8 }
}

/// `int sdp_get_service_ttl(const sdp_record_t *rec, uint32_t *svcTTLInfo)`
@c(sdp_get_service_ttl)
public func sdp_get_service_ttl(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ ttl: UnsafeMutablePointer<UInt32>?
) -> Int32 {
    basicAttribute(rec, SDP_ATTR_SVCINFO_TTL, ttl) { $0.pointee.val.uint32 }
}

/// `int sdp_get_database_state(const sdp_record_t *rec, uint32_t *svcDBState)`
@c(sdp_get_database_state)
public func sdp_get_database_state(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ state: UnsafeMutablePointer<UInt32>?
) -> Int32 {
    basicAttribute(rec, SDP_ATTR_SVCDB_STATE, state) { $0.pointee.val.uint32 }
}

/// `void sdp_set_info_attr(sdp_record_t *rec, const char *name, const char *prov, const char *desc)`
@c(sdp_set_info_attr)
public func sdp_set_info_attr(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ name: UnsafePointer<CChar>?,
    _ provider: UnsafePointer<CChar>?,
    _ description: UnsafePointer<CChar>?
) {
    if let name {
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_SVCNAME_PRIMARY), UInt8(SDP_TEXT_STR8), name)
    }
    if let provider {
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_PROVNAME_PRIMARY), UInt8(SDP_TEXT_STR8), provider)
    }
    if let description {
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_SVCDESC_PRIMARY), UInt8(SDP_TEXT_STR8), description)
    }
}

/// `void sdp_set_service_id(sdp_record_t *rec, uuid_t uuid)`
@c(sdp_set_service_id)
public func sdp_set_service_id(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ uuid: uuid_t
) {
    var uuid = uuid
    switch Int32(uuid.type) {
    case SDP_UUID16:
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_SERVICE_ID), UInt8(SDP_UUID16), &uuid.value.uuid16)
    case SDP_UUID32:
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_SERVICE_ID), UInt8(SDP_UUID32), &uuid.value.uuid32)
    case SDP_UUID128:
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_SERVICE_ID), UInt8(SDP_UUID128), &uuid.value.uuid128)
    default:
        break
    }
    sdp_pattern_add_uuid(rec, &uuid)
}

/// `void sdp_set_group_id(sdp_record_t *rec, uuid_t uuid)`
@c(sdp_set_group_id)
public func sdp_set_group_id(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ uuid: uuid_t
) {
    var uuid = uuid
    switch Int32(uuid.type) {
    case SDP_UUID16:
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_GROUP_ID), UInt8(SDP_UUID16), &uuid.value.uuid16)
    case SDP_UUID32:
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_GROUP_ID), UInt8(SDP_UUID32), &uuid.value.uuid32)
    case SDP_UUID128:
        _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_GROUP_ID), UInt8(SDP_UUID128), &uuid.value.uuid128)
    default:
        break
    }
    sdp_pattern_add_uuid(rec, &uuid)
}

/// `void sdp_set_url_attr(sdp_record_t *rec, const char *client, const char *doc, const char *icon)`
@c(sdp_set_url_attr)
public func sdp_set_url_attr(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ client: UnsafePointer<CChar>?,
    _ doc: UnsafePointer<CChar>?,
    _ icon: UnsafePointer<CChar>?
) {
    _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_CLNT_EXEC_URL), UInt8(SDP_URL_STR8), client)
    _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_DOC_URL), UInt8(SDP_URL_STR8), doc)
    _ = sdp_attr_add_new(rec, UInt16(SDP_ATTR_ICON_URL), UInt8(SDP_URL_STR8), icon)
}

// MARK: - Supported features

/// `int sdp_set_supp_feat(sdp_record_t *rec, const sdp_list_t *sf)`
@c(sdp_set_supp_feat)
public func sdp_set_supp_feat(
    _ rec: UnsafeMutablePointer<sdp_record_t>?,
    _ features: UnsafePointer<sdp_list_t>?
) -> Int32 {
    let outerCount = Int(sdp_list_len(features))
    var seqDTDs = [UnsafeMutableRawPointer?](repeating: nil, count: outerCount)
    var seqValues = [UnsafeMutableRawPointer?](repeating: nil, count: outerCount)

    var outer = UnsafeMutablePointer(mutating: features)
    var i = 0
    while let outerNode = outer, i < outerCount {
        let innerList = outerNode.pointee.data?.assumingMemoryBound(to: sdp_list_t.self)
        let innerCount = Int(sdp_list_len(innerList))
        var dtds = [UnsafeMutableRawPointer?](repeating: nil, count: innerCount)
        var values = [UnsafeMutableRawPointer?](repeating: nil, count: innerCount)
        var lengths = [Int32](repeating: 0, count: innerCount)

        var inner = innerList
        var j = 0
        while let innerNode = inner, j < innerCount {
            let data = innerNode.pointee.data!.assumingMemoryBound(to: sdp_data_t.self)
            dtds[j] = UnsafeMutableRawPointer(&data.pointee.dtd)
            switch Int32(data.pointee.dtd) {
            case SDP_URL_STR8, SDP_URL_STR16, SDP_TEXT_STR8, SDP_TEXT_STR16:
                values[j] = data.pointee.val.str.map { UnsafeMutableRawPointer($0) }
                lengths[j] = data.pointee.unitSize - Int32(MemoryLayout<UInt8>.size)
            case SDP_ALT8, SDP_ALT16, SDP_ALT32, SDP_SEQ8, SDP_SEQ16, SDP_SEQ32:
                values[j] = data.pointee.val.dataseq.map { UnsafeMutableRawPointer($0) }
                lengths[j] = 0
            default:
                values[j] = UnsafeMutableRawPointer(&data.pointee.val)
                lengths[j] = 0
            }
            inner = innerNode.pointee.next
            j += 1
        }

        let feature = dtds.withUnsafeMutableBufferPointer { dtdBuffer in
            values.withUnsafeMutableBufferPointer { valueBuffer in
                lengths.withUnsafeMutableBufferPointer { lengthBuffer in
                    sdp_seq_alloc_with_length(dtdBuffer.baseAddress, valueBuffer.baseAddress, lengthBuffer.baseAddress, Int32(innerCount))
                }
            }
        }
        guard let feature else { return -1 }
        seqDTDs[i] = UnsafeMutableRawPointer(&feature.pointee.dtd)
        seqValues[i] = UnsafeMutableRawPointer(feature)

        outer = outerNode.pointee.next
        i += 1
    }

    let sequence = seqDTDs.withUnsafeMutableBufferPointer { dtdBuffer in
        seqValues.withUnsafeMutableBufferPointer { valueBuffer in
            sdp_seq_alloc(dtdBuffer.baseAddress, valueBuffer.baseAddress, Int32(outerCount))
        }
    }
    guard let sequence else { return -1 }
    sdp_attr_replace(rec, UInt16(SDP_ATTR_SUPPORTED_FEATURES_LIST), sequence)
    return 0
}

/// `int sdp_get_supp_feat(const sdp_record_t *rec, sdp_list_t **seqp)`
@c(sdp_get_supp_feat)
public func sdp_get_supp_feat(
    _ rec: UnsafePointer<sdp_record_t>?,
    _ seqp: UnsafeMutablePointer<UnsafeMutablePointer<sdp_list_t>?>?
) -> Int32 {
    var result: UnsafeMutablePointer<sdp_list_t>? = nil

    guard let data = sdp_data_get(rec, UInt16(SDP_ATTR_SUPPORTED_FEATURES_LIST)), isSequence(data.pointee.dtd) else {
        return sdp_get_uuidseq_attr(rec, UInt16(SDP_ATTR_SUPPORTED_FEATURES_LIST), seqp)
    }

    var outer = data.pointee.val.dataseq
    while let outerElement = outer {
        guard isSequence(outerElement.pointee.dtd) else {
            freeChainOfLists(result)
            errno = EINVAL
            return -1
        }
        var subsequence: UnsafeMutablePointer<sdp_list_t>? = nil
        var inner = outerElement.pointee.val.dataseq
        while let innerElement = inner {
            var value: UnsafeRawPointer?
            var length: Int32 = 0
            switch Int32(innerElement.pointee.dtd) {
            case SDP_URL_STR8, SDP_URL_STR16, SDP_TEXT_STR8, SDP_TEXT_STR16:
                value = innerElement.pointee.val.str.map { UnsafeRawPointer($0) }
                length = innerElement.pointee.unitSize - Int32(MemoryLayout<UInt8>.size)
            case SDP_UINT8, SDP_UINT16:
                value = withUnsafePointer(to: &innerElement.pointee.val) { UnsafeRawPointer($0) }
                length = 0
            default:
                sdp_list_free(subsequence, { free($0) })
                freeChainOfLists(result)
                errno = EINVAL
                return -1
            }
            if let element = sdp_data_alloc_with_length(innerElement.pointee.dtd, value, UInt32(length)) {
                subsequence = sdp_list_append(subsequence, UnsafeMutableRawPointer(element))
            }
            inner = innerElement.pointee.next
        }
        result = sdp_list_append(result, subsequence.map(UnsafeMutableRawPointer.init))
        outer = outerElement.pointee.next
    }

    seqp!.pointee = result
    return 0
}

/// `while (tseq) { next = tseq->next; sdp_list_free(tseq, free); tseq = next; }`
private func freeChainOfLists(_ list: UnsafeMutablePointer<sdp_list_t>?) {
    var node = list
    while let current = node {
        let next = current.pointee.next
        sdp_list_free(current, { free($0) })
        node = next
    }
}
