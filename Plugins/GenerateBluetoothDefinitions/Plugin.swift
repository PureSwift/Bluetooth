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
        do {
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
            let outputDirectory = context.pluginWorkDirectory.appending("Generated")
            let outputPaths = [
                outputDirectory.appending("CompanyIdentifiers.swift"),
                outputDirectory.appending("CompanyIdentifierNames.swift")
            ]
            /*
             .prebuildCommand(
                 displayName: "Generate Bluetooth Company Identifier Definitions",
                 executable: try context.tool(named: "GenerateBluetooth").path,
                 arguments: ["companyIdentifier", inputPath, outputPath],
                 outputFilesDirectory: target.directory.appending(subpath: "Generated")
             )
             */
            let command = Command.buildCommand(
                displayName: "Generate Bluetooth Company Identifier Definitions",
                executable: try context.tool(named: "GenerateBluetooth").path,
                arguments: ["companyIdentifier", inputPath] + outputPaths,
                inputFiles: [inputPath],
                outputFiles: outputPaths
            )
            commands.append(command)
        }
        return commands
    }
}
