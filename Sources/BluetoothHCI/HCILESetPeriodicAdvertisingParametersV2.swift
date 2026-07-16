//
//  HCILESetPeriodicAdvertisingParametersV2.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Set Periodic Advertising Parameters Command (v2)
    ///
    /// The command is used by the Host to set the parameters for periodic advertising,
    /// including the subevent parameters required for Periodic Advertising with
    /// Responses (Bluetooth 5.4).
    func setPeriodicAdvertisingParametersV2(
        _ parameters: HCILESetPeriodicAdvertisingParametersV2,
        timeout: HCICommandTimeout = .default
    ) async throws -> UInt8 {

        let returnParameter = try await deviceRequest(parameters, HCILESetPeriodicAdvertisingParametersV2Return.self, timeout: timeout)

        return returnParameter.advertisingHandle
    }
}
#endif

// MARK: - Command

/// LE Set Periodic Advertising Parameters Command (v2)
///
/// The command is used by the Host to set the parameters for periodic advertising.
///
/// Version 2 (Bluetooth 5.4) adds the `Num_Subevents`, `Subevent_Interval`,
/// `Response_Slot_Delay`, `Response_Slot_Spacing`, and `Num_Response_Slots`
/// parameters, which configure the Controller for Periodic Advertising with
/// Responses (PAwR).
@frozen
public struct HCILESetPeriodicAdvertisingParametersV2: HCICommandParameter {

    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingParametersV2  // 0x0086

    public typealias PeriodicAdvertisingInterval = HCILESetPeriodicAdvertisingParameters.PeriodicAdvertisingInterval

    public typealias AdvertisingEventProperties = HCILESetPeriodicAdvertisingParameters.AdvertisingEventProperties

    /// Used to identify an advertising set
    public var advertisingHandle: UInt8  // Advertising_Handle

    public var periodicAdvertisingInterval: PeriodicAdvertisingInterval

    public var advertisingEventProperties: AdvertisingEventProperties

    /// Number of subevents per PAwR event.
    ///
    /// A value of 0 disables Periodic Advertising with Responses.
    public var numberOfSubevents: UInt8  // Num_Subevents

    /// Time between the subevents of PAwR.
    ///
    /// Time = N × 1.25 ms
    public var subeventInterval: UInt8  // Subevent_Interval

    /// Time between the advertising packet in a subevent and the first response slot.
    ///
    /// Time = N × 1.25 ms
    public var responseSlotDelay: UInt8  // Response_Slot_Delay

    /// Time between response slots.
    ///
    /// Time = N × 0.125 ms
    public var responseSlotSpacing: UInt8  // Response_Slot_Spacing

    /// Number of subevent response slots.
    public var numberOfResponseSlots: UInt8  // Num_Response_Slots

    public init(
        advertisingHandle: UInt8,
        periodicAdvertisingInterval: PeriodicAdvertisingInterval,
        advertisingEventProperties: AdvertisingEventProperties,
        numberOfSubevents: UInt8 = 0,
        subeventInterval: UInt8 = 0,
        responseSlotDelay: UInt8 = 0,
        responseSlotSpacing: UInt8 = 0,
        numberOfResponseSlots: UInt8 = 0
    ) {

        self.advertisingHandle = advertisingHandle
        self.periodicAdvertisingInterval = periodicAdvertisingInterval
        self.advertisingEventProperties = advertisingEventProperties
        self.numberOfSubevents = numberOfSubevents
        self.subeventInterval = subeventInterval
        self.responseSlotDelay = responseSlotDelay
        self.responseSlotSpacing = responseSlotSpacing
        self.numberOfResponseSlots = numberOfResponseSlots
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let intervalMinBytes = periodicAdvertisingInterval.rawValue.lowerBound.littleEndian.bytes
        let intervalMaxBytes = periodicAdvertisingInterval.rawValue.upperBound.littleEndian.bytes
        let propertiesBytes = advertisingEventProperties.rawValue.littleEndian.bytes

        data += [
            advertisingHandle,
            intervalMinBytes.0,
            intervalMinBytes.1,
            intervalMaxBytes.0,
            intervalMaxBytes.1,
            propertiesBytes.0,
            propertiesBytes.1,
            numberOfSubevents,
            subeventInterval,
            responseSlotDelay,
            responseSlotSpacing,
            numberOfResponseSlots
        ]
    }
}

// MARK: - Return Parameter

/// LE Set Periodic Advertising Parameters Command (v2)
@frozen
public struct HCILESetPeriodicAdvertisingParametersV2Return: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingParametersV2  // 0x0086

    public static let length: Int = 1

    /// Used to identify an advertising set
    public let advertisingHandle: UInt8

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        self.advertisingHandle = data[0]
    }
}
