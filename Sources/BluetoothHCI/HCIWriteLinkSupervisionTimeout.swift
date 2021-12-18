//
//  HCIWriteLinkSupervisionTimeout.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Write Link Supervision Timeout Command
    ///
    /// This command writes the value for the Link_Supervision_Timeout parameter for a BR/EDR or AMP Controller. For BR/EDR Controllers, this command shall only be issued on the master for the given Connection Handle. If this command is issued on a slave, the command shall be rejected by the BR/EDR controller with the error code Command Disallowed. The command may be issued to any AMP Controller without restriction to role.
    ///
    /// The Handle used for this command shall be the ACL connection to the appro- priate device. This command will set the Link_Supervision_
    /// Timeout values for other Synchronous Handles to that device.
    func writeLinkSupervisionTimeout(handle: UInt16,
                                     linkSupervisionTimeout: HCIWriteLinkSupervisionTimeout.LinkSupervisionTimeout,
                                     timeout: HCICommandTimeout = .default) async throws -> HCIWriteLinkSupervisionTimeoutReturn {
        
        let command = HCIWriteLinkSupervisionTimeout(handle: handle,
                                                     linkSupervisionTimeout: linkSupervisionTimeout)
        
        return try await deviceRequest(command, HCIWriteLinkSupervisionTimeoutReturn.self, timeout: timeout)
    }
}

// MARK: - Command

/// Write Link Supervision Timeout Command
///
/// This command writes the value for the Link_Supervision_Timeout parameter for a BR/EDR or AMP Controller. For BR/EDR Controllers, this command shall only be issued on the master for the given Connection Handle. If this command is issued on a slave, the command shall be rejected by the BR/EDR controller with the error code Command Disallowed. The command may be issued to any AMP Controller without restriction to role.
///
/// The Handle used for this command shall be the ACL connection to the appro- priate device. This command will set the Link_Supervision_
/// Timeout values for other Synchronous Handles to that device.
@frozen
public struct HCIWriteLinkSupervisionTimeout: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.writeLinkSupervisionTimeout
    
    /// Specifies which Handle’s Link Supervision Timeout value is to be written.
    /// The Handle is a Connection Handle for a BR/EDR Controller. On an AMP a Physical Link Handle is used as the lower 8 bits of the Handle. The upper 4 bits are reserved and shall be set to 0.
    public var handle: UInt16
    
    public var linkSupervisionTimeout: LinkSupervisionTimeout
    
    public init(handle: UInt16, linkSupervisionTimeout: LinkSupervisionTimeout) {
        
        self.handle = handle
        self.linkSupervisionTimeout = linkSupervisionTimeout
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        let timeoutBytes = linkSupervisionTimeout.rawValue.littleEndian.bytes
        
        return Data([handleBytes.0,
                     handleBytes.1,
                     timeoutBytes.0,
                     timeoutBytes.1])
    }
}

extension HCIWriteLinkSupervisionTimeout {
    
    /// Measured in Number of BR/EDR Baseband slots Link_Supervision_Timeout = N*0.625 msec (1 Baseband slot) Range for N: 0x0001 – 0xFFFF
    /// Time Range: 0.625ms – 40.9 sec
    /// Default: N = 0x7D00
    /// Link_Supervision_Timeout = 20 sec
    /// Mandatory Range for Controller: 0x0190 to 0xFFFF; plus 0 for infinite timeout
    public struct LinkSupervisionTimeout: RawRepresentable {
        
        public static let infinite = LinkSupervisionTimeout(0)
            
        public var rawValue: UInt16
        
        public var duration: Double {
            
            return Double(rawValue) * 0.625 / 1000
        }
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - Return Parameter

@frozen
public struct HCIWriteLinkSupervisionTimeoutReturn: HCICommandReturnParameter {
    
    public static let command = HostControllerBasebandCommand.writeLinkSupervisionTimeout
    
    public static let length: Int = MemoryLayout<UInt16>.size
    
    public var handle: UInt16
    
    public init?(data: Data) {
        
        guard data.count == HCIWriteLinkSupervisionTimeoutReturn.length
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
