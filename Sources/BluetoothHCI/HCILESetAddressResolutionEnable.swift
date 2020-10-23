//
//  HCILESetAddressResolutionEnable.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Address Resolution Enable Command
    ///
    /// The command is used to enable resolution of Resolvable Private Addresses in the Controller.
    func lowEnergySetAddressResolutionEnable(addressResolutionEnable: HCILESetAddressResolutionEnable.AddressResolutionEnable, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILESetAddressResolutionEnable(addressResolutionEnable: addressResolutionEnable)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Address Resolution Enable Command
///
/// The ommand is used to enable resolution of Resolvable Private Addresses
/// in the Controller. This causes the Controller to use the resolving list
/// whenever the Controller receives a local or peer Resolvable Private Address.
///
/// This command can be used at any time except when
///
/// * Advertising is enabled
/// * Scanning is enabled
/// * Create connection command is outstanding
///
/// Note: enabling address resolution when it is already enabled,
/// or disabling it when it is already disabled, has no effect.
public struct HCILESetAddressResolutionEnable: HCICommandParameter { //HCI_LE_Set_Address_Resolution_ Enable
    
    public static let command = HCILowEnergyCommand.setAddressResolutionEnable //0x002D
    
    public let addressResolutionEnable: AddressResolutionEnable
    
    public init(addressResolutionEnable: AddressResolutionEnable) {
        self.addressResolutionEnable = addressResolutionEnable
    }
    
    public var data: Data {
        return Data([addressResolutionEnable.rawValue])
    }
    
    public enum AddressResolutionEnable: UInt8 {
        
        /// Address Resolution in Controller disabled (default)
        case disabled = 0x00
        
        /// Address Resolution in Controller enabled
        case enabled  = 0x01
    }
}
