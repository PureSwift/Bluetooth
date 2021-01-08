//
//  HCIAuthenticationComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Authentication Complete Event
///
/// The Authentication Complete event occurs when authentication has been completed for the specified connection. The Connection_Handle must be a Connection_Handle for an ACL connection.
@frozen
public struct HCIAuthenticationComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.authenticationComplete
    
    public static let length: Int = 3
    
    public let status: HCIStatus
    
    /// Connection_Handle for which Authentication has been performed.
    /// Range: 0x0000-0x0EFF (0x0F00 - 0x0FFF Reserved for future use)
    public let handle: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.status = status
        self.handle = handle
    }
    
}
