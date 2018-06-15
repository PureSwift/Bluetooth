//
//  HCILowEnergyCommandParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Command Return Parameters

public extension HCILowEnergyCommand {
    
    /// LE Read Number of Supported Advertising Sets Command
    ///
    /// The command is used to read the maximum number of advertising sets supported by
    /// the advertising Controller at the same time. Note: The number of advertising sets that
    /// can be supported is not fixed and the Controller can change it at any time because the memory
    /// used to store advertising sets can also be used for other purposes.
    public struct ReadNumberOfSupportedAdvertisingSetsReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readNumberOfSupportedAdvertisingSets //0x003B
        
        public static let length: Int = 1
        
        /// Number of advertising sets supported at the same time
        public let numSupportedAdvertisingSets: UInt8 //Num_Supported_Advertising_Sets
        
        public init?(data: Data) {
            guard data.count == type(of: self).length
                else { return nil }
            
            numSupportedAdvertisingSets = data[0]
        }
    }
    
    /// LE Read Periodic Advertiser List Size Command
    ///
    /// The command is used to read the total number of Periodic Advertiser list entries that can be stored in the Controller.
    public struct ReadPeriodicAdvertisingListSizeReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readPeriodicAdvertiserListSize //0x004A
        
        public static let length: Int = 1
        
        /// Total number of Periodic Advertiser list entries that can be stored in the Controller
        public let periodicAdvertiserListSize: UInt8
        
        public init?(data: Data) {
            guard data.count == type(of: self).length
                else { return nil }
            
            periodicAdvertiserListSize = data[0]
        }
    }
    
    /// LE Read Transmit Power Command
    ///
    /// The command is used to read the minimum and maximum transmit powers supported by the Controller.
    public struct ReadTransmitPowerReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readTransmitPower //0x004B
        
        public static let length: Int = 2
        
        public let minTxPower: TxPower
        
        public let maxTxPower: TxPower
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let minTxPower = TxPower(rawValue: Int8(bitPattern: data[0]))
                else { return nil }
            
            guard let maxTxPower = TxPower(rawValue: Int8(bitPattern: data[1]))
                else { return nil }
            
            self.minTxPower = minTxPower
            self.maxTxPower = maxTxPower
        }
        
        public struct TxPower: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = TxPower(-127)
            
            public static let max = TxPower(126)
            
            public let rawValue: Int8
            
            public init?(rawValue: Int8) {
                
                guard rawValue >= TxPower.min.rawValue,
                    rawValue <= TxPower.max.rawValue
                    else { return nil }
                
                assert((TxPower.min.rawValue ... TxPower.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: Int8) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: TxPower, rhs: TxPower) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: TxPower, rhs: TxPower) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
    }
    
    /// LE Read RF Path Compensation Command
    ///
    /// The command is used to read the RF Path Compensation Values parameter used in the Tx Power Level and RSSI calculation.
    public struct ReadRfPathCompensationReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readRFPathCompensation //0x004C
        
        public static let length: Int = 4
        
        public let rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue
        public let rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let rfTxPathCompensationValue = LowEnergyRfTxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (data[0], data[1]))))
                else { return nil }
                
            guard let rfRxPathCompensationValue = LowEnergyRfTxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (data[2], data[3]))))
                else { return nil }
            
            self.rfTxPathCompensationValue = rfTxPathCompensationValue
            self.rfRxPathCompensationValue = rfRxPathCompensationValue
        }
    }
}
