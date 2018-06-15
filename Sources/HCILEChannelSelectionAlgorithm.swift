//
//  HCILEChannelSelectionAlgorithm.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Channel Selection Algorithm Event
///
/// The LE Channel Selection Algorithm Event indicates which channel selection algorithm is used on a data channel connection.
public struct HCILEChannelSelectionAlgorithm: HCIEventParameter {
    
    public static let event = LowEnergyEvent.channelSelectionAlgorithm // 0x14
    
    public static let length: Int = 3
    
    public let connectionHandle: UInt16 // Connection_Handle
    
    public let channelSelectionAlgorithm: ChannelSelectionAlgorithm
    
    public init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        
        let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let channelSelectionAlgorithm = ChannelSelectionAlgorithm.init(rawValue: data[2])
            else { return nil }
        
        self.connectionHandle = connectionHandle
        self.channelSelectionAlgorithm = channelSelectionAlgorithm
    }
    
    public enum ChannelSelectionAlgorithm: UInt8 { // Channel_Selection_Algorithm
        
        /// LE Channel Selection Algorithm #1 is used
        case algorithm1         = 0x00
        
        /// LE Channel Selection Algorithm #2 is used
        case algorithm2         = 0x01
    }
}
