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
        let companies = companyIdentifiers(from: data)

        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }

        // generate unit test for extensions
        generatedCode = """
            //
            //  CompanyIdentifierTests.swift
            //  Bluetooth
            //

            import Foundation
            import Testing
            @testable import Bluetooth

            // swiftlint:disable type_body_length
            #if !canImport(Darwin)
            @Suite
            struct CompanyIdentifierTests {

                @Test func companies() {


            """

        // generate test methods

        for (id, name, memberName) in companies {

            🖨(
                """
                        // \(name)
                        #expect(CompanyIdentifier.\(memberName).rawValue == \(id))
                        #expect(CompanyIdentifier.\(memberName).name == #\"\(name)\"#)
                        #expect(CompanyIdentifier.\(memberName).description == #\"\(name)\"#)
                    
                """)
        }

        🖨(
            """
                }

            }
            #endif
            // swiftlint:enable type_body_length
            """)

        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated \(output.path)")
    }
}
