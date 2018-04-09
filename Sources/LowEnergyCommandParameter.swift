//
//  LowEnergyCommandParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

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
            
            self.init(data: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), length: 0)
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
            
            public init(whiteListScan: Bool,
                        whiteListConnect: Bool) {
                
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
        public let connectionInterval: LowEnergyConnectionInterval  // Conn_Interval_Min, Conn_Interval_Max
        
        /// Slave latency for the connection in number of connection events.
        ///
        /// Defines the maximum allowed connection latency.
        public let connectionLatency: LowEnergyConnectionLatency
        
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
        public let connectionLength: LowEnergyConnectionLength
        
        public init(scanInterval: LowEnergyScanTimeInterval = LowEnergyScanTimeInterval(10),
                    scanWindow: LowEnergyScanTimeInterval = LowEnergyScanTimeInterval(10),
                    initiatorFilterPolicy: InitiatorFilterPolicy = .peerAddress,
                    peerAddressType: LowEnergyAddressType = .public,
                    peerAddress: Address,
                    ownAddressType: LowEnergyAddressType = .public,
                    connectionInterval: LowEnergyConnectionInterval = .full,
                    connectionLatency: LowEnergyConnectionLatency = .zero,
                    supervisionTimeout: SupervisionTimeout = .max,
                    connectionLength: LowEnergyConnectionLength = .full) {
            
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
    }
    
    /// LE Add Device To White List Command
    ///
    /// The command is used to add a single device to the White List stored in the Controller.
    ///
    /// This command can be used at any time except when:
    /// * any advertising filter policy uses the White List and advertising is enabled.
    /// * the scanning filter policy uses the White List and scanning is enabled.
    /// * the initiator filter policy uses the White List and a create connection command is outstanding.
    ///
    /// When a Controller cannot add a device to the White List because there is no space available,
    /// it shall return the error code Memory Capacity Exceeded (0x07).
    ///
    /// Address is ignored when Address Type is set to 0xFF.
    public struct AddDeviceToWhiteListParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.addDeviceToWhiteList //0x0011
        
        /// The white list device. 
        public var device: LowEnergyWhiteListDevice
        
        public init(device: LowEnergyWhiteListDevice) {
            
            self.device = device
        }
        
        public var byteValue: [UInt8] {
            
            let addressType = self.device.addressType.rawValue
            let addressBytes = self.device.address.littleEndian.bytes
            
            return [addressType,
                    addressBytes.0,
                    addressBytes.1,
                    addressBytes.2,
                    addressBytes.3,
                    addressBytes.4,
                    addressBytes.5]
        }
    }
    
    /// LE Remove Device From White List Command
    ///
    /// The command is used to remove a single device from the White List stored in the Controller.
    ///
    /// This command can be used at any time except when:
    /// * any advertising filter policy uses the White List and advertising is enabled.
    /// * the scanning filter policy uses the White List and scanning is enabled.
    /// * the initiator filter policy uses the White List and a create connection command is outstanding.
    ///
    /// Address is ignored when Address_Type is set to 0xFF.
    public struct RemoveDeviceToWhiteListParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.removeDeviceFromWhiteList //0x0012
        
        /// The white list device.
        public var device: LowEnergyWhiteListDevice
        
        public init(device: LowEnergyWhiteListDevice) {
            
            self.device = device
        }
        
        public var byteValue: [UInt8] {
            
            let addressType = self.device.addressType.rawValue
            let addressBytes = self.device.address.littleEndian.bytes
            
            return [addressType,
                    addressBytes.0,
                    addressBytes.1,
                    addressBytes.2,
                    addressBytes.3,
                    addressBytes.4,
                    addressBytes.5]
        }
    }
    
    /// LE Connection Update Command
    ///
    /// The LE_Connection_Update command is used to change the Link Layer connection parameters of a connection. This command may be issued on both the master and slave.
    ///
    /// The Conn_Interval_Min and Conn_Interval_Max parameters are used to define the minimum and maximum allowed connection interval.
    /// The Conn_Interval_Min parameter shall not be greater than the Conn_Interval_Max parameter.
    ///
    /// The Conn_Latency parameter shall define the maximum allowed connection latency.
    ///
    /// The Supervision_Timeout parameter shall define the link supervision timeout for the LE link.
    /// The Supervision_Timeout in milliseconds shall be larger than (1 + Conn_Latency) * Conn_Interval_Max * 2, where Conn_Interval_Max is given in milliseconds.
    ///
    /// The Minimum_CE_Length and Maximum_CE_Length are information parameters providing the Controller with a hint about the expected minimum and maximum length
    ///  of the connection events. The Minimum_CE_Length shall be less than or equal to the Maximum_CE_Length.
    ///
    ///  The actual parameter values selected by the Link Layer may be different from the parameter values provided by the Host through this command.
    public struct UpdateConnectionParameter: HCICommandParameter {
        
        public typealias SupervisionTimeout = LowEnergySupervisionTimeout
        
        public static let command = LowEnergyCommand.connectionUpdate //0x0013
        
        public let connectionHandle: UInt16 //Connection_Handle
        
        /// Value for the connection event interval.
        ///
        /// Defines the minimum and maximum allowed connection interval.
        public let connectionInterval: LowEnergyConnectionInterval  // Conn_Interval_Min, Conn_Interval_Max
        
        /// Slave latency for the connection in number of connection events.
        ///
        /// Defines the maximum allowed connection latency.
        public let connectionLatency: LowEnergyConnectionLatency
        
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
        public let connectionLength: LowEnergyConnectionLength
        
        public init(connectionHandle: UInt16,
                    connectionInterval: LowEnergyConnectionInterval = .full,
                    connectionLatency: LowEnergyConnectionLatency = .zero,
                    supervisionTimeout: SupervisionTimeout = .max,
                    connectionLength: LowEnergyConnectionLength = .full) {
            
            precondition(supervisionTimeout.miliseconds > connectionInterval.miliseconds.upperBound, "The Supervision_Timeout in milliseconds shall be larger than the Conn_Interval_Max in milliseconds.")
            
            self.connectionHandle = connectionHandle
            self.connectionInterval = connectionInterval
            self.connectionLatency = connectionLatency
            self.supervisionTimeout = supervisionTimeout
            self.connectionLength = connectionLength
        }
        
        public var byteValue: [UInt8] {
            let connectionIntervalMinBytes = connectionInterval.rawValue.lowerBound.littleEndian.bytes
            let connectionIntervalMaxBytes = connectionInterval.rawValue.upperBound.littleEndian.bytes
            let connectionLatencyBytes = connectionLatency.rawValue.littleEndian.bytes
            let supervisionTimeoutBytes = supervisionTimeout.rawValue.littleEndian.bytes
            let connectionLengthMinBytes = connectionLength.rawValue.lowerBound.littleEndian.bytes
            let connectionLengthMaxBytes = connectionLength.rawValue.upperBound.littleEndian.bytes
            
            return [connectionHandle.littleEndian.bytes.0,
                    connectionHandle.littleEndian.bytes.1,
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
    }
    
    /// LE Set Host Channel Classification Command
    ///
    /// command allows the Host to specify a channel classification for data channels based
    /// on its “local information”. This classification persists until overwritten with a subsequent LE_Set_Host_Channel_Classification command or
    /// until the Controller is reset using the Reset command
    public struct SetHostChannelClassificationParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.setHostChannelClassification //0x0014
        
        /// This parameter contains 37 1-bit fields.
        /// The nth such field (in the range 0 to 36) contains the value for the link layer channel index n.
        /// Channel n is bad = 0. Channel n is unknown = 1.
        /// The most significant bits are reserved and shall be set to 0for future use.
        /// At least one channel shall be marked as unknown.
        public let channelMap : LowEnergyChannelMap  //Channel_Map
        
        public init(channelMap : LowEnergyChannelMap) {
            self.channelMap = channelMap
        }
        
        public var byteValue: [UInt8] {
            return [
                channelMap.0,
                channelMap.1,
                channelMap.2,
                channelMap.3,
                channelMap.4
            ]
        }
    }
    
    /// LE Read Channel Map Command
    ///
    /// The command returns the current Channel_Map for the specified Connection_Handle. The returned value indicates the state
    /// of the Channel_Map specified by the last transmitted or received Channel_Map (in a CONNECT_IND or LL_CHANNEL_MAP_IND message)
    /// for the specified Connection_Handle, regardless of whether the Master has received an acknowledgment.
    public struct ReadChannelMapParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.readChannelMap //0x0015
        
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            self.connectionHandle = connectionHandle
        }
        
        public var byteValue: [UInt8] {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1
            ]
        }
    }
    
    /// LE Read Remote Features Command
    ///
    /// The command requests, from the remote device identified by the connection handle,
    /// the features used on the connection and the features supported by the remote device.
    ///
    /// This command may be issued on both the master and slave.
    ///
    /// Note: If a connection already exists between the two devices and the features have already been fetched on that connection,
    //// the Controller may use a cached copy of the features.
    public struct ReadRemoteUsedFeaturesParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.readRemoteUsedFeatures //0x0016
        
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            self.connectionHandle = connectionHandle
        }
        
        public var byteValue: [UInt8] {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1
            ]
        }
    }
    
    /// LE Encrypt Command
    ///
    /// The Commnad is used to request the Controller to encrypt the Plaintext_Data in the command using the Key given in the command
    /// and returns the Encrypted_Data to the Host.
    /// The AES-128 bit block cypher is defined in NIST Publication FIPS-197 (http://csrc.nist.gov/publications/fips/fips197/fips-197.pdf).
    public struct EncryptParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.encrypt //0x0017
        
        /// 128 bit key for the encryption of the data given in the command.
        /// The most significant octet of the key corresponds to key[0] using the notation specified in FIPS 197.
        public let key: UInt128 //Key
        
        /// 128 bit data block that is requested to be encrypted.
        /// The most significant octet of the PlainText_Data corresponds to in[0] using the notation specified in FIPS 197.
        public let data: UInt128 //Plaintext_Data
        
        public init(key: UInt128, data: UInt128) {
        
            self.key = key
            self.data = data
        }
        
        public var byteValue: [UInt8] {
            
            let keyBytes = key.littleEndian.bytes
            let dataBytes = data.littleEndian.bytes
            
            return [
                keyBytes.0,
                keyBytes.1,
                keyBytes.2,
                keyBytes.3,
                keyBytes.4,
                keyBytes.5,
                keyBytes.6,
                keyBytes.7,
                keyBytes.8,
                keyBytes.9,
                keyBytes.10,
                keyBytes.11,
                keyBytes.12,
                keyBytes.13,
                keyBytes.14,
                keyBytes.15,
                dataBytes.0,
                dataBytes.1,
                dataBytes.2,
                dataBytes.3,
                dataBytes.4,
                dataBytes.5,
                dataBytes.6,
                dataBytes.7,
                dataBytes.8,
                dataBytes.9,
                dataBytes.10,
                dataBytes.11,
                dataBytes.12,
                dataBytes.13,
                dataBytes.14,
                dataBytes.15
            ]
        }
    }
    
    /// LE Start Encryption Command
    ///
    /// command is used to authenticate the given encryption key associated with the remote device specified
    /// by the Connection_Handle, and once authenticated will encrypt the connection.
    ///
    /// If the connection is already encrypted then the Controller shall pause connection encryption
    /// before attempting to authenticate the given encryption key, and then re-encrypt the connection.
    /// While encryption is paused no user data shall be transmitted.
    ///
    /// On an authentication failure, the connection shall be automatically disconnected
    /// by the Link Layer. If this command succeeds, then the connection shall be encrypted.
    ///
    /// This command shall only be used when the local device’s role is Master.
    public struct StartEncryptionParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.startEncryption //0x0019
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle
        
        /// 64 bit random number.
        public let randomNumber: UInt64 //Random_Number
        
        /// 16 bit encrypted diversifier.
        public let encryptedDiversifier: UInt16 //Encrypted_Diversifier
        
        /// 128 bit long term key.
        public let longTermKey: UInt128 //Long_Term_Key
        
        public init(connectionHandle: UInt16, randomNumber: UInt64, encryptedDiversifier: UInt16, longTermKey: UInt128) {
            
            self.connectionHandle = connectionHandle
            self.randomNumber = randomNumber
            self.encryptedDiversifier = encryptedDiversifier
            self.longTermKey = longTermKey
        }
        
        public var byteValue: [UInt8] {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            let randomNumberBytes = randomNumber.littleEndian.bytes
            let encryptedDiversifierBytes = encryptedDiversifier.littleEndian.bytes
            let longTermKeyBytes = longTermKey.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1,
                randomNumberBytes.0,
                randomNumberBytes.1,
                randomNumberBytes.2,
                randomNumberBytes.3,
                randomNumberBytes.4,
                randomNumberBytes.5,
                randomNumberBytes.6,
                randomNumberBytes.7,
                encryptedDiversifierBytes.0,
                encryptedDiversifierBytes.1,
                longTermKeyBytes.0,
                longTermKeyBytes.1,
                longTermKeyBytes.2,
                longTermKeyBytes.3,
                longTermKeyBytes.4,
                longTermKeyBytes.5,
                longTermKeyBytes.6,
                longTermKeyBytes.7,
                longTermKeyBytes.8,
                longTermKeyBytes.9,
                longTermKeyBytes.10,
                longTermKeyBytes.11,
                longTermKeyBytes.12,
                longTermKeyBytes.13,
                longTermKeyBytes.14,
                longTermKeyBytes.15
            ]
        }
    }
    
    /// LE Long Term Key Request Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event from the Controller,
    /// and specifies the Long_Term_Key parameter that shall be used for this Connection_Handle.
    public struct LongTermKeyRequestReplyParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.ltkReply //0x001A
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle

        /// 128 bit long term key for the given connection.
        public let longTermKey: UInt128 //Long_Term_Key
        
        public init(connectionHandle: UInt16, longTermKey: UInt128) {
            
            self.connectionHandle = connectionHandle
            self.longTermKey = longTermKey
        }
        
        public var byteValue: [UInt8] {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            let longTermKeyBytes = longTermKey.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1,
                longTermKeyBytes.0,
                longTermKeyBytes.1,
                longTermKeyBytes.2,
                longTermKeyBytes.3,
                longTermKeyBytes.4,
                longTermKeyBytes.5,
                longTermKeyBytes.6,
                longTermKeyBytes.7,
                longTermKeyBytes.8,
                longTermKeyBytes.9,
                longTermKeyBytes.10,
                longTermKeyBytes.11,
                longTermKeyBytes.12,
                longTermKeyBytes.13,
                longTermKeyBytes.14,
                longTermKeyBytes.15
            ]
        }
    }
    
    /// LE Long Term Key Request Negative Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event
    /// from the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
    public struct LongTermKeyRequestNegativeReplyParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.ltkNegativeReply //0x001B
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            
            self.connectionHandle = connectionHandle
        }
        
        public var byteValue: [UInt8] {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
        
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1
            ]
        }
    }
    
    /// LE Receiver Test Command
    ///
    /// This command is used to start a test where the DUT receives test reference
    /// packets at a fixed interval. The tester generates the test reference packets.
    public struct ReceiverTestParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.receiverTest //0x001D
        
        /// N = (F – 2402) / 2
        /// Range: 0x00 – 0x27. Frequency Range : 2402 MHz to 2480 MHz
        public let rxChannel: RxChannel //RX_Channel
        
        public init(rxChannel: RxChannel) {
            
            self.rxChannel = rxChannel
        }
        
        public var byteValue: [UInt8] {
            
            return [rxChannel.rawValue]
        }
    }
    
    /// LE Transmitter Test Command
    ///
    /// This command is used to start a test where the DUT generates test reference packets
    /// at a fixed interval. The Controller shall transmit at maximum power.
    ///
    /// An LE Controller supporting the LE_Transmitter_Test command shall support Packet_Payload values 0x00,
    /// 0x01 and 0x02. An LE Controller may support other values of Packet_Payload.
    public struct TransmitterTestParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.transmitterTest //0x001E
        
        /// N = (F – 2402) / 2
        /// Range: 0x00 – 0x27. Frequency Range : 2402 MHz to 2480 MHz
        public let rxChannel: RxChannel //RX_Channel
        
        public let lengthOfTestData: UInt8
        
        public let packetPayload: LowEnergyPacketPayload
        
        public init(rxChannel: RxChannel,
                    lengthOfTestData: UInt8,
                    packetPayload: LowEnergyPacketPayload) {
            
            self.rxChannel = rxChannel
            self.lengthOfTestData = lengthOfTestData
            self.packetPayload = packetPayload
        }
        
        public var byteValue: [UInt8] {
            
            return [rxChannel.rawValue, packetPayload.rawValue]
        }
    }
    
    /// LE Add Device To Resolving List Command
    ///
    /// The LE_Add_Device_To_Resolving_List command is used to
    /// add one device to the list of address translations used to
    /// resolve Resolvable Private Addresses in the Controller.
    ///
    /// This command cannot be used when address translation is enabled
    /// in the Controller and:
    /// * Advertising is enabled
    /// * Scanning is enabled
    /// * Create connection command is outstanding
    ///
    /// This command can be used at any time when address translation
    /// is disabled in the Controller.
    ///
    /// The added device shall be set to Network Privacy mode.
    ///
    /// When a Controller cannot add a device to the list because
    /// there is no space available, it shall return the error code
    /// Memory Capacity Exceeded (0x07).
    public struct AddDeviceToResolvingListParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.addDeviceToResolvedList //0x0027
        
        public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
        
        public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
        
        public let peerIrk: UInt128 //Peer_IRK
        
        public let localIrk: UInt128 //Local_IRK
        
        public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType, peerIdentifyAddress: UInt64, peerIrk: UInt128, localIrk: UInt128) {
        
            self.peerIdentifyAddressType = peerIdentifyAddressType
            self.peerIdentifyAddress = peerIdentifyAddress
            self.peerIrk = peerIrk
            self.localIrk = localIrk
        }
        
        public var byteValue: [UInt8] {
            
            let peerIdentifyAddressTypeBytes = peerIdentifyAddressType.rawValue.littleEndian
            let peerIdentifyAddressBytes = peerIdentifyAddress.littleEndian.bytes
            let peerIrkBytes = peerIrk.littleEndian.bytes
            let localIrkBytes = localIrk.littleEndian.bytes
            
            return [
                    peerIdentifyAddressTypeBytes,
                    peerIdentifyAddressBytes.0,
                    peerIdentifyAddressBytes.1,
                    peerIdentifyAddressBytes.2,
                    peerIdentifyAddressBytes.3,
                    peerIdentifyAddressBytes.4,
                    peerIdentifyAddressBytes.5,
                    peerIdentifyAddressBytes.6,
                    peerIdentifyAddressBytes.7,
                    peerIrkBytes.0,
                    peerIrkBytes.1,
                    peerIrkBytes.2,
                    peerIrkBytes.3,
                    peerIrkBytes.4,
                    peerIrkBytes.5,
                    peerIrkBytes.6,
                    peerIrkBytes.7,
                    peerIrkBytes.8,
                    peerIrkBytes.9,
                    peerIrkBytes.10,
                    peerIrkBytes.11,
                    peerIrkBytes.12,
                    peerIrkBytes.13,
                    peerIrkBytes.14,
                    peerIrkBytes.15,
                    localIrkBytes.0,
                    localIrkBytes.1,
                    localIrkBytes.2,
                    localIrkBytes.3,
                    localIrkBytes.4,
                    localIrkBytes.5,
                    localIrkBytes.6,
                    localIrkBytes.7,
                    localIrkBytes.8,
                    localIrkBytes.9,
                    localIrkBytes.10,
                    localIrkBytes.11,
                    localIrkBytes.12,
                    localIrkBytes.13,
                    localIrkBytes.14,
                    localIrkBytes.15
                ]
        }
    }
    
    /// LE Remove Device From Resolving List Command
    ///
    /// he LE_Remove_Device_From_Resolving_List command is used
    /// to remove one device from the list of address translations used to
    /// resolve Resolvable Private Addresses in the Controller.
    ///
    /// This command cannot be used when address translation is
    /// enabled in the Controller and:
    ///
    /// * Advertising is enabled
    /// * Scanning is enabled
    /// * Create connection command is outstanding
    ///
    /// This command can be used at any time when address translation
    /// is disabled in the Controller.
    ///
    /// When a Controller cannot remove a device from the resolving
    /// list because it is not found, it shall return the error code
    /// Unknown Connection Identifier (0x02).
    public struct RemoveDeviceFromResolvingListParameter: HCICommandParameter {
    
        public static let command = LowEnergyCommand.removeDeviceFromResolvedList //0x0028
        
        public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
        
        public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
        
        public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                    peerIdentifyAddress: UInt64) {
            
            self.peerIdentifyAddressType = peerIdentifyAddressType
            self.peerIdentifyAddress = peerIdentifyAddress
        }
        
        public var byteValue: [UInt8] {
            
            let peerIdentifyAddressTypeBytes = peerIdentifyAddressType.rawValue.littleEndian
            let peerIdentifyAddressBytes = peerIdentifyAddress.littleEndian.bytes
            
            return [
                peerIdentifyAddressTypeBytes,
                peerIdentifyAddressBytes.0,
                peerIdentifyAddressBytes.1,
                peerIdentifyAddressBytes.2,
                peerIdentifyAddressBytes.3,
                peerIdentifyAddressBytes.4,
                peerIdentifyAddressBytes.5,
                peerIdentifyAddressBytes.6,
                peerIdentifyAddressBytes.7
            ]
        }
    }
    
    /// LE Read Peer Resolvable Address Command
    ///
    /// The command is used to get the current peer Resolvable Private Address
    /// being used for the corresponding peer Public and Random (static) Identity Address.
    /// The peer’s resolvable address being used may change after the command is called.
    ///
    /// This command can be used at any time.
    ///
    /// When a Controller cannot find a Resolvable Private Address associated
    /// with the Peer Identity Address, it shall return the error code Unknown
    /// Connection Identifier (0x02).
    public struct ReadPeerResolvableAddressParameter: HCICommandParameter { //HCI_LE_Read_ Peer_Resolvable_Address
        
        public static let command = LowEnergyCommand.readPeerResolvableAddress //0x002B
        
        public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
        
        public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
        
        public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                    peerIdentifyAddress: UInt64) {
            
            self.peerIdentifyAddressType = peerIdentifyAddressType
            self.peerIdentifyAddress = peerIdentifyAddress
        }
        
        public var byteValue: [UInt8] {
            
            let peerIdentifyAddressTypeBytes = peerIdentifyAddressType.rawValue.littleEndian
            let peerIdentifyAddressBytes = peerIdentifyAddress.littleEndian.bytes
            
            return [
                peerIdentifyAddressTypeBytes,
                peerIdentifyAddressBytes.0,
                peerIdentifyAddressBytes.1,
                peerIdentifyAddressBytes.2,
                peerIdentifyAddressBytes.3,
                peerIdentifyAddressBytes.4,
                peerIdentifyAddressBytes.5,
                peerIdentifyAddressBytes.6,
                peerIdentifyAddressBytes.7
            ]
        }
    }
    
    /// LE Read Local Resolvable Address Command
    ///
    /// The command is used to get the current local Resolvable Private Address
    //// being used for the corresponding peer Identity Address.
    /// The local’s resolvable address being used may change after the command is called.
    ///
    /// This command can be used at any time.
    ///
    /// When a Controller cannot find a Resolvable Private Address associated
    /// with the Peer Identity Address, it shall return the error code
    /// Unknown Connection Identifier (0x02).
    public struct ReadLocalResolvableAddressParameter: HCICommandParameter { //HCI_LE_Read_Local_ Resolvable_Address
        
        public static let command = LowEnergyCommand.readLocalResolvableAddress //0x002C
        
        public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
        
        public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
        
        public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                    peerIdentifyAddress: UInt64) {
            
            self.peerIdentifyAddressType = peerIdentifyAddressType
            self.peerIdentifyAddress = peerIdentifyAddress
        }
        
        public var byteValue: [UInt8] {
            
            let peerIdentifyAddressBytes = peerIdentifyAddress.littleEndian.bytes
            
            return [
                peerIdentifyAddressType.rawValue,
                peerIdentifyAddressBytes.0,
                peerIdentifyAddressBytes.1,
                peerIdentifyAddressBytes.2,
                peerIdentifyAddressBytes.3,
                peerIdentifyAddressBytes.4,
                peerIdentifyAddressBytes.5,
                peerIdentifyAddressBytes.6,
                peerIdentifyAddressBytes.7
            ]
        }
    }
    
    /// LE Set Address Resolution Enable Command
    ///
    /// The ommand is used to enable resolution of Resolvable Private Addresses
    /// in the Controller. This causes the Controller to use the resolving list
    /// whenever the Controller receives a local or peer Resolvable Private Address.
    ///
    /// This command can be used at any time except when
    ///
    /// * Advertising is enabled
    /// * Scanning is enabled
    /// * Create connection command is outstanding
    ///
    /// Note: enabling address resolution when it is already enabled,
    /// or disabling it when it is already disabled, has no effect.
    public struct SetAddressResolutionEnableParameter: HCICommandParameter { //HCI_LE_Set_Address_Resolution_ Enable
        
        public static let command = LowEnergyCommand.setAddressResolutionEnable //0x002D
        
        public let addressResolutionEnable: AddressResolutionEnable
        
        public init(addressResolutionEnable: AddressResolutionEnable) {
            self.addressResolutionEnable = addressResolutionEnable
        }
        
        public var byteValue: [UInt8] {
            return [addressResolutionEnable.rawValue]
        }
        
        public enum AddressResolutionEnable: UInt8 {
            
            /// Address Resolution in Controller disabled (default)
            case disabled = 0x00
            
            /// Address Resolution in Controller enabled
            case enabled  = 0x01
        }
    }
    
    /// LE Set Resolvable Private Address Timeout Command
    ///
    /// The command set the length of time the Controller uses a
    /// Resolvable Private Address before a new resolvable private address is
    /// generated and starts being used.
    ///
    /// This timeout applies to all addresses generated by the Controller.
    public struct SetResolvablePrivateAddressTimeoutParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.setResolvablePrivateAddressTimeout //0x002E
        
        /// Default: N= 0x0384 (900 s or 15 minutes)
        public static let defaultRpaTimeout = RPATimeout(0x0384)
        
        /// RPA_Timeout measured in s
        /// Range for N: 0x0001 – 0xA1B8 (1 s – approximately 11.5 hours)
        /// Default: N= 0x0384 (900 s or 15 minutes)
        public let rpaTimeout: RPATimeout //RPA_Timeout
        
        public init(rpaTimeout: RPATimeout = defaultRpaTimeout) {
            self.rpaTimeout = rpaTimeout
        }
        
        public var byteValue: [UInt8] {
            
            let rpaTimeoutBytes = rpaTimeout.rawValue.littleEndian.bytes
            
            return [rpaTimeoutBytes.0,
                    rpaTimeoutBytes.1]
        }
        
        /// RPA_Timeout measured in s
        /// Range for N: 0x0001 – 0xA1B8 (1 s – approximately 11.5 hours)
        public struct RPATimeout: RawRepresentable, Equatable, Comparable, Hashable {
            
            /// 2.5 msec
            public static let min = RPATimeout(0x0001)
            
            /// 10.24 seconds
            public static let max = RPATimeout(0xA1B8)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= RPATimeout.min.rawValue,
                    rawValue <= RPATimeout.max.rawValue
                    else { return nil }
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            fileprivate init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: RPATimeout, rhs: RPATimeout) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: RPATimeout, rhs: RPATimeout) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
    }
    
    /// LE Read PHY Command
    ///
    /// The command is used to read the current transmitter PHY and receiver PHY
    /// on the connection identified by the Connection_Handle.
    public struct ReadPHYParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.readPhy //0x0030
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            
            self.connectionHandle = connectionHandle
        }
        
        public var byteValue: [UInt8] {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1
            ]
        }
    }
    
    /// LE Set Default PHY Command
    ///
    /// command allows the Host to specify its preferred values for
    /// the transmitter PHY and receiver PHY to be used for all subsequent
    ///connections over the LE transport.
    public struct SetDefaultPhyParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.readPhy //0x0031
        
        public let allPhys: LowEnergyAllPhys
        public let txPhys:  LowEnergyTxPhys
        public let rxPhys: LowEnergyRxPhys
        
        public init(allPhys: LowEnergyAllPhys, txPhys:  LowEnergyTxPhys, rxPhys: LowEnergyRxPhys) {
            self.allPhys = allPhys
            self.txPhys = txPhys
            self.rxPhys = rxPhys
        }
        
        public var byteValue: [UInt8] {
            return [allPhys.rawValue, txPhys.rawValue, rxPhys.rawValue]
        }
    }
    
    /// LE Set PHY Command
    ///
    /// The command is used to set the PHY preferences for the connection identified by
    /// the Connection_Handle. The Controller might not be able to make the change
    /// (e.g. because the peer does not support the requested PHY) or may decide that
    /// the current PHY is preferable.
    public struct SetPhyParameter: HCICommandParameter {
    
        public static let command = LowEnergyCommand.setPhy //0x0032
    
        public let connectionHandle: UInt16
        public let allPhys: LowEnergyAllPhys
        public let txPhys:  LowEnergyTxPhys
        public let rxPhys: LowEnergyRxPhys
        public let phyOptions: LowEnergyPhyOptions
        
        public init(connectionHandle: UInt16, allPhys: LowEnergyAllPhys, txPhys:  LowEnergyTxPhys, rxPhys: LowEnergyRxPhys, phyOptions: LowEnergyPhyOptions) {
            self.connectionHandle = connectionHandle
            self.allPhys = allPhys
            self.txPhys = txPhys
            self.rxPhys = rxPhys
            self.phyOptions = phyOptions
        }
    
        public var byteValue: [UInt8] {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            let phyOptionsBytes = phyOptions.rawValue.littleEndian.bytes
            
            return [connectionHandleBytes.0,
                    connectionHandleBytes.1,
                    allPhys.rawValue,
                    txPhys.rawValue,
                    rxPhys.rawValue,
                    phyOptionsBytes.0,
                    phyOptionsBytes.1
            ]
        }
    }
    
    /// LE Enhanced Receiver Test Command
    ///
    /// This command is used to start a test where the DUT receives test reference packets at a
    /// fixed interval. The tester generates the test reference packets.
    public struct EnhancedReceiverTestParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.enhancedReceiverTest //0x0033
        
        public let rxChannel: RxChannel
        public let phy: Phy
        public let modulationIndex: ModulationIndex
        
        public init(rxChannel: RxChannel, phy: Phy, modulationIndex: ModulationIndex) {
            self.rxChannel = rxChannel
            self.phy = phy
            self.modulationIndex = modulationIndex
        }
        
        public var byteValue: [UInt8] {
            return [rxChannel.rawValue, phy.rawValue, modulationIndex.rawValue]
        }
        
        public enum Phy: UInt8 {
            
            /// Receiver set to use the LE 1M PHY
            case le1MPhy        =   0x01
            
            /// Receiver set to use the LE 2M PHY
            case le2MPhy        =   0x02
            
            /// Receiver set to use the LE Coded PHY
            case leCodedPhy     =   0x03
        }
        
        public enum ModulationIndex: UInt8 {
            
            /// Assume transmitter will have a standard modulation index
            case standard = 0x00
            
            /// Assume transmitter will have a stable modulation index
            case stable   = 0x01
        }
    }
}

