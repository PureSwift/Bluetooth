//
//  UnitIdentifier.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/5/24.
//

import Foundation
import PackagePlugin

extension GenerateBluetoothDefinitionsPlugin {

    func unitIdentifiersBuildCommands(
        for context: PluginContext,
        target: SwiftSourceModuleTarget,
        commands: inout [Command]
    ) throws {
        guard target.name == "Bluetooth" else {
            return
        }
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURLs = [
            outputDirectory.appending(component: "UnitIdentifiers.swift")
        ]
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Unit Identifier Definitions",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: ["unitIdentifier"] + outputURLs.map { $0.path() },
            inputFiles: [],
            outputFiles: outputURLs
        )
        commands.append(command)
    }

    func unitIdentifierTestsBuildCommands(
        for context: PluginContext,
        target: SwiftSourceModuleTarget,
        commands: inout [Command]
    ) throws {
        // Generate Bluetooth Unit Identifier Unit Tests
        guard target.name == "BluetoothTests" else {
            return
        }
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURL = outputDirectory.appending(component: "UnitIdentifierTests.swift")
        let arguments = ["unitIdentifierTests", outputURL.path()]
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth Unit Identifier Unit Tests",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: arguments,
            inputFiles: [],
            outputFiles: [outputURL]
        )
        assert(arguments.count == 2)
        commands.append(command)
    }
}
