//
//  Address.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/8/25.
//

import Bluetooth
import CBluetooth

@_cdecl("BTAddressEqual")
internal func BTAddressEqual(_ lhs: UnsafePointer<BTAddress>, _ rhs: UnsafePointer<BTAddress>) -> Bool {
    BluetoothAddress(bytes: lhs.pointee.bytes) == BluetoothAddress(bytes: rhs.pointee.bytes)
}

@_cdecl("BTAddressCreateWithString")
internal func BTAddressCreateWithString(
    _ address: OpaquePointer,
    _ string: UnsafePointer<CChar>
) -> Bool {
    let pointer = UnsafeMutablePointer<BluetoothAddress>(address)
    assert(pointer.pointee == .zero)
    let string = String(cString: string)
    guard let value = BluetoothAddress(string) else {
        return false
    }
    pointer.pointee = value
    return true
}

@_cdecl("BTAddressCreateWithData")
@inline(never)
internal func BTAddressCreateWithData(
    _ address: OpaquePointer,
    _ data: UnsafePointer<UInt8>?,
    _ size: Int
) -> Bool {
    guard let data, size == BluetoothAddress.length
        else { return false }
    let pointer = UnsafeMutablePointer<BluetoothAddress>(address)
    assert(pointer.pointee == .zero)
    pointer.pointee.bytes = (data[0], data[1], data[2], data[3], data[4], data[5])
    return false
}

// MARK: - CoreFoundation

#if canImport(CoreFoundation)
import CoreFoundation

public extension BluetoothAddress {
    
    init?(_ string: CFString) {
        var address = BluetoothAddress.zero
        guard withUnsafeMutablePointer(to: &address, {
            BTAddressCreateWithCFString(OpaquePointer($0), string)
        }) else {
            return nil
        }
        self = address
    }
}

/// `BOOL BTAddressCreateWithCFString(*BTAddress address, CFStringRef string)`
@_cdecl("BTAddressCreateWithCFString")
internal func BTAddressCreateWithCFString(_ address: OpaquePointer, _ string: CFString) -> Bool {
    // get C string
    guard let cString = CFStringGetCStringPtr(string, CFStringBuiltInEncodings.UTF8.rawValue) else {
        return false
    }
    return BTAddressCreateWithString(address, cString)
}

public extension BluetoothAddress {
    
    init?(data: CFData) {
        var address = BluetoothAddress.zero
        guard withUnsafeMutablePointer(to: &address, {
            BTAddressCreateWithCFData(OpaquePointer($0), data)
        }) else {
            return nil
        }
        self = address
    }
}

@_cdecl("BTAddressCreateWithCFData")
internal func BTAddressCreateWithCFData(_ address: OpaquePointer, _ data: CFData) -> Bool {
    // get byte pointer
    let dataPointer = CFDataGetBytePtr(data)
    let size = CFDataGetLength(data)
    return BTAddressCreateWithData(address, dataPointer, size)
}

#endif
