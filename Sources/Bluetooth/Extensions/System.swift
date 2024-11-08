//
//  System.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/7/24.
//

// Declares the required C functions

@_silgen_name("memcmp")
func _memcmp(
    _: UnsafeRawPointer!,
    _: UnsafeRawPointer!,
    _: Int
) -> Int32

#if hasFeature(Embedded)
@_silgen_name("snprintf")
internal func _snprintf_uint8_t(
    _ pointer: UnsafeMutablePointer<CChar>,
    _ length: Int,
    _ format: UnsafePointer<CChar>,
    _ arg: UInt8
) -> Int32
#endif
