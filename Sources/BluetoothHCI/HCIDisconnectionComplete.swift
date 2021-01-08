//
//  HCIDisconnectionComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/1/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Disconnection Complete Event
///
/// The Disconnection Complete event occurs when a connection is terminated. The status parameter indicates if the disconnection was successful or not. The reason parameter indicates the reason for the disconnection if the disconnection was successful. If the disconnection was not successful, the value of the reason parameter can be ignored by the Host. For example, this can be the case if the Host has issued the Disconnect command and there was a parameter error, or the command was not presently allowed, or a Connection_Handle that didn’t correspond to a connection was given.
///
/// - Note: When a physical link fails, one Disconnection Complete event will be returned for each logical channel on the physical link with the corresponding Connection_Handle as a parameter.
@frozen
public struct HCIDisconnectionComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.disconnectionComplete
    
    public static let length: Int = 4
    
    public let status: HCIStatus
    
    /// Connection_Handle which was disconnected.
    /// Range: 0x0000-0x0EFF (0x0F00 - 0x0FFF Reserved for future use)
    public let handle: UInt16
    
    /// Reason for disconnection.
    public let error: HCIError
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        guard let error = HCIError(rawValue: data[3])
            else { return nil }
        
        self.status = status
        self.handle = handle
        self.error = error
    }

}
