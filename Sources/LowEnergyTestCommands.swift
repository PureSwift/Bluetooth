//
//  Test.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Test End Command
    ///
    /// This command is used to stop any test which is in progress.
    func lowEnergyTestEnd(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(HCILowEnergyCommand.TestEndReturnParameter.self,
                                      timeout: timeout)
        
        return value.numberOfPackets
    }
    
    /// LE Enhanced Receiver Test Command
    ///
    /// This command is used to start a test where the DUT receives test
    /// reference packets at a fixed interval. The tester generates the test
    /// reference packets.
    func lowEnergyEnhancedReceiverTest(rxChannel: LowEnergyRxChannel, phy: HCILowEnergyCommand.HCILEEnhancedReceiverTest.Phy, modulationIndex: HCILowEnergyCommand.HCILEEnhancedReceiverTest.ModulationIndex, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILEEnhancedReceiverTest(rxChannel: rxChannel, phy: phy, modulationIndex: modulationIndex)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Enhanced Transmitter Test Command
    ///
    /// This command is used to start a test where the DUT generates test reference packets
    /// at a fixed interval. The Controller shall transmit at maximum power.
    func lowEnergyEnhancedTransmitterTest(txChannel: LowEnergyTxChannel, lengthOfTestData: UInt8, packetPayload: LowEnergyPacketPayload, phy: HCILowEnergyCommand.HCILEEnhancedTransmitterTest.Phy, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILEEnhancedTransmitterTest(txChannel: txChannel, lengthOfTestData: lengthOfTestData, packetPayload: packetPayload, phy: phy)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}
