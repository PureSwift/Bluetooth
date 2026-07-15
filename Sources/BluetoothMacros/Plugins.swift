//
//  Plugins.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/9/25.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct Plugins: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        BluetoothAddressMacro.self,
        BluetoothUUIDMacro.self
    ]
}
