//
//  CompanyIdentifier.swift
//  
//
//  Created by Alsey Coleman Miller on 6/12/22.
//

import Foundation

extension GenerateTool {
    
    static func parseFile(input: URL) throws -> [UInt16: String] {
        let data = try Data(contentsOf: input, options: [.mappedIfSafe])
        guard let string = String(data: data, encoding: .utf8) else {
            throw CocoaError(.fileReadUnknownStringEncoding)
        }
        var output = [UInt16: String]()
        let lines = string.split(separator: "\n", omittingEmptySubsequences: true)
        output.reserveCapacity(lines.count)
        for line in lines {
            let hexString = line.prefix(6).replacingOccurrences(of: "0x", with: "")
            guard let id = UInt16(hexString, radix: 16) else {
                throw CocoaError(.fileReadCorruptFile)
            }
            output[id] = String(line.suffix(from: line.index(after: line.firstIndex(where: { $0 == " " })!)))
        }
        return output
    }
    
    static func companyIdentifiers(from data: [UInt16: String]) -> [(id: UInt16, name: String, member: String)] {
        let blacklist: [UInt16] = [
            .max // remove internal use identifier
        ]
        let companies = data
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
    
    static func generateCompanyIdentifiers(input: URL, output: [URL]) throws {
        let data = try parseFile(input: input)
        try generateCompanyIdentifierExtensions(data, output: output[0])
        try generateCompanyIdentifierNames(data, output: output[1])
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
        print("Generated Swift \(output.path)")
    }
    
    static func generateCompanyIdentifierNames(_ data: [UInt16: String], output: URL) throws {
        
        var generatedCode = ""
        let companies = companyIdentifiers(from: data)
        
        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }
        
        🖨("//")
        🖨("//  CompanyIdentifierNames.swift")
        🖨("//  Bluetooth")
        🖨("//")
        🖨("")
        🖨("internal extension CompanyIdentifier {")
        🖨("")
        🖨("    static let companyIdentifiers: [UInt16: String] = {")
        🖨("")
        🖨("        var companyIdentifiers = [UInt16: String]()")
        🖨("        companyIdentifiers.reserveCapacity(\(companies.count))")
        🖨("")
        
        for (id, name, _) in companies {
            🖨("        companyIdentifiers[\(id)] = #\"\(name)\"#")
        }
        
        🖨("        return companyIdentifiers")
        🖨("    }()")
        🖨("}")
        
        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated Swift \(output.path)")
    }
    
    static func generateCompanyIdentifierTests(input: URL, output: URL) throws {
        
        let data = try parseFile(input: input)
        
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
        
        import XCTest
        import Foundation
        @testable import Bluetooth
        
        // swiftlint:disable type_body_length
        final class CompanyIdentifierTests: XCTestCase {
        
            func testCompanies() {
        
        
        """
        
        // generate test methods
        
        for (id, name, memberName) in companies {
                        
            🖨("""
                    // \(name)
                    XCTAssertEqual(CompanyIdentifier.\(memberName).rawValue, \(id))
                    XCTAssertEqual(CompanyIdentifier.\(memberName).name, #\"\(name)\"#)
                    XCTAssertEqual(CompanyIdentifier.\(memberName).description, #\"\(name)\"#)
                
            """)
        }
        
        🖨("""
                }
            
            }
            // swiftlint:enable type_body_length
            """)
        
        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated Swift \(output.path)")
    }
}
