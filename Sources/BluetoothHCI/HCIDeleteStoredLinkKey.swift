//
//  HCIDeleteStoredLinkKey.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Delete Stored Link Key Command
    ///
    /// The Delete_Stored_Link_Key command provides the ability to remove one or more of the link keys stored in the BR/EDR Controller. The BR/EDR Controller can store a limited number of link keys for other BR/EDR devices. Link keys are shared between two BR/EDR devices and are used for all security transac- tions between the two devices. The Delete_All_Flag parameter is used to indicate if all of the stored Link Keys should be deleted. If the Delete_All_Flag indicates that all Link Keys are to be deleted, then the BD_ADDR command parameter must be ignored This command provides the ability to negate all security agreements between two devices. The BD_ADDR command parameter is used to identify which link key to delete. If a link key is currently in use for a connection, then the link key will be deleted when all of the connections are disconnected.
    func deleteStoredLinkKey(address: BluetoothAddress,
                             deleteFlag: HCIDeleteStoredLinkKey.DeleteFlag,
                             timeout: HCICommandTimeout = .default) async throws -> HCIDeleteStoredLinkKeyReturn {
        
        let command = HCIDeleteStoredLinkKey(address: address, deleteFlag: deleteFlag)
        
        return try await deviceRequest(command, HCIDeleteStoredLinkKeyReturn.self, timeout: timeout)
    }
}

// MARK: - Command

/// Delete Stored Link Key Command
///
/// The Delete_Stored_Link_Key command provides the ability to remove one or more of the link keys stored in the BR/EDR Controller. The BR/EDR Controller can store a limited number of link keys for other BR/EDR devices. Link keys are shared between two BR/EDR devices and are used for all security transac- tions between the two devices. The Delete_All_Flag parameter is used to indicate if all of the stored Link Keys should be deleted. If the Delete_All_Flag indicates that all Link Keys are to be deleted, then the BD_ADDR command parameter must be ignored This command provides the ability to negate all security agreements between two devices. The BD_ADDR command parameter is used to identify which link key to delete. If a link key is currently in use for a connection, then the link key will be deleted when all of the connections are disconnected.
@frozen
public struct HCIDeleteStoredLinkKey: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.deleteStoredLinkKey
    
    public static let length = 7
    
    public var address: BluetoothAddress
    
    public var deleteFlag: HCIDeleteStoredLinkKey.DeleteFlag
    
    public init(address: BluetoothAddress, deleteFlag: HCIDeleteStoredLinkKey.DeleteFlag) {
        
        self.address = address
        self.deleteFlag = deleteFlag
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     deleteFlag.rawValue])
    }
}

extension HCIDeleteStoredLinkKey {
    
    public enum DeleteFlag: UInt8 {
        
        /// Delete only the Link Key for specified BD_ADDR
        case onlySpecifiedKey
        
        /// Delete all stored Link Keys.
        case all
    }
}

// MARK: - Return Parameter

@frozen
public struct HCIDeleteStoredLinkKeyReturn: HCICommandReturnParameter {
    
    public static let command = HostControllerBasebandCommand.deleteStoredLinkKey
    
    public static let length: Int = MemoryLayout<UInt16>.size
    
    public var numberKeysDeleted: UInt16
    
    public init?(data: Data) {
        
        guard data.count == HCIDeleteStoredLinkKeyReturn.length
            else { return nil }
        
        self.numberKeysDeleted = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
