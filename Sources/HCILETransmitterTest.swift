//
//  HCILETransmitterTest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Transmitter Test Command
    ///
    /// This command is used to start a test where the DUT generates test reference packets
    /// at a fixed interval. The Controller shall transmit at maximum power.
    func lowEnergyTransmitterTest(txChannel: LowEnergyTxChannel,
                                  lengthOfTestData: UInt8,
                                  packetPayload: LowEnergyPacketPayload,
                                  timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILETransmitterTest(txChannel: txChannel, lengthOfTestData: lengthOfTestData, packetPayload: packetPayload)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Transmitter Test Command
///
/// This command is used to start a test where the DUT generates test reference packets
/// at a fixed interval. The Controller shall transmit at maximum power.
///
/// An LE Controller supporting the LE_Transmitter_Test command shall support Packet_Payload values 0x00,
/// 0x01 and 0x02. An LE Controller may support other values of Packet_Payload.
public struct HCILETransmitterTest: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.transmitterTest //0x001E
    
    /// N = (F – 2402) / 2
    /// Range: 0x00 – 0x27. Frequency Range : 2402 MHz to 2480 MHz
    public let txChannel: LowEnergyTxChannel //RX_Channel
    
    /// Length in bytes of payload data in each packet
    public let lengthOfTestData: UInt8
    
    public let packetPayload: LowEnergyPacketPayload
    
    public init(txChannel: LowEnergyTxChannel,
                lengthOfTestData: UInt8,
                packetPayload: LowEnergyPacketPayload) {
        
        self.txChannel = txChannel
        self.lengthOfTestData = lengthOfTestData
        self.packetPayload = packetPayload
    }
    
    public var data: Data {
        
        return Data([txChannel.rawValue, packetPayload.rawValue])
    }
}
