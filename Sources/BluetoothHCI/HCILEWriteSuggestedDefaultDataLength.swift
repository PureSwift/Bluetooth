//
//  HCILEWriteSuggestedDefaultDataLength.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Write Suggested Default Data Length Command
    ///
    /// The command allows the Host to specify its suggested values for the Controller's maximum transmission number
    /// of payload octets and maximum packet transmission time to be used for new connections.
    func lowEnergyWriteSuggestedDefaultDataLength(
        suggestedMaxTxOctets: LowEnergyMaxTxOctets,
        suggestedMaxTxTime: LowEnergyMaxTxTime,
        timeout: HCICommandTimeout = .default
    ) async throws {

        let parameters = HCILEWriteSuggestedDefaultDataLength(
            suggestedMaxTxOctets: suggestedMaxTxOctets,
            suggestedMaxTxTime: suggestedMaxTxTime)

        try await deviceRequest(parameters, timeout: timeout)
    }
}
#endif

// MARK: - Command

/// LE Write Suggested Default Data Length Command
///
/// The command allows the Host to specify its suggested values for the Controller's maximum transmission number
/// of payload octets and maximum packet transmission time to be used for new connections.
@frozen
public struct HCILEWriteSuggestedDefaultDataLength: HCICommandParameter {

    public static let command = HCILowEnergyCommand.writeSuggestedDefaultDataLengthCommand  //0x0024

    public var suggestedMaxTxOctets: LowEnergyMaxTxOctets

    public var suggestedMaxTxTime: LowEnergyMaxTxTime

    public init(
        suggestedMaxTxOctets: LowEnergyMaxTxOctets,
        suggestedMaxTxTime: LowEnergyMaxTxTime
    ) {
        self.suggestedMaxTxOctets = suggestedMaxTxOctets
        self.suggestedMaxTxTime = suggestedMaxTxTime
    }

    public func append<Data: DataContainer>(to data: inout Data) {
        let suggestedMaxTxOctetsBytes = suggestedMaxTxOctets.rawValue.littleEndian.bytes
        let suggestedMaxTxTimeBytes = suggestedMaxTxTime.rawValue.littleEndian.bytes

        data += [
            suggestedMaxTxOctetsBytes.0,
            suggestedMaxTxOctetsBytes.1,
            suggestedMaxTxTimeBytes.0,
            suggestedMaxTxTimeBytes.1
        ]
    }
}
