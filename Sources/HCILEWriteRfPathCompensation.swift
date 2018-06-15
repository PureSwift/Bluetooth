//
//  HCILEWriteRfPathCompensation.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Write RF Path Compensation Command
    ///
    /// The command is used to indicate the RF path gain or loss between the RF transceiver and
    /// the antenna contributed by intermediate components.
    func lowEnergyWriteRfPathCompensation(rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue,
                                          rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue,
                                          timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILEWriteRfPathCompensation(rfTxPathCompensationValue: rfTxPathCompensationValue,
                                                      rfRxPathCompensationValue: rfRxPathCompensationValue)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Write RF Path Compensation Command
///
/// The command is used to indicate the RF path gain or loss between the RF transceiver and
/// the antenna contributed by intermediate components. A positive value means a net RF path gain
/// and a negative value means a net RF path loss. The RF Tx Path Compensation Value parameter
/// shall be used by the Controller to calculate radiative Tx Power Level used in the TxPower field
/// in the Extended Header using the following equation:
///
/// Radiative Tx Power Level = Tx Power Level at RF transceiver output + RF Tx Path Compensation Value
///
/// For example, if the Tx Power Level is +4 (dBm) at RF transceiver output and the RF
/// Path Compensation Value is -1.5 (dB), the radiative Tx Power Level is +4+(-1.5) = 2.5 (dBm).
///
/// The RF Rx Path Compensation Value parameter shall be used by the Controller to calculate
/// the RSSI value reported to the Host.
public struct HCILEWriteRfPathCompensation: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.writeRFPathCompensation // 0x004D
    
    public var rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue
    public var rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue
    
    public init(rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue,
                rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue) {
        self.rfTxPathCompensationValue = rfTxPathCompensationValue
        self.rfRxPathCompensationValue = rfRxPathCompensationValue
    }
    
    public var data: Data {
        let rfTxPathCompensationValueBytes = UInt16.init(bitPattern: rfTxPathCompensationValue.rawValue).littleEndian.bytes
        
        let rfRxPathCompensationValueBytes = UInt16.init(bitPattern: rfRxPathCompensationValue.rawValue).littleEndian.bytes
        
        return Data([rfTxPathCompensationValueBytes.0,
                     rfTxPathCompensationValueBytes.1,
                     rfRxPathCompensationValueBytes.0,
                     rfRxPathCompensationValueBytes.1])
    }
}