// MARK: - Command Return Parameters

public extension LowEnergyCommand {
    
    /// LE Read White List Size
    ///
    /// The command is used to read the total number of white list entries that can be stored in the Controller.
    public struct ReadWhiteListSizeReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readWhiteListSize //0x000F
        public static let length = 1
        
        /// The white list size.
        public let size: UInt8 // White_List_Size
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == ReadWhiteListSizeReturnParameter.length
                else { return nil }
            
            self.size = byteValue[0]
        }
    }
    
    /// LE Read Channel Map Command
    ///
    /// The command returns the current Channel_Map for the specified Connection_Handle. The returned value indicates the state
    /// of the Channel_Map specified by the last transmitted or received Channel_Map (in a CONNECT_IND or LL_CHANNEL_MAP_IND message)
    /// for the specified Connection_Handle, regardless of whether the Master has received an acknowledgment.
    public struct ReadChannelMapReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readChannelMap //0x0015
        
        public static let length: Int = 7
        
        public let connectionHandle: UInt16 // Connection_Handle
        
        /// This parameter contains 37 1-bit fields.
        /// The Nth such field (in the range 0 to 36) contains the value for the link layer channel index n.
        /// Channel n is unused = 0.
        /// Channel n is used = 1.
        /// The most significant bits are reserved for future use.
        public let channelMap: LowEnergyChannelMap // Channel_Map
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            
            channelMap = (byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6])
        }
    }
    
    /// LE Encrypt Command
    ///
    /// The Commnad is used to request the Controller to encrypt the Plaintext_Data in the command using the Key given in the command
    /// and returns the Encrypted_Data to the Host.
    /// The AES-128 bit block cypher is defined in NIST Publication FIPS-197 (http://csrc.nist.gov/publications/fips/fips197/fips-197.pdf).
    public struct EncryptReturnParameter: HCICommandReturnParameter {

        public static let command = LowEnergyCommand.encrypt //0x0017
        
        public static let length: Int = 16
        
        /// 128 bit encrypted data block.
        /// The most significant octet of the Encrypted_Data corresponds to out[0] using the notation specified in FIPS 197.
        public let encryptedData: UInt128
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            guard let encryptedData = UInt128(data: Data(byteValue))
                else { return nil }
            
            self.encryptedData = encryptedData
        }
    }
    
    /// LE Rand Command
    ///
    /// The command is used to request the Controller to generate 8 octets of random data to be sent to the Host.
    public struct RandomReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.random //0x0018
        
        public static let length: Int = 8
        
        /// Random Number
        public let randomNumber: UInt64 //Random_Number
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            self.randomNumber = UInt64(littleEndian: UInt64(bytes: ((byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7]))))
        }
    }
    
    /// LE Long Term Key Request Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event from the Controller,
    /// and specifies the Long_Term_Key parameter that shall be used for this Connection_Handle.
    public struct LongTermKeyRequestReplyReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.ltkReply //0x001A
        
        public static let length: Int = 2
        
        /// Connection_Handle
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 // Connection_Handle
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Long Term Key Request Negative Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event
    /// from the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
    public struct LongTermKeyRequestNegativeReplyReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.ltkNegativeReply //0x001B
        
        public static let length: Int = 2
        
        /// Connection_Handle
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 // Connection_Handle
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Test End Command
    ///
    /// This command is used to stop any test which is in progress. The Number_Of_Packets
    /// for a transmitter test shall be reported as 0x0000. The Number_Of_Packets is an unsigned number
    /// and contains the number of received packets.
    public struct TestEndReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.testEnd //0x001F
        
        public static let length: Int = 2
        
        public let numberOfPackets: UInt16
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            numberOfPackets = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Read Supported States
    public struct ReadSupportedStatesReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readSupportedStates //0x001C
        
        public static let length: Int = 8
        
        public let state: LowEnergyStateSet
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            let stateRawValue = UInt64(littleEndian: UInt64(bytes: (byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7])))
            
            guard let state = LowEnergyStateSet(rawValue: stateRawValue)
                else { return nil }
            
            self.state = state
        }
    }
    
    /// LE Read Resolving List Size Command
    ///
    /// The command is used to read the total number of address translation entries
    /// in the resolving list that can be stored in the Controller.
    /// Note: The number of entries that can be stored is not fixed and
    /// the Controller can change it at any time (e.g. because the memory
    /// used to store the list can also be used for other purposes).
    public struct ReadResolvingListSizeReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readResolvedListSize //0x002A
        
        public static let length: Int = 1
        
        public let resolvingListSize: UInt8 //Resolving_List_Size
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            self.resolvingListSize = byteValue[0]
        }
    }
    
    /// LE Read Peer Resolvable Address Command
    ///
    /// The command is used to get the current peer Resolvable Private Address
    /// being used for the corresponding peer Public and Random (static) Identity Address.
    /// The peer’s resolvable address being used may change after the command is called.
    ///
    /// This command can be used at any time.
    ///
    /// When a Controller cannot find a Resolvable Private Address associated
    /// with the Peer Identity Address, it shall return the error code Unknown
    /// Connection Identifier (0x02).
    public struct ReadPeerResolvableAddressReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readPeerResolvableAddress //0x002B
        
        public static let length: Int = 6
        
        /// Resolvable Private Address being used by the peer device
        public let peerResolvableAddress: UInt64 //Peer_Resolvable_Address
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            self.peerResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7]))))
        }
    }
    
    /// LE Read Local Resolvable Address Command
    ///
    /// The command is used to get the current local Resolvable Private Address
    //// being used for the corresponding peer Identity Address.
    /// The local’s resolvable address being used may change after the command is called.
    ///
    /// This command can be used at any time.
    ///
    /// When a Controller cannot find a Resolvable Private Address associated
    /// with the Peer Identity Address, it shall return the error code
    /// Unknown Connection Identifier (0x02).
    public struct ReadLocalResolvableAddressReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readLocalResolvableAddress //0x002C
        
        public static let length: Int = 6
        
        /// Resolvable Private Address being used by the local device
        public let localResolvableAddress: UInt64 //Local_Resolvable_Address
        
        public init?(byteValue: [UInt8]) {
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            self.localResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7]))))
        }
    }
    
    /// LE Read Maximum Data Length Command
    ///
    /// The command allows the Host to read the Controller’s maximum supported payload octets
    /// and packet duration times for transmission and reception.
    public struct ReadMaximumDataLengthReturnParameter: HCICommandReturnParameter { //HCI_LE_Read_Maximum_Data_ Length 1323
        
        public static let command = LowEnergyCommand.readMaximumDataLength //0x002F
        
        public static let length: Int = 8
        
        /// Maximum number of payload octets that the local Controller supports for transmission
        /// of a single Link Layer packet on a data connection.
        public let supportedMaxTxOctets: SupportedMaxTxOctets
        
        /// Maximum time, in microseconds, that the local Controller supports for transmission of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxTxTime: SupportedMaxTxTime
        
        /// Maximum number of payload octets that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxRxOctets: SupportedMaxRxOctets
        
        /// Maximum time, in microseconds, that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxRxTime: SupportedMaxRxTime
        
        public init?(byteValue: [UInt8]) {
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            guard let supportedMaxTxOctets = SupportedMaxTxOctets(rawValue: UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1]))))
                else { return nil }
            
            guard let supportedMaxTxTime = SupportedMaxTxTime(rawValue: UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3]))))
                else { return nil }
            
            guard let supportedMaxRxOctets = SupportedMaxRxOctets(rawValue: UInt16(littleEndian: UInt16(bytes: (byteValue[4], byteValue[5]))))
                else { return nil }
            
            guard let supportedMaxRxTime = SupportedMaxRxTime(rawValue: UInt16(littleEndian: UInt16(bytes: (byteValue[6], byteValue[7]))))
                else { return nil }
            
            self.supportedMaxTxOctets = supportedMaxTxOctets
            self.supportedMaxTxTime = supportedMaxTxTime
            self.supportedMaxRxOctets = supportedMaxRxOctets
            self.supportedMaxRxTime = supportedMaxRxTime
        }
        
        /// Maximum time, in microseconds, that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        /// Range 0x0148-0x4290
        public struct SupportedMaxRxTime: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = SupportedMaxRxTime(0x0148)
            
            public static let max = SupportedMaxRxTime(0x4290)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= SupportedMaxRxTime.min.rawValue,
                    rawValue <= SupportedMaxRxTime.max.rawValue
                    else { return nil }
                
                assert((SupportedMaxRxTime.min.rawValue ... SupportedMaxRxTime.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: SupportedMaxRxTime, rhs: SupportedMaxRxTime) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: SupportedMaxRxTime, rhs: SupportedMaxRxTime) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
        
        /// Maximum number of payload octets that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        /// Range 0x001B-0x00FB
        public struct SupportedMaxRxOctets: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = SupportedMaxRxOctets(0x001B)
            
            public static let max = SupportedMaxRxOctets(0x00FB)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= SupportedMaxRxOctets.min.rawValue,
                    rawValue <= SupportedMaxRxOctets.max.rawValue
                    else { return nil }
                
                assert((SupportedMaxRxOctets.min.rawValue ... SupportedMaxRxOctets.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: SupportedMaxRxOctets, rhs: SupportedMaxRxOctets) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: SupportedMaxRxOctets, rhs: SupportedMaxRxOctets) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
        
        /// Maximum time, in microseconds, that the local Controller supports for transmission of
        /// a single Link Layer packet on a data connection.
        /// Range 0x0148-0x4290
        public struct SupportedMaxTxTime: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = SupportedMaxTxTime(0x0148)
            
            public static let max = SupportedMaxTxTime(0x4290)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= SupportedMaxTxTime.min.rawValue,
                    rawValue <= SupportedMaxTxTime.max.rawValue
                    else { return nil }
                
                assert((SupportedMaxTxTime.min.rawValue ... SupportedMaxTxTime.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: SupportedMaxTxTime, rhs: SupportedMaxTxTime) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: SupportedMaxTxTime, rhs: SupportedMaxTxTime) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
        
        /// Maximum number of payload octets that the local Controller supports for transmission
        /// of a single Link Layer packet on a data connection.
        /// Range 0x001B-0x00FB
        public struct SupportedMaxTxOctets: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = SupportedMaxTxOctets(0x001B)
            
            public static let max = SupportedMaxTxOctets(0x00FB)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= SupportedMaxTxOctets.min.rawValue,
                    rawValue <= SupportedMaxTxOctets.max.rawValue
                    else { return nil }
                
                assert((SupportedMaxTxOctets.min.rawValue ... SupportedMaxTxOctets.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: SupportedMaxTxOctets, rhs: SupportedMaxTxOctets) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: SupportedMaxTxOctets, rhs: SupportedMaxTxOctets) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
    }
    
    /// LE Read PHY Command
    ///
    /// The command is used to read the current transmitter PHY and receiver PHY
    /// on the connection identified by the Connection_Handle.
    public struct ReadPHYReturnParameter: HCICommandReturnParameter {
        
        public static let command = LowEnergyCommand.readPhy //0x0030
        
        public static let length: Int = 4
        
        public let connectionHandle: UInt16
        
        public let txPhy: LowEnergyTxPhy
        
        public let rxPhy: LowEnergyRxPhy
        
        public init?(byteValue: [UInt8]) {
            guard byteValue.count == type(of:self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            
            guard let txPhy = LowEnergyTxPhy(rawValue: byteValue[2])
                else { return nil }
            
            guard let rxPhy = LowEnergyRxPhy(rawValue: byteValue[3])
                else { return nil }
            
            self.txPhy = txPhy
            self.rxPhy = rxPhy
        }
    }
}

