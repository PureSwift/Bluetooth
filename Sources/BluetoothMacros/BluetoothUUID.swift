//
//  BluetoothUUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/9/25.
//

import Foundation
import SwiftSyntaxMacros
import SwiftSyntax

struct BluetoothUUIDMacro: ExpressionMacro {
    
    static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws(Error) -> ExprSyntax {
        
        guard let argument = node.arguments.first?.expression,
          let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
          segments.count == 1,
          case .stringSegment(let literalSegment)? = segments.first else {
            throw .requiresStaticStringLiteral
        }

        guard validate(literalSegment.content.text) else {
            throw .invalidString("\(argument)")
        }
        
        return "BluetoothUUID(rawValue: \(argument))!"
    }
    
    static func validate(_ rawValue: String) -> Bool {
        switch rawValue.utf8.count {
        case 4:
            guard let _ = UInt16(hexadecimal: rawValue)
                else { return false }
            return true
        case 8:
            guard let _ = UInt32(hexadecimal: rawValue)
                else { return false }
            return true
        case 36:
            guard let _ = UUID(uuidString: rawValue)
                else { return false }
            return true
        default:
            return false
        }
    }
}

// MARK: - Supporting Types

extension BluetoothUUIDMacro {
    
    enum Error: Swift.Error {
        case requiresStaticStringLiteral
        case invalidString(String)
    }
}
