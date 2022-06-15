//
//  Generate.swift
//  
//
//  Created by Alsey Coleman Miller on 6/12/22.
//

import Foundation

@main
struct GenerateTool {
    
    static func main() throws {
        // parse arguments
        let arguments = CommandLine.arguments
        guard arguments.count > 1, let commandType = CommandType(rawValue: arguments[1]) else {
            throw CommandError.invalidArguments(arguments)
        }
        switch commandType {
        case .companyIdentifier:
            // parse arguments
            guard arguments.count == 5 else {
                throw CommandError.invalidArguments(arguments)
            }
            let inputFile = URL(fileURLWithPath: arguments[2])
            let outputFiles = [
                URL(fileURLWithPath: arguments[3]),
                URL(fileURLWithPath: arguments[4])
            ]
            // generate files
            try generateCompanyIdentifiers(
                input: inputFile,
                output: outputFiles
            )
        case .companyIdentifierTests:
            // parse arguments
            guard arguments.count == 4 else {
                throw CommandError.invalidArguments(arguments)
            }
            let inputFile = URL(fileURLWithPath: arguments[2])
            let outputFile = URL(fileURLWithPath: arguments[3])
            // generate files
            try generateCompanyIdentifierTests(
                input: inputFile,
                output: outputFile
            )
        }
    }
}

enum CommandType: String {
    
    case companyIdentifier
    case companyIdentifierTests
}

enum CommandError: Error {
    
    case invalidArguments([String])
}
