//
//  HCILEReadMaximumDataLength.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    // MARK: - Return parameter
    
    /// LE Read Maximum Data Length Command
    ///
    /// This ommand allows the Host to read the Controller’s maximum supported payload octets
    /// and packet duration times for transmission and reception
    func lowEnergyReadMaximumDataLengthReturn(timeout: HCICommandTimeout = .default) throws -> HCILEReadMaximumDataLength {
        
        let value = try deviceRequest(HCILEReadMaximumDataLength.self, timeout: timeout)
        
        return value
    }
}

// MARK: - Return parameter

/// LE Read Maximum Data Length Command
///
/// The command allows the Host to read the Controller’s maximum supported payload octets
/// and packet duration times for transmission and reception.
public struct HCILEReadMaximumDataLength: HCICommandReturnParameter { //HCI_LE_Read_Maximum_Data_ Length 1323
    
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
