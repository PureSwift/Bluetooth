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
        guard let target = target as? SwiftSourceModuleTarget else {
            return []
        }
        var commands = [Command]()
        commands.reserveCapacity(10)
        
        // Generate Bluetooth Company Identifier Definitions
        try companyIdentifiersBuildCommands(for: context, target: target, commands: &commands)
        // Generate Bluetooth Company Identifier Unit Tests
        try companyIdentifierTestsBuildCommands(for: context, target: target, commands: &commands)
        // Generate Bluetooth Unit Identifier Definitions
        try unitIdentifiersBuildCommands(for: context, target: target, commands: &commands)
        // Generate Bluetooth Unit Identifier Unit Tests
        try unitIdentifierTestsBuildCommands(for: context, target: target, commands: &commands)
        // Generate Bluetooth UUID Definitions
        let uuidFiles = [
            ("Service", "ServiceUUID"),
            ("Characteristic", "CharacteristicUUID"),
            ("Descriptor", "DescriptorUUID"),
            ("Member", "MemberUUID"),
            ("Declaration", "DeclarationUUID"),
        ]
        for (type, fileName) in uuidFiles {
            try bluetoothUUIDBuildCommands(
                type: type,
                fileName: fileName,
                for: context,
                target: target,
                commands: &commands
            )
        }
        
        return commands
    }
}
