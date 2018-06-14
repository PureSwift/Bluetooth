//
//  GAPChannelMapUpdateIndication.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The channel map (channelMap) used for periodic advertisements may be updated at any time by the advertiser.
/// The advertiser can update the channel map by sending the Channel Map Update Indication data type in the extended header of the packet containing the AUX_SYNC_IND PDU.
/// The advertiser’s Host may provide an initial channel map using the LE Set Host Channel Classification HCI Command; however the advertiser’s Controller can update the channels that were marked as unknown by the Host in the channel map based on channel assessments without being requested to by the Host.
/// The Channel Map Update Indication data type shall only be present in the extended header of the packet containing the AUX_SYNC_IND PDU.
public struct GAPChannelMapUpdateIndication: GAPData {
    
    internal static let length = 7
    
    public static let dataType: GAPDataType = .channelMapUpdateIndication
    
    public var channelMap: (UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public var instant: (UInt8, UInt8)
    
    public init(channelMap: (UInt8, UInt8, UInt8, UInt8, UInt8), instant: (UInt8, UInt8)) {
        
        self.channelMap = channelMap
        self.instant = instant
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(channelMap: (data[0], data[1], data[2], data[3], data[4]), instant: (data[5], data[6]))
    }
    
    public var data: Data {
        
        return Data([channelMap.0, channelMap.1, channelMap.2, channelMap.3, channelMap.4, instant.0, instant.1                                      ])
    }
    
}

extension GAPChannelMapUpdateIndication: Equatable {
    
    public static func == (lhs: GAPChannelMapUpdateIndication, rhs: GAPChannelMapUpdateIndication) -> Bool {
        
        return lhs.channelMap == rhs.channelMap && lhs.instant == rhs.instant
    }
}

extension GAPChannelMapUpdateIndication: CustomStringConvertible {
    
    public var description: String {
        
        return "\(channelMap.0) \(channelMap.1) \(channelMap.2) \(channelMap.3) \(channelMap.4) \(instant.0) \(instant.1)"
    }
}
