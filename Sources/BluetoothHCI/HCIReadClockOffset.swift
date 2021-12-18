//
//  HCIReadClockOffset.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/8/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Clock Offset Command
    ///
    /// Both the System Clock and the clock offset to a remote device are used to determine what hopping frequency is used by a remote device for page scan. This command allows the Host to read clock offset to remote devices. The clock offset can be used to speed up the paging procedure when the local device tries to establish a connection to a remote device, for example, when the local Host has issued Create_Connection or Remote_Name_Request. The Connection_Handle must be a Connection_Handle for an ACL connection.
    func readClockOffset(handle: UInt16,
                         timeout: HCICommandTimeout = .default) async throws -> HCIReadClockOffsetComplete.ClockOffset {
        
        let completeEvent = HCIReadClockOffset(handle: handle)
        
        return try await deviceRequest(completeEvent,
                                 HCIReadClockOffsetComplete.self,
                                 timeout: timeout).clockOffset
    }
}

// MARK: - Command

/// Read Clock Offset Command
///
/// Both the System Clock and the clock offset to a remote device are used to determine what hopping frequency is used by a remote device for page scan. This command allows the Host to read clock offset to remote devices. The clock offset can be used to speed up the paging procedure when the local device tries to establish a connection to a remote device, for example, when the local Host has issued Create_Connection or Remote_Name_Request. The Connection_Handle must be a Connection_Handle for an ACL connection.
@frozen
public struct HCIReadClockOffset: HCICommandParameter {
    
    public static let command = LinkControlCommand.readClockOffset
    
    /// Specifies which Connection_Handle’s LMP-supported features list to get.
    public var handle: UInt16
    
    public init(handle: UInt16) {
        
        self.handle = handle
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([handleBytes.0, handleBytes.1])
    }
}