// MARK: - Supporting Types

public enum LowEnergyRxPhy: UInt8 { //RX_PHY
    
    /// The receiver PHY for the connection is LE 1M
    case le1m       = 0x01
    
    /// The receiver PHY for the connection is LE 2M
    case le2m       = 0x02
    
    /// The receiver PHY for the connection is LE Coded
    case leCoded    = 0x03
}

public enum LowEnergyTxPhy: UInt8 { //TX_PHY
    
    /// The transmitter PHY for the connection is LE 1M
    case le1m       = 0x01
    
    /// The transmitter PHY for the connection is LE 2M
    case le2m       = 0x02
    
    /// The transmitter PHY for the connection is LE Coded
    case leCoded    = 0x03
}

public enum LowEnergyPeerIdentifyAddressType: UInt8 { //Peer_Identity_Address_Type
    case publicIdentifyAddress = 0x00
    case randomIdentifyAddress = 0x01
}

public enum LowEnergyPacketPayload: UInt8 { // Packet_Payload
    
    case prb29Sequence       = 0x00
    case repeated11110000    = 0x01
    case repeated10101010    = 0x02
    case prbs15Sequence      = 0x03
    case repeated11111111    = 0x04
    case repeated00000000    = 0x05
    case repeated00001111    = 0x06
    case repeated01010101    = 0x07
}

