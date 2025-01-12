//
//  BluetoothUUIDMetadata.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

#if canImport(Foundation) && canImport(BluetoothMetadata) && !os(WASI) && !hasFeature(Embedded)
import Foundation
import BluetoothMetadata

public extension BluetoothUUID {
    
    /// Fetch the metadata for the UUID.
    var metadata: BluetoothMetadata.BluetoothUUID? {
        guard case let .bit16(rawValue) = self else {
            return nil
        }
        for file in files.values {
            if let metadata = file[rawValue] {
                return metadata
            }
        }
        return nil
    }
}

internal let files: [BluetoothMetadata.BluetoothUUID.Category: BluetoothMetadata.BluetoothUUID.File] = {
    do {
        return try BluetoothMetadata.BluetoothUUID.File.load()
    }
    catch {
        assertionFailure("Unable to load metadata: \(error)")
        return [:]
    }
}()

#endif
