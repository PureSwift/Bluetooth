//
//  AssignedUUIDParser.swift
//  
//
//  Created by Alsey Coleman Miller on 6/15/22.
//

#if os(macOS)
import Foundation
import PDFKit

final class AssignedUUIDParser {
    
    let document: PDFDocument
    
    let maxRowsPerPage = 100
    
    private static let pageSuffixRegex = try! NSRegularExpression(pattern: #"\d+ of \d+"#, options: .caseInsensitive)
    
    private static let hexNameRegex = try! NSRegularExpression(pattern: #"0x.{4} [^0x]+"#)
    
    init(url: URL) throws {
        guard let document = PDFDocument(url: url) else {
            throw AssignedUUIDParserError("Invalid PDF document")
        }
        self.document = document
    }
    
    func parse() throws -> [AssignedUUID] {
        let pages = (0 ..< document.pageCount).compactMap { document.page(at: $0) }
        guard pages.count >= 3 else {
            throw AssignedUUIDParserError("At least 3 pages expected")
        }
        var data = [AssignedUUID]()
        for page in pages.suffix(from: 2) {
            data += try parsePage(page)
        }
        guard data.isEmpty == false else {
            throw AssignedUUIDParserError("No assigned numbers parsed")
        }
        return data
    }
    
    private func parsePage(_ page: PDFPage) throws -> [AssignedUUID] {
        guard let pageNumber = page.label.flatMap({ UInt($0) }) else {
            throw AssignedUUIDParserError("Missing page number")
        }
        guard let text = page.string else {
            throw AssignedUUIDParserError("Page \(pageNumber): Unable to parse text")
        }
        let lines = text.components(separatedBy: "\n")
        var pageData = PageData()
        for (lineNumber, var line) in lines.enumerated() {
            try parseLine(&line, data: &pageData, context: (pageNumber, UInt(lineNumber)))
        }
        // compile page data
        guard pageData.uuids.count == pageData.names.count else {
            print(pageData)
            throw AssignedUUIDParserError("Page \(pageNumber): Expected \(pageData.uuids.count) names but found \(pageData.names.count)")
        }
        guard pageData.uuids.count == pageData.allocationTypes.count else {
            throw AssignedUUIDParserError("Page \(pageNumber): Expected \(pageData.uuids.count) types but found \(pageData.allocationTypes.count)")
        }
        return pageData.uuids.enumerated().map {
            AssignedUUID(allocationType: pageData.allocationTypes[$0], value: $1, name: pageData.names[$0])
        }
    }
    
    private func parseLine(
        _ line: inout String,
        data: inout PageData,
        context: (page: UInt, line: UInt)
    ) throws {
        // remove leading whitespace
        while line.first == " " {
            line.removeFirst()
        }
        // ignore header
        if line == "16-bit UUID Numbers / Document" {
            return
        } else if containsPageSuffix(line) {
            return
        } else if line == "Bluetooth SIG Proprietary" {
            return
        } else if line == "Allocation Type Allocated UUID Allocated for" {
            return
        } else if line == "Service Classes" {
            data.allocationTypes.append(.serviceProfiles)
            return
        } else if line == "and Profiles" {
            return
        } else if line == "(Note: This allocation is associated with a draft specification and is subject to change.)" {
            return
        } else if line.hasPrefix("(Note: This allocation is associated with a draft specification and is subject to ") {
            let prefix = "(Note: This allocation is associated with a draft specification and is subject to "
            let suffix = " change.)"
            line.removeFirst(prefix.count)
            line.removeLast(suffix.count)
        } else if let header = TableHeader.allCases.first(where: { line.hasPrefix($0.rawValue) }) {
            line.removeFirst(header.rawValue.count)
        } else if let type = AssignedUUID.AllocationType.allCases.first(where: { line.hasPrefix($0.rawValue) }) {
            data.allocationTypes.append(type)
            line.removeFirst(type.rawValue.count)
        } else if line.hasPrefix("0x"), line.count > 7, line.firstMatch(of: Self.hexNameRegex) != nil {
            while let range = line.firstMatch(of: Self.hexNameRegex) {
                var substring = String(line[range])
                try parseUUID(&substring, data: &data, context: context)
                if substring.first == " " {
                    substring.removeFirst()
                }
                data.names.append(substring)
                line.removeSubrange(range)
            }
            return
        } else if line.hasPrefix("0x") {
            try parseUUID(&line, data: &data, context: context)
        } else if line.isEmpty == false {
            // name
            data.names.append(line)
            return
        }
        // continue parsing same line
        if line.isEmpty == false {
            try parseLine(&line, data: &data, context: context)
        }
    }
    
    private func parseUUID(
        _ line: inout String,
        data: inout PageData,
        context: (page: UInt, line: UInt)
    ) throws {
        assert(line.hasPrefix("0x"))
        guard line.count >= 6 else {
            throw AssignedUUIDParserError("Page \(context.page), Line \(context.line): Invalid hexadecimal string '\(line)'")
        }
        let hexString = line[line.index(line.startIndex, offsetBy: 2) ..< line.index(line.startIndex, offsetBy: 6)]
        assert(hexString.count == 4)
        guard let value = UInt16(hexString, radix: 16) else {
            throw AssignedUUIDParserError("Page \(context.page), Line \(context.line): Invalid hexadecimal string '\(hexString)'")
        }
        data.uuids.append(value)
        line.removeFirst(6)
    }
    
    private func containsPageSuffix(_ string: String) -> Bool {
        #if swift(>=5.7)
        if #available(macOS 13.0, *) {
            let regex = #/\d+ of \d+/#
            return string.prefixMatch(of: regex) != nil
        } else {
            return string.firstMatch(of: Self.pageSuffixRegex) != nil
        }
        #else
        return string.firstMatch(of: Self.pageSuffixRegex) != nil
        #endif
    }
}

struct AssignedUUIDParserError: Error {
    
    let description: String
    
    fileprivate init(_ description: String) {
        self.description = description
    }
}

extension AssignedUUIDParser {
    
    /// PDF document table header
    enum TableHeader: String, CaseIterable {
        
        /// Allocation Type
        case allocationType         = "Allocation Type"
        
        /// Allocated UUID
        case allocatedUUID          = "Allocated UUID"
        
        /// Allocated for
        case allocatedFor           = "Allocated for"
    }
    
    struct PageData {
        
        var allocationTypes = [AssignedUUID.AllocationType]()
        
        var uuids = [UInt16]()
        
        var names = [String]()
    }
}
#endif