/// Value for connection event interval
///
/// Range: 0x0006 to 0x0C80
/// Time = N * 1.25 msec
/// Time Range: 7.5 msec to 4 seconds.
public struct LowEnergyConnectionInterval: RawRepresentable, Equatable {
    
    public typealias RawValue = CountableClosedRange<UInt16>
    
    /// 7.5 msec
    public static let min: UInt16 = 0x0006
    
    /// 4000 msec
    public static let max: UInt16 = 0x0C80
    
    /// Maximum interval range.
    public static let full = LowEnergyConnectionInterval(.min ... .max)
    
    public let rawValue: RawValue
    
    public init?(rawValue: RawValue) {
        
        assert(LowEnergyConnectionInterval.full.rawValue.lowerBound == LowEnergyConnectionInterval.min)
        assert(LowEnergyConnectionInterval.full.rawValue.upperBound == LowEnergyConnectionInterval.max)
        
        guard rawValue.lowerBound >= LowEnergyConnectionInterval.min,
            rawValue.upperBound <= LowEnergyConnectionInterval.max
            else { return nil }
        
        assert(rawValue.clamped(to: LowEnergyConnectionInterval.full.rawValue) == rawValue)
        assert(rawValue.overlaps(LowEnergyConnectionInterval.full.rawValue))
        
        self.rawValue = rawValue
    }
    
