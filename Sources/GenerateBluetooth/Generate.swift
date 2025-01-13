//
//  Generate.swift
//
//
//  Created by Alsey Coleman Miller on 6/12/22.
//

import Foundation
import BluetoothMetadata

@main
struct GenerateTool {

    static func main() throws {
        // parse arguments
        let arguments = CommandLine.arguments
        guard arguments.count > 1,
            let commandType = CommandType(rawValue: arguments[1])
        else {
            throw CommandError.invalidArguments(arguments)
        }
        switch commandType {
        case .companyIdentifier:
            // parse arguments
            guard arguments.count == 3 else {
                throw CommandError.invalidArguments(arguments)
            }
            let outputFile = URL(fileURLWithPath: arguments[2])
            // generate files
            try generateCompanyIdentifiers(
                output: outputFile
            )
        case .companyIdentifierTests:
            // parse arguments
            guard arguments.count == 3 else {
                throw CommandError.invalidArguments(arguments)
            }
            let outputFile = URL(fileURLWithPath: arguments[2])
            // generate files
            try generateCompanyIdentifierTests(
                output: outputFile
            )
        case .unitIdentifier:
            // parse arguments
            guard arguments.count == 3 else {
                throw CommandError.invalidArguments(arguments)
            }
            let outputFile = URL(fileURLWithPath: arguments[2])
            // generate files
            try generateUnitIdentifiers(
                output: outputFile
            )
        case .unitIdentifierTests:
            // parse arguments
            guard arguments.count == 3 else {
                throw CommandError.invalidArguments(arguments)
            }
            let outputFile = URL(fileURLWithPath: arguments[3])
            // generate files
            try generateUnitIdentifierTests(
                output: outputFile
            )
        case .uuid:
            // parse arguments
            guard arguments.count == 4 else {
                throw CommandError.invalidArguments(arguments)
            }
            let uuidType = BluetoothUUID.Category(rawValue: arguments[2])
            let outputFile = URL(fileURLWithPath: arguments[3])
            // generate files
            try generateBluetoothUUIDs(
                type: uuidType,
                output: outputFile
            )
        }
    }
}

enum CommandType: String {

    case companyIdentifier
    case companyIdentifierTests
    case unitIdentifier
    case unitIdentifierTests
    case uuid
}

enum CommandError: Error {

    case invalidArguments([String])
}
