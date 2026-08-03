//
//  CompanyIdentifierMetadata.swift
//
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

import Foundation
import BluetoothMetadata

extension GenerateTool {

    static func generateCompanyIdentifierMetadata(output: URL) throws {
        let data = try parseCompanyIdentifiersFile()
        try generateCompanyIdentifierMetadataSwitch(data, output: output)
    }

    static func generateCompanyIdentifierMetadataSwitch(_ data: [UInt16: String], output: URL) throws {

        var generatedCode = ""
        // sorted, but not filtered — unlike the numeric constant accessors,
        // this backs the lossless `name` lookup, so every entry (including
        // the internal-use 0xFFFF identifier) is kept.
        let companies = data.sorted(by: { $0.key < $1.key })

        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }

        🖨("//")
        🖨("//  \(output.lastPathComponent)")
        🖨("//  Bluetooth")
        🖨("//")
        🖨("//  Generated from Resources/CompanyIdentifier.json — do not edit.")
        🖨("//")
        🖨("")
        🖨("#if Metadata")
        🖨("extension CompanyIdentifier {")
        🖨("")
        🖨("    // swiftlint:disable:next cyclomatic_complexity")
        🖨("    static func generatedName(for rawValue: UInt16) -> String? {")
        🖨("        switch rawValue {")

        for (id, name) in companies {
            🖨("        case \(id): return #\"\(name)\"#")
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
