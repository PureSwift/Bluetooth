//
//  Plugin.swift
//  
//
//  Created by Alsey Coleman Miller on 6/12/22.
//

import Foundation
import PackagePlugin

@main
struct GenerateBluetoothDefinitionsPlugin: BuildToolPlugin {

    /// This entry point is called when operating on a Swift package.
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let target = target as! SwiftSourceModuleTarget
        var commands = [Command]()
        // Generate Bluetooth Company Identifier Definitions
        if target.name == "Bluetooth" {
            let inputFileName = "CompanyIdentifiers.csv"
            let inputPath = target
                .sourceFiles(withSuffix: "csv")
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
        // Generate Bluetooth Company Identifier Unit Tests
        if target.name == "BluetoothTests" {
            let inputFileName = "CompanyIdentifiers.csv"
            guard let bluetoothTarget = try context.package.targets(named: ["Bluetooth"]).first as? SwiftSourceModuleTarget else {
                fatalError("Missing Bluetooth target")
            }
            let inputPath = bluetoothTarget
                .sourceFiles(withSuffix: "csv")
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
        return commands
    }
}
