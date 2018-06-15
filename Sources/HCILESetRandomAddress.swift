//
//  HCILESetRandomAddress.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Used by the Host to set the LE Random Device Address in the Controller.
    func lowEnergySetRandomAddress(_ address: Address, timeout: HCICommandTimeout = .default) throws {
        
        // When the LE_Set_Random_Address command has completed, a Command Complete event shall be generated.
        let commandParameter = HCILESetRandomAddress(address: address)
        
        try self.deviceRequest(commandParameter, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Random Address Command
///
/// Used by the Host to set the LE Random Device Address in the Controller.
///
/// If this command is used to change the address, the new random address shall take effect for advertising no later than
/// the next successful LE Set Advertising Enable Command, for scanning no later than the next successful LE Set Scan Enable Command
/// or LE Set Extended Scan Enable Command, and for initiating no later than the next successful LE Create Connection Command
/// or LE Extended Create Connection Command.
///
/// - Note: If Extended Advertising is in use, this command only affects the address used for scanning and initiating.
/// The addresses used for advertising are set by the LE Set Advertising Set Random Address command.
///
/// If the Host issues this command when scanning or legacy advertising is enabled, the Controller shall return the error code Command Disallowed (`0x0C`).
public struct HCILESetRandomAddress: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setRandomAddress // 0x0005
    
    public static let length = 6
    
    public var address: Address
    
    public init(address: Address) {
        
        self.address = address
    }
    
    public var data: Data {
        
        let bytes = address.littleEndian.bytes
        
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5])
    }
}
