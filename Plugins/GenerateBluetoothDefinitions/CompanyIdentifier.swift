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
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURLs = [
            outputDirectory.appending(component: "CompanyIdentifiers.swift")
        ]
        let arguments = ["companyIdentifier"] + outputURLs.map { $0.path() }
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Company Identifier Definitions",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: arguments,
            inputFiles: [],
            outputFiles: outputURLs
        )
        assert(arguments.count == 2)
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
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURL = outputDirectory.appending(component: "CompanyIdentifierTests.swift")
        let arguments = ["companyIdentifierTests", outputURL.path()]
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Company Identifier Unit Tests",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: arguments,
            inputFiles: [],
            outputFiles: [outputURL]
        )
        assert(arguments.count == 2)
        commands.append(command)
    }
}
