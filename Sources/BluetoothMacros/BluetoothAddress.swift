//
//  Address.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/9/25.
//

import Foundation
import SwiftSyntaxMacros
import SwiftSyntax

struct BluetoothAddressMacro: ExpressionMacro {
    
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

        guard let _ = Self.parse(literalSegment.content.text) else {
            throw .invalidString("\(argument)")
        }
        
        return "BluetoothAddress(rawValue: \(argument))!"
    }
    
    /// Initialize a Bluetooth Address from its big endian string representation (e.g. `00:1A:7D:DA:71:13`).
    static func parse<S: StringProtocol>(_ rawValue: S) -> ByteValue? {
        
        // verify string length
        let characters = rawValue.utf8
        guard characters.count == 17,
            let separator = ":".utf8.first
            else { return nil }
        
        var bytes: ByteValue = (0, 0, 0, 0, 0, 0)
        
        let components = characters.split(whereSeparator: { $0 == separator })
        
        guard components.count == 6
            else { return nil }
        
        for (index, subsequence) in components.enumerated() {
            
            guard subsequence.count == 2,
                  let byte = UInt8(hexadecimal: subsequence)
                else { return nil }
            
            withUnsafeMutablePointer(to: &bytes) {
                $0.withMemoryRebound(to: UInt8.self, capacity: 6) {
                    $0.advanced(by: index).pointee = byte
                }
            }
        }
        
        return bytes
    }
}

// MARK: - Supporting Types

extension BluetoothAddressMacro {
    
    /// Raw Bluetooth Address 6 byte (48 bit) value.
    typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    enum Error: Swift.Error {
        case requiresStaticStringLiteral
        case invalidString(String)
    }
}
