//
//  HCILERemoveDeviceFromWhiteList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Remove Device From White List Command
    ///
    /// Used to remove a single device from the White List stored in the Controller.
    func lowEnergyRemoveDeviceFromWhiteList(_ whiteListDevice: LowEnergyWhiteListDevice, timeout: HCICommandTimeout = .default) async throws {

        try await deviceRequest(HCILERemoveDeviceFromWhiteList(device: whiteListDevice), timeout: timeout)
    }

}

// MARK: - Command

/// LE Remove Device From White List Command
///
/// The command is used to remove a single device from the White List stored in the Controller.
///
/// This command can be used at any time except when:
/// * any advertising filter policy uses the White List and advertising is enabled.
/// * the scanning filter policy uses the White List and scanning is enabled.
/// * the initiator filter policy uses the White List and a create connection command is outstanding.
///
/// Address is ignored when Address Type is set to 0xFF.
@frozen
public struct HCILERemoveDeviceFromWhiteList: HCICommandParameter {  // HCI_LE_Remove_Device_From_White_List

    public static let command = HCILowEnergyCommand.removeDeviceFromWhiteList  //0x0012

    /// The white list device.
    public var device: LowEnergyWhiteListDevice

    public init(device: LowEnergyWhiteListDevice) {
        self.device = device
    }
}

// MARK: - DataConvertible

extension HCILERemoveDeviceFromWhiteList {

    public var data: Data {
        var data = Data()
        data.reserveCapacity(self.dataLength)
        data += self
        return data
    }

    var dataLength: Int {
        return 1 + BluetoothAddress.length
    }

    static func += <T: DataContainer>(data: inout T, value: HCILERemoveDeviceFromWhiteList) {

        data += value.device.addressType.rawValue
        data += value.device.address?.littleEndian ?? .zero
    }
}
