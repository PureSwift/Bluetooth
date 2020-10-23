//
//  HCILEEnhancedTransmitterTest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Enhanced Transmitter Test Command
    ///
    /// This command is used to start a test where the DUT generates test reference packets
    /// at a fixed interval. The Controller shall transmit at maximum power.
    func lowEnergyEnhancedTransmitterTest(txChannel: LowEnergyTxChannel, lengthOfTestData: UInt8, packetPayload: LowEnergyPacketPayload, phy: HCILEEnhancedTransmitterTest.Phy, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILEEnhancedTransmitterTest(txChannel: txChannel, lengthOfTestData: lengthOfTestData, packetPayload: packetPayload, phy: phy)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Enhanced Transmitter Test Command
///
/// This command is used to start a test where the DUT generates test reference packets
/// at a fixed interval. The Controller shall transmit at maximum power.
///
/// An LE Controller supporting the LE_Enhanced Transmitter_Test command shall support
/// Packet_Payload values 0x00, 0x01 and 0x02. An LE Controller supporting the LE Coded PHY
/// shall also support Packet_Payload value 0x04. An LE Controller may support other values
/// of Packet_Payload.
public struct HCILEEnhancedTransmitterTest: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.enhancedTransmitterTest //0x0034
    
    /// N = (F – 2402) / 2
    /// Range: 0x00 – 0x27. Frequency Range : 2402 MHz to 2480 MHz
    public let txChannel: LowEnergyTxChannel //RX_Channel
    
    /// Length in bytes of payload data in each packet
    public let lengthOfTestData: UInt8
    
    public let packetPayload: LowEnergyPacketPayload
    
    public let phy: Phy
    
    public init(txChannel: LowEnergyTxChannel,
                lengthOfTestData: UInt8,
                packetPayload: LowEnergyPacketPayload,
                phy: Phy) {
        
        self.txChannel = txChannel
        self.lengthOfTestData = lengthOfTestData
        self.packetPayload = packetPayload
        self.phy = phy
    }
    
    public var data: Data {
        
        return Data([txChannel.rawValue, lengthOfTestData, packetPayload.rawValue, phy.rawValue])
    }
    
    public enum Phy: UInt8 {
        
        /// Transmitter set to use the LE 1M PHY
        case le1MPhy                =   0x01
        
        /// Transmitter set to use the LE 2M PHY
        case le2MPhy                =   0x02
        
        /// Transmitter set to use the LE Coded PHY with S=8 data coding
        case leCodedPhywithS8       =   0x03
        
        /// Transmitter set to use the LE Coded PHY with S=2 data coding
        case leCodedPhywithS2       =   0x04
    }
}
