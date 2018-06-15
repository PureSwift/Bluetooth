//
//  HCILEReadTransmitPower.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Transmit Power Command
    ///
    /// The command is used to read the minimum and maximum transmit powers supported by the Controller.ReadTransmitPowerReturnParameter
    func lowEnergyReadTransmitPower(timeout: HCICommandTimeout = .default) throws -> HCILEReadTransmitPower {
        
        return try deviceRequest(HCILEReadTransmitPower.self, timeout: timeout)
    }
}

// MARK: - Return parameter

/// LE Read Transmit Power Command
///
/// The command is used to read the minimum and maximum transmit powers supported by the Controller.
public struct HCILEReadTransmitPower: HCICommandReturnParameter {
    
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
