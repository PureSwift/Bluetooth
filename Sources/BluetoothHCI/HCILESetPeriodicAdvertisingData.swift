//
//  HCILESetPeriodicAdvertisingData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Periodic Advertising Data Command
    ///
    /// The command is used to set the data used in periodic advertising PDUs.
    func setSetPeriodicAdvertisingData(advertisingHandle: UInt8,
                                       operation: HCILESetPeriodicAdvertisingData.Operation,
                                       advertisingData: [UInt8],
                                       timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILESetPeriodicAdvertisingData(advertisingHandle: advertisingHandle, operation: operation, advertisingData: advertisingData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Periodic Advertising Data Command
///
/// The command is used to set the data used in periodic advertising PDUs.
public struct HCILESetPeriodicAdvertisingData: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingData //0x003F
    
    public var advertisingHandle: UInt8 //Advertising_Handle
    public var operation: Operation //Operation
    public var advertisingData: [UInt8] //Advertising_Data
    
    public init(advertisingHandle: UInt8,
                operation: Operation,
                advertisingData: [UInt8]) {
        
        self.advertisingHandle = advertisingHandle
        self.operation = operation
        self.advertisingData = advertisingData
    }
    
    public var data: Data {
        
        let advertisingDataLength = UInt8(advertisingData.count)
        
        return Data([advertisingHandle,
                     operation.rawValue,
                     advertisingDataLength]) + advertisingData
    }
    
    public enum Operation: UInt8 { //Operation
        
        /// Intermediate fragment of fragmented periodic advertising data
        case intermediateFragment   = 0x00
        
        /// First fragment of fragmented periodic advertising data
        case firstFragment          = 0x01
        
        /// Last fragment of fragmented periodic advertising data
        case lastFragment           = 0x02
        
        /// Complete periodic advertising data
        case complete       = 0x03
    }
}
