//
//  BluetoothUUIDMetadata.swift
//
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

import Foundation
import BluetoothMetadata

extension GenerateTool {

    /// Categories merged in this fixed order when the same 16-bit value
    /// appears in more than one — matches `BluetoothUUIDMetadata.swift`'s
    /// prior runtime behavior of returning the first match found, but
    /// deterministically instead of in unspecified dictionary order.
    static var uuidMetadataCategoryOrder: [BluetoothMetadata.BluetoothUUID.Category] {
        [.service, .characteristic, .declaration, .descriptor, .member, .unit]
    }

    static func generateBluetoothUUIDMetadata(output: URL) throws {
        var merged = [UInt16: BluetoothMetadata.BluetoothUUID]()
        for category in uuidMetadataCategoryOrder {
            let file = try BluetoothMetadata.BluetoothUUID.File(category)
            for entry in file.uuids {
                if let existing = merged[entry.uuid] {
                    print(
                        "warning: BluetoothUUID 0x\(entry.uuid.toHexadecimal()) is defined in more than one category"
                            + " (keeping \"\(existing.name)\", ignoring \"\(entry.name)\" from \(category))"
                    )
                    continue
                }
                merged[entry.uuid] = entry
            }
        }
        try generateBluetoothUUIDMetadataSwitch(merged, output: output)
    }

    static func generateBluetoothUUIDMetadataSwitch(
        _ data: [UInt16: BluetoothMetadata.BluetoothUUID],
        output: URL
    ) throws {

        var generatedCode = ""
        let entries = data.values.sorted(by: { $0.uuid < $1.uuid })

        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }

        🖨("//")
        🖨("//  \(output.lastPathComponent)")
        🖨("//  Bluetooth")
        🖨("//")
        🖨("//  Generated from Resources/{Service,Characteristic,Declaration,Descriptor,Member,Unit}UUID.json — do not edit.")
        🖨("//")
        🖨("")
        🖨("#if Metadata")
        🖨("extension BluetoothUUID {")
        🖨("")
        🖨("    // swiftlint:disable:next cyclomatic_complexity")
        🖨("    static func generatedMetadata(for rawValue: UInt16) -> (name: String, type: String?)? {")
        🖨("        switch rawValue {")

        for entry in entries {
            let typeLiteral = entry.type.map { "#\"\($0)\"#" } ?? "nil"
            🖨("        case \(entry.uuid): return (#\"\(entry.name)\"#, \(typeLiteral))")
        }

        🖨("        default: return nil")
        🖨("        }")
        🖨("    }")
        🖨("}")
        🖨("#endif")

        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated \(output.path)")
    }
}
