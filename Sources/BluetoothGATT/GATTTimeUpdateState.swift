//
//  GATTTimeUpdateState.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Time Update State
///
/// - SeeAlso: [Time Update State](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_update_state.xml)
@frozen
public struct GATTTimeUpdateState: GATTCharacteristic, Equatable {

    internal static let length = MemoryLayout<UInt8>.size * 2

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.timeUpdateState }

    public var currentState: CurrentState

    public var result: Result

    public init(currentState: CurrentState, result: Result) {

        self.currentState = currentState
        self.result = result
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let currentState = CurrentState(rawValue: data[0])
        else { return nil }

        guard let result = Result(rawValue: data[1])
        else { return nil }

        self.init(currentState: currentState, result: result)
    }

    public var data: Data {

        return Data([currentState.rawValue, result.rawValue])
    }
}

extension GATTTimeUpdateState {

    public enum CurrentState: UInt8 {

        /// Idle
        case idle = 0

        /// Update Pending
        case updatePending = 1
    }

    public enum Result: UInt8 {

        /// Successful
        case successful = 0

        /// Canceled
        case canceled = 1

        /// No Connection To Reference
        case noConnectionToReference = 2

        /// Reference responded with an error
        case referenceRespondedWithError = 3

        /// Timeout
        case timeout = 4

        /// Update not attempted after reset
        case updateNotAttemptedAfterReset = 5
    }
}
