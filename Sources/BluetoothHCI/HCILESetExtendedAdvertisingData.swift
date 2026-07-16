//
//  HCILESetExtendedAdvertisingData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Set Extended Advertising Data Command
    ///
    /// The command is used to set the data used in advertising PDUs that have a data field.
    func setExtendedAdvertisingData(
        advertisingHandle: UInt8,
        operation: HCILESetExtendedAdvertisingData.Operation,
        fragmentPreference: LowEnergyFragmentPreference,
        advertisingData: [UInt8],
        timeout: HCICommandTimeout = .default
    ) async throws {

        let parameters = HCILESetExtendedAdvertisingData(advertisingHandle: advertisingHandle, operation: operation, fragmentPreference: fragmentPreference, advertisingData: advertisingData)

        try await deviceRequest(parameters, timeout: timeout)
    }
}
#endif

// MARK: - Command

/// LE Set Extended Advertising Data Command
///
/// The command is used to set the data used in advertising PDUs that have a data field.
@frozen
public struct HCILESetExtendedAdvertisingData: HCICommandParameter {

    public static let command = HCILowEnergyCommand.setExtendedAdvertisingData  //0x0037

    public var advertisingHandle: UInt8  //Advertising_Handle
    public var operation: Operation  //Operation
    public var fragmentPreference: LowEnergyFragmentPreference  //Fragment_Preference
    public var advertisingData: [UInt8]  //Advertising_Data

    public init(
        advertisingHandle: UInt8,
        operation: Operation,
        fragmentPreference: LowEnergyFragmentPreference,
        advertisingData: [UInt8]
    ) {

        self.advertisingHandle = advertisingHandle
        self.operation = operation
        self.fragmentPreference = fragmentPreference
        self.advertisingData = advertisingData
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let advertisingDataLength = UInt8(advertisingData.count)

        data += [
            advertisingHandle,
            operation.rawValue,
            fragmentPreference.rawValue,
            advertisingDataLength
        ]
        data += advertisingData
    }

    public enum Operation: UInt8 {  //Operation

        /// Intermediate fragment of fragmented extended advertising data
        case intermediateFragment = 0x00

        /// First fragment of fragmented extended advertising data
        case firstFragment = 0x01

        /// Last fragment of fragmented extended advertising data
        case lastFragment = 0x02

        /// Complete extended advertising data
        case completeExtended = 0x03

        /// Unchanged data (just update the Advertising DID)
        case unchangedData = 0x04
    }
}
