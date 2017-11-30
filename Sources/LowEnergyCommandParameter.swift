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
        public var data: LowEnergyResponseData
        
        public init(data: LowEnergyResponseData, length: UInt8) {
            
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
        
        public var advertisingType: AdvertisingType
        
        public var addressType: (own: LowEnergyAddressType, direct: LowEnergyAddressType)
        
        /// Public Device Address or Random Device Address of the device to be connected.
        public var directAddress: Address
        
        public var channelMap: ChannelMap
        
        public var filterPolicy: FilterPolicy
        
        public init(interval: (minimum: UInt16, maximum: UInt16) = (0x0800, 0x0800),
            advertisingType: AdvertisingType = AdvertisingType(),
            addressType: (own: LowEnergyAddressType, direct: LowEnergyAddressType) = (.public, .public),
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
        
        public enum AdvertisingType: UInt8 {
            
            /// Connectable undirected advertising event
            case undirected         = 0x00
            
            /// Connectable directed advertising event
            case directed           = 0x01
            
            /// Scannable undirected advertising event
            case scannable          = 0x02
            
            /// Non-connectable undirected advertising event
            case nonConnectable     = 0x03
            
            public init() { self = .undirected }
        }
        
        public enum ChannelMap: UInt8 {
            
            /// Default (all channels enabled)
            case all                    = 0b00000111
            case channel37              = 0b00000001
            case channel38              = 0b00000010
            case channel39              = 0b00000100
            
            public init() { self = .all }
        }
        
        public enum FilterPolicy: UInt8 {
            
            /// Allow Scan Request from Any,
            /// Allow Connect Request from Any (default).
            case any                    = 0x00
            
            /// Allow Scan Request from White List Only, 
            /// Allow Connect Request from Any.
            case whiteListScan          = 0x01
            
            /// Allow Scan Request from Any, 
            /// Allow Connect Request from White List Only.
            case whiteListConnect       = 0x02
            
            /// Allow Scan Request from White List Only, 
            /// Allow Connect Request from White List Only.
            case whiteListScanConnect   = 0x03
            
            public init() { self = .any }
            
            public init(whiteListScan: Bool, whiteListConnect: Bool) {
                
                switch (whiteListScan, whiteListConnect) {
                    
                case (false, false): self = .any
                case (true, false): self = .whiteListScan
                case (false, true): self = .whiteListConnect
                case (true, true): self = .whiteListScanConnect
                }
            }
            
            public var whiteList: (scan: Bool, connect: Bool) {
                
                switch self {
                case .any:                      return (false, false)
                case .whiteListScan:            return (true, false)
                case .whiteListConnect:         return (false, true)
                case .whiteListScanConnect:     return (true, true)
                }
            }
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
        public var data: LowEnergyResponseData // Scan_Response_Data
        
        public init(data: LowEnergyResponseData, length: UInt8) {
            
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
        
        public init(type: ScanType = ScanType(),
                    interval: TimeInterval = .default,
                    window: TimeInterval = .default,
                    addressType: LowEnergyAddressType = .public,
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
    
    /// LE Create Connection Command
    /// 
    /// The LE Create Connection command is used to create a Link Layer connection to a connectable advertiser.
    ///
    /// When the Controller receives the LE Create Connection Command, the Controller sends the Command Status 
    /// event to the Host. An LE Connection Complete event shall be generated when a connection is created 
    /// or the connection creation procedure is cancelled.
    ///
    /// - Note: No Command Complete event is sent by the Controller to indicate that this command has been completed.
    /// Instead, the LE Connection Complete event indicates that this command has been completed.
    ///
    /// - Warning: The Host shall not issue this command when another `LE Create Connection Command` is pending
    /// in the Controller; if this does occur the Controller shall return the Command Disallowed error code shall be used.
    public struct CreateConnectionParameter: HCICommandParameter { // LE_Create_Connection
        
        public static let command = LowEnergyCommand.createConnection // 0x000C
        public static let length = 2 + 2 + 1 + 1 + 6 + 1 + 2 + 2 + 2 + 2 + 2 + 2
        
        public typealias SupervisionTimeout = LowEnergySupervisionTimeout
        
        /// Recommendation from the Host on how long the Controller should scan.
        ///
        /// This is defined as the time interval from when the Controller started 
        /// its last LE scan until it begins the subsequent LE scan.
        public let scanInterval: LowEnergyScanTimeInterval // LE_Scan_Interval
        
        /// Recommendation from the Host on how frequently the Controller should scan.
        ///
        /// Amount of time for the duration of the LE scan. 
        /// - Note: `scanWindow` shall be less than or equal to `scanInterval`.
        /// If both are set to the same value, scanning should run continuously.
        public let scanWindow: LowEnergyScanTimeInterval // LE_Scan_Window
        
        /// Used to determine whether the White List is used. 
        /// If the White List is not used, the Peer_Address_Type and the Peer_Address
        /// parameters specify the address type and address of the advertising device to connect to.
        public let initiatorFilterPolicy: InitiatorFilterPolicy // Initiator_Filter_Policy
        
        /// The address type (Public or Random) of the device to be connected.
        public let peerAddressType: LowEnergyAddressType // Peer_Address_Type
        
        /// Public Device Address or Random Device Address of the device to be connected.
        public let peerAddress: Address // Peer_Address
        
        /// The Link Layer shall set the address in the `CONNECT_REQ` packets 
        /// to either the Public Device Address or the Random Device Addressed 
        /// based on the `ownAddressType` property.
        public let ownAddressType: LowEnergyAddressType // Own_Address_Type
        
        /// Value for the connection event interval.
        ///
        /// Defines the minimum and maximum allowed connection interval.
        public let connectionInterval: ConnectionInterval  // Conn_Interval_Min, Conn_Interval_Max
        
        /// Slave latency for the connection in number of connection events.
        ///
        /// Defines the maximum allowed connection latency.
        public let connectionLatency: ConnectionLatency
        
        /// Supervision timeout for the LE Link.
        ///
        /// Defines the link supervision timeout for the connection. 
        ///
        /// - Note: The `supervisionTimeout` in milliseconds shall be
        /// larger than the `connectionInterval.miliseconds.upperBound` in milliseconds.
        public let supervisionTimeout: SupervisionTimeout
        
        /// Connection Length
        ///
        /// Informative parameters providing the Controller with the expected minimum 
        /// and maximum length of the connection needed for this LE connection.
        public let connectionLength: ConnectionLength
        
        public init(scanInterval: LowEnergyScanTimeInterval = .default,
                    scanWindow: LowEnergyScanTimeInterval = .default,
                    initiatorFilterPolicy: InitiatorFilterPolicy = .peerAddress,
                    peerAddressType: LowEnergyAddressType = .public,
                    peerAddress: Address,
                    ownAddressType: LowEnergyAddressType = .public,
                    connectionInterval: ConnectionInterval = .full,
                    connectionLatency: ConnectionLatency = .zero,
                    supervisionTimeout: SupervisionTimeout = .max,
                    connectionLength: ConnectionLength = .full) {
            
            precondition(scanWindow <= scanInterval, "LE_Scan_Window shall be less than or equal to LE_Scan_Interval")
            precondition(supervisionTimeout.miliseconds > connectionInterval.miliseconds.upperBound, "The Supervision_Timeout in milliseconds shall be larger than the Conn_Interval_Max in milliseconds.")
            
            self.scanInterval = scanInterval
            self.scanWindow = scanWindow
            self.initiatorFilterPolicy = initiatorFilterPolicy
            self.peerAddressType = peerAddressType
            self.peerAddress = peerAddress
            self.ownAddressType = ownAddressType
            self.connectionInterval = connectionInterval
            self.connectionLatency = connectionLatency
            self.supervisionTimeout = supervisionTimeout
            self.connectionLength = connectionLength
        }
        
        public var byteValue: [UInt8] {
            
            let scanIntervalBytes = scanInterval.rawValue.littleEndian.bytes
            let scanWindowBytes = scanWindow.rawValue.littleEndian.bytes
            let initiatorFilterPolicyByte = initiatorFilterPolicy.rawValue
            let peerAddressTypeByte = peerAddressType.rawValue
            let peerAddressBytes = peerAddress.littleEndian.bytes
            let ownAddressTypeByte = ownAddressType.rawValue
            let connectionIntervalMinBytes = connectionInterval.rawValue.lowerBound.littleEndian.bytes
            let connectionIntervalMaxBytes = connectionInterval.rawValue.upperBound.littleEndian.bytes
            let connectionLatencyBytes = connectionLatency.rawValue.littleEndian.bytes
            let supervisionTimeoutBytes = supervisionTimeout.rawValue.littleEndian.bytes
            let connectionLengthMinBytes = connectionLength.rawValue.lowerBound.littleEndian.bytes
            let connectionLengthMaxBytes = connectionLength.rawValue.upperBound.littleEndian.bytes
            
            return [scanIntervalBytes.0,
                    scanIntervalBytes.1,
                    scanWindowBytes.0,
                    scanWindowBytes.1,
                    initiatorFilterPolicyByte,
                    peerAddressTypeByte,
                    peerAddressBytes.0,
                    peerAddressBytes.1,
                    peerAddressBytes.2,
                    peerAddressBytes.3,
                    peerAddressBytes.4,
                    peerAddressBytes.5,
                    ownAddressTypeByte,
                    connectionIntervalMinBytes.0,
                    connectionIntervalMinBytes.1,
                    connectionIntervalMaxBytes.0,
                    connectionIntervalMaxBytes.1,
                    connectionLatencyBytes.0,
                    connectionLatencyBytes.1,
                    supervisionTimeoutBytes.0,
                    supervisionTimeoutBytes.1,
                    connectionLengthMinBytes.0,
                    connectionLengthMinBytes.1,
                    connectionLengthMaxBytes.0,
                    connectionLengthMaxBytes.1]
        }
        
        /// Used to determine whether the White List is used.
        public enum InitiatorFilterPolicy: UInt8 {
            
            /// White list is not used to determine which advertiser to connect to.
            /// `peerAddressType` and `peerAddress` shall be used.
            case peerAddress
            
            /// White list is used to determine which advertiser to connect to.
            /// `peerAddressType` and `peerAddress` shall be ignored.
            case whiteList
        }
        
        /// Value for connection event interval
        ///
        /// Range: 0x0006 to 0x0C80
        /// Time = N * 1.25 msec
        /// Time Range: 7.5 msec to 4 seconds.
        public struct ConnectionInterval: RawRepresentable, Equatable {
            
            public typealias RawValue = CountableClosedRange<UInt16>
            
            /// 7.5 msec
            public static let min: UInt16 = 0x0006
            
            /// 4000 msec
            public static let max: UInt16 = 0x0C80
            
            /// Maximum interval range.
            public static let full = ConnectionInterval(ConnectionInterval.min ... ConnectionInterval.max)
            
            public let rawValue: RawValue
            
            public init?(rawValue: RawValue) {
                
                assert(ConnectionInterval.full.rawValue.lowerBound == ConnectionInterval.min)
                assert(ConnectionInterval.full.rawValue.upperBound == ConnectionInterval.max)
                
                guard rawValue.lowerBound >= ConnectionInterval.min,
                    rawValue.upperBound <= ConnectionInterval.max
                    else { return nil }
                
                assert(rawValue.clamped(to: ConnectionInterval.full.rawValue) == rawValue)
                assert(rawValue.overlaps(ConnectionInterval.full.rawValue))
                
                self.rawValue = rawValue
            }
            
            // private API, unsafe
            private init(_ unchecked: RawValue) {
                
                self.rawValue = unchecked
            }
            
            /// Time = N * 1.25 msec
            public var miliseconds: ClosedRange<Double> {
                
                let ms = Double(1.25)
                
                let min = Double(rawValue.lowerBound) * ms
                
                let max = Double(rawValue.upperBound) * ms
                
                return min ... max
            }
            
            // Equatable
            public static func == (lhs: ConnectionInterval, rhs: ConnectionInterval) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
        }
        
        /// Slave latency for the connection in number of connection events.
        ///
        /// Range: 0x0000 to 0x01F4
        public struct ConnectionLatency: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static var zero: ConnectionLatency { return ConnectionLatency() }
            
            public let rawValue: UInt16
            
            public init() {
                
                self.rawValue = 0
            }
            
            public init?(rawValue: UInt16) {
                
                guard rawValue <= 0x01F4
                    else { return nil }
                
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: ConnectionLatency, rhs: ConnectionLatency) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
            
            // Comparable
            public static func < (lhs: ConnectionLatency, rhs: ConnectionLatency) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
        }
        
        /// Information parameter about the minimum length of connection needed for this LE connection.
        ///
        /// Range: 0x0000 – 0xFFFF
        /// Time = N * 0.625 msec.
        public struct ConnectionLength: RawRepresentable, Equatable {
            
            public typealias RawValue = CountableClosedRange<UInt16>
            
            /// Maximum interval range.
            public static let full = ConnectionLength(rawValue: .min ... .max)
            
            public let rawValue: RawValue
            
            public init(rawValue: RawValue) {
                
                self.rawValue = rawValue
            }
            
            /// Time = N * 0.625 msec.
            public var miliseconds: ClosedRange<Double> {
                
                let ms = Double(0.625)
                
                let min = Double(rawValue.lowerBound) * ms
                
                let max = Double(rawValue.upperBound) * ms
                
                return min ... max
            }
            
            // Equatable
            public static func == (lhs: ConnectionLength, rhs: ConnectionLength) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
        }
    }
}

// MARK: - Command Return Parameters

public extension LowEnergyCommand {
    
    /// LE Read White List Size
    ///
    /// The command is used to read the total number of white list entries that can be stored in the Controller.
    public struct ReadWhiteListSizeReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readWhiteListSize
        public static let length = 2
        
        /// The HCI command status
        public let status: HCIStatus // Status
        
        /// The white list size.
        public let size: UInt8 // White_List_Size
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == ReadWhiteListSizeReturnParameter.length,
                let status = HCIStatus(rawValue: byteValue[0])
                else { return nil }
            
            self.status = status
            self.size = byteValue[1]
        }
    }
}

// MARK: - Supporting Types

/// 31 Byte LE Advertising or Scan Response Data
public typealias LowEnergyResponseData = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

/// LE Scan Time Interval
///
/// Range: 0x0004 to 0x4000
/// Time = N * 0.625 msec
/// Time Range: 2.5 msec to 10240 msec
public struct LowEnergyScanTimeInterval: RawRepresentable, Equatable, Comparable, Hashable {
    
    /// 2.5 msec
    public static let min = LowEnergyScanTimeInterval(0x0004)
    
    /// 10.24 seconds
    public static let max = LowEnergyScanTimeInterval(0x4000)
    
    /// 10 ms
    public static let `default` = LowEnergyScanTimeInterval(0x0010)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16) {
        
        guard rawValue >= LowEnergyScanTimeInterval.min.rawValue,
            rawValue <= LowEnergyScanTimeInterval.max.rawValue
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    /// Time = N * 0.625 msec
    public var miliseconds: Double {
        
        return Double(rawValue) * 0.625
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyScanTimeInterval, rhs: LowEnergyScanTimeInterval) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyScanTimeInterval, rhs: LowEnergyScanTimeInterval) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

/// Supervision Timeout
///
/// Supervision timeout for the LE Link.
/// Range: 0x000A to 0x0C80
/// Time = N * 10 msec
/// Time Range: 100 msec to 32 seconds
///
/// - SeeAlso: [Vol 6] Part B, Section 4.5.2
public struct LowEnergySupervisionTimeout: RawRepresentable, Equatable, Hashable, Comparable {
    
    /// 100 msec
    public static let min = LowEnergySupervisionTimeout(0x000A)
    
    /// 32 seconds
    public static let max = LowEnergySupervisionTimeout(0x0C80)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16) {
        
        guard rawValue >= LowEnergySupervisionTimeout.min.rawValue,
            rawValue <= LowEnergySupervisionTimeout.max.rawValue
            else { return nil }
        
        assert((LowEnergySupervisionTimeout.min.rawValue ... LowEnergySupervisionTimeout.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    /// Time = N * 10 msec
    public var miliseconds: Double {
        
        return Double(rawValue) * 10
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergySupervisionTimeout, rhs: LowEnergySupervisionTimeout) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergySupervisionTimeout, rhs: LowEnergySupervisionTimeout) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
