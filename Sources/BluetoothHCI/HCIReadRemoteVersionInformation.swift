//
//  HCIReadRemoteVersionInformation.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/7/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Remote Version Information Command
    ///
    /// This command will obtain the values for the version information for the remote device identified by the Connection_Handle parameter. The Connection_Handle must be a Connection_Handle for an ACL or LE connection.
    func readRemoteVersionInformation(handle: UInt16,
                                      timeout: HCICommandTimeout = .default) async throws -> HCIReadRemoteVersionInformationComplete {
        
        let readRemoteVersionInformation = HCIReadRemoteVersionInformation(handle: handle)
        
        return try await deviceRequest(readRemoteVersionInformation,
                                 HCIReadRemoteVersionInformationComplete.self,
                                 timeout: timeout)
    }
}

// MARK: - Command

/// Read Remote Version Information Command
///
/// This command will obtain the values for the version information for the remote device identified by the Connection_Handle parameter. The Connection_Handle must be a Connection_Handle for an ACL or LE connection.
@frozen
public struct HCIReadRemoteVersionInformation: HCICommandParameter {
    
    public static let command = LinkControlCommand.readRemoteVersion
    
    /// Specifies which Connection_Handle’s version information to get.
    public var handle: UInt16
    
    public init(handle: UInt16) {
        
        self.handle = handle
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([handleBytes.0, handleBytes.1])
    }
}
