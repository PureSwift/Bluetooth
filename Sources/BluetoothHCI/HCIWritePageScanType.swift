//
//  HCIWritePageScanType.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/16/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Write Page Scan Type Command
    ///
    /// This command writes the Page Scan Type configuration parameter of the local BR/EDR Controller.
    func writePageScanType(pageScanType: HCIWritePageScanType.PageScanType,
                           timeout: HCICommandTimeout = .default) async throws {
        
        let command = HCIWritePageScanType(pageScanType: pageScanType)
        
        return try await deviceRequest(command, timeout: timeout)
    }
}

// MARK: - Command

/// Write Page Scan Type Command
///
/// This command writes the Page Scan Type configuration parameter of the local BR/EDR Controller.
@frozen
public struct HCIWritePageScanType: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.writePageScanType
    
    public var pageScanType: PageScanType
    
    public init(pageScanType: PageScanType) {
        
        self.pageScanType = pageScanType
    }
    
    public var data: Data {
        
        return Data([pageScanType.rawValue])
    }
}

extension HCIWritePageScanType {
    
    public enum PageScanType: UInt8 {
        
        /// Mandatory: Standard Scan (default)
        case mandatory = 0x00
        
        /// Optional: Interlaced Scan
        case optional = 0x01
    }
}
