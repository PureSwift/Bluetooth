//
//  GAPPeriodicAdvertisingResponseTimingInformation.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

@_exported import Bluetooth

/// Periodic Advertising Response Timing Information
///
/// Carries the subevent and response slot timing information required by an Observer
/// to synchronize with a Periodic Advertising with Responses (PAwR) advertising train
/// (Bluetooth Core 5.4). Transmitted in the Additional Controller Advertising Data
/// (ACAD) field of `AUX_ADV_IND` PDUs.
///
/// - SeeAlso: Core Specification Supplement, Part A
@frozen
public struct GAPPeriodicAdvertisingResponseTimingInformation: GAPData, Equatable, Hashable, Sendable {

    internal static var length: Int { 4 + 1 + 1 + 1 + 1 }

    /// GAP Data Type
    public static var dataType: GAPDataType { .periodicAdvertisingResponseTimingInformation }

    /// Response Access Address
    ///
    /// The access address to be used by the Observer when it transmits a response
    /// packet back to the Broadcaster.
    public var responseAccessAddress: UInt32

    /// The number of subevents per PAwR event.
    public var numberOfSubevents: UInt8

    /// The time from the start of one subevent to the beginning of the next subevent.
    ///
    /// Expressed as a multiple of 1.25 ms, supporting a range of 7.5 ms to 318.75 ms.
    public var subeventInterval: UInt8

    /// Time from the start of a subevent to the first response slot.
    ///
    /// Expressed as a multiple of 1.25 ms, supporting a range of 1.25 ms to 317.5 ms.
    public var responseSlotDelay: UInt8

    /// Time from the start of one response slot to the beginning of the next response slot.
    ///
    /// Expressed as a multiple of 0.125 ms, supporting a range of 0.25 ms to 31.875 ms.
    public var responseSlotSpacing: UInt8

    public init(
        responseAccessAddress: UInt32,
        numberOfSubevents: UInt8,
        subeventInterval: UInt8,
        responseSlotDelay: UInt8,
        responseSlotSpacing: UInt8
    ) {

        self.responseAccessAddress = responseAccessAddress
        self.numberOfSubevents = numberOfSubevents
        self.subeventInterval = subeventInterval
        self.responseSlotDelay = responseSlotDelay
        self.responseSlotSpacing = responseSlotSpacing
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        let responseAccessAddress = UInt32(
            littleEndian: UInt32(
                bytes: (
                    data[0],
                    data[1],
                    data[2],
                    data[3]
                )))

        self.init(
            responseAccessAddress: responseAccessAddress,
            numberOfSubevents: data[4],
            subeventInterval: data[5],
            responseSlotDelay: data[6],
            responseSlotSpacing: data[7])
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let addressBytes = responseAccessAddress.littleEndian.bytes
        data += [
            addressBytes.0,
            addressBytes.1,
            addressBytes.2,
            addressBytes.3
        ]

        data += numberOfSubevents
        data += subeventInterval
        data += responseSlotDelay
        data += responseSlotSpacing
    }

    public var dataLength: Int {

        return Self.length
    }
}

// MARK: - DataConvertible

extension GAPPeriodicAdvertisingResponseTimingInformation: DataConvertible {

    static func += <T: DataContainer>(data: inout T, value: GAPPeriodicAdvertisingResponseTimingInformation) {
        value.append(to: &data)
    }
}