    // private API, unsafe
    private init(_ unchecked: RawValue) {
        
        self.rawValue = unchecked
    }
    
    /// Time = N * 1.25 msec
    public var miliseconds: ClosedRange<Double> {
        
        let miliseconds = Double(1.25)
        
        let min = Double(rawValue.lowerBound) * miliseconds
        
        let max = Double(rawValue.upperBound) * miliseconds
        
        return min ... max
    }
    
    // Equatable
    public static func == (lhs: LowEnergyConnectionInterval, rhs: LowEnergyConnectionInterval) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

/// The ALL_PHYS parameter is a bit field that allows the Host to specify, for each direction,
/// whether it has no preference among the PHYs that the Controller supports in a given direction
//// or whether it has specified particular PHYs that it prefers in the TX_PHYS or RX_PHYS parameter.
public enum LowEnergyAllPhys: UInt8, BitMaskOption {
    
    /// The Host has no preference among the transmitter PHYs supported by the Controller
    case hostHasNoPreferenceAmongTheTransmitterPhy  = 0b01
    
    /// The Host has no preference among the receiver PHYs supported by the Controller
    case hostHasNoPreferenceAmongTheReceiverPhy     = 0b10
    
    public static let all: Set<LowEnergyAllPhys> = [.hostHasNoPreferenceAmongTheTransmitterPhy,
                                                  .hostHasNoPreferenceAmongTheReceiverPhy]
}

/// The TX_PHYS parameter is a bit field that indicates the transmitter PHYs that the Host prefers
/// the Controller to use. If the ALL_PHYS parameter specifies that the Host has no preference,
//// the TX_PHYS parameter is ignored; otherwise at least one bit shall be set to 1.
public enum LowEnergyTxPhys: UInt8, BitMaskOption {
    
