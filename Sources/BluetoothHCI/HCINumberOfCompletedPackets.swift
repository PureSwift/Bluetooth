//
//  HCINumberOfCompletedPackets.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Number Of Completed Packets event is used by the Controller to indicate to the Host how many HCI Data Packets have been completed (transmitted or flushed) for each Connection_Handle since the previous Number Of Completed Packets event was sent to the Host. This means that the corresponding buffer space has been freed in the Controller. Based on this information, and the HC_Total_Num_ACL_Data_Packets and HC_Total_Num_Synchronous_Data_Packets return parameter of the Read_Buffer_Size command, the Host can determine for which Connection_Handles the following HCI Data Packets should be sent to the Controller. The Number Of Completed Packets event must not be sent before the corresponding Connection Complete event. While the Controller has HCI data packets in its buffer, it must keep sending the Number Of Completed Packets event to the Host at least periodically, until it finally reports that all the pending ACL Data Packets have been transmitted or flushed. The rate with which this event is sent is manufacturer specific.
///
/// - Note: Number Of Completed Packets events will not report on synchronous Connection Handles if synchronous Flow Control is disabled.
@frozen
public struct HCINumberOfCompletedPackets: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.numberOfCompletedPackets
    
    public static let length: Int = 5
    
    public let numberOfHandles: UInt8
    
    public let connectionHandle: UInt16
    
    public let numberOfCompletedPackets: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let numberOfCompletedPackets = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        self.numberOfHandles = data[0]
        self.connectionHandle = connectionHandle
        self.numberOfCompletedPackets = numberOfCompletedPackets
    }
}
