//
//  LowEnergyChannelMap.swift
//  Bluetooth-macOS
//
//  Created by Marco Estrella on 3/29/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// LE Read Channel Map Command
    ///
    /// Returns the current Channel_Map for the specified Connection_Handle. The returned value indicates the state
    /// of the Channel_Map specified by the last transmitted or received Channel_Map (in a CONNECT_IND or LL_CHANNEL_MAP_IND message)
    /// for the specified Connection_Handle, regardless of whether the Master has received an acknowledgment.
    func lowEnergyReadChannelMap(handle: UInt16, timeout: HCICommandTimeout = .default) throws -> LowEnergyChannelMap {
        
        let parameters = LowEnergyCommand.ReadChannelMapParameter(connectionHandle: handle)
        
        let returnParameters = try deviceRequest(parameters, LowEnergyCommand.ReadChannelMapReturnParameter.self, timeout: timeout)
        
        return returnParameters.channelMap
    }
}
