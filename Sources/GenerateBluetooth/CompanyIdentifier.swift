//
//  CompanyIdentifier.swift
//
//
//  Created by Alsey Coleman Miller on 6/12/22.
//

import Foundation
import BluetoothMetadata

extension GenerateTool {

    static func parseCompanyIdentifiersFile() throws -> [UInt16: String] {
        let file = try BluetoothMetadata.CompanyIdentifier.File.load()
        var output = [UInt16: String]()
        output.reserveCapacity(file.companyIdentifiers.count)
        for element in file.companyIdentifiers {
            output[element.id] = element.name
        }
        return output
    }

    static func companyIdentifiers(from data: [UInt16: String]) -> [(id: UInt16, name: String, member: String)] {
        let blacklist: [UInt16] = [
            .max  // remove internal use identifier
        ]
        let companies =
            data
            .sorted(by: { $0.key < $1.key })
            .filter { blacklist.contains($0.key) == false }
        var memberNames = [UInt16: String]()
        memberNames.reserveCapacity(companies.count)
        for (id, name) in companies {
            let sanitizedName = name.sanitizeName(prefix: "company")
            let llamaCaseName = sanitizedName.llamaCase()
            var memberName = llamaCaseName
            // prevent duplicate entries
            var duplicateNumber = 1
            while memberNames.values.contains(memberName) {
                duplicateNumber += 1
                memberName = llamaCaseName + "\(duplicateNumber)"
            }
            memberNames[id] = memberName
        }
        return companies.map { ($0, $1, memberNames[$0]!) }
    }

    static func generateCompanyIdentifiers(output: URL) throws {
        let data = try parseCompanyIdentifiersFile()
        try generateCompanyIdentifierExtensions(data, output: output)
    }

    static func generateCompanyIdentifierExtensions(_ data: [UInt16: String], output: URL) throws {

        var generatedCode = ""
        let companies = companyIdentifiers(from: data)

        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }

        🖨("//")
        🖨("//  CompanyIdentifiers.swift")
        🖨("//  Bluetooth")
        🖨("//")
        🖨("")
        🖨("public extension CompanyIdentifier {")
        🖨("")

        for (id, name, memberName) in companies {

            🖨("    /// " + name + " " + "(`\(id)`)")
            🖨("    @_alwaysEmitIntoClient")
            🖨("    static var " + memberName + ": CompanyIdentifier {")
            🖨("        return CompanyIdentifier(rawValue: \(id))")
            🖨("    }")
            🖨("")
        }

        🖨("}")

        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated \(output.path)")
    }

    static func generateCompanyIdentifierTests(output: URL) throws {

        let data = try parseCompanyIdentifiersFile()

        var generatedCode = ""
        // sorted, but not filtered — this backs a lossless correctness
        // check, so every entry (including the internal-use 0xFFFF
        // identifier) is covered.
        let companies = data.sorted(by: { $0.key < $1.key })

        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }

        // One #expect() call *site*, not one per entry: swift-testing's
        // macro expansion cost scales with the number of source-level
        // #expect occurrences, not with how many times each runs, so a
        // few thousand individually-unrolled #expect calls (whether in
        // one function or split across many) is many minutes of type
        // checking. A single parameterized @Test(arguments:) — data
        // description, runtime loop — keeps compile time bounded
        // regardless of entry count.
        generatedCode = """
            //
            //  CompanyIdentifierTests.swift
            //  Bluetooth
            //

            import Foundation
            import Testing
            @testable import Bluetooth

            #if !canImport(Darwin) && Metadata
            @Suite
            struct CompanyIdentifierTests {

                struct Entry: Sendable {
                    let id: UInt16
                    let name: String
                }

                // A single array-literal expression with thousands of
                // elements is pathologically slow for the type checker,
                // same as an unrolled #expect() chain. Sequential
                // append() calls keep each statement's type-checking
                // cost independent of the others.
                static var entries: [Entry] {
                    var entries: [Entry] = []
                    entries.reserveCapacity(\(companies.count))

            """

        for (id, name) in companies {
            🖨("        entries.append(Entry(id: \(id), name: #\"\(name)\"#))")
        }

        🖨(
            """
                    return entries
                }

                @Test(arguments: entries)
                func company(_ entry: Entry) {
                    let identifier = CompanyIdentifier(rawValue: entry.id)
                    #expect(identifier.rawValue == entry.id)
                    #expect(identifier.name == entry.name)
                    #expect(identifier.description == entry.name)
                }
            }
            #endif
            """)

        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated \(output.path)")
    }
}
