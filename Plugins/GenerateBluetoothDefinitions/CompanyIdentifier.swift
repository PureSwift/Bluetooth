//
//  CompanyIdentifier.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/5/24.
//

import Foundation
import PackagePlugin

extension GenerateBluetoothDefinitionsPlugin {
    
    func companyIdentifiersBuildCommands(
        for context: PluginContext,
        target: SwiftSourceModuleTarget,
        commands: inout [Command]
    ) throws {
        guard target.name == "Bluetooth" else {
            return
        }
        // Generate Bluetooth Company Identifier Definitions
        let inputFileName = "CompanyIdentifier.json"
        let inputURL = target
            .sourceFiles(withSuffix: "json")
            .filter { $0.type == .unknown }
            .first { $0.url.lastPathComponent == inputFileName }
            .map { $0.url }
        guard let inputURL = inputURL else {
            Diagnostics.error("Missing \(inputFileName)")
            throw CocoaError(.fileNoSuchFile)
        }
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURLs = [
            outputDirectory.appending(component: "CompanyIdentifiers.swift"),
            outputDirectory.appending(component: "CompanyIdentifierNames.swift")
        ]
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Company Identifier Definitions",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: ["companyIdentifier", inputURL.path()] + outputURLs.map { $0.path() },
            inputFiles: [inputURL],
            outputFiles: outputURLs
        )
        commands.append(command)
    }
    
    func companyIdentifierTestsBuildCommands(
        for context: PluginContext,
        target: SwiftSourceModuleTarget,
        commands: inout [Command]
    ) throws {
        // Generate Bluetooth Company Identifier Unit Tests
        guard target.name == "BluetoothTests" else {
            return
        }
        let inputFileName = "CompanyIdentifier.json"
        guard let bluetoothTarget = try context.package.targets(named: ["Bluetooth"]).first as? SwiftSourceModuleTarget else {
            fatalError("Missing Bluetooth target")
        }
        let inputURL = bluetoothTarget
            .sourceFiles(withSuffix: "json")
            .filter { $0.type == .unknown }
            .first { $0.url.lastPathComponent == inputFileName }
            .map { $0.url }
        guard let inputURL = inputURL else {
            Diagnostics.error("Missing \(inputFileName)")
            throw CocoaError(.fileNoSuchFile)
        }
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURL = outputDirectory.appending(component: "CompanyIdentifierTests.swift")
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Company Identifier Unit Tests",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: ["companyIdentifierTests", inputURL.path(), outputURL.path()],
            inputFiles: [inputURL],
            outputFiles: [outputURL]
        )
        commands.append(command)
    }
}
