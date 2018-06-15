//
//  HCILEReadAdvertisingChannelTxPowerReturn.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Advertising Channel Tx Power Command
    ///
    /// The command is used by the Host to read the transmit power level used for LE advertising channel packets.
    func readAdvertisingChannelTxPower(timeout: HCICommandTimeout = .default) throws -> HCILEReadAdvertisingChannelTxPower.TransmitPowerLevel {
        
        let value = try deviceRequest(HCILEReadAdvertisingChannelTxPower.self,
                                      timeout: timeout)
        
        return value.transmitPowerLevel
    }
}

// MARK: - Return parameter

/// LE Read Advertising Channel Tx Power Command
///
/// The command is used by the Host to read the transmit power level used for LE advertising channel packets.
public struct HCILEReadAdvertisingChannelTxPower: HCICommandReturnParameter { //HCI_LE_Read_Advertising_ Channel_Tx_Power
    
    public static let command = HCILowEnergyCommand.readAdvertisingChannelTXPower // 0x0007
    
    public static let length = 1
    
    public let transmitPowerLevel: TransmitPowerLevel
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let transmitPowerLevel = TransmitPowerLevel(rawValue: Int8(bitPattern: data[0]))
            else { return nil }
        
        self.transmitPowerLevel = transmitPowerLevel
    }
    
    /// Size: 1 Octet (signed integer)
    /// Range: -20 ≤ N ≤ 10
    /// Units: dBm
    /// Accuracy: +/- 4 dB
    public struct TransmitPowerLevel: RawRepresentable, Equatable, Hashable, Comparable {
        
        public static let min = TransmitPowerLevel(-20)
        
        public static let max = TransmitPowerLevel(10)
        
        public let rawValue: Int8
        
        public init?(rawValue: Int8) {
            
            guard rawValue >= TransmitPowerLevel.min.rawValue,
                rawValue <= TransmitPowerLevel.max.rawValue
                else { return nil }
            
            assert((TransmitPowerLevel.min.rawValue ... TransmitPowerLevel.max.rawValue).contains(rawValue))
            
            self.rawValue = rawValue
        }
        
        // Private, unsafe
        private init(_ rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        // Equatable
        public static func == (lhs: TransmitPowerLevel, rhs: TransmitPowerLevel) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
        
        // Comparable
        public static func < (lhs: TransmitPowerLevel, rhs: TransmitPowerLevel) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
        
        // Hashable
        public var hashValue: Int {
            
            return Int(rawValue)
        }
    }
}
