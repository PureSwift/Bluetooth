//
//  HCILEReadSuggestedDefaultDataLength.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Suggested Default Data Length Command
    ///
    /// This command allows the Host to read the Host's suggested values (SuggestedMaxTxOctets and SuggestedMaxTxTime)
    /// for the Controller's maximum transmitted number of payload octets and maximum packet transmission time to be used for new connections.
    func lowEnergyReadSuggestedDefaultDataLength(timeout: HCICommandTimeout = .default) throws -> HCILEReadSuggestedDefaultDataLength {
        
        return try deviceRequest(HCILEReadSuggestedDefaultDataLength.self, timeout: timeout)
    }
}

// MARK: - Return parameter

/// LE Read Suggested Default Data Length Command
///
/// This command allows the Host to read the Host's suggested values (SuggestedMaxTxOctets and SuggestedMaxTxTime)
/// for the Controller's maximum transmitted number of payload octets and maximum packet transmission time to be used for new connections.
public struct HCILEReadSuggestedDefaultDataLength: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readSuggestedDefaultDataLengthCommand //0x0023
    
    public static let length: Int = 4
    
    public let suggestedMaxTxOctets: LowEnergyMaxTxOctets
    
    public let suggestedMaxTxTime: LowEnergyMaxTxTime
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let suggestedMaxTxOctetsUInt16 = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let suggestedMaxTxTimeUInt16 = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        guard let suggestedMaxTxOctets = LowEnergyMaxTxOctets(rawValue: suggestedMaxTxOctetsUInt16)
            else { return nil }
        
        guard let suggestedMaxTxTime = LowEnergyMaxTxTime(rawValue: suggestedMaxTxTimeUInt16)
            else { return nil }
        
        self.suggestedMaxTxOctets = suggestedMaxTxOctets
        self.suggestedMaxTxTime = suggestedMaxTxTime
    }
}
