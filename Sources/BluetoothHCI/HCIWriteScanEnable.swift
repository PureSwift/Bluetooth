//
//  HCIWriteScanEnable.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/16/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Write Scan Enable Command
    ///
    /// This command writes the value for the Scan_Enable configuration parameter.
    func writeScanEnable(scanEnable: HCIWriteScanEnable.ScanEnable,
                         timeout: HCICommandTimeout = .default) async throws {
        
        let command = HCIWriteScanEnable(scanEnable: scanEnable)
        
        return try await deviceRequest(command, timeout: timeout)
    }
}

// MARK: - Command

/// Write Scan Enable Command
///
/// This command writes the value for the Scan_Enable configuration parameter.
@frozen
public struct HCIWriteScanEnable: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.writeScanEnable
    
    public var scanEnable: ScanEnable
    
    public init(scanEnable: ScanEnable) {
        
        self.scanEnable = scanEnable
    }
    
    public var data: Data {
        
        return Data([scanEnable.rawValue])
    }
}

extension HCIWriteScanEnable {
    
    public enum ScanEnable: UInt8 {
        
        /// No Scans enabled. Default.
        case noScans = 0x00
        
        /// Inquiry Scan enabled. Page Scan disabled.
        case onlyInquiryScan = 0x01
        
        /// Inquiry Scan disabled. Page Scan enabled.
        case onlyPageScan = 0x02
        
        /// Inquiry Scan enabled. Page Scan enabled.
        case inquiryAndPageScan = 0x03
    }
}
