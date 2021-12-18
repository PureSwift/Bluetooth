//
//  HCIReadLMPHandle.swift
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
    func readLMPHandle(handle: UInt16,
                       timeout: HCICommandTimeout = .default) async throws -> UInt8 {
        
        let lmpHandle = HCIReadLMPHandle(handle: handle)
        
        return try await deviceRequest(lmpHandle,
                                 HCIReadLMPHandleReturn.self,
                                 timeout: timeout).lmpHandle
    }
}

// MARK: - Command

/// Read LMP Handle Command
///
/// This command reads the current LMP Handle associated with the Connection_Handle. The Connection_Handle shall be a SCO or eSCO Han dle. If the Connection_Handle is a SCO Connection_Handle, then this command shall read the LMP SCO Handle for this connection. If the Connection_Handle is an eSCO Connection_Handle, then this command shall read the LMP eSCO Handle for this connection.
@frozen
public struct HCIReadLMPHandle: HCICommandParameter {
    
    public static let command = LinkControlCommand.readLMPHandle
    
    /// Connection_Handle to be used to identify which connection to be used for reading the LMP Handle. This must be a synchronous handle.

    public var handle: UInt16
    
    public init(handle: UInt16) {
        
        self.handle = handle
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([handleBytes.0, handleBytes.1])
    }
}

// MARK: - Return Parameter

@frozen
public struct HCIReadLMPHandleReturn: HCICommandReturnParameter {

    public static let command = LinkControlCommand.readLMPHandle
    
    public static let length: Int = 8
    
    public let status: HCIStatus
    
    public let connectionHandle: UInt16
    
    public let lmpHandle: UInt8
    
    public init?(data: Data) {
        
        guard data.count == HCIEncryptionChange.length
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let status = HCIStatus(rawValue: data[2])
            else { return nil }
        
        self.status = status
        self.connectionHandle = handle
        self.lmpHandle = data[3]
    }
}
