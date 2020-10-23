//
//  HCILEEnhancedReceiverTest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Enhanced Receiver Test Command
    ///
    /// This command is used to start a test where the DUT receives test
    /// reference packets at a fixed interval. The tester generates the test
    /// reference packets.
    func lowEnergyEnhancedReceiverTest(rxChannel: LowEnergyRxChannel, phy: HCILEEnhancedReceiverTest.Phy, modulationIndex: HCILEEnhancedReceiverTest.ModulationIndex, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILEEnhancedReceiverTest(rxChannel: rxChannel, phy: phy, modulationIndex: modulationIndex)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Enhanced Receiver Test Command
///
/// This command is used to start a test where the DUT receives test reference packets at a
/// fixed interval. The tester generates the test reference packets.
public struct HCILEEnhancedReceiverTest: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.enhancedReceiverTest //0x0033
    
    public let rxChannel: LowEnergyRxChannel
    public let phy: Phy
    public let modulationIndex: ModulationIndex
    
    public init(rxChannel: LowEnergyRxChannel, phy: Phy, modulationIndex: ModulationIndex) {
        self.rxChannel = rxChannel
        self.phy = phy
        self.modulationIndex = modulationIndex
    }
    
    public var data: Data {
        return Data([rxChannel.rawValue, phy.rawValue, modulationIndex.rawValue])
    }
    
    public enum Phy: UInt8 {
        
        /// Receiver set to use the LE 1M PHY
        case le1MPhy        =   0x01
        
        /// Receiver set to use the LE 2M PHY
        case le2MPhy        =   0x02
        
        /// Receiver set to use the LE Coded PHY
        case leCodedPhy     =   0x03
    }
    
    public enum ModulationIndex: UInt8 {
        
        /// Assume transmitter will have a standard modulation index
        case standard = 0x00
        
        /// Assume transmitter will have a stable modulation index
        case stable   = 0x01
    }
}
