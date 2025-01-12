//
//  BluetoothUUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/11/25.
//

import Foundation

struct BluetoothUUIDFile: Equatable, Hashable, Codable, Sendable {
    
    var uuids: [Element]
}

extension BluetoothUUIDFile {
    
    struct Element: Equatable, Hashable, Codable, Sendable {
        
        var id: String?
        
        let uuid: UInt16
        
        let name: String
    }
}

extension GenerateTool {
    
    static func generateBluetoothUUIDs(
        type: String,
        input: URL,
        output: URL
    ) throws {
        let data = try parseUUIDFile(type: type, input: input)
        try generateBluetoothUUIDExtensions(for: data, type: type, output: output)
    }
    
    static func parseUUIDFile(
        type: String,
        input: URL
    ) throws -> [UInt16: BluetoothUUIDFile.Element] {
        let data = try Data(contentsOf: input, options: [.mappedIfSafe])
        let decoder = JSONDecoder()
        let file = try decoder.decode(BluetoothUUIDFile.self, from: data)
        var output = [UInt16: BluetoothUUIDFile.Element]()
        output.reserveCapacity(file.uuids.count)
        for element in file.uuids {
            output[element.uuid] = element
        }
        return output
    }
    
    static func UUIDs(
        from data: [UInt16: BluetoothUUIDFile.Element]
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
        for data: [UInt16: BluetoothUUIDFile.Element],
        type: String,
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
        🖨("    enum \(type) {") // Namespace
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
