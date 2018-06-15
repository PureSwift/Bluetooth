//
//  HCILETestEnd.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Test End Command
    ///
    /// This command is used to stop any test which is in progress.
    func lowEnergyTestEnd(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(HCILETestEnd.self,
                                      timeout: timeout)
        
        return value.numberOfPackets
    }
}

// MARK: - Return parameter

/// LE Test End Command
///
/// This command is used to stop any test which is in progress. The Number_Of_Packets
/// for a transmitter test shall be reported as 0x0000. The Number_Of_Packets is an unsigned number
/// and contains the number of received packets.
public struct HCILETestEnd: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.testEnd //0x001F
    
    public static let length: Int = 2
    
    public let numberOfPackets: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        numberOfPackets = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
