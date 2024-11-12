//
//  HCILEAddDeviceToWhiteList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

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
public struct HCILEAddDeviceToWhiteList: HCICommandParameter, Sendable { //HCI_LE_Add_Device_To_White_List
    
    public static var command: HCILowEnergyCommand { .addDeviceToWhiteList } //0x0011
    
    /// The white list device.
    public var device: LowEnergyWhiteListDevice
    
    public init(device: LowEnergyWhiteListDevice) {
        self.device = device
    }
}

// MARK: - DataConvertible

extension HCILEAddDeviceToWhiteList: DataConvertible {
    
    public static var length: Int { 1 + BluetoothAddress.length }
    
    public init?<Data>(data: Data) where Data : DataContainer {
        guard data.count == Self.length else {
            return nil
        }
        guard let addressType = LowEnergyWhiteListAddressType(rawValue: data[0]) else {
            return nil
        }
        let address = BluetoothAddress(littleEndian: BluetoothAddress(data: Data(data.subdata(in: 1 ..< 7)))!)
        switch addressType {
        case .public:
            self.init(device: .public(address))
        case .random:
            self.init(device: .random(address))
        case .anonymous:
            self.init(device: .anonymous)
        }
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += device.addressType.rawValue
        data += (device.address ?? .zero).littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
    
    public var data: Data {
        return Data(self)
    }
}