    /// The Host prefers to use the LE 1M transmitter PHY (possibly among others)
    case hostUseLe1MTransmitterPhy      = 0b001
    
    /// The Host prefers to use the LE 2M transmitter PHY (possibly among others)
    case hostUseLe2MTransmitterPhy      = 0b010
    
    /// The Host prefers to use the LE Coded transmitter PHY (possibly among others)
    case hostUseLeCodedTransmitterPhy   = 0b100
    
    public static let all: Set<LowEnergyTxPhys> = [.hostUseLe1MTransmitterPhy,
                                           .hostUseLe2MTransmitterPhy,
                                           .hostUseLeCodedTransmitterPhy]
}

/// The RX_PHYS parameter is a bit field that indicates the receiver PHYs that the Host prefers
/// the Controller to use. If the ALL_PHYS parameter specifies that the Host has no preference,
/// the RX_PHYS parameter is ignored; otherwise at least one bit shall be set to 1.
public enum LowEnergyRxPhys: UInt8, BitMaskOption {
    
    /// The Host prefers to use the LE 1M receiver PHY (possibly among others)
    case hostUseLe1MReceiverPhy      = 0
    
    /// The Host prefers to use the LE 2M receiver PHY (possibly among others)
    case hostUseLe2MReceiverPhy      = 1
    
