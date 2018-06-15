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
    
    /// LE Read Local Resolvable Address Command
    ///
    /// The command is used to get the current local Resolvable Private Address
    //// being used for the corresponding peer Identity Address.
    /// The local’s resolvable address being used may change after the command is called.
    ///
    /// This command can be used at any time.
    ///
    /// When a Controller cannot find a Resolvable Private Address associated
    /// with the Peer Identity Address, it shall return the error code
    /// Unknown Connection Identifier (0x02).
    public struct ReadLocalResolvableAddressReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readLocalResolvableAddress //0x002C
        
        public static let length: Int = 6
        
        /// Resolvable Private Address being used by the local device
        public let localResolvableAddress: UInt64 //Local_Resolvable_Address
        
        public init?(data: Data) {
            guard data.count == type(of: self).length
                else { return nil }
            
            self.localResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]))))
        }
    }
    
    /// LE Read Maximum Data Length Command
    ///
    /// The command allows the Host to read the Controller’s maximum supported payload octets
    /// and packet duration times for transmission and reception.
    public struct ReadMaximumDataLengthReturnParameter: HCICommandReturnParameter { //HCI_LE_Read_Maximum_Data_ Length 1323
        
        public static let command = HCILowEnergyCommand.readMaximumDataLength //0x002F
        
        public static let length: Int = 8
        
        /// Maximum number of payload octets that the local Controller supports for transmission
        /// of a single Link Layer packet on a data connection.
        public let supportedMaxTxOctets: LowEnergyMaxTxOctets
        
        /// Maximum time, in microseconds, that the local Controller supports for transmission of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxTxTime: LowEnergyMaxTxTime
        
        /// Maximum number of payload octets that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxRxOctets: SupportedMaxRxOctets
        
        /// Maximum time, in microseconds, that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxRxTime: SupportedMaxRxTime
        
        public init?(data: Data) {
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let supportedMaxTxOctets = LowEnergyMaxTxOctets(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
                else { return nil }
            
            guard let supportedMaxTxTime = LowEnergyMaxTxTime(rawValue: UInt16(littleEndian: UInt16(bytes: (data[2], data[3]))))
                else { return nil }
            
            guard let supportedMaxRxOctets = SupportedMaxRxOctets(rawValue: UInt16(littleEndian: UInt16(bytes: (data[4], data[5]))))
                else { return nil }
            
            guard let supportedMaxRxTime = SupportedMaxRxTime(rawValue: UInt16(littleEndian: UInt16(bytes: (data[6], data[7]))))
                else { return nil }
            
            self.supportedMaxTxOctets = supportedMaxTxOctets
            self.supportedMaxTxTime = supportedMaxTxTime
            self.supportedMaxRxOctets = supportedMaxRxOctets
            self.supportedMaxRxTime = supportedMaxRxTime
        }
        
        /// Maximum time, in microseconds, that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        /// Range 0x0148-0x4290
        public struct SupportedMaxRxTime: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = SupportedMaxRxTime(0x0148)
            
            public static let max = SupportedMaxRxTime(0x4290)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= SupportedMaxRxTime.min.rawValue,
                    rawValue <= SupportedMaxRxTime.max.rawValue
                    else { return nil }
                
                assert((SupportedMaxRxTime.min.rawValue ... SupportedMaxRxTime.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: SupportedMaxRxTime, rhs: SupportedMaxRxTime) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: SupportedMaxRxTime, rhs: SupportedMaxRxTime) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
        
        /// Maximum number of payload octets that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        /// Range 0x001B-0x00FB
        public struct SupportedMaxRxOctets: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = SupportedMaxRxOctets(0x001B)
            
            public static let max = SupportedMaxRxOctets(0x00FB)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= SupportedMaxRxOctets.min.rawValue,
                    rawValue <= SupportedMaxRxOctets.max.rawValue
                    else { return nil }
                
                assert((SupportedMaxRxOctets.min.rawValue ... SupportedMaxRxOctets.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: SupportedMaxRxOctets, rhs: SupportedMaxRxOctets) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: SupportedMaxRxOctets, rhs: SupportedMaxRxOctets) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
    }
    
    /// LE Read PHY Command
    ///
    /// The command is used to read the current transmitter PHY and receiver PHY
    /// on the connection identified by the Connection_Handle.
    public struct ReadPHYReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readPhy //0x0030
        
        public static let length: Int = 4
        
        public let connectionHandle: UInt16
        
        public let txPhy: LowEnergyTxPhy
        
        public let rxPhy: LowEnergyRxPhy
        
        public init?(data: Data) {
            guard data.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            guard let txPhy = LowEnergyTxPhy(rawValue: data[2])
                else { return nil }
            
            guard let rxPhy = LowEnergyRxPhy(rawValue: data[3])
                else { return nil }
            
            self.txPhy = txPhy
            self.rxPhy = rxPhy
        }
    }
    
    /// LE Read Maximum Advertising Data Length Command
    ///
    /// The command is used to read the maximum length of data supported by the Controller for use
    /// as advertisement data or scan response data in an advertising event or as periodic advertisement data.
    public struct ReadMaximumAdvertisingDataLengthReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readMaximumAdvertisingDataLength //0x003A
        
        public static let length: Int = 2
        
        /// Maximum supported advertising data length
        public let maximumAdvertisingDataLength: UInt16
        
        public init?(data: Data) {
            guard data.count == type(of: self).length
                else { return nil }
            
            maximumAdvertisingDataLength = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        }
    }
    
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
