//
//  UUID.swift
//  
//
//  Created by Alsey Coleman Miller on 6/15/22.
//

#if os(macOS)
import Foundation
import PDFKit

extension GenerateTool {
    
    static func generateAssignedUUIDs(input: URL, output: [URL]) throws {
        let uuids = try parseAssignedUUID(input)
        uuids.forEach { print($0) }
    }
    
    static func parseAssignedUUID(_ input: URL) throws  -> [AssignedUUID] {
        let parser = try AssignedUUIDParser(url: input)
        let data = try parser.parse()
        return data
    }
}

struct AssignedUUID: Equatable, Hashable, Codable {
    
    public let allocationType: AllocationType
    
    public let value: UInt16
    
    public let name: String
}

extension AssignedUUID {
    
    /// Allocation Types
    enum AllocationType: String, CaseIterable, Codable {
        
        /// Protocol Identifier
        case protocolIdentifier     = "Protocol Identifier"
        
        /// Service Classes and Profiles
        case serviceProfiles        = "Service Classes and Profiles"
        
        /// GATT Service
        case gattService            = "GATT Service"
        
        /// GATT Unit
        case gattUnit               = "GATT Unit"
        
        /// GATT Declarations
        case gattDeclarations       = "GATT Declarations"
        
        /// GATT Descriptor
        case gattDescriptor         = "GATT Descriptor"
        
        /// GATT Characteristic and Object Type
        case gattCharacteristic     = "GATT Characteristic and Object Type"
        
        /// 16-bit UUID for Members
        case memberUUID             = "16-bit UUID for Members"
        
        /// SDO GATT Service
        case sdoGATTService         = "SDO GATT Service"
    }
}

#endif
