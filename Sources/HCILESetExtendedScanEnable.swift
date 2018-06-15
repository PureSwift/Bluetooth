//
//  HCILESetExtendedScanEnable.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Extended Scan Enable Command
    ///
    /// The command is used to enable or disable scanning.
    func setLowEnergyExtendedScanEnable(enable: HCILESetExtendedScanEnable.Enable,
                                        filterDuplicates: HCILESetExtendedScanEnable.FilterDuplicates,
                                        duration: HCILESetExtendedScanEnable.Duration,
                                        period: HCILESetExtendedScanEnable.Period,
                                        timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILESetExtendedScanEnable(enable: enable,
                                                    filterDuplicates: filterDuplicates,
                                                    duration: duration,
                                                    period: period)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Extended Scan Enable Command
///
/// The command is used to enable or disable scanning.
public struct HCILESetExtendedScanEnable: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setExtendedScanEnable //0x0042
    
    public let enable: Enable
    public let filterDuplicates: FilterDuplicates
    public let duration: Duration
    public let period: Period
    
    public init(enable: Enable,
                filterDuplicates: FilterDuplicates,
                duration: Duration,
                period: Period) {
        
        self.enable = enable
        self.filterDuplicates = filterDuplicates
        self.duration = duration
        self.period  = period
    }
    
    public var data: Data {
        
        let durationBytes = duration.rawValue.littleEndian.bytes
        let periodBytes = period.rawValue.littleEndian.bytes
        
        return Data([
            enable.rawValue,
            filterDuplicates.rawValue,
            durationBytes.0,
            durationBytes.1,
            periodBytes.0,
            periodBytes.1
            ])
    }
    
    /// The Enable parameter determines whether scanning is enabled or disabled.
    /// If it is disabled, the remaining parameters are ignored.
    public enum Enable: UInt8 {
        
        /// Scanning disabled
        case disabled = 0x00
        
        /// Scanning enabled
        case enabled  = 0x01
    }
    
    public enum FilterDuplicates: UInt8 { //Filter_Duplicates
        
        /// Duplicate filtering disabled
        case disabled = 0x00
        
        /// Duplicate filtering enabled
        case enabled = 0x01
        
        /// Duplicate filtering enabled, reset for each scan period
        case reset = 0x02
    }
    
    /// Scan duration
    /// Range: 0x0001 – 0xFFFF
    /// Time = N * 10 ms
    /// Time Range: 10 ms to 655.35 s
    public struct Duration: RawRepresentable, Equatable, Comparable, Hashable {
        
        /// 10 ms
        public static let min = Duration(0x0001)
        
        /// 655.35 s
        public static let max = Duration(0xFFFF)
        
        public let rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            
            guard rawValue >= Duration.min.rawValue,
                rawValue <= Duration.max.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        // Private, unsafe
        fileprivate init(_ rawValue: UInt16) {
            self.rawValue = rawValue
        }
        
        /// Time = N * 10 ms
        public var miliseconds: Double {
            
            return Double(rawValue) * 10
        }
        
        // Equatable
        public static func == (lhs: Duration, rhs: Duration) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
        
        // Comparable
        public static func < (lhs: Duration, rhs: Duration) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
        
        // Hashable
        public var hashValue: Int {
            
            return Int(rawValue)
        }
    }
    
    /// Time interval from when the Controller started its last Scan_Duration until
    /// it begins the subsequent Scan_Duration.
    /// Range: 0x0001 – 0xFFFF
    /// Time = N * 1.28 sec
    /// Time Range: 1.28 s to 83,884.8 s
    public struct Period: RawRepresentable, Equatable, Comparable, Hashable {
        
        /// 1.28 s
        public static let min = Duration(0x0001)
        
        /// 83,884.8 s
        public static let max = Duration(0xFFFF)
        
        public let rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            
            guard rawValue >= Period.min.rawValue,
                rawValue <= Period.max.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        // Private, unsafe
        fileprivate init(_ rawValue: UInt16) {
            self.rawValue = rawValue
        }
        
        /// Time = N * 1.28 ms
        public var miliseconds: Double {
            
            return Double(rawValue) * 1.28
        }
        
        // Equatable
        public static func == (lhs: Period, rhs: Period) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
        
        // Comparable
        public static func < (lhs: Period, rhs: Period) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
        
        // Hashable
        public var hashValue: Int {
            
            return Int(rawValue)
        }
    }
}
