//
//  HCILEWriteSuggestedDefaultDataLength.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Write Suggested Default Data Length Command
    ///
    /// The command allows the Host to specify its suggested values for the Controller's maximum transmission number
    /// of payload octets and maximum packet transmission time to be used for new connections.
    func lowEnergyWriteSuggestedDefaultDataLength(suggestedMaxTxOctets: LowEnergyMaxTxOctets,
                                                  suggestedMaxTxTime: LowEnergyMaxTxTime,
                                                  timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILEWriteSuggestedDefaultDataLength(suggestedMaxTxOctets: suggestedMaxTxOctets,
                                                                                  suggestedMaxTxTime: suggestedMaxTxTime)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Write Suggested Default Data Length Command
///
/// The command allows the Host to specify its suggested values for the Controller's maximum transmission number
/// of payload octets and maximum packet transmission time to be used for new connections.
public struct HCILEWriteSuggestedDefaultDataLength: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.writeSuggestedDefaultDataLengthCommand //0x0024
    
    public var suggestedMaxTxOctets: LowEnergyMaxTxOctets
    
    public var suggestedMaxTxTime: LowEnergyMaxTxTime
    
    public init(suggestedMaxTxOctets: LowEnergyMaxTxOctets,
                suggestedMaxTxTime: LowEnergyMaxTxTime) {
        self.suggestedMaxTxOctets = suggestedMaxTxOctets
        self.suggestedMaxTxTime = suggestedMaxTxTime
    }
    
    public var data: Data {
        let suggestedMaxTxOctetsBytes = suggestedMaxTxOctets.rawValue.littleEndian.bytes
        let suggestedMaxTxTimeBytes = suggestedMaxTxTime.rawValue.littleEndian.bytes
        
        return Data([
            suggestedMaxTxOctetsBytes.0,
            suggestedMaxTxOctetsBytes.1,
            suggestedMaxTxTimeBytes.0,
            suggestedMaxTxTimeBytes.1
            ])
    }
}
