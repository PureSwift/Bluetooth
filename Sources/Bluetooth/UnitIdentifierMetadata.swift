//
//  UnitIdentifierMetadata.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

#if canImport(Foundation) && canImport(BluetoothMetadata) && !os(WASI) && !hasFeature(Embedded)
import Foundation
import BluetoothMetadata

public extension UnitIdentifier {
    
    /// The name of the unit.
    var name: String? {
        BluetoothUUID.bit16(rawValue).metadata?.name
    }
    
    /// The Bluetooth type namespace of the unit.
    var type: String? {
        BluetoothUUID.bit16(rawValue).metadata?.type
    }
}
#endif
