//
//  BluetoothSIG.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/11/25.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public protocol BluetoothMetadataFile: Codable {

    init(from data: Data) throws
}

public extension BluetoothMetadataFile {

    init(url: URL) throws {
        let data = try Data(contentsOf: url, options: [.mappedIfSafe])
        try self.init(from: data)
    }
}
