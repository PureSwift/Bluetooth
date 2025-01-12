//
//  BluetoothUUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

import Foundation

/// Bluetooth SIG UUID Identifier Metadata
public struct BluetoothUUID: Equatable, Hashable, Codable, Sendable, Identifiable {
    
    public var id: UInt16 { uuid }
    
    public let uuid: UInt16
    
    public let name: String
    
    public let namespace: String?
    
    public enum CodingKeys: String, CodingKey {
        
        case uuid
        case namespace = "id"
        case name
    }
}

// MARK: - Supporting Types

public extension BluetoothUUID {
    
    struct Category: RawRepresentable, Equatable, Hashable, Codable, Sendable {
        
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension BluetoothUUID.Category: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}

extension BluetoothUUID.Category: CustomStringConvertible {
    
    public var description: String { rawValue }
}

public extension BluetoothUUID.Category {
    
    static var member: BluetoothUUID.Category { "Member" }
    
    static var service: BluetoothUUID.Category { "Service" }
    
    static var characteristic: BluetoothUUID.Category { "Characteristic" }
    
    static var descriptor: BluetoothUUID.Category { "Descriptor" }
    
    static var declaration: BluetoothUUID.Category { "Declaration" }
    
    static var unit: BluetoothUUID.Category { "Unit" }
}

public extension BluetoothUUID {
    
    struct File: BluetoothMetadataFile, Equatable, Hashable, Codable, Sendable {
        
        public let uuids: [BluetoothUUID]
        
        public init(from data: Data) throws {
            self = try Self.decoder.decode(File.self, from: data)
        }
    }
}

public extension BluetoothUUID.File {
    
    static var fileNames: [BluetoothUUID.Category: String] {
        [
            .member: "MemberUUID",
            .service: "ServiceUUID",
            .characteristic: "CharacteristicUUID",
            .descriptor: "DescriptorUUID",
            .declaration: "DeclarationUUID",
            .unit: "UnitIdentifier"
        ]
    }
    
    static var fileExtension: String {
        "json"
    }
    
    static var decoder: JSONDecoder {
        .init()
    }
    
    static func load(_ name: BluetoothUUID.Category) throws -> Self {
        guard let fileName = Self.fileNames[name] else {
            throw CocoaError(.fileNoSuchFile)
        }
        guard let fileURL = Bundle.module.url(
            forResource: fileName,
            withExtension: fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }
        return try self.init(url: fileURL)
    }
    
    static func load() throws -> [BluetoothUUID.Category: Self] {
        let types = Self.fileNames.keys
        var files = [BluetoothUUID.Category: Self]()
        files.reserveCapacity(types.count)
        for type in types {
            let file = try load(type)
            files[type] = file
        }
        assert(files.count == types.count)
        return files
    }
}
