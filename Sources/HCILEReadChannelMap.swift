//
//  HCILEReadChannelMapReturnParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Channel Map Command
    ///
    /// Returns the current Channel_Map for the specified Connection_Handle. The returned value indicates the state
    /// of the Channel_Map specified by the last transmitted or received Channel_Map (in a CONNECT_IND or LL_CHANNEL_MAP_IND message)
    /// for the specified Connection_Handle, regardless of whether the Master has received an acknowledgment.
    func lowEnergyReadChannelMap(handle: UInt16, timeout: HCICommandTimeout = .default) throws -> LowEnergyChannelMap {
        
        let parameters = HCILEReadChannelMap(connectionHandle: handle)
        
        let returnParameters = try deviceRequest(parameters, HCILEReadChannelMap.ReturnParameter.self, timeout: timeout)
        
        return returnParameters.channelMap
    }
}

// MARK: - Command

/// LE Read Channel Map Command
///
/// The command returns the current Channel_Map for the specified Connection_Handle. The returned value indicates the state
/// of the Channel_Map specified by the last transmitted or received Channel_Map (in a CONNECT_IND or LL_CHANNEL_MAP_IND message)
/// for the specified Connection_Handle, regardless of whether the Master has received an acknowledgment.
public struct HCILEReadChannelMap: HCICommandParameter { // HCI_LE_Read_Channel_Map
    
    public static let command = HCILowEnergyCommand.readChannelMap //0x0015
    
    public var connectionHandle: UInt16 //Connection_Handle
    
    public init(connectionHandle: UInt16) {
        self.connectionHandle = connectionHandle
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        
        return Data([
            connectionHandleBytes.0,
            connectionHandleBytes.1
        ])
    }
}

// MARK: - Return Parameter

public extension HCILEReadChannelMap {
    
    public typealias ReturnParameter = HCILEReadChannelMapReturnParameter
}

/// LE Read Channel Map Command
///
/// The command returns the current Channel_Map for the specified Connection_Handle. The returned value indicates the state
/// of the Channel_Map specified by the last transmitted or received Channel_Map (in a CONNECT_IND or LL_CHANNEL_MAP_IND message)
/// for the specified Connection_Handle, regardless of whether the Master has received an acknowledgment.
public struct HCILEReadChannelMapReturnParameter: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readChannelMap //0x0015
    
    public static let length: Int = 7
    
    public let connectionHandle: UInt16 // Connection_Handle
    
    /// This parameter contains 37 1-bit fields.
    /// The Nth such field (in the range 0 to 36) contains the value for the link layer channel index n.
    /// Channel n is unused = 0.
    /// Channel n is used = 1.
    /// The most significant bits are reserved for future use.
    public let channelMap: LowEnergyChannelMap // Channel_Map
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.channelMap = (data[2], data[3], data[4], data[5], data[6])
    }
}
