//
//  BluetoothUUIDMetadata.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

import Foundation
import PackagePlugin

extension GenerateBluetoothDefinitionsPlugin {

    func bluetoothUUIDMetadataBuildCommands(
        for context: PluginContext,
        target: SwiftSourceModuleTarget,
        commands: inout [Command]
    ) throws {
        guard target.name == "Bluetooth" else {
            return
        }
        // Generate Bluetooth UUID Metadata (name/type lookup, merged
        // across all categories)
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURLs = [
            outputDirectory.appending(component: "BluetoothUUIDMetadataNames.swift")
        ]
        let arguments = ["uuidMetadata"] + outputURLs.map { $0.path() }
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth UUID Metadata",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: arguments,
            inputFiles: [],
            outputFiles: outputURLs
        )
        assert(arguments.count == 2)
        commands.append(command)
    }
}
