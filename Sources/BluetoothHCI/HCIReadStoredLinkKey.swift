//
//  HCIReadStoredLinkKey.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Stored Link Key Command
    ///
    /// The Read_Stored_Link_Key command provides the ability to read whether one or more link keys are stored in the BR/EDR Controller. The BR/EDR Controller can store a limited number of link keys for other BR/EDR Controllers. Link keys are shared between two BR/EDR Controllers, and are used for all security transactions between the two devices. The read link key command shall not return the link keys value. A Host device may have additional storage capabilities, which can be used to save additional link keys to be reloaded to the BR/ EDR Controller when needed. The Read_All_Flag parameter is used to indicate if all of the stored Link Keys should be returned. If Read_All_Flag indicates that all Link Keys are to be returned, then the BD_ADDR command parameter must be ignored. The BD_ADDR command parameter is used to identify which link key to read. The stored Link Keys are returned by one or more Return Link Keys events.
    func readStoredLinkKey(address: BluetoothAddress,
                           readFlag: HCIReadStoredLinkKey.ReadFlag,
                           timeout: HCICommandTimeout = .default) async throws -> HCIReadStoredLinkKeyReturn {
        
        let command = HCIReadStoredLinkKey(address: address, readFlag: readFlag)
        
        return try await deviceRequest(command, HCIReadStoredLinkKeyReturn.self, timeout: timeout)
    }
}

// MARK: - Command

/// Read Stored Link Key Command
///
/// The Read_Stored_Link_Key command provides the ability to read whether one or more link keys are stored in the BR/EDR Controller. The BR/EDR Controller can store a limited number of link keys for other BR/EDR Controllers. Link keys are shared between two BR/EDR Controllers, and are used for all security transactions between the two devices. The read link key command shall not return the link keys value. A Host device may have additional storage capabilities, which can be used to save additional link keys to be reloaded to the BR/ EDR Controller when needed. The Read_All_Flag parameter is used to indicate if all of the stored Link Keys should be returned. If Read_All_Flag indicates that all Link Keys are to be returned, then the BD_ADDR command parameter must be ignored. The BD_ADDR command parameter is used to identify which link key to read. The stored Link Keys are returned by one or more Return Link Keys events.
@frozen
public struct HCIReadStoredLinkKey: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.readStoredLinkKey
    
    public static let length = 7
    
    public var address: BluetoothAddress
    
    public var readFlag: HCIReadStoredLinkKey.ReadFlag
    
    public init(address: BluetoothAddress, readFlag: HCIReadStoredLinkKey.ReadFlag) {
        
        self.address = address
        self.readFlag = readFlag
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     readFlag.rawValue])
    }
}

extension HCIReadStoredLinkKey {
    
    public enum ReadFlag: UInt8 {
        
        /// Return Link Key for specified BD_ADDR.
        case onlySpecifiedKey
        
        /// Return all stored Link Keys.
        case all
    }
}

// MARK: - Return Parameter

@frozen
public struct HCIReadStoredLinkKeyReturn: HCICommandReturnParameter {
    
    public static let command = HostControllerBasebandCommand.readStoredLinkKey
    
    public static let length: Int = 4
    
    /// Total Number of Link Keys that the Controller can store.
    /// Range: 0x0000 – 0xFFFF
    public var maxNumberKeys: UInt16
    
    /// Number of Link Keys Read.
    /// Range: 0x0000 – 0xFFFF
    public var numberKeysRead: UInt16
    
    public init?(data: Data) {
        
        guard data.count == HCIReadStoredLinkKeyReturn.length
            else { return nil }
        
        self.maxNumberKeys = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.numberKeysRead = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
    }
}
