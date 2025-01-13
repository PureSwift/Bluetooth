//
//  Plugins.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/9/25.
//

import Foundation
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct Plugins: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        BluetoothAddressMacro.self,
        BluetoothUUIDMacro.self,
    ]
}
