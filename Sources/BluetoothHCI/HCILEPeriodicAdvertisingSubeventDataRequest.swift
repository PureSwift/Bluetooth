//
//  HCILEPeriodicAdvertisingSubeventDataRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

/// LE Periodic Advertising Subevent Data Request Event
///
/// The Controller sends this event to the Host to request data for one or more
/// subevents of a Periodic Advertising with Responses (PAwR) advertising train
/// (Bluetooth 5.4). The Host replies with one or more LE Set Periodic Advertising
/// Subevent Data commands.
@frozen
public struct HCILEPeriodicAdvertisingSubeventDataRequest: HCIEventParameter, Equatable, Hashable, Sendable {

    public static var event: LowEnergyEvent { .periodicAdvertisingSubeventDataRequest }  // 0x27

    public static var length: Int { 3 }

    /// Used to identify an advertising set
    public let advertisingHandle: UInt8  // Advertising_Handle

    /// The first subevent that data is requested for.
    public let subeventStart: UInt8  // Subevent_Start

    /// The number of subevents that data is requested for.
    public let subeventDataCount: UInt8  // Subevent_Data_Count

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.advertisingHandle = data[0]
        self.subeventStart = data[1]
        self.subeventDataCount = data[2]
    }
}