    /// The Host prefers to use the LE Coded receiver PHY (possibly among others)
    case hostUseLeCodedReceiverPhy   = 2
    
    public static let all: Set<LowEnergyRxPhys> = [.hostUseLe1MReceiverPhy,
                                          .hostUseLe2MReceiverPhy,
                                          .hostUseLeCodedReceiverPhy]
}

/// The PHY_options parameter is a bit field that allows the Host to specify options for PHYs.
/// The default value for a new connection shall be all zero bits. The Controller may override
/// any preferred coding for transmitting on the LE Coded PHY.
public enum LowEnergyPhyOptions: UInt16, BitMaskOption {
    
    /// The Host has no preferred coding when transmitting on the LE Coded PHY
    case host       = 0b01
    
    /// The Host prefers that S=2 coding be used when transmitting on the LE Coded PHY
    case s2         = 0b10
    
    /// The Host prefers that S=8 coding be used when transmitting on the LE Coded PHY
    case s3         = 0b100
    
    public static let all: Set<LowEnergyPhyOptions> = [.host,
                                          .s2,
                                          .s3]
}

/// Slave latency for the connection in number of connection events.
///
/// Range: 0x0000 to 0x01F3
public struct LowEnergyConnectionLatency: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static var zero: LowEnergyConnectionLatency { return LowEnergyConnectionLatency() }
    
