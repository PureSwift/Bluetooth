//
//  CompanyIdentifierCSVParser.swift
//  
//
//  Created by Alsey Coleman Miller on 6/15/22.
//

import Foundation

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
