//
//  HCILESetPeriodicAdvertisingSubeventData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set Periodic Advertising Subevent Data Command
    ///
    /// Used by the Host to set the data for one or more subevents of Periodic
    /// Advertising with Responses (Bluetooth 5.4), in reply to an
    /// LE Periodic Advertising Subevent Data Request event.
    func lowEnergySetPeriodicAdvertisingSubeventData(
        advertisingHandle: UInt8,
        subevents: [HCILESetPeriodicAdvertisingSubeventData<[UInt8]>.Subevent],
        timeout: HCICommandTimeout = .default
    ) async throws -> UInt8 {

        let parameters = HCILESetPeriodicAdvertisingSubeventData(
            advertisingHandle: advertisingHandle,
            subevents: subevents)

        let returnParameter = try await deviceRequest(parameters, HCILESetPeriodicAdvertisingSubeventDataReturn.self, timeout: timeout)

        return returnParameter.advertisingHandle
    }
}

// MARK: - Command

/// LE Set Periodic Advertising Subevent Data Command
///
/// Used by the Host to set the data for one or more subevents of Periodic Advertising
/// with Responses (PAwR) in reply to an LE Periodic Advertising Subevent Data Request
/// event. The data for a subevent will be transmitted only once.
@frozen
public struct HCILESetPeriodicAdvertisingSubeventData<SubeventData: DataContainer>: HCICommandParameter {

    public static var command: HCILowEnergyCommand { .setPeriodicAdvertisingSubeventData }  // 0x0082

    /// Used to identify an advertising set
    public var advertisingHandle: UInt8  // Advertising_Handle

    /// Data for each subevent (maximum of 15 per command).
    public var subevents: [Subevent]

    public init(
        advertisingHandle: UInt8,
        subevents: [Subevent]
    ) {

        self.advertisingHandle = advertisingHandle
        self.subevents = subevents
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += advertisingHandle
        data += UInt8(subevents.count)

        for subevent in subevents {
            data += subevent.subevent
            data += subevent.responseSlotStart
            data += subevent.responseSlotCount
            data += UInt8(subevent.data.count)
            data += subevent.data
        }
    }

    /// Data for a single PAwR subevent.
    public struct Subevent: Equatable, Hashable, Sendable {

        /// The subevent index of the data contained in this command.
        public var subevent: UInt8  // Subevent

        /// The first response slot to be used in this subevent.
        public var responseSlotStart: UInt8  // Response_Slot_Start

        /// The number of response slots to be used.
        public var responseSlotCount: UInt8  // Response_Slot_Count

        /// Advertising data to be transmitted in the subevent.
        public var data: SubeventData  // Subevent_Data

        public init(
            subevent: UInt8,
            responseSlotStart: UInt8,
            responseSlotCount: UInt8,
            data: SubeventData
        ) {

            self.subevent = subevent
            self.responseSlotStart = responseSlotStart
            self.responseSlotCount = responseSlotCount
            self.data = data
        }
    }
}

// MARK: - Return Parameter

/// LE Set Periodic Advertising Subevent Data Command
@frozen
public struct HCILESetPeriodicAdvertisingSubeventDataReturn: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingSubeventData  // 0x0082

    public static let length: Int = 1

    /// Used to identify an advertising set
    public let advertisingHandle: UInt8

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        self.advertisingHandle = data[0]
    }
}
