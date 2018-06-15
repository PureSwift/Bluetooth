//
//  HCISetHostChannelClassification.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Command

/// LE Set Host Channel Classification Command
///
/// command allows the Host to specify a channel classification for data channels based
/// on its “local information”. This classification persists until overwritten with a subsequent LE_Set_Host_Channel_Classification command or
/// until the Controller is reset using the Reset command
public struct HCILESetHostChannelClassification: HCICommandParameter { // HCI_LE_Set_Host_Channel_Classification
    
    public static let command = HCILowEnergyCommand.setHostChannelClassification //0x0014
    
    /// This parameter contains 37 1-bit fields.
    /// The nth such field (in the range 0 to 36) contains the value for the link layer channel index n.
    /// Channel n is bad = 0. Channel n is unknown = 1.
    /// The most significant bits are reserved and shall be set to 0for future use.
    /// At least one channel shall be marked as unknown.
    public let channelMap: LowEnergyChannelMap  //Channel_Map
    
    public init(channelMap: LowEnergyChannelMap) {
        self.channelMap = channelMap
    }
    
    public var data: Data {
        return Data([
            channelMap.0,
            channelMap.1,
            channelMap.2,
            channelMap.3,
            channelMap.4
            ])
    }
}
