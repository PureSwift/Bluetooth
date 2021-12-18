//
//  HCIWritePageScanActivity.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/16/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Write Page Scan Activity Command
    ///
    /// This command writes the values for the Page_Scan_Interval and Page_Scan_Window configuration parameters. The Page_Scan_Window shall be less than or equal to the Page_Scan_Interval.
    func writePageScanActivity(scanInterval: HCIWritePageScanActivity.PageScanInterval,
                               scanWindow: HCIWritePageScanActivity.PageScanWindow,
                               timeout: HCICommandTimeout = .default) async throws {
        
        let command = HCIWritePageScanActivity(scanInterval: scanInterval,
                                               scanWindow: scanWindow)
        
        return try await deviceRequest(command, timeout: timeout)
    }
}

// MARK: - Command

/// Write Page Scan Activity Command
///
/// This command writes the values for the Page_Scan_Interval and Page_Scan_Window configuration parameters. The Page_Scan_Window shall be less than or equal to the Page_Scan_Interval.
@frozen
public struct HCIWritePageScanActivity: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.writePageScanActivity
    
    public var scanInterval: PageScanInterval
    
    public var scanWindow: PageScanWindow
    
    public init(scanInterval: PageScanInterval, scanWindow: PageScanWindow) {
        
        self.scanInterval = scanInterval
        self.scanWindow = scanWindow
    }
    
    public var data: Data {
        
        let intervalBytes = scanInterval.rawValue.littleEndian.bytes
        
        let windowBytes = scanWindow.rawValue.littleEndian.bytes
        
        return Data([intervalBytes.0, intervalBytes.1, windowBytes.0, windowBytes.1])
    }
}

extension HCIWritePageScanActivity {
    
    /// The Page_Scan_Interval configuration parameter defines the amount of time between consecutive page scans. This time interval is defined from when the Controller started its last page scan until it begins the next page scan.
    public struct PageScanInterval: RawRepresentable {
        
        public static let min = PageScanInterval(0x0012)
        
        public static let max = PageScanInterval(0x1000)
        
        public let rawValue: UInt16
        
        public var duration: Double {
            
            return Double(rawValue) * 0.625
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= type(of: self).max.rawValue,
                rawValue >= type(of: self).min.rawValue
                else { return nil }
            
            guard rawValue % 2 == 0
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
    
    /// The Page_Scan_Window configuration parameter defines the amount of time for the duration of the page scan. The Page_Scan_Window can only be less than or equal to the Page_Scan_Interval.
    public struct PageScanWindow: RawRepresentable {
        
        public static let min = PageScanWindow(0x0011)
        
        public static let max = PageScanWindow(0x1000)
        
        public let rawValue: UInt16
        
        public var duration: Double {
            
            return Double(rawValue) * 0.625
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= type(of: self).max.rawValue,
                rawValue >= type(of: self).min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}
