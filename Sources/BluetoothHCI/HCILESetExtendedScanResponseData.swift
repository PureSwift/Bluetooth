//
//  HCILESetExtendedScanResponseData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Extended Scan Response Data Command
    ///
    /// The command is used to provide scan response data used in scanning response PDUs. This command may be
    /// issued at any time after the advertising set identified by the Advertising_Handle parameter has been
    /// created using the LE Set Extended Advertising Parameters Command (see Section 7.8.53) regardless of
    /// whether advertising in that set is enabled or disabled.
    func setLowEnergyExtendedScanResponseData(advertisingHandle: UInt8,
                                              operation: HCILESetExtendedScanResponseData.Operation,
                                              fragmentPreference: LowEnergyFragmentPreference,
                                              scanResponseData: [UInt8],
                                              timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILESetExtendedScanResponseData(advertisingHandle: advertisingHandle, operation: operation, fragmentPreference: fragmentPreference, scanResponseData: scanResponseData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Extended Scan Response Data Command
///
/// The command is used to provide scan response data used in scanning response PDUs. This command may be
/// issued at any time after the advertising set identified by the Advertising_Handle parameter has been
/// created using the LE Set Extended Advertising Parameters Command (see Section 7.8.53) regardless of
/// whether advertising in that set is enabled or disabled.
public struct HCILESetExtendedScanResponseData: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setExtendedScanResponseData //0x0038
    
    public var advertisingHandle: UInt8 //Advertising_Handle
    public var operation: Operation //Operation
    public var fragmentPreference: LowEnergyFragmentPreference //Fragment_Preference
    public let scanResponseData: [UInt8] //Advertising_Data
    
    public init(advertisingHandle: UInt8, operation: Operation, fragmentPreference: LowEnergyFragmentPreference, scanResponseData: [UInt8]) {
        
        self.advertisingHandle = advertisingHandle
        self.operation = operation
        self.fragmentPreference = fragmentPreference
        self.scanResponseData = scanResponseData
    }
    
    public var data: Data {
        
        let scanResponseDataLength = UInt8(scanResponseData.count)
        
        return Data([advertisingHandle, operation.rawValue,
                     fragmentPreference.rawValue, scanResponseDataLength]) + scanResponseData
    }
    
    public enum Operation: UInt8 { //Operation
        
        /// Intermediate fragment of fragmented scan response da
        case intermediateFragment   = 0x00
        
        /// First fragment of fragmented scan response data
        case firstFragment          = 0x01
        
        /// Last fragment of fragmented scan response data
        case lastFragment           = 0x02
        
        /// Complete scan response data
        case complete       = 0x03
    }
}
