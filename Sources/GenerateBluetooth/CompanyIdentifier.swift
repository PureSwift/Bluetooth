//
//  CompanyIdentifier.swift
//  
//
//  Created by Alsey Coleman Miller on 6/12/22.
//

import Foundation

extension GenerateTool {
    
    static func parseCSV(input: URL) throws -> [UInt16: String] {
        let csvParser = CompanyIdentifierCSVParser()
        try csvParser.parse(url: input)
        return csvParser.data
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
        let data = try parseCSV(input: input)
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
        
        let data = try parseCSV(input: input)
        
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

final class CompanyIdentifierCSVParser: CSVParserDelegate {
    
    private(set) var data = [UInt16: String]()
    
    private var state: Line?
    
    private var error: Error?
    
    init() { }
    
    func parse(url: URL) throws {
        error = nil
        defer { error = nil }
        guard let parser = CSV.Parser(
            url: url,
            configuration: .init(delimiter: ",", encoding: .utf8)
        ) else {
            throw CSVError(description: "Invalid file \(url)")
        }
        parser.delegate = self
        try parser.parse()
        if let error = self.error {
            throw error
        }
    }
    
    /// Called when the parser begins parsing.
    func parserDidBeginDocument(_ parser: CSV.Parser) {
        state = nil
    }
    
    /// Called when the parser finished parsing without errors.
    func parserDidEndDocument(_ parser: CSV.Parser) {
        state = nil
    }
    
    /// Called when the parser begins parsing a line.
    func parser(_ parser: CSV.Parser, didBeginLineAt index: UInt) {
        // skip header
        guard index > 0 else {
            state = nil
            return
        }
        // create line state
        state = Line(index: index, values: [])
    }
    
    /// Called when the parser finished parsing a line.
    func parser(_ parser: CSV.Parser, didEndLineAt index: UInt) {
        // skipped for headers
        guard let state = self.state else {
            return
        }
        defer { self.state = nil }
        let valuesPerLine = 3
        guard state.values.count == valuesPerLine else {
            parser.cancel()
            self.error = CSVError(description: "Line \(index): expected \(valuesPerLine) values, got \(state.values.count)")
            return
        }
        guard let decimal = UInt16(state.values[0]) else {
            parser.cancel()
            self.error = CSVError(description: "Line \(index): unable to parse \(state.values[0]) as decimal")
            return
        }
        let hexString = state.values[1].replacingOccurrences(of: "0x", with: "")
        guard let hexadecimal = UInt16(hexString, radix: 16) else {
            parser.cancel()
            self.error = CSVError(description: "Line \(index): unable to parse \(state.values[1]) as hexadecimal")
            return
        }
        guard decimal == hexadecimal else {
            parser.cancel()
            self.error = CSVError(description: "Line \(index): \(decimal) must equal \(hexadecimal)")
            return
        }
        // add values to output
        let name = state.values[2]
        self.data[decimal] = name
    }
    
    /// Called for every field in a line.
    func parser(_ parser: CSV.Parser, didReadFieldAt index: UInt, value: String) {
        self.state?.values.append(value)
    }
}

internal extension CompanyIdentifierCSVParser {
    
    struct Line {
        let index: UInt
        var values: [String]
    }
}
