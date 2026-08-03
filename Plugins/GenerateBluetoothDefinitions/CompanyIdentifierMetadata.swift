//
//  CompanyIdentifierMetadata.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

import Foundation
import PackagePlugin

extension GenerateBluetoothDefinitionsPlugin {

    func companyIdentifierMetadataBuildCommands(
        for context: PluginContext,
        target: SwiftSourceModuleTarget,
        commands: inout [Command]
    ) throws {
        guard target.name == "Bluetooth" else {
            return
        }
        // Generate Bluetooth Company Identifier Metadata (name lookup)
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURLs = [
            outputDirectory.appending(component: "CompanyIdentifierNames.swift")
        ]
        let arguments = ["companyIdentifierMetadata"] + outputURLs.map { $0.path() }
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Company Identifier Metadata",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: arguments,
            inputFiles: [],
            outputFiles: outputURLs
        )
        assert(arguments.count == 2)
        commands.append(command)
    }
}
