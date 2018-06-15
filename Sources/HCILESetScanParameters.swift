//
//  HCILESetScanParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Set Scan Parameters Command
///
/// Used to set the scan parameters.
///
/// - Note: The Host shall not issue this command when scanning is enabled in the Controller;
/// if it is the Command Disallowed error code shall be used.
public struct HCILESetScanParameters: HCICommandParameter { // HCI_LE_Set_Scan_Parameters
    
    public static let command = HCILowEnergyCommand.setScanParameters // 0x000B
    public static let length = 1 + 2 + 2 + 1 + 1
    
    public typealias TimeInterval = LowEnergyScanTimeInterval
    
    /// Controls the type of scan to perform
    public let type: ScanType // LE_Scan_Type
    
    /// This is defined as the time interval from when the Controller
    /// started its last LE scan until it begins the subsequent LE scan.
    public let interval: TimeInterval // LE_Scan_Interval
    
    /// The duration of the LE scan.
    /// Should be less than or equal to `interval`.
    public let window: TimeInterval // LE_Scan_Window
    
    /// Determines the address used (Public or Random Device Address) when performing active scan.
    public let addressType: LowEnergyAddressType // Own_Address_Type
    
    public let filterPolicy: FilterPolicy
    
    public init(type: ScanType = .passive,
                interval: TimeInterval = TimeInterval(0x01E0),
                window: TimeInterval = TimeInterval(0x0030),
                addressType: LowEnergyAddressType = .public,
                filterPolicy: FilterPolicy = .accept) {
        
        precondition(window <= interval, "LE_Scan_Window shall be less than or equal to LE_Scan_Interval")
        
        self.type = type
        self.interval = interval
        self.window = window
        self.addressType = addressType
        self.filterPolicy = filterPolicy
    }
    
    public var data: Data {
        
        let scanType = type.rawValue
        let scanInterval = interval.rawValue.littleEndian.bytes
        let scanWindow = window.rawValue.littleEndian.bytes
        let ownAddressType = addressType.rawValue
        let filter = filterPolicy.rawValue
        
        return Data([scanType, scanInterval.0, scanInterval.1, scanWindow.0, scanWindow.1, ownAddressType, filter])
    }
    
    /// Controls the type of scan to perform
    public enum ScanType: UInt8 {
        
        /// Passive Scanning. No `SCAN_REQ` packets shall be sent.
        case passive = 0x0
        
        /// Active scanning. `SCAN_REQ` packets may be sent.
        case active = 0x1
        
        public init() { self = .passive }
    }
    
    public enum FilterPolicy: UInt8 { // Scanning_Filter_Policy
        
        /// Accept all advertisement packets (default).
        ///
        /// Directed advertising packets which are not addressed for this device shall be ignored.
        case accept = 0x0
        
        /// Ignore advertisement packets from devices not in the White List Only.
        ///
        /// Directed advertising packets which are not addressed for this device shall be ignored.
        case ignore = 0x1
    }
}
