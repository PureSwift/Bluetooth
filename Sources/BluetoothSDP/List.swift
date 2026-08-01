//
//  List.swift
//  Bluetooth
//
//  Swift implementations of the `sdp_list_t` singly-linked list, bound
//  to the declarations in the vendored `sdp_lib.h`.
//
//  `sdp_list_t` is a transparent struct — `{ next, data }` — and every
//  consumer walks it directly (`for (p = list; p; p = p->next)`), so
//  unlike an opaque handle, its layout is itself the ABI contract.
//  These functions operate on the imported C type directly, the same
//  pattern used for `bdaddr_t` and `bt_uuid_t` in the address and UUID
//  ABI. Nodes are allocated with plain `malloc`/`free`, matching the
//  reference exactly (as opposed to `bt_malloc`/`bt_free`, used
//  elsewhere in this library); today the two pairs are equivalent thin
//  wrappers over the system allocator, but the reference's choice is
//  reproduced rather than assumed.
//
//  `sdp_list_len`, `sdp_list_find` and `sdp_list_foreach` are
//  `static inline` in the header and therefore never exported — no `@c`
//  binding exists for them — but the same logic is needed internally by
//  the record and attribute functions, so private Swift equivalents are
//  defined here for that use.
//

import Bluetooth
import CBluetooth

/// `sdp_list_t *sdp_list_append(sdp_list_t *list, void *d)`
@c(sdp_list_append)
public func sdp_list_append(
    _ list: UnsafeMutablePointer<sdp_list_t>?,
    _ data: UnsafeMutableRawPointer?
) -> UnsafeMutablePointer<sdp_list_t>? {
    guard let node = malloc(MemoryLayout<sdp_list_t>.size)?
        .assumingMemoryBound(to: sdp_list_t.self) else {
        return nil
    }
    node.pointee.data = data
    node.pointee.next = nil

    guard let list else { return node }
    var tail = list
    while let next = tail.pointee.next {
        tail = next
    }
    tail.pointee.next = node
    return list
}

/// `sdp_list_t *sdp_list_remove(sdp_list_t *list, void *d)`
///
/// Removes the first node whose `data` pointer equals `d` (pointer
/// identity, not content equality), matching the reference.
@c(sdp_list_remove)
public func sdp_list_remove(
    _ list: UnsafeMutablePointer<sdp_list_t>?,
    _ data: UnsafeMutableRawPointer?
) -> UnsafeMutablePointer<sdp_list_t>? {
    var previous: UnsafeMutablePointer<sdp_list_t>? = nil
    var node = list
    var head = list
    while let current = node {
        if current.pointee.data == data {
            if let previous {
                previous.pointee.next = current.pointee.next
            } else {
                head = current.pointee.next
            }
            free(current)
            break
        }
        previous = current
        node = current.pointee.next
    }
    return head
}

/// `sdp_list_t *sdp_list_insert_sorted(sdp_list_t *list, void *data, sdp_comp_func_t f)`
///
/// Inserts before the first node for which `f(existing, data) >= 0`,
/// so the list stays non-decreasing under `f` (equal keys land after
/// existing equal entries — this is not a stable sort in general, but
/// matches the singly-linked insertion the reference performs).
@c(sdp_list_insert_sorted)
public func sdp_list_insert_sorted(
    _ list: UnsafeMutablePointer<sdp_list_t>?,
    _ data: UnsafeMutableRawPointer?,
    _ compare: sdp_comp_func_t?
) -> UnsafeMutablePointer<sdp_list_t>? {
    guard let node = malloc(MemoryLayout<sdp_list_t>.size)?
        .assumingMemoryBound(to: sdp_list_t.self) else {
        return nil
    }
    node.pointee.data = data

    var previous: UnsafeMutablePointer<sdp_list_t>? = nil
    var current = list
    var head = list
    while let candidate = current {
        if let compare, compare(candidate.pointee.data, data) >= 0 {
            break
        }
        previous = candidate
        current = candidate.pointee.next
    }

    if let previous {
        previous.pointee.next = node
    } else {
        head = node
    }
    node.pointee.next = current
    return head
}

/// `void sdp_list_free(sdp_list_t *list, sdp_free_func_t f)`
///
/// Frees every node, calling `f` on each node's `data` first when `f`
/// is non-NULL. As in the reference, `f` frees the pointee; the list
/// nodes themselves are always freed regardless of `f`.
@c(sdp_list_free)
public func sdp_list_free(
    _ list: UnsafeMutablePointer<sdp_list_t>?,
    _ freeElement: sdp_free_func_t?
) {
    var node = list
    while let current = node {
        let next = current.pointee.next
        if let freeElement {
            freeElement(current.pointee.data)
        }
        free(current)
        node = next
    }
}

// MARK: - Internal (not exported: `static inline` in sdp_lib.h)

/// `static inline int sdp_list_len(const sdp_list_t *list)`
internal func sdp_list_len(_ list: UnsafePointer<sdp_list_t>?) -> Int32 {
    var count: Int32 = 0
    var node = list
    while let current = node {
        count += 1
        node = UnsafePointer(current.pointee.next)
    }
    return count
}

/// `static inline sdp_list_t *sdp_list_find(sdp_list_t *list, void *u, sdp_comp_func_t f)`
internal func sdp_list_find(
    _ list: UnsafeMutablePointer<sdp_list_t>?,
    _ value: UnsafeMutableRawPointer?,
    _ compare: sdp_comp_func_t
) -> UnsafeMutablePointer<sdp_list_t>? {
    var node = list
    while let current = node {
        if compare(current.pointee.data, value) == 0 {
            return current
        }
        node = current.pointee.next
    }
    return nil
}

/// `static inline void sdp_list_foreach(sdp_list_t *list, sdp_list_func_t f, void *u)`
internal func sdp_list_foreach(
    _ list: UnsafeMutablePointer<sdp_list_t>?,
    _ body: sdp_list_func_t,
    _ userData: UnsafeMutableRawPointer?
) {
    var node = list
    while let current = node {
        body(current.pointee.data, userData)
        node = current.pointee.next
    }
}
