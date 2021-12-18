//
//  HCILEAddDeviceToWhiteList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
 
    /// LE Add Device To White List Command
    ///
    /// Used to add a single device to the White List stored in the Controller.
    func lowEnergyAddDeviceToWhiteList(_ whiteListDevice: LowEnergyWhiteListDevice, timeout: HCICommandTimeout = .default) async throws {
        
        try await deviceRequest(HCILEAddDeviceToWhiteList(device: whiteListDevice), timeout: timeout)
    }
    
}

// MARK: - Command

/// LE Add Device To White List Command
///
/// The command is used to add a single device to the White List stored in the Controller.
///
/// This command can be used at any time except when:
/// * any advertising filter policy uses the White List and advertising is enabled.
/// * the scanning filter policy uses the White List and scanning is enabled.
/// * the initiator filter policy uses the White List and a create connection command is outstanding.
///
/// When a Controller cannot add a device to the White List because there is no space available,
/// it shall return the error code Memory Capacity Exceeded (0x07).
///
/// Address is ignored when Address Type is set to 0xFF.
@frozen
public struct HCILEAddDeviceToWhiteList: HCICommandParameter { //HCI_LE_Add_Device_To_White_List
    
    public static let command = HCILowEnergyCommand.addDeviceToWhiteList //0x0011
    
    /// The white list device.
    public var device: LowEnergyWhiteListDevice
    
    public init(device: LowEnergyWhiteListDevice) {
        
        self.device = device
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension HCILEAddDeviceToWhiteList: DataConvertible {
    
    var dataLength: Int {
        
        return 1 + BluetoothAddress.length
    }
    
    static func += <T: DataContainer> (data: inout T, value: HCILEAddDeviceToWhiteList) {
        
        data += value.device.addressType.rawValue
        data += value.device.address?.littleEndian ?? .zero
    }
}
