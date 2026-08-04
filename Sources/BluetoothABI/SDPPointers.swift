//
//  SDPPointers.swift
//  Bluetooth
//
//  Stable raw-pointer helpers for `sdp_data_t.val` and `uuid_t.value`.
//
//  `&expr.pointee.val.uint8`-style expressions — taking the address of
//  a *specific* union member reached through a pointer's `.pointee` —
//  are only guaranteed valid for the duration of the call they are a
//  direct argument to (Swift's `-Wtemporary-pointer` warning; the
//  ClangImporter exposes individual union members as computed
//  properties, and address-of on those can materialize a temporary).
//  Passing such an expression straight into `sdp_uuid16_create(...)`
//  is fine — Swift's inout call convention handles the writeback
//  correctly. Extracting the address as a *value* to store in an array
//  for a later, separate call — the `dtds`/`values` arrays throughout
//  this module — is not: confirmed by observation, not just the
//  warning, since a differential-conformance run surfaced exactly this
//  as heap-layout-dependent corruption of encoded UUID values.
//
//  The whole union (`&expr.pointee.val`, no further member access) is
//  a genuinely stable address — proven the same way — because every
//  member of a C union starts at the union's own address. These
//  helpers give that stable address, computing the extra offset for
//  `uuid_t`'s own nested `.value` union by hand where needed.
//

import Bluetooth
import CBluetooth

/// A stable pointer to `d`'s value bytes, valid regardless of which
/// tagged member is populated.
internal func rawValue(_ d: UnsafeMutablePointer<sdp_data_t>) -> UnsafeMutableRawPointer {
    UnsafeMutableRawPointer(&d.pointee.val)
}

/// A stable pointer to the raw UUID bytes within `d.val.uuid.value`
/// (2, 4, or 16 bytes, depending on the DTD) — the doubly-nested case.
internal func rawUUIDValue(_ d: UnsafeMutablePointer<sdp_data_t>) -> UnsafeMutableRawPointer {
    rawValue(d).advanced(by: MemoryLayout<uuid_t>.offset(of: \.value)!)
}

/// A stable `uuid_t` pointer into `d.val.uuid`, for call sites that
/// need the whole `uuid_t` (not just its value bytes) to outlive the
/// statement that captures it.
internal func rawUUID(_ d: UnsafeMutablePointer<sdp_data_t>) -> UnsafeMutablePointer<uuid_t> {
    rawValue(d).assumingMemoryBound(to: uuid_t.self)
}

/// A stable pointer to `uuid`'s raw value bytes.
internal func rawValue(_ uuid: UnsafeMutablePointer<uuid_t>) -> UnsafeMutableRawPointer {
    UnsafeMutableRawPointer(&uuid.pointee.value)
}
