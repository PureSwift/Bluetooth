//
//  HCILEReadBufferSizeReturn.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Buffer Size Command
    ///
    /// The command is used to read the maximum size of the data portion of HCI LE ACL Data Packets sent from the Host to the Controller.
    func readBufferSize(timeout: HCICommandTimeout = .default) throws -> HCILEReadBufferSize {
        
        let bufferSizeReturnParameter = try deviceRequest(HCILEReadBufferSize.self, timeout: timeout)
        
        return bufferSizeReturnParameter
    }
}

// MARK: - Return parameters

/// LE Read Buffer Size Command
///
/// The command is used to read the maximum size of the data portion of HCI LE ACL Data Packets sent from the Host to the Controller.
public struct HCILEReadBufferSize: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readBufferSize //0x0002
    public static let length = 3
    
    public let dataPacketLength: UInt16
    public let dataPacket: UInt8
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let dataPacketLength = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.dataPacketLength = dataPacketLength
        self.dataPacket = data[2]
    }
}
