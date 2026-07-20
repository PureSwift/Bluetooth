//
//  GATTClientSupportedFeatures.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// Client Supported Features
///
/// The Client Supported Features characteristic is used by the client to inform the server
/// which features are supported by the client. The value is a variable-length bit field;
/// each bit, when set, indicates support for the associated feature.
///
/// - SeeAlso: [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/) Vol 3 Part G 7.2
@frozen
public struct GATTClientSupportedFeatures: GATTCharacteristic, Equatable, Hashable, Sendable {

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.clientSupportedFeatures }

    /// The features supported by the client.
    public var features: Feature

    public init(features: Feature = []) {

        self.features = features
    }

    public init?<Data: DataContainer>(data: Data) {

        guard let bitmask = Feature.RawValue(bitmaskArray: data)
        else { return nil }

        self.features = Feature(rawValue: bitmask)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data.append(contentsOf: features.rawValue.bitmaskArray)
    }

    public var dataLength: Int {

        return features.rawValue.bitmaskArray.count
    }

    /// GATT client features.
    @frozen
    public struct Feature: OptionSet, Hashable, Sendable, CaseIterable {

        public let rawValue: UInt64

        public init(rawValue: UInt64) {
            self.rawValue = rawValue
        }

        /// Robust Caching
        ///
        /// The client supports robust caching.
        public static let robustCaching = Feature(rawValue: 0b001)

        /// Enhanced ATT bearer
        ///
        /// The client supports the Enhanced ATT bearer (EATT).
        public static let enhancedATT = Feature(rawValue: 0b010)

        /// Multiple Handle Value Notifications
        ///
        /// The client supports receiving `ATT_MULTIPLE_HANDLE_VALUE_NTF` PDUs.
        public static let multipleHandleValueNotifications = Feature(rawValue: 0b100)

        public static var allCases: [Feature] {
            [
                .robustCaching,
                .enhancedATT,
                .multipleHandleValueNotifications
            ]
        }
    }
}
