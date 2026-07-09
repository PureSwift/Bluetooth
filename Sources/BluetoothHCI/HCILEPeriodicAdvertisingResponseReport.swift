//
//  HCILEPeriodicAdvertisingResponseReport.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

/// LE Periodic Advertising Response Report Event
///
/// The Controller sends this event to the Broadcaster's Host to report the responses
/// it received in the response slots of a Periodic Advertising with Responses (PAwR)
/// subevent (Bluetooth 5.4).
@frozen
public struct HCILEPeriodicAdvertisingResponseReport<ResponseData: DataContainer>: HCIEventParameter, Equatable, Hashable, Sendable {

    public static var event: LowEnergyEvent { .periodicAdvertisingResponseReport }  // 0x28

    /// Minimum length (no responses)
    public static var length: Int { 4 }

    /// Used to identify an advertising set
    public let advertisingHandle: UInt8  // Advertising_Handle

    /// The subevent the responses were received in.
    public let subevent: UInt8  // Subevent

    /// Whether the subevent advertising packet was transmitted.
    public let txStatus: TxStatus  // Tx_Status

    /// The responses received in the response slots.
    public let responses: [Response]

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= Self.length
        else { return nil }

        self.advertisingHandle = data[0]
        self.subevent = data[1]

        guard let txStatus = TxStatus(rawValue: data[2])
        else { return nil }
        self.txStatus = txStatus

        let responseCount = Int(data[3])

        var responses = [Response]()
        responses.reserveCapacity(responseCount)

        var offset = 4
        for _ in 0..<responseCount {

            guard data.count >= offset + Response.minimumLength
            else { return nil }

            // 0x7F indicates the value is not available
            let txPowerRawValue = Int8(bitPattern: data[offset])
            let txPower: LowEnergyTxPower?
            if txPowerRawValue == 0x7F {
                txPower = nil
            } else {
                guard let value = LowEnergyTxPower(rawValue: txPowerRawValue)
                else { return nil }
                txPower = value
            }

            let rssiRawValue = Int8(bitPattern: data[offset + 1])
            let rssi: RSSI?
            if rssiRawValue == 0x7F {
                rssi = nil
            } else {
                guard let value = RSSI(rawValue: rssiRawValue)
                else { return nil }
                rssi = value
            }

            let cteType = data[offset + 2]
            let responseSlot = data[offset + 3]

            guard let dataStatus = DataStatus(rawValue: data[offset + 4])
            else { return nil }

            let dataLength = Int(data[offset + 5])
            offset += Response.minimumLength

            guard data.count >= offset + dataLength
            else { return nil }

            let responseData: ResponseData
            if dataLength > 0 {
                responseData = ResponseData(data[offset..<offset + dataLength])
            } else {
                responseData = ResponseData()
            }
            offset += dataLength

            responses.append(
                Response(
                    txPower: txPower,
                    rssi: rssi,
                    cteType: cteType,
                    responseSlot: responseSlot,
                    dataStatus: dataStatus,
                    data: responseData
                ))
        }

        self.responses = responses
    }

    /// Whether the subevent indication was transmitted.
    public enum TxStatus: UInt8, Sendable {

        /// AUX_SYNC_SUBEVENT_IND packet was transmitted.
        case transmitted = 0x00

        /// AUX_SYNC_SUBEVENT_IND packet was not transmitted.
        case notTransmitted = 0x01
    }

    /// Data status of a response.
    public enum DataStatus: UInt8, Sendable {

        /// Data complete
        case complete = 0x00

        /// Data incomplete, more data to come
        case incomplete = 0x01

        /// Failed to receive an AUX_SYNC_SUBEVENT_RSP PDU in this response slot
        case failed = 0xFF
    }

    /// A response received in a response slot.
    public struct Response: Equatable, Hashable, Sendable {

        internal static var minimumLength: Int { 6 }

        /// Transmit power of the response, or `nil` if not available.
        public let txPower: LowEnergyTxPower?  // Tx_Power

        /// RSSI of the response, or `nil` if not available.
        public let rssi: RSSI?  // RSSI

        /// Type of Constant Tone Extension in the response.
        public let cteType: UInt8  // CTE_Type

        /// The response slot the response was received in.
        public let responseSlot: UInt8  // Response_Slot

        /// Data status of the response.
        public let dataStatus: DataStatus  // Data_Status

        /// Response data.
        public let data: ResponseData  // Data

        public init(
            txPower: LowEnergyTxPower?,
            rssi: RSSI?,
            cteType: UInt8,
            responseSlot: UInt8,
            dataStatus: DataStatus,
            data: ResponseData
        ) {

            self.txPower = txPower
            self.rssi = rssi
            self.cteType = cteType
            self.responseSlot = responseSlot
            self.dataStatus = dataStatus
            self.data = data
        }
    }
}
