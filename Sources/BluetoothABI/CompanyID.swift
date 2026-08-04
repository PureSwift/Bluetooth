//
//  CompanyID.swift
//  Bluetooth
//
//  Swift implementation of `bt_compidtostr`, bound to the declaration
//  in the vendored `bluetooth.h`.
//
//  Where the reference is a hand-maintained switch over string literals
//  frozen at the release's date, this implementation uses the Bluetooth
//  SIG assigned-numbers metadata, baked into the binary by
//  `Scripts/generate-company-names.py` (see `gen/CompanyNames.swift`).
//  Names the SIG has changed since the reference table was frozen are a
//  deliberate conformance difference, recorded in
//  `Conformance/known-differences.txt`.
//
//  Baking the table in rather than reading `BluetoothMetadata` at
//  runtime keeps this target free of Foundation and of SwiftPM's
//  `Bundle.module` — neither of which the CMake build has — and makes
//  the returned pointers static allocations rather than heap ones, with
//  no global initializer to synchronize.
//

import Bluetooth
import CBluetooth

/// `const char *bt_compidtostr(int compid)`
@c(bt_compidtostr)
public func bt_compidtostr(_ compid: Int32) -> UnsafePointer<CChar>? {
    guard let id = UInt16(exactly: compid) else {
        return companyName(at: notAssignedOffset)
    }
    if id == 0xFFFF {
        return companyName(at: internalUseOffset)
    }
    guard let offset = companyNameOffset(for: id) else {
        return companyName(at: notAssignedOffset)
    }
    return companyName(at: offset)
}
