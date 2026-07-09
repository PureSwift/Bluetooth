//
//  HCILESetPeriodicAdvertisingResponseData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set Periodic Advertising Response Data Command
    ///
    /// Used by the Host to set the data for a response slot in a specific subevent
    /// of a Periodic Advertising with Responses (PAwR) advertising train
    /// (Bluetooth 5.4).
    func lowEnergySetPeriodicAdvertisingResponseData<ResponseData: DataContainer>(
        _ parameters: HCILESetPeriodicAdvertisingResponseData<ResponseData>,
        timeout: HCICommandTimeout = .default
    ) async throws -> UInt16 {

        let returnParameter = try await deviceRequest(parameters, HCILESetPeriodicAdvertisingResponseDataReturn.self, timeout: timeout)

        return returnParameter.syncHandle
    }
}

// MARK: - Command

/// LE Set Periodic Advertising Response Data Command
///
/// Used by the Host to set the data for a response slot in a specific subevent of the
/// PAwR advertising train identified by the Sync_Handle. The data for a response slot
/// will be transmitted only once.
@frozen
public struct HCILESetPeriodicAdvertisingResponseData<ResponseData: DataContainer>: HCICommandParameter {

    public static var command: HCILowEnergyCommand { .setPeriodicAdvertisingResponseData }  // 0x0083

    /// Identifies the PAwR advertising train.
    public var syncHandle: UInt16  // Sync_Handle

    /// The periodic event counter of the request the response is sent to.
    public var requestEvent: UInt16  // Request_Event

    /// The subevent of the request the response is sent to.
    public var requestSubevent: UInt8  // Request_Subevent

    /// The subevent that the response shall be sent in.
    public var responseSubevent: UInt8  // Response_Subevent

    /// The response slot that the response shall be sent in.
    public var responseSlot: UInt8  // Response_Slot

    /// The response data.
    public var responseData: ResponseData  // Response_Data

    public init(
        syncHandle: UInt16,
        requestEvent: UInt16,
        requestSubevent: UInt8,
        responseSubevent: UInt8,
        responseSlot: UInt8,
        responseData: ResponseData
    ) {

        self.syncHandle = syncHandle
        self.requestEvent = requestEvent
        self.requestSubevent = requestSubevent
        self.responseSubevent = responseSubevent
        self.responseSlot = responseSlot
        self.responseData = responseData
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let syncHandleBytes = syncHandle.littleEndian.bytes
        let requestEventBytes = requestEvent.littleEndian.bytes

        data += [
            syncHandleBytes.0,
            syncHandleBytes.1,
            requestEventBytes.0,
            requestEventBytes.1,
            requestSubevent,
            responseSubevent,
            responseSlot,
            UInt8(responseData.count)
        ]

        data += responseData
    }
}

// MARK: - Return Parameter

/// LE Set Periodic Advertising Response Data Command
@frozen
public struct HCILESetPeriodicAdvertisingResponseDataReturn: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingResponseData  // 0x0083

    public static let length: Int = 2

    /// Identifies the PAwR advertising train.
    public let syncHandle: UInt16

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        self.syncHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