    public let rawValue: UInt16
    
    public init() {
        
        self.rawValue = 0
    }
    
    public init?(rawValue: UInt16) {
        
        guard rawValue <= 0x01F3
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyConnectionLatency, rhs: LowEnergyConnectionLatency) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
    
    // Comparable
    public static func < (lhs: LowEnergyConnectionLatency, rhs: LowEnergyConnectionLatency) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
}

public typealias LowEnergyChannelMap = (UInt8, UInt8, UInt8, UInt8, UInt8)

/// 31 Byte LE Advertising or Scan Response Data
public typealias LowEnergyResponseData = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

/// LE White List Address Type
public enum LowEnergyWhiteListAddressType: UInt8 {
    
    /// Public Device Address
    case `public` = 0x00
    
    /// Random Device Address
    case random = 0x01
    
    /// Devices sending anonymous advertisements
    case anonymous = 0xFF
}

/// LE White List Device Entry
public enum LowEnergyWhiteListDevice {
    
    case `public`(Address)
    case random(Address)
    case anonymous
    
    public var addressType: LowEnergyWhiteListAddressType {
        switch self {
        case .public: return .public
        case .random: return .random
        case .anonymous: return .anonymous
        }
    }
    
    public var address: Address {
        switch self {
        case let .public(address): return address
        case let .random(address): return address
        case .anonymous: return .any
        }
    }
}

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
    fileprivate init(_ rawValue: UInt16) {
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

public struct RxChannel: RawRepresentable, Equatable, Hashable, Comparable {
    
    /// 100 msec
    public static let min = RxChannel(0x00)
    
    /// 32 seconds
    public static let max = RxChannel(0x27)
    
    public var rawValue: UInt8
    
    public init?(rawValue: UInt8) {
        guard rawValue >= RxChannel.min.rawValue,
            rawValue <= RxChannel.max.rawValue
            else { return nil }
        
        assert((RxChannel.min.rawValue ... RxChannel.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt8) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: RxChannel, rhs: RxChannel) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: RxChannel, rhs: RxChannel) -> Bool {
        
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

/// Information parameter about the minimum length of connection needed for this LE connection.
///
/// Range: 0x0000 – 0xFFFF
/// Time = N * 0.625 msec.
public struct LowEnergyConnectionLength: RawRepresentable, Equatable {
    
    public typealias RawValue = CountableClosedRange<UInt16>
    
    /// Maximum interval range.
    public static let full = LowEnergyConnectionLength(rawValue: .min ... .max)
    
    public let rawValue: RawValue
    
    public init(rawValue: RawValue) {
        
        self.rawValue = rawValue
    }
    
    /// Time = N * 0.625 msec.
    public var miliseconds: ClosedRange<Double> {
        
        let miliseconds = Double(0.625)
        
        let min = Double(rawValue.lowerBound) * miliseconds
        
        let max = Double(rawValue.upperBound) * miliseconds
        
        return min ... max
    }
    
    // Equatable
    public static func == (lhs: LowEnergyConnectionLength, rhs: LowEnergyConnectionLength) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}
