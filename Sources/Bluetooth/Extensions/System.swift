//
//  System.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/7/24.
//

#if canImport(Darwin)
import Darwin
#elseif os(Windows)
import ucrt
#elseif canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#elseif canImport(WASILibc)
import WASILibc
#elseif canImport(Bionic)
import Bionic
#else
#error("Unsupported Platform")
#endif

// Declares the required C functions
internal func _memcmp(
    _ p1: UnsafeRawPointer?,
    _ p2: UnsafeRawPointer?,
    _ size: Int
) -> Int32 {
    memcmp(p1, p2, size)
}

#if hasFeature(Embedded)
@_silgen_name("snprintf")
internal func _snprintf_uint8_t(
    _ pointer: UnsafeMutablePointer<CChar>,
    _ length: Int,
    _ format: UnsafePointer<CChar>,
    _ arg: UInt8
) -> Int32
#endif
