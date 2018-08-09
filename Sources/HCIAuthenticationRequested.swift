//
//  HCIAuthenticationRequested.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/9/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read LMP Handle Command
    ///
    /// This command reads the current LMP Handle associated with the Connection_Handle. The Connection_Handle shall be a SCO or eSCO Handle. If the Connection_Handle is a SCO Connection_Handle, then this command shall read the LMP SCO Handle for this connection. If the Connection_Handle is an eSCO Connection_Handle, then this command shall read the LMP eSCO Handle for this connection.
    func authenticationRequested(handle: UInt16,
                                 timeout: HCICommandTimeout = .default) throws -> HCIStatus {
        
        let command = HCIAuthenticationRequested(handle: handle)
        
        return try deviceRequest(command,
                                 HCIAuthenticationComplete.self,
                                 timeout: timeout).status
    }
}

// MARK: - Command

/// Authentication Requested Command
///
/// The Authentication_Requested command is used to try to authenticate the remote device associated with the specified Connection_Handle. On an authentication failure, the BR/EDR Controller or Link Manager shall not auto- matically detach the link. The Host is responsible for issuing a Disconnect com- mand to terminate the link if the action is appropriate.
///
/// - Note: The Connection_Handle command parameter is used to identify the other BR/EDR Controller, which forms the connection. The Connection_Handle should be a Connection_Handle for an ACL connection.
public struct HCIAuthenticationRequested: HCICommandParameter {
    
    public static let command = LinkControlCommand.authenticationRequested
    
    /// Connection_Handle to be used to set up authentication for all Connection Handles with the same BR/EDR Controller end-point as the specified Connection_Handle.
    public var handle: UInt16
    
    public init(handle: UInt16) {
        
        self.handle = handle
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([handleBytes.0, handleBytes.1])
    }
}
