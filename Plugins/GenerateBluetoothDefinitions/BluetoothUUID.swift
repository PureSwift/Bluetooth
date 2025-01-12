//
//  BluetoothUUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/11/25.
//

import Foundation
import PackagePlugin

extension GenerateBluetoothDefinitionsPlugin {
    
    func bluetoothUUIDBuildCommands(
        type: String,
        fileName: String,
        for context: PluginContext,
        target: SwiftSourceModuleTarget,
        commands: inout [Command]
    ) throws {
        guard target.name == "Bluetooth" else {
            return
        }
        // Generate Bluetooth UUID Definitions
        let inputFileNames = [
            fileName + ".json"
        ]
        let inputURLs = inputFileNames.compactMap { inputFileName in
            target
                .sourceFiles(withSuffix: "json")
                .filter { $0.type == .unknown }
                .first { $0.url.lastPathComponent == inputFileName }
                .flatMap { $0.url }
        }
        assert(inputFileNames.count == inputURLs.count)
        let outputDirectory = context.pluginWorkDirectoryURL
        let outputURLs = [
            outputDirectory.appending(component: fileName + ".swift")
        ]
        let arguments = ["uuid", type]
            + inputURLs.map { $0.path() }
            + outputURLs.map { $0.path() }
        let command = Command.buildCommand(
            displayName: "Generate Bluetooth \(type) UUID Definitions",
            executable: try context.tool(named: "GenerateBluetooth").url,
            arguments: arguments,
            inputFiles: inputURLs,
            outputFiles: outputURLs
        )
        assert(arguments.count == 4)
        commands.append(command)
    }
}
