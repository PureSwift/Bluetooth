//
//  Test.swift
//  Bluetooth-macOS
//
//  Created by Marco Estrella on 4/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Receiver Test Command
    ///
    /// This command is used to start a test where the DUT receives test reference packets at a fixed interval.
    /// The tester generates the test reference packets.
    func lowEnergyReceiverTest(rxChannel: RxChannel, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.ReceiverTestParameter(rxChannel: rxChannel)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Transmitter Test Command
    ///
    /// This command is used to start a test where the DUT generates test reference packets
    /// at a fixed interval. The Controller shall transmit at maximum power.
    func lowEnergyTransmitterTest(rxChannel: RxChannel,
                                  lengthOfTestData: UInt8,
                                  packetPayload: PacketPayload,
                                  timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.TransmitterTestParameter(rxChannel: rxChannel, lengthOfTestData: lengthOfTestData, packetPayload: packetPayload)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Test End Command
    ///
    /// This command is used to stop any test which is in progress.
    func lowEnergyTestEnd(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(LowEnergyCommand.TestEndReturnParameter.self,
                                      timeout: timeout)
        
        return value.numberOfPackets
    }
    
    /// LE Enhanced Receiver Test Command
    ///
    /// This command is used to start a test where the DUT receives test
    /// reference packets at a fixed interval. The tester generates the test
    /// reference packets.
    func lowEnergyEnhancedReceiverTest(rxChannel: RxChannel, phy: LowEnergyCommand.EnhancedReceiverTestParameter.Phy, modulationIndex: LowEnergyCommand.EnhancedReceiverTestParameter.ModulationIndex, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.EnhancedReceiverTestParameter(rxChannel: rxChannel, phy: phy, modulationIndex: modulationIndex)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}
