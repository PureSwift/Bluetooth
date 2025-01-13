//
//  CompanyIdentifier.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

import Foundation

/// Bluetooth SIG Company Identifier Metadata
public struct CompanyIdentifier: Equatable, Hashable, Codable, Sendable, Identifiable {
    
    public var id: UInt16 { value }
    
    public let value: UInt16
    
    public let name: String
}

public extension CompanyIdentifier {
    
    struct File: BluetoothMetadataFile, Equatable, Hashable, Codable, Sendable {
        
        public let companyIdentifiers: [CompanyIdentifier]
        
        public init(from data: Data) throws {
            self = try Self.decoder.decode(File.self, from: data)
        }
    }
}

public extension CompanyIdentifier.File {
    
    static var fileName: String { "CompanyIdentifier" }
    
    static var fileExtension: String {
        "json"
    }
    
    static var decoder: JSONDecoder {
        .init()
    }
        
    static func load() throws -> Self {
        guard let fileURL = Bundle.module.url(
            forResource: fileName,
            withExtension: fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }
        return try self.init(url: fileURL)
    }
}
