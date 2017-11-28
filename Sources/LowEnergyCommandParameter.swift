//
//  LowEnergyCommandParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public extension LowEnergyCommand {
    
    /// LE Set Advertising Data Command
    ///
    /// Used to set the data used in advertising packets that have a data field.
    ///
    /// - Note: Only the significant part of the Advertising Data is transmitted in the advertising packets.
    public struct SetAdvertisingDataParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.setAdvertisingData
        public static let length = 32
        
        /// The number of significant bytes.
        public var length: UInt8
        
        /// 31 octets of advertising data. 
        public var data: LowEnergyAdvertisingData
        
        public init(data: LowEnergyAdvertisingData, length: UInt8) {
            
            precondition(length <= 31, "LE Advertising Data can only be 31 octets")
            
            self.length = length
            self.data = data
        }
        
        public init() {
            
            self.length = 0
            self.data = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        }
        
        public var byteValue: [UInt8] {
            
            return [length, data.0, data.1, data.2, data.3, data.4, data.5, data.6, data.7, data.8, data.9, data.10, data.11, data.12, data.13, data.14, data.15, data.16, data.17, data.18, data.19, data.20, data.21, data.22, data.23, data.24, data.25, data.26, data.27, data.28, data.29, data.30]
        }
    }
    
    /// LE Set Advertising Parameters Command
    ///
    /// Used by the Host to set the advertising parameters.
    public struct SetAdvertisingParametersParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.setAdvertisingParameters
        public static let length = 2 + 2 + 1 + 1 + 1 + 6 + 1 + 1
        
        /// Interval for non-directed advertising.
        public var interval: (minimum: UInt16, maximum: UInt16)
        
        public var advertisingType: AdvertisingChannelHeader
        
        public var addressType: (own: LowEnergyAddressType, direct: LowEnergyAddressType)
        
        /// Public Device Address or Random Device Address of the device to be connected.
        public var directAddress: Address
        
        public var channelMap: ChannelMap
        
        public var filterPolicy: FilterPolicy
        
        public init(interval: (minimum: UInt16, maximum: UInt16) = (0x0800, 0x0800),
            advertisingType: AdvertisingChannelHeader = AdvertisingChannelHeader(),
            addressType: (own: LowEnergyAddressType, direct: LowEnergyAddressType) = (.Public, .Public),
            directAddress: Address = Address(bytes: (0,0,0,0,0,0)),
            channelMap: ChannelMap = ChannelMap(),
            filterPolicy: FilterPolicy = FilterPolicy()) {
            
            self.interval = interval
            self.advertisingType = advertisingType
            self.addressType = addressType
            self.directAddress = directAddress
            self.channelMap = channelMap
            self.filterPolicy = filterPolicy
        }
        
        public var byteValue: [UInt8] {
            
            let minimumIntervalBytes = interval.minimum.littleEndian.bytes
            let maximumIntervalBytes = interval.maximum.littleEndian.bytes
            
            return [minimumIntervalBytes.0, minimumIntervalBytes.1,
                maximumIntervalBytes.0, maximumIntervalBytes.1,
                advertisingType.rawValue,
                addressType.own.rawValue,
                addressType.direct.rawValue,
                directAddress.bytes.0, directAddress.bytes.1, directAddress.bytes.2, directAddress.bytes.3, directAddress.bytes.4, directAddress.bytes.5, channelMap.rawValue, filterPolicy.rawValue]
        }
        
        public enum ChannelMap: UInt8 {
            
            /// Default (all channels enabled)
            case All                    = 0b00000111
            case Channel37              = 0b00000001
            case Channel38              = 0b00000010
            case Channel39              = 0b00000100
            
            public init() { self = ChannelMap.All }
        }
        
        public enum FilterPolicy: UInt8 {
            
            /// Allow Scan Request from Any, Allow Connect Request from Any (default).
            case AnyScanConnect         = 0x00
            
            /// Allow Scan Request from White List Only, Allow Connect Request from Any.
            case WhiteListScan          = 0x01
            
            /// Allow Scan Request from Any, Allow Connect Request from White List Only.
            case WhiteListConnect       = 0x02
            
            /// Allow Scan Request from White List Only, Allow Connect Request from White List Only.
            case WhiteListScanConnect   = 0x03
            
            public init() { self = FilterPolicy.AnyScanConnect }
        }
    }
    
    /// LE Set Advertise Enable Command
    public struct SetAdvertiseEnableParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.setAdvertiseEnable
        public static let length = 1
        
        public var enabled: Bool
        
        public init(enabled: Bool = false) {
            
            self.enabled = enabled
        }
        
        public var byteValue: [UInt8] {
            
            let enabledByte: UInt8 = enabled ? 0x01 : 0x00
            
            return [enabledByte]
        }
    }
    
    /// LE Set Scan Response Data Command
    public struct SetScanResponseDataParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.setScanResponseData // 0x0009
        public static let length = 32
        
        /// The number of significant bytes.
        public var length: UInt8 // Scan_Response_Data_Length
        
        /// 31 octets of scan response data.
        public var data: LowEnergyScanData // Scan_Response_Data
        
        public init(data: LowEnergyScanData, length: UInt8) {
            
            precondition(length <= 31, "LE Scan Response Data can only be 31 octets")
            
            self.length = length
            self.data = data
        }
        
        public init() {
            
            self.length = 0
            self.data = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        }
        
        public var byteValue: [UInt8] {
            
            return [length, data.0, data.1, data.2, data.3, data.4, data.5, data.6, data.7, data.8, data.9, data.10, data.11, data.12, data.13, data.14, data.15, data.16, data.17, data.18, data.19, data.20, data.21, data.22, data.23, data.24, data.25, data.26, data.27, data.28, data.29, data.30]
        }
    }
    
    /// LE Set Scan Enable Command
    ///
    /// The `LE Set Scan Enable Command` command is used to start scanning.
    /// Scanning is used to discover advertising devices nearby.
    public struct SetScanEnableParameter: HCICommandParameter { // HCI_LE_Set_Scan_Enable
        
        public static let command = LowEnergyCommand.setScanEnable // 0x000C
        public static let length = 2
        
        /// Whether scanning is enabled or disabled.
        public var enabled: Bool // LE_Scan_Enable
        
        /// Controls whether the Link Layer shall filter duplicate advertising reports to the Host,
        /// or if it shall generate advertising reports for each packet received.
        public var filterDuplicates: Bool // Filter_Duplicates
        
        /// Initialize a `LE Set Scan Enable Command` HCI command parameter.
        ///
        /// The `LE Set Scan Enable Command` command is used to start scanning.
        /// Scanning is used to discover advertising devices nearby.
        ///
        /// - Parameter enabled: Whether scanning is enabled or disabled.
        ///
        /// - Parameter filterDuplicates: Controls whether the Link Layer shall filter duplicate advertising reports to the Host,
        /// or if it shall generate advertising reports for each packet received.
        public init(enabled: Bool = false, filterDuplicates: Bool = false) {
            
            self.enabled = enabled
            self.filterDuplicates = filterDuplicates
        }
        
        public var byteValue: [UInt8] {
            
            let enabledByte: UInt8 = enabled ? 0x01 : 0x00
            let filterDuplicatesByte: UInt8 = filterDuplicates ? 0x01 : 0x00
            
            return [enabledByte, filterDuplicatesByte]
        }
    }
    
    /// LE Set Scan Parameters Command
    ///
    /// Used to set the scan parameters.
    ///
    /// - Note: The Host shall not issue this command when scanning is enabled in the Controller; 
    /// if it is the Command Disallowed error code shall be used.
    public struct SetScanParametersParameter: HCICommandParameter { // HCI_LE_Set_Scan_Parameters
        
        public static let command = LowEnergyCommand.setScanParameters // 0x000B
        public static let length = 1 + 2 + 2 + 1 + 1
        
        /// Controls the type of scan to perform
        public var type: ScanType // LE_Scan_Type
        
        /// This is defined as the time interval from when the Controller 
        /// started its last LE scan until it begins the subsequent LE scan.
        public var interval: TimeInterval // LE_Scan_Interval
        
        /// The duration of the LE scan.
        /// Should be less than or equal to `interval`.
        public var window: TimeInterval // LE_Scan_Window
        
        /// Determines the address used (Public or Random Device Address) when performing active scan.
        public var addressType: LowEnergyAddressType // Own_Address_Type
        
        public var filterPolicy: FilterPolicy
        
        public init(type: ScanType = ScanType(),
                    interval: TimeInterval = .default,
                    window: TimeInterval = .default,
                    addressType: LowEnergyAddressType = .Public,
                    filterPolicy: FilterPolicy = .accept) {
            
            precondition(window <= interval, "LE_Scan_Window shall be less than or equal to LE_Scan_Interval")
            
            self.type = type
            self.interval = interval
            self.window = window
            self.addressType = addressType
            self.filterPolicy = filterPolicy
        }
        
        public var byteValue: [UInt8] {
            
            let scanType = type.rawValue
            let scanInterval = interval.rawValue.littleEndian.bytes
            let scanWindow = window.rawValue.littleEndian.bytes
            let ownAddressType = addressType.rawValue
            let filter = filterPolicy.rawValue
            
            return [scanType, scanInterval.0, scanInterval.1, scanWindow.0, scanWindow.1, ownAddressType, filter]
        }
        
        /// Controls the type of scan to perform
        public enum ScanType: UInt8 {
            
            /// Passive Scanning. No `SCAN_REQ` packets shall be sent.
            case passive = 0x0
            
            /// Active scanning. `SCAN_REQ` packets may be sent.
            case active = 0x1
            
            public init() { self = .passive }
        }
        
        /// LE Scan Time Interval
        ///
        /// Range: 0x0004 to 0x4000
        public struct TimeInterval: RawRepresentable, Equatable, Comparable, Hashable {
            
            /// 2.5 msec
            public static let min = TimeInterval(0x0004)
            
            /// 10.24 seconds
            public static let max = TimeInterval(0x4000)
            
            /// 10 ms
            public static let `default` = TimeInterval(0x0010)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= TimeInterval.min.rawValue,
                    rawValue <= TimeInterval.max.rawValue
                    else { return nil }
                
                self.rawValue = rawValue
            }
            
            public var miliseconds: Double {
                
                return Double(rawValue) * 0.625
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: TimeInterval, rhs: TimeInterval) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: TimeInterval, rhs: TimeInterval) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
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
}

// MARK: - Supporting Types

/// Bluetooth Low Energy Address type
public enum LowEnergyAddressType: UInt8 {
    
    case Public = 0x00
    case Random = 0x01
    
    public init() { self = .Public }
}

/// 31 Byte LE Advertising Data
public typealias LowEnergyAdvertisingData = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

/// 31 Byte LE Scan Data
public typealias LowEnergyScanData = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

public enum AdvertisingChannelHeader: UInt8 {
    
    /// Connectable undirected advertising event
    case Undirected         = 0x00
    
    /// Connectable directed advertising event
    case Directed           = 0x01
    
    /// Scannable undirected advertising event
    case Scannable          = 0x02
    
    /// Non-connectable undirected advertising event
    case NonConnectable     = 0x03
    
    public init() { self = .Undirected }
}
