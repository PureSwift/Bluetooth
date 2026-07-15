//
//  BluetoothSIG.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/11/25.
//

import Foundation

public protocol BluetoothMetadataFile: Codable {

    init(from data: Data) throws
}

public extension BluetoothMetadataFile {

    init(url: URL) throws {
        let data = try Data(contentsOf: url, options: [.mappedIfSafe])
        try self.init(from: data)
    }
}
