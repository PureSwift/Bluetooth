//
//  HCIWritePageTimeout.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Write Page Timeout Command
    ///
    /// This command writes the value for the Page_Timeout configuration parameter. The Page_Timeout configuration parameter defines the maximum time the local Link Manager shall wait for a baseband page response from the remote device at a locally initiated connection attempt. If this time expires and the remote device has not responded to the page at baseband level, the connec- tion attempt will be considered to have failed.
    func writePageTimeout(pageTimeout: HCIWritePageTimeout.PageTimeout,
                          timeout: HCICommandTimeout = .default) async throws {
        
        let command = HCIWritePageTimeout(pageTimeout: pageTimeout)
        
        return try await deviceRequest(command, timeout: timeout)
    }
}

// MARK: - Command

/// Write Page Timeout Command
///
/// This command writes the value for the Page_Timeout configuration parameter. The Page_Timeout configuration parameter defines the maximum time the local Link Manager shall wait for a baseband page response from the remote device at a locally initiated connection attempt. If this time expires and the remote device has not responded to the page at baseband level, the connec- tion attempt will be considered to have failed.
@frozen
public struct HCIWritePageTimeout: HCICommandParameter {
    
    public typealias PageTimeout = HCIReadPageTimeoutReturn.PageTimeout
    
    public static let command = HostControllerBasebandCommand.writePageTimeout
    
    public var pageTimeout: PageTimeout
    
    public init(pageTimeout: PageTimeout) {
        
        self.pageTimeout = pageTimeout
    }
    
    public var data: Data {
        
        let pageTimeoutBytes = pageTimeout.rawValue.littleEndian.bytes
        
        return Data([pageTimeoutBytes.0, pageTimeoutBytes.1])
    }
}
