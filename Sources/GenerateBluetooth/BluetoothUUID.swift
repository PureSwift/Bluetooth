//
//  BluetoothUUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/11/25.
//

import Foundation
import BluetoothMetadata

extension GenerateTool {
    
    static func generateBluetoothUUIDs(
        type: BluetoothMetadata.BluetoothUUID.Category,
        output: URL
    ) throws {
        let data = try parseUUIDFile(type: type)
        try generateBluetoothUUIDExtensions(for: data, type: type, output: output)
    }
    
    static func parseUUIDFile(
        type: BluetoothMetadata.BluetoothUUID.Category
    ) throws -> [UInt16: BluetoothMetadata.BluetoothUUID] {
        let file = try BluetoothMetadata.BluetoothUUID.File(type)
        var output = [UInt16: BluetoothMetadata.BluetoothUUID]()
        output.reserveCapacity(file.uuids.count)
        for element in file.uuids {
            output[element.uuid] = element
        }
        return output
    }
    
    static func UUIDs(
        from data: [UInt16: BluetoothMetadata.BluetoothUUID]
    ) -> [(id: UInt16, name: String, member: String)] {
        let blacklist: [UInt16] = [
            .max // remove internal use identifier
        ]
        let units = data
            .sorted(by: { $0.key < $1.key })
            .filter { blacklist.contains($0.key) == false }
        var memberNames = [UInt16: String]()
        memberNames.reserveCapacity(units.count)
        for (id, metadata) in units {
            var memberName = metadata.name
                .sanitizeName(prefix: "uuid")
                .llamaCase()
            var duplicateNumber = 1
            while memberNames.values.contains(memberName) {
                duplicateNumber += 1
                memberName = memberName + "\(duplicateNumber)"
            }
            memberNames[id] = memberName
        }
        return units.map { ($0, $1.name, memberNames[$0]!) }
    }
    
    static func generateBluetoothUUIDExtensions(
        for data: [UInt16: BluetoothMetadata.BluetoothUUID],
        type: BluetoothMetadata.BluetoothUUID.Category,
        output: URL
    ) throws {
        
        var generatedCode = ""
        let uuids = UUIDs(from: data)
        
        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }
                
        🖨("//")
        🖨("//  \(output.lastPathComponent)")
        🖨("//  Bluetooth")
        🖨("//")
        🖨("")
        🖨("public extension BluetoothUUID {")
        🖨("")
        🖨("    enum \(type.rawValue) {") // Namespace
        🖨("")
        
        for (id, name, memberName) in uuids {
            
            let hexLiteral = "0x" + id.toHexadecimal()
            
            🖨("        /// " + name + " " + "(`\(hexLiteral)`)")
            🖨("        @_alwaysEmitIntoClient")
            🖨("        public static var " + memberName + ": BluetoothUUID {")
            🖨("            .bit16(\(hexLiteral))")
            🖨("        }")
            🖨("")
        }
        🖨("    }")
        🖨("}")
        
        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated \(output.path)")
    }
}
