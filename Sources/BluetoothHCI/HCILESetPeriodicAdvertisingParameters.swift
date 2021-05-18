//
//  HCILESetPeriodicAdvertisingParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Periodic Advertising Parameters Command
    ///
    /// The  command is used by the Host to set the parameters for periodic advertising.
    func setSetPeriodicAdvertisingParameters(advertisingHandle: UInt8,
                                             periodicAdvertisingInterval: HCILESetPeriodicAdvertisingParameters.PeriodicAdvertisingInterval,
                                             advertisingEventProperties: HCILESetPeriodicAdvertisingParameters.AdvertisingEventProperties,
                                             timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILESetPeriodicAdvertisingParameters(advertisingHandle: advertisingHandle, periodicAdvertisingInterval: periodicAdvertisingInterval, advertisingEventProperties: advertisingEventProperties)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Periodic Advertising Parameters Command
///
/// The  command is used by the Host to set the parameters for periodic advertising.
///
/// The Advertising_Handle parameter identifies the advertising set whose periodic advertising
/// parameters are being configured. If the corresponding advertising set does not already exist,
/// then the Controller shall return the error code Unknown Advertising Identifier (0x42).
///
/// The Periodic_Advertising_Interval_Min parameter shall be less than or equal to the
/// Periodic_Advertising_Interval_Max parameter. The Periodic_Advertising_Interval_Min and
/// Periodic_Advertising_Interval_Max parameters should not be the same value to enable the Controller to
/// determine the best advertising interval given other activities.
///
/// The Periodic_Advertising_Properties parameter indicates which fields should be included in
/// the advertising packet.
///
/// If the advertising set identified by the Advertising_Handle specified anonymous advertising,
/// the Controller shall return the error code Invalid HCI Parameters (0x12).
///
/// If the Host issues this command when periodic advertising is enabled for the specified
/// advertising set, the Controller shall return the error code Command Disallowed (0x0C).
///
/// If the Advertising_Handle does not identify an advertising set that is already configured for periodic
/// advertising and the Controller is unable to support more periodic advertising at present, the Controller
/// shall return the error code Memory Capacity Exceeded (0x07).
@frozen
public struct HCILESetPeriodicAdvertisingParameters: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingParameters //0x003E
    
    /// Used to identify an advertising set
    public var advertisingHandle: UInt8 //Advertising_Handle
    public var periodicAdvertisingInterval: PeriodicAdvertisingInterval
    public var advertisingEventProperties: AdvertisingEventProperties
    
    public init(advertisingHandle: UInt8,
                periodicAdvertisingInterval: PeriodicAdvertisingInterval,
                advertisingEventProperties: AdvertisingEventProperties) {
        
        self.advertisingHandle = advertisingHandle
        self.periodicAdvertisingInterval = periodicAdvertisingInterval
        self.advertisingEventProperties = advertisingEventProperties
    }
    
    public var data: Data {
        
        let periodicAdvertisingIntervalMinBytes = periodicAdvertisingInterval.rawValue.lowerBound.littleEndian.bytes
        let periodicAdvertisingIntervalMaxBytes = periodicAdvertisingInterval.rawValue.upperBound.littleEndian.bytes
        let advertisingEventPropertiesytes = advertisingEventProperties.rawValue.littleEndian.bytes
        return Data([
            advertisingHandle,
            periodicAdvertisingIntervalMinBytes.0,
            periodicAdvertisingIntervalMinBytes.1,
            periodicAdvertisingIntervalMaxBytes.0,
            periodicAdvertisingIntervalMaxBytes.1,
            advertisingEventPropertiesytes.0,
            advertisingEventPropertiesytes.1
            ])
    }
    
    public struct PeriodicAdvertisingInterval: RawRepresentable, Equatable {
        
        public typealias RawValue = CountableClosedRange<UInt16>
        
        /// Maximum interval range.
        public static let full = PeriodicAdvertisingInterval(rawValue: .min ... .max)
        
        public let rawValue: RawValue
        
        public init(rawValue: RawValue) {
            
            self.rawValue = rawValue
        }
        
        /// Time = N * 0.125 msec.
        public var miliseconds: ClosedRange<Double> {
            
            let miliseconds = Double(0.125)
            
            let min = Double(rawValue.lowerBound) * miliseconds
            
            let max = Double(rawValue.upperBound) * miliseconds
            
            return min ... max
        }
        
        // Equatable
        public static func == (lhs: PeriodicAdvertisingInterval, rhs: PeriodicAdvertisingInterval) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
    }
    
    /// The Advertising_Event_Properties parameter describes the type of advertising event that is being configured
    /// and its basic properties.
    public enum AdvertisingEventProperties: UInt16, BitMaskOption {
        
        /// Include TxPower in the extended header of the advertising PDU
        case includeTxPower = 0b100000
        
        public static let allCases: [HCILESetPeriodicAdvertisingParameters.AdvertisingEventProperties] = [
            .includeTxPower
        ]
    }
}
