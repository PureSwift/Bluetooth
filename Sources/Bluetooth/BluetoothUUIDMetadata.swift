//
//  BluetoothUUIDMetadata.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

#if Metadata
public extension BluetoothUUID {

    /// Bluetooth SIG assigned-numbers metadata for a 16-bit UUID.
    struct Metadata: Equatable, Hashable, Sendable {

        /// The name of the defined UUID.
        public let name: String

        /// The Bluetooth type namespace of the UUID.
        public let type: String?
    }
}

#if !hasFeature(Embedded)
extension BluetoothUUID.Metadata: Codable {}
#endif

public extension BluetoothUUID {

    /// Fetch the metadata for the UUID.
    ///
    /// - SeeAlso: [Assigned Numbers](https://www.bluetooth.com/specifications/assigned-numbers/)
    var metadata: Metadata? {
        guard case let .bit16(rawValue) = self,
            let generated = Self.generatedMetadata(for: rawValue)
        else {
            return nil
        }
        return Metadata(name: generated.name, type: generated.type)
    }
}
#endif
