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
        let inputPath = target
            .sourceFiles(withSuffix: "json")
            .filter { $0.type == .unknown }
            .first { $0.path.lastComponent == inputFileName }
            .map { $0.path }
        guard let inputPath = inputPath else {
            Diagnostics.error("Missing \(inputFileName)")
            throw CocoaError(CocoaError.fileNoSuchFile)
        }
        let outputDirectory = context.pluginWorkDirectory
        let outputPaths = [
            outputDirectory.appending("CompanyIdentifiers.swift"),
            outputDirectory.appending("CompanyIdentifierNames.swift")
        ]
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Company Identifier Definitions",
            executable: try context.tool(named: "GenerateBluetooth").path,
            arguments: ["companyIdentifier", inputPath] + outputPaths,
            inputFiles: [inputPath],
            outputFiles: outputPaths
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
        let inputPath = bluetoothTarget
            .sourceFiles(withSuffix: "json")
            .filter { $0.type == .unknown }
            .first { $0.path.lastComponent == inputFileName }
            .map { $0.path }
        guard let inputPath = inputPath else {
            Diagnostics.error("Missing \(inputFileName)")
            throw CocoaError(CocoaError.fileNoSuchFile)
        }
        let outputDirectory = context.pluginWorkDirectory
        let outputPath = outputDirectory.appending("CompanyIdentifierTests.swift")
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Company Identifier Unit Tests",
            executable: try context.tool(named: "GenerateBluetooth").path,
            arguments: ["companyIdentifierTests", inputPath, outputPath],
            inputFiles: [inputPath],
            outputFiles: [outputPath]
        )
        commands.append(command)
    }
}
