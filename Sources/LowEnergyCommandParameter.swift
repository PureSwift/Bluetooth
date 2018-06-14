//
//  HCILowEnergyCommandParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

public extension HCILowEnergyCommand {
    
    /// LE Set Advertising Parameters Command
    ///
    /// Used by the Host to set the advertising parameters.
    public struct SetAdvertisingParametersParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setAdvertisingParameters // 0x0006
        public static let length = 2 + 2 + 1 + 1 + 1 + 6 + 1 + 1
        
        /// Interval for non-directed advertising.
        ///
        /// - Note: The `Advertising_Interval_Min` and `Advertising_Interval_Max` should not be the same value
        /// to enable the Controller to determine the best advertising interval given other activities.
        ///
        /// For directed advertising, when Advertising_Type is `0x01` (ADV_DIRECT_IND),
        /// the `Advertising_Interval_Min` and `Advertising_Interval_Max` parameters are not used and shall be ignored.
        ///
        /// The `Advertising_Interval_Min` and `Advertising_Interval_Max` shall not be set to less than
        /// `0x00A0` (100 ms) if the Advertising_Type is set to `0x02` (ADV_SCAN_IND) or `0x03` (ADV_NONCONN_IND).
        public var interval: (min: AdvertisingInterval, max: AdvertisingInterval)
        
        /// Ssed to determine the packet type that is used for advertising when advertising is enabled.
        public var advertisingType: AdvertisingType
        
        /// Determines if the advertising packets are identified with the Public Device Address of the device,
        /// or a Random Device Address as written by the `LE_Set_Random_Address` command.
        public var ownAddressType: LowEnergyAddressType
        
        /// Address type
        public var directAddresssType: LowEnergyAddressType // Direct_Address_Type
        
        /// Public Device Address or Random Device Address of the device to be connected.
        public var directAddress: Address
        
        public var channelMap: BitMaskOptionSet<ChannelMap>
        
        public var filterPolicy: FilterPolicy
        
        public init(interval: (min: AdvertisingInterval, max: AdvertisingInterval) = (.default, .max),
                    advertisingType: AdvertisingType = AdvertisingType(),
                    ownAddressType: LowEnergyAddressType = .public,
                    directAddresssType: LowEnergyAddressType = .public,
                    directAddress: Address = .zero,
                    channelMap: BitMaskOptionSet<ChannelMap> = .all,
                    filterPolicy: FilterPolicy = .any) {
            
            assert(interval.min <= interval.max, "The Advertising_Interval_Min shall be less than or equal to the Advertising_Interval_Max.")
            
            assert(channelMap.rawValue != 0, "00000000b is Reserved for future use")
            
            self.interval = interval
            self.advertisingType = advertisingType
            self.ownAddressType = ownAddressType
            self.directAddresssType = directAddresssType
            self.directAddress = directAddress
            self.channelMap = channelMap
            self.filterPolicy = filterPolicy
        }
        
        public var data: Data {
            
            let minimumIntervalBytes = interval.min.rawValue.littleEndian.bytes
            let maximumIntervalBytes = interval.max.rawValue.littleEndian.bytes
            let directAddressBytes = directAddress.littleEndian.bytes
            
            return Data([minimumIntervalBytes.0,
                    minimumIntervalBytes.1,
                    maximumIntervalBytes.0,
                    maximumIntervalBytes.1,
                    advertisingType.rawValue,
                    ownAddressType.rawValue,
                    directAddresssType.rawValue,
                    directAddressBytes.0,
                    directAddressBytes.1,
                    directAddressBytes.2,
                    directAddressBytes.3,
                    directAddressBytes.4,
                    directAddressBytes.5,
                    channelMap.rawValue,
                    filterPolicy.rawValue])
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
        
        public enum ChannelMap: UInt8, BitMaskOption {
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt8
            #endif
            
            /// Enable channel 37 use
            case channel37              = 0b00000001
            
            /// Enable channel 38 use
            case channel38              = 0b00000010
            
            /// Enable channel 39 use
            case channel39              = 0b00000100
            
            public static let all: Set<ChannelMap> = [.channel37, .channel38, .channel39]
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
    
    /// LE Set Advertising Data Command
    ///
    /// Used to set the data used in advertising packets that have a data field.
    ///
    /// - Note: Only the significant part of the Advertising Data is transmitted in the advertising packets.
    public struct SetAdvertisingDataParameter: HCICommandParameter { // HCI_LE_Set_Advertising_Data
        
        public static let command = HCILowEnergyCommand.setAdvertisingData // 0x0008
        public static let length = 32
        
        /// 31 octets of advertising data. 
        public var data: LowEnergyAdvertisingData
        
        public init(data: LowEnergyAdvertisingData = LowEnergyAdvertisingData()) {
            
            self.data = data
        }
        
        public var data: Data {
            
            return [data.length, data.bytes.0, data.bytes.1, data.bytes.2, data.bytes.3, data.bytes.4, data.bytes.5, data.bytes.6, data.bytes.7, data.bytes.8, data.bytes.9, data.bytes.10, data.bytes.11, data.bytes.12, data.bytes.13, data.bytes.14, data.bytes.15, data.bytes.16, data.bytes.17, data.bytes.18, data.bytes.19, data.bytes.20, data.bytes.21, data.bytes.22, data.bytes.23, data.bytes.24, data.bytes.25, data.bytes.26, data.bytes.27, data.bytes.28, data.bytes.29, data.bytes.30]
        }
    }
    
    /// LE Set Scan Response Data Command
    ///
    /// This command is used to provide data used in Scanning Packets that have a data field.
    public struct SetScanResponseDataParameter: HCICommandParameter { // HCI_LE_Set_Scan_Response_ Data
        
        public static let command = HCILowEnergyCommand.setScanResponseData // 0x0009
        public static let length = 32
        
        /// 31 octets of scan response data.
        public var data: LowEnergyAdvertisingData // Scan_Response_Data
        
        public init(data: LowEnergyAdvertisingData = LowEnergyAdvertisingData()) {
            
            self.data = data
        }
        
        public var data: Data {
            
            return [data.length, data.bytes.0, data.bytes.1, data.bytes.2, data.bytes.3, data.bytes.4, data.bytes.5, data.bytes.6, data.bytes.7, data.bytes.8, data.bytes.9, data.bytes.10, data.bytes.11, data.bytes.12, data.bytes.13, data.bytes.14, data.bytes.15, data.bytes.16, data.bytes.17, data.bytes.18, data.bytes.19, data.bytes.20, data.bytes.21, data.bytes.22, data.bytes.23, data.bytes.24, data.bytes.25, data.bytes.26, data.bytes.27, data.bytes.28, data.bytes.29, data.bytes.30]
        }
    }
    
    /**
     LE Set Advertising Enable
     
     The LE Set Advertising Enable command is used to request the Controller to start or stop advertising. The Controller manages the timing of advertisements as per the advertising parameters given in the LE Set Advertising Parameters command.
     
     The Controller shall continue advertising until the Host issues an LE_Set_Advertising_Enable command with Advertising_Enable set to 0x00 (Advertising is disabled) or until a connection is created or until the Advertising is timed out due to high duty cycle Directed Advertising. In these cases, advertising is then disabled.
     
     If the advertising parameters' Own_Address_Type parameter is set to 0x01 and the random address for the device has not been initialized, the Controller shall return the error code Invalid HCI Command Parameters (0x12).
     
     If the advertising parameters' Own_Address_Type parameter is set to 0x03, the controller's resolving list did not contain a matching entry, and the random address for the device has not been initialized, the Controller shall return the error code Invalid HCI Command Parameters (0x12).
     
     - Note: Enabling advertising when it is already enabled can cause the random address to change. Disabling advertising when it is already disabled has no effect.
     */
    public struct SetAdvertiseEnableParameter: HCICommandParameter { // HCI_LE_Set_Advertising_Enable
        
        public static let command = HCILowEnergyCommand.setAdvertiseEnable // 0x000A
        public static let length = 1
        
        public var isEnabled: Bool
        
        public init(isEnabled: Bool = false) {
            
            self.isEnabled = isEnabled
        }
        
        public var data: Data {
            
            return [isEnabled.byteValue]
        }
    }
    
    /// LE Set Scan Parameters Command
    ///
    /// Used to set the scan parameters.
    ///
    /// - Note: The Host shall not issue this command when scanning is enabled in the Controller;
    /// if it is the Command Disallowed error code shall be used.
    public struct SetScanParametersParameter: HCICommandParameter { // HCI_LE_Set_Scan_Parameters
        
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
    
    /// LE Set Scan Enable Command
    ///
    /// The `LE Set Scan Enable Command` command is used to start scanning.
    /// Scanning is used to discover advertising devices nearby.
    public struct SetScanEnableParameter: HCICommandParameter { // HCI_LE_Set_Scan_Enable
        
        public static let command = HCILowEnergyCommand.setScanEnable // 0x000C
        public static let length = 2
        
        /// Whether scanning is enabled or disabled.
        public var isEnabled: Bool // LE_Scan_Enable
        
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
        /// - Parameter filterDuplicates: Controls whether the Link Layer shall filter duplicate advertising
        /// reports to the Host, or if it shall generate advertising reports for each packet received.
        public init(isEnabled: Bool = false,
                    filterDuplicates: Bool = false) {
            
            self.isEnabled = isEnabled
            self.filterDuplicates = filterDuplicates
        }
        
        public var data: Data {
            
            return [isEnabled.byteValue, filterDuplicates.byteValue]
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
        
        public static let command = HCILowEnergyCommand.createConnection // 0x000D
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
        public let connectionInterval: LowEnergyConnectionIntervalRange  // Conn_Interval_Min, Conn_Interval_Max
        
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
                    connectionInterval: LowEnergyConnectionIntervalRange = .full,
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
        
        public var data: Data {
            
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
    public struct AddDeviceToWhiteListParameter: HCICommandParameter { //HCI_LE_Add_Device_To_White_List
        
        public static let command = HCILowEnergyCommand.addDeviceToWhiteList //0x0011
        
        /// The white list device. 
        public var device: LowEnergyWhiteListDevice
        
        public init(device: LowEnergyWhiteListDevice) {
            
            self.device = device
        }
        
        public var data: Data {
            
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
    /// Address is ignored when Address Type is set to 0xFF.
    public struct RemoveDeviceFromWhiteListParameter: HCICommandParameter { // HCI_LE_Remove_Device_From_White_List
        
        public static let command = HCILowEnergyCommand.removeDeviceFromWhiteList //0x0012
        
        /// The white list device.
        public var device: LowEnergyWhiteListDevice
        
        public init(device: LowEnergyWhiteListDevice) {
            
            self.device = device
        }
        
        public var data: Data {
            
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
    public struct UpdateConnectionParameter: HCICommandParameter { // HCI_LE_Connection_Update
        
        public typealias SupervisionTimeout = LowEnergySupervisionTimeout
        
        public static let command = HCILowEnergyCommand.connectionUpdate //0x0013
        
        public let connectionHandle: UInt16 //Connection_Handle
        
        /// Value for the connection event interval.
        ///
        /// Defines the minimum and maximum allowed connection interval.
        public let connectionInterval: LowEnergyConnectionIntervalRange  // Conn_Interval_Min, Conn_Interval_Max
        
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
                    connectionInterval: LowEnergyConnectionIntervalRange = .full,
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
        
        public var data: Data {
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
    public struct SetHostChannelClassificationParameter: HCICommandParameter { // HCI_LE_Set_Host_Channel_Classification
        
        public static let command = HCILowEnergyCommand.setHostChannelClassification //0x0014
        
        /// This parameter contains 37 1-bit fields.
        /// The nth such field (in the range 0 to 36) contains the value for the link layer channel index n.
        /// Channel n is bad = 0. Channel n is unknown = 1.
        /// The most significant bits are reserved and shall be set to 0for future use.
        /// At least one channel shall be marked as unknown.
        public let channelMap: LowEnergyChannelMap  //Channel_Map
        
        public init(channelMap: LowEnergyChannelMap) {
            self.channelMap = channelMap
        }
        
        public var data: Data {
            return [
                channelMap.0,
                channelMap.1,
                channelMap.2,
                channelMap.3,
                channelMap.4
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
    public struct ReadRemoteUsedFeaturesParameter: HCICommandParameter { //HCI_LE_Read_Remote_Features
        
        public static let command = HCILowEnergyCommand.readRemoteUsedFeatures //0x0016
        
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            self.connectionHandle = connectionHandle
        }
        
        public var data: Data {
            
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
    /// and returns the Encrypted Data to the Host.
    ///
    /// - Note: The AES-128 bit block cypher is defined in NIST Publication [FIPS-197](http://csrc.nist.gov/publications/fips/fips197/fips-197.pdf).
    public struct EncryptParameter: HCICommandParameter { // HCI_LE_Encrypt
        
        public static let command = HCILowEnergyCommand.encrypt //0x0017
        
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
        
        public var data: Data {
            
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
    public struct StartEncryptionParameter: HCICommandParameter { // HCI_LE_Start_Encryption
        
        public static let command = HCILowEnergyCommand.startEncryption //0x0019
        
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
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.longTermKeyReply //0x001A
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle

        /// 128 bit long term key for the given connection.
        public let longTermKey: UInt128 //Long_Term_Key
        
        public init(connectionHandle: UInt16, longTermKey: UInt128) {
            
            self.connectionHandle = connectionHandle
            self.longTermKey = longTermKey
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.longTermKeyNegativeReply //0x001B
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            
            self.connectionHandle = connectionHandle
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.receiverTest //0x001D
        
        /// N = (F – 2402) / 2
        /// Range: 0x00 – 0x27. Frequency Range : 2402 MHz to 2480 MHz
        public let rxChannel: LowEnergyRxChannel //RX_Channel
        
        public init(rxChannel: LowEnergyRxChannel) {
            
            self.rxChannel = rxChannel
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.transmitterTest //0x001E
        
        /// N = (F – 2402) / 2
        /// Range: 0x00 – 0x27. Frequency Range : 2402 MHz to 2480 MHz
        public let txChannel: LowEnergyTxChannel //RX_Channel
        
        /// Length in bytes of payload data in each packet
        public let lengthOfTestData: UInt8
        
        public let packetPayload: LowEnergyPacketPayload
        
        public init(txChannel: LowEnergyTxChannel,
                    lengthOfTestData: UInt8,
                    packetPayload: LowEnergyPacketPayload) {
            
            self.txChannel = txChannel
            self.lengthOfTestData = lengthOfTestData
            self.packetPayload = packetPayload
        }
        
        public var data: Data {
            
            return [txChannel.rawValue, packetPayload.rawValue]
        }
    }
    
    /// LE Remote Connection Parameter Request Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has accepted the remote device’s request to change connection parameters.
    public struct RemoteConnectionParameterRequestReplyParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestReply //0x0020
    
        public var connectionHandle: UInt16
        
        public var interval: LowEnergyConnectionIntervalRange
        
        public var latency: LowEnergyConnectionLatency
        
        public var timeOut: LowEnergySupervisionTimeout
        
        public var length: LowEnergyConnectionLength
        
        public init(connectionHandle: UInt16,
                    interval: LowEnergyConnectionIntervalRange,
                    latency: LowEnergyConnectionLatency,
                    timeOut: LowEnergySupervisionTimeout,
                    length: LowEnergyConnectionLength) {
            
            self.connectionHandle = connectionHandle
            self.interval = interval
            self.latency = latency
            self.timeOut = timeOut
            self.length = length
        }
        
        public var data: Data {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            let connectionIntervalMinBytes = interval.rawValue.lowerBound.littleEndian.bytes
            let connectionIntervalMaxBytes = interval.rawValue.upperBound.littleEndian.bytes
            let connectionLatencyBytes = latency.rawValue.littleEndian.bytes
            let supervisionTimeoutBytes = timeOut.rawValue.littleEndian.bytes
            let connectionLengthMinBytes = length.rawValue.lowerBound.littleEndian.bytes
            let connectionLengthMaxBytes = length.rawValue.upperBound.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1,
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
                connectionLengthMaxBytes.1
            ]
        }
    }
    
    /// LE Remote Connection Parameter Request Negative Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has rejected the remote device’s request to change connection parameters.
    /// The reason for the rejection is given in the Reason parameter.
    public struct RemoteConnectionParameterRequestNegativeReplyParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestNegativeReply //0x0021
        
        public var connectionHandle: UInt16
        
        public var reason: UInt8
        
        public init(connectionHandle: UInt16,
                    reason: UInt8) {
            
            self.connectionHandle = connectionHandle
            self.reason = reason
        }
        
        public var data: Data {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1,
                reason
            ]
        }
    }
    
    /// LE Set Data Length Command
    ///
    /// This command allows the Host to suggest maximum transmission packet size and maximum packet transmission time
    /// to be used for a given connection. The Controller may use smaller or larger values based on local information.
    public struct SetDataLengthParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setDataLengthCommand //0x0022
        
        public var connectionHandle: UInt16
        
        public var txOctets: LowEnergyMaxTxOctets
        
        public var txTime: LowEnergyMaxTxTime
        
        public init(connectionHandle: UInt16,
                    txOctets: LowEnergyMaxTxOctets,
                    txTime: LowEnergyMaxTxTime) {
            
            self.connectionHandle = connectionHandle
            self.txOctets = txOctets
            self.txTime = txTime
        }
        
        public var data: Data {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            let txOctetsBytes = txOctets.rawValue.littleEndian.bytes
            let txTimeBytes = txTime.rawValue.littleEndian.bytes
            
            return [
                connectionHandleBytes.0,
                connectionHandleBytes.1,
                txOctetsBytes.0,
                txOctetsBytes.1,
                txTimeBytes.0,
                txTimeBytes.1
            ]
        }
    }
    
    /// LE Write Suggested Default Data Length Command
    ///
    /// The command allows the Host to specify its suggested values for the Controller's maximum transmission number
    /// of payload octets and maximum packet transmission time to be used for new connections.
    public struct WriteSuggestedDefaultDataLengthParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.writeSuggestedDefaultDataLengthCommand //0x0024
        
        public var suggestedMaxTxOctets: LowEnergyMaxTxOctets
        
        public var suggestedMaxTxTime: LowEnergyMaxTxTime
     
        public init(suggestedMaxTxOctets: LowEnergyMaxTxOctets,
                    suggestedMaxTxTime: LowEnergyMaxTxTime) {
            self.suggestedMaxTxOctets = suggestedMaxTxOctets
            self.suggestedMaxTxTime = suggestedMaxTxTime
        }
        
        public var data: Data {
            let suggestedMaxTxOctetsBytes = suggestedMaxTxOctets.rawValue.littleEndian.bytes
            let suggestedMaxTxTimeBytes = suggestedMaxTxTime.rawValue.littleEndian.bytes
            
            return [
                suggestedMaxTxOctetsBytes.0,
                suggestedMaxTxOctetsBytes.1,
                suggestedMaxTxTimeBytes.0,
                suggestedMaxTxTimeBytes.1
            ]
        }
    }
    
    /// LE Generate DHKey Command
    ///
    /// This command is used to initiate generation of a Diffie- Hellman key in the Controller for use over the LE transport.
    /// This command takes the remote P-256 public key as input.
    /// The Diffie-Hellman key generation uses the private key generated by LE_Read_Local_P256_Public_Key command.
    public struct GenerateDHKeyParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.generateDHKeyCommand
        
        public var remoteP256PublicKey: UInt512
        
        public init(remoteP256PublicKey: UInt512) {
        
            self.remoteP256PublicKey = remoteP256PublicKey
        }
        
        public var data: Data {
            
            let remoteP256PublicKeyBytes = remoteP256PublicKey.littleEndian.bytes
            
            return [
                remoteP256PublicKeyBytes.0,
                remoteP256PublicKeyBytes.1,
                remoteP256PublicKeyBytes.2,
                remoteP256PublicKeyBytes.3,
                remoteP256PublicKeyBytes.4,
                remoteP256PublicKeyBytes.5,
                remoteP256PublicKeyBytes.6,
                remoteP256PublicKeyBytes.7,
                remoteP256PublicKeyBytes.8,
                remoteP256PublicKeyBytes.9,
                remoteP256PublicKeyBytes.10,
                remoteP256PublicKeyBytes.11,
                remoteP256PublicKeyBytes.12,
                remoteP256PublicKeyBytes.13,
                remoteP256PublicKeyBytes.14,
                remoteP256PublicKeyBytes.15,
                remoteP256PublicKeyBytes.16,
                remoteP256PublicKeyBytes.17,
                remoteP256PublicKeyBytes.18,
                remoteP256PublicKeyBytes.19,
                remoteP256PublicKeyBytes.20,
                remoteP256PublicKeyBytes.21,
                remoteP256PublicKeyBytes.22,
                remoteP256PublicKeyBytes.23,
                remoteP256PublicKeyBytes.24,
                remoteP256PublicKeyBytes.25,
                remoteP256PublicKeyBytes.26,
                remoteP256PublicKeyBytes.27,
                remoteP256PublicKeyBytes.28,
                remoteP256PublicKeyBytes.29,
                remoteP256PublicKeyBytes.30,
                remoteP256PublicKeyBytes.31,
                remoteP256PublicKeyBytes.32,
                remoteP256PublicKeyBytes.33,
                remoteP256PublicKeyBytes.34,
                remoteP256PublicKeyBytes.35,
                remoteP256PublicKeyBytes.36,
                remoteP256PublicKeyBytes.37,
                remoteP256PublicKeyBytes.38,
                remoteP256PublicKeyBytes.39,
                remoteP256PublicKeyBytes.40,
                remoteP256PublicKeyBytes.41,
                remoteP256PublicKeyBytes.42,
                remoteP256PublicKeyBytes.42,
                remoteP256PublicKeyBytes.43,
                remoteP256PublicKeyBytes.44,
                remoteP256PublicKeyBytes.45,
                remoteP256PublicKeyBytes.46,
                remoteP256PublicKeyBytes.47,
                remoteP256PublicKeyBytes.48,
                remoteP256PublicKeyBytes.49,
                remoteP256PublicKeyBytes.50,
                remoteP256PublicKeyBytes.51,
                remoteP256PublicKeyBytes.52,
                remoteP256PublicKeyBytes.53,
                remoteP256PublicKeyBytes.53,
                remoteP256PublicKeyBytes.55,
                remoteP256PublicKeyBytes.56,
                remoteP256PublicKeyBytes.57,
                remoteP256PublicKeyBytes.58,
                remoteP256PublicKeyBytes.59,
                remoteP256PublicKeyBytes.60,
                remoteP256PublicKeyBytes.61,
                remoteP256PublicKeyBytes.62,
                remoteP256PublicKeyBytes.63
            ]
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
        
        public static let command = HCILowEnergyCommand.addDeviceToResolvedList //0x0027
        
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
        
        public var data: Data {
            
            let peerIdentifyAddressBytes = peerIdentifyAddress.littleEndian.bytes
            let peerIrkBytes = peerIrk.littleEndian.bytes
            let localIrkBytes = localIrk.littleEndian.bytes
            
            return [
                    peerIdentifyAddressType.rawValue,
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
    
        public static let command = HCILowEnergyCommand.removeDeviceFromResolvedList //0x0028
        
        public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
        
        public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
        
        public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                    peerIdentifyAddress: UInt64) {
            
            self.peerIdentifyAddressType = peerIdentifyAddressType
            self.peerIdentifyAddress = peerIdentifyAddress
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.readPeerResolvableAddress //0x002B
        
        public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
        
        public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
        
        public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                    peerIdentifyAddress: UInt64) {
            
            self.peerIdentifyAddressType = peerIdentifyAddressType
            self.peerIdentifyAddress = peerIdentifyAddress
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.readLocalResolvableAddress //0x002C
        
        public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
        
        public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
        
        public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                    peerIdentifyAddress: UInt64) {
            
            self.peerIdentifyAddressType = peerIdentifyAddressType
            self.peerIdentifyAddress = peerIdentifyAddress
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.setAddressResolutionEnable //0x002D
        
        public let addressResolutionEnable: AddressResolutionEnable
        
        public init(addressResolutionEnable: AddressResolutionEnable) {
            self.addressResolutionEnable = addressResolutionEnable
        }
        
        public var data: Data {
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
        
        public static let command = HCILowEnergyCommand.setResolvablePrivateAddressTimeout //0x002E
        
        /// Default: N= 0x0384 (900 s or 15 minutes)
        public static let defaultRpaTimeout = RPATimeout(0x0384)
        
        /// RPA_Timeout measured in s
        /// Range for N: 0x0001 – 0xA1B8 (1 s – approximately 11.5 hours)
        /// Default: N= 0x0384 (900 s or 15 minutes)
        public let rpaTimeout: RPATimeout //RPA_Timeout
        
        public init(rpaTimeout: RPATimeout = defaultRpaTimeout) {
            self.rpaTimeout = rpaTimeout
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.readPhy //0x0030
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            
            self.connectionHandle = connectionHandle
        }
        
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.readPhy //0x0031
        
        public let allPhys: LowEnergyAllPhys
        public let txPhys: LowEnergyTxPhys
        public let rxPhys: LowEnergyRxPhys
        
        public init(allPhys: LowEnergyAllPhys,
                    txPhys: LowEnergyTxPhys,
                    rxPhys: LowEnergyRxPhys) {
            
            self.allPhys = allPhys
            self.txPhys = txPhys
            self.rxPhys = rxPhys
        }
        
        public var data: Data {
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
    
        public static let command = HCILowEnergyCommand.setPhy //0x0032
    
        public let connectionHandle: UInt16
        public let allPhys: LowEnergyAllPhys
        public let txPhys: LowEnergyTxPhys
        public let rxPhys: LowEnergyRxPhys
        public let phyOptions: LowEnergyPhyOptions
        
        public init(connectionHandle: UInt16,
                    allPhys: LowEnergyAllPhys,
                    txPhys: LowEnergyTxPhys,
                    rxPhys: LowEnergyRxPhys,
                    phyOptions: LowEnergyPhyOptions) {
            
            self.connectionHandle = connectionHandle
            self.allPhys = allPhys
            self.txPhys = txPhys
            self.rxPhys = rxPhys
            self.phyOptions = phyOptions
        }
    
        public var data: Data {
            
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
        
        public static let command = HCILowEnergyCommand.enhancedReceiverTest //0x0033
        
        public let rxChannel: LowEnergyRxChannel
        public let phy: Phy
        public let modulationIndex: ModulationIndex
        
        public init(rxChannel: LowEnergyRxChannel, phy: Phy, modulationIndex: ModulationIndex) {
            self.rxChannel = rxChannel
            self.phy = phy
            self.modulationIndex = modulationIndex
        }
        
        public var data: Data {
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
  
    /// LE Enhanced Transmitter Test Command
    ///
    /// This command is used to start a test where the DUT generates test reference packets
    /// at a fixed interval. The Controller shall transmit at maximum power.
    ///
    /// An LE Controller supporting the LE_Enhanced Transmitter_Test command shall support
    /// Packet_Payload values 0x00, 0x01 and 0x02. An LE Controller supporting the LE Coded PHY
    /// shall also support Packet_Payload value 0x04. An LE Controller may support other values
    /// of Packet_Payload.
    public struct EnhancedTransmitterTest: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.enhancedTransmitterTest //0x0034
        
        /// N = (F – 2402) / 2
        /// Range: 0x00 – 0x27. Frequency Range : 2402 MHz to 2480 MHz
        public let txChannel: LowEnergyTxChannel //RX_Channel
        
        /// Length in bytes of payload data in each packet
        public let lengthOfTestData: UInt8
        
        public let packetPayload: LowEnergyPacketPayload
        
        public let phy: Phy
        
        public init(txChannel: LowEnergyTxChannel,
                    lengthOfTestData: UInt8,
                    packetPayload: LowEnergyPacketPayload,
                    phy: Phy) {
            
            self.txChannel = txChannel
            self.lengthOfTestData = lengthOfTestData
            self.packetPayload = packetPayload
            self.phy = phy
        }
        
        public var data: Data {
            
            return [txChannel.rawValue, lengthOfTestData, packetPayload.rawValue, phy.rawValue]
        }
        
        public enum Phy: UInt8 {
            
            /// Transmitter set to use the LE 1M PHY
            case le1MPhy                =   0x01
            
            /// Transmitter set to use the LE 2M PHY
            case le2MPhy                =   0x02
            
            /// Transmitter set to use the LE Coded PHY with S=8 data coding
            case leCodedPhywithS8       =   0x03
            
            /// Transmitter set to use the LE Coded PHY with S=2 data coding
            case leCodedPhywithS2       =   0x04
        }
    }
    
    /// LE Set Advertising Set Random Address Command
    ///
    /// The command is used by the Host to set the random device address specified by the Random_Address parameter.
    /// This address is used in the Controller for the advertiser's address contained in the advertising PDUs
    /// for the advertising set specified by the Advertising_Handle parameter.
    ///
    /// If the Host issues this command while an advertising set using connectable advertising is enabled,
    /// the Controller shall return the error code Command Disallowed (0x0C). The Host may issue this command at any other time.
    ///
    /// If this command is used to change the address, the new random address shall take effect for advertising no later than
    /// the next successful LE Extended Set Advertising Enable Command and for periodic advertising no later than
    /// the next successful LE Periodic Advertising Enable Command.
    public struct SetAdvertisingSetRandomAddress: HCICommandParameter { //HCI_LE_Set_Advertising_Set_Ran- dom_Address
        
        public static let command = HCILowEnergyCommand.setAdvertisingSetRandomAddress //0x0035
        
        /// Used to identify an advertising set
        public let advertisingHandle: UInt8
        
        /// Random Device Address
        public let advertisingRandomAddress: Address
        
        public init(advertisingHandle: UInt8, advertisingRandomAddress: Address) {
            self.advertisingHandle = advertisingHandle
            self.advertisingRandomAddress = advertisingRandomAddress
        }
        
        public var data: Data {
            
            let advertisingRandomAddressBytes = advertisingRandomAddress.littleEndian.bytes
            
            return [advertisingHandle,
                    advertisingRandomAddressBytes.0,
                    advertisingRandomAddressBytes.1,
                    advertisingRandomAddressBytes.2,
                    advertisingRandomAddressBytes.3,
                    advertisingRandomAddressBytes.4,
                    advertisingRandomAddressBytes.5]
        }
    }
    
    /// LE Set Extended Advertising Parameters Command
    ///
    /// The command is used by the Host to set the advertising parameters.
    public struct SetExtendedAdvertisingParametersParameter: HCICommandParameter { //HCI_LE_Set_ Extended_ Advertising_ Parameters
        
        public static let command = HCILowEnergyCommand.setAdvertisingSetRandomAddress //0x0036
        
        /// Used to identify an advertising set
        public let advertisingHandle: UInt8 //Advertising_Handle
        
        /// The Advertising_Event_Properties parameter describes the type of advertising event that is being configured
        /// and its basic properties.
        public let advertisingEventProperties: AdvertisingEventProperties //Advertising_Event_Properties
        
        /// The Primary_Advertising_Interval_Min parameter shall be less than or equal to the Primary_Advertising_Interval_Max parameter.
        /// The Primary_Advertising_Interval_Min and Primary_Advertising_Interval_Max parameters should not be the same value
        /// so that the Controller can choose the best advertising interval given other activities.
        ///
        /// For high duty cycle connectable directed advertising event type (ADV_DIRECT_IND),
        /// the Primary_Advertising_Interval_Min and Primary_Advertising_Interval_Max parameters are not used and shall be ignored.
        ///
        /// If the primary advertising interval range provided by the Host (Primary_Advertising_Interval_Min,
        /// Primary_Advertising_Interval_Max) is outside the advertising interval range supported by the Controller,
        //// then the Controller shall return the error code Unsupported Feature or Parameter Value (0x11).
        public let primaryAdvertising: PrimaryAdvertisingInterval
        
        /// The Primary_Advertising_Channel_Map is a bit field that indicates the advertising channels that shall be used
        /// when transmitting advertising packets. At least one channel bit shall be set in the Primary_Advertising_Channel_Map parameter.
        public let primaryAdvertisingChannelMap: PrimaryAdvertisingChannelMap
        
        /// The Own_Address_Type parameter specifies the type of address being used in the advertising packets.
        /// For random addresses, the address is specified by the LE_Set_Advertising_Set_Random_Address command.
        ///
        /// If Own_Address_Type equals 0x02 or 0x03, the Peer_Address parameter contains the peer’s Identity Address
        /// and the Peer_Address_Type parameter contains the peer’s Identity Type (i.e., 0x00 or 0x01). These parameters are
        /// used to locate the corresponding local IRK in the resolving list; this IRK is used to generate their own address
        /// used in the advertisement.
        public let ownAddressType: OwnAddressType //Own_Address_Type
        
        public let peerAddressType: PeerAddressType //Peer_Address_Type
        
        public let peerAddress: Address // Peer_Address
        
        public let advertisingFilterPolicy: AdvertisingFilterPolicy //Advertising_Filter_Policy
        
        public let advertisingTxPower: LowEnergyTxPower //Advertising_Tx_Power
        
        public let primaryAdvertisingPhy: PrimaryAdvertisingPhy
        
        /// The Secondary_Advertising_Max_Skip parameter is the maximum number of advertising events that
        /// can be skipped before the AUX_ADV_IND can be sent.
        public let secondaryAdvertisingMaxSkip: UInt8
        
        public let secondaryAdvertisingPhy: SecondaryAdvertisingPhy
        
        public let advertisingSid: UInt8
        
        public let scanRequestNotificationEnable: ScanRequestNotificationEnable
        
        public init(advertisingHandle: UInt8,
                    advertisingEventProperties: AdvertisingEventProperties,
                    primaryAdvertising: PrimaryAdvertisingInterval,
                    primaryAdvertisingChannelMap: PrimaryAdvertisingChannelMap,
                    ownAddressType: OwnAddressType,
                    peerAddressType: PeerAddressType,
                    peerAddress: Address,
                    advertisingFilterPolicy: AdvertisingFilterPolicy,
                    advertisingTxPower: LowEnergyTxPower,
                    primaryAdvertisingPhy: PrimaryAdvertisingPhy,
                    secondaryAdvertisingMaxSkip: UInt8,
                    secondaryAdvertisingPhy: SecondaryAdvertisingPhy,
                    advertisingSid: UInt8,
                    scanRequestNotificationEnable: ScanRequestNotificationEnable) {
            
            self.advertisingHandle = advertisingHandle
            self.advertisingEventProperties = advertisingEventProperties
            self.primaryAdvertising = primaryAdvertising
            self.primaryAdvertisingChannelMap = primaryAdvertisingChannelMap
            self.ownAddressType = ownAddressType
            self.peerAddressType = peerAddressType
            self.peerAddress = peerAddress
            self.advertisingFilterPolicy = advertisingFilterPolicy
            self.advertisingTxPower = advertisingTxPower
            self.primaryAdvertisingPhy = primaryAdvertisingPhy
            self.secondaryAdvertisingMaxSkip = secondaryAdvertisingMaxSkip
            self.secondaryAdvertisingPhy = secondaryAdvertisingPhy
            self.advertisingSid = advertisingSid
            self.scanRequestNotificationEnable = scanRequestNotificationEnable
        }
        
        public var data: Data {
            
            let advertisingEventPropertiesBytes = advertisingEventProperties.rawValue.littleEndian.bytes
            
            let primaryAdvertisingMinimumBytes = primaryAdvertising.rawValue.lowerBound.littleEndian.bytes
            let primaryAdvertisingMaximunBytes = primaryAdvertising.rawValue.upperBound.littleEndian.bytes
            
            let addressBytes = peerAddress.littleEndian.bytes
            
            let advertisingTxPowerByte = UInt8.init(bitPattern: advertisingTxPower.rawValue)
            
            return [advertisingHandle,
                    advertisingEventPropertiesBytes.0,
                    advertisingEventPropertiesBytes.1,
                    primaryAdvertisingMinimumBytes.0,
                    primaryAdvertisingMinimumBytes.1,
                    primaryAdvertisingMinimumBytes.2,
                    primaryAdvertisingMaximunBytes.0,
                    primaryAdvertisingMaximunBytes.1,
                    primaryAdvertisingMaximunBytes.2,
                    primaryAdvertisingChannelMap.rawValue,
                    ownAddressType.rawValue,
                    peerAddressType.rawValue,
                    addressBytes.0,
                    addressBytes.1,
                    addressBytes.2,
                    addressBytes.3,
                    addressBytes.4,
                    addressBytes.5,
                    advertisingFilterPolicy.rawValue,
                    advertisingTxPowerByte,
                    primaryAdvertisingPhy.rawValue,
                    secondaryAdvertisingMaxSkip,
                    secondaryAdvertisingPhy.rawValue,
                    advertisingSid,
                    scanRequestNotificationEnable.rawValue
            ]
        }
        
        /// The Scan_Request_Notification_Enable parameter indicates whether the Controller shall send
        /// notifications upon the receipt of a scan request PDU that is in response to an advertisement from
        /// the specified advertising set that contains its device address and is from a scanner that is allowed
        /// by the advertising filter policy.
        ///
        /// If the Host issues this command when advertising is enabled for the specified advertising set,
        /// the Controller shall return the error code Command Disallowed (0x0C).
        ///
        /// If periodic advertising is enabled for the advertising set and the Secondary_Advertising_PHY parameter
        /// does not specify the PHY currently being used for the periodic advertising, the Controller shall
        /// return the error code Command Disallowed (0x0C).
        ///
        /// If the Advertising_Handle does not identify an existing advertising set and the Controller is unable
        /// to support a new advertising set at present, the Controller shall return the error code Memory
        /// Capacity Exceeded (0x07).
        public enum ScanRequestNotificationEnable: UInt8 {
            
            /// Scan request notifications disabled
            case disabled       = 0x00
            
            /// Scan request notifications enabled
            case enabled        = 0x01
        }
        
        /// The Secondary_Advertising_PHY parameter indicates the PHY on which
        /// the advertising packets are be transmitted on the secondary advertising channel.
        public enum SecondaryAdvertisingPhy: UInt8 {
            
            /// Secondary advertisement PHY is LE 1M
            case le1M       = 0x01
            
            /// Secondary advertisement PHY is LE 2M
            case le2M       = 0x02
            
            /// Secondary advertisement PHY is LE Coded
            case leCoded    = 0x03
        }
        
        /// The Primary_Advertising_PHY parameter indicates the PHY on which the advertising packets
        /// are transmitted on the primary advertising channel. If legacy advertising PDUs are being used,
        /// the Primary_Advertising_PHY shall indicate the LE 1M PHY.
        public enum PrimaryAdvertisingPhy: UInt8 {
            
            /// Primary advertisement PHY is LE 1M
            case le1M       = 0x01
            
            /// Primary advertisement PHY is LE Coded
            case leCoded    = 0x03
        }
        
        public enum AdvertisingFilterPolicy: UInt8 {
            
            /// Process scan and connection requests from all devices (i.e., the White List is not in use)
            case processScanFromAllDevices = 0x00
            
            /// Process connection requests from all devices and only scan requests from devices that are in the White List
            case processConnectionRequest = 0x01
            
            /// Process scan requests from all devices and only connection requests from devices that are in the White List.
            case procesScanRequest = 0x02
            
            /// Process scan and connection requests only from devices in the White List.
            case processScanFromDevicesInWhiteList = 0x03
        }
        
        public enum PeerAddressType: UInt8 {
            
            /// Public Device Address or Public Identity Address
            case publicDeviceAddress = 0x00
            
            /// Random Device Address or Random (static) Identity Address
            case randomDeviceAddress = 0x01
        }
        
        public enum OwnAddressType: UInt8 {
            
            /// Public Device Address
            case publicDeviceAddress = 0x00
            
            /// Random Device Address
            case randomDeviceAddress = 0x01
            
            /// Controller generates the Resolvable Private Address based on the local IRK from the resolving list.
            /// If the resolving list contains no matching entry, use the public address.
            case usePublicAddressIfNoMatching = 0x02
            
            /// Controller generates the Resolvable Private Address based on the local IRK from the resolving list.
            /// If the resolving list contains no matching entry, use the random address from LE_Set_Advertising_Set_Ran- dom_Address.
            case useRandomAddressIfNoMatching = 0x03
        }
        
        /// The Primary_Advertising_Channel_Map is a bit field that indicates the advertising channels that shall be used
        /// when transmitting advertising packets. At least one channel bit shall be set in the Primary_Advertising_Channel_Map parameter.
        public enum PrimaryAdvertisingChannelMap: UInt8, BitMaskOption {
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt8
            #endif
            
            /// Channel 37 shall be used
            case channel37 = 0b1
            
            /// Channel 38 shall be used
            case channel38 = 0b10
            
            /// Channel 39 shall be used
            case channel39 = 0b100
            
            public static var all: Set<PrimaryAdvertisingChannelMap> = [
                .channel37,
                .channel38,
                .channel39
            ]
        }
        
        public struct PrimaryAdvertisingInterval: RawRepresentable, Equatable {
            
            public typealias RawValue = CountableClosedRange<UInt32>
            
            /// Maximum interval range.
            public static let full = PrimaryAdvertisingInterval(rawValue: .min ... .max)
            
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
            public static func == (lhs: PrimaryAdvertisingInterval, rhs: PrimaryAdvertisingInterval) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
        }
        
        /// The Advertising_Event_Properties parameter describes the type of advertising event that is being configured
        /// and its basic properties.
        public enum AdvertisingEventProperties: UInt16, BitMaskOption {
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt16
            #endif
            
            /// Connectable advertising
            case connectableAdvertising                         = 0b1
            
            /// Scannable advertising
            case scannableAdvertising                           = 0b10
            
            /// Directed advertising
            case directedAdvertising                            = 0b100
            
            /// High Duty Cycle Directed Connectable advertising (≤ 3.75 ms Advertis- ing Interval)
            case highDutyCycleDirectedConnectableAdvertising    = 0b1000
            
            /// Use legacy advertising PDUs
            case useLegacyAdvertisingPDUs                       = 0b10000
            
            /// Omit advertiser's address from all PDUs ("anonymous advertising")
            case omitAdvertisingAddress                         = 0b100000
            
            /// Include TxPower in the extended header of the advertising PDU
            case includeTxPower                                 = 0b1000000
            
            public static var all: Set<HCILowEnergyCommand.SetExtendedAdvertisingParametersParameter.AdvertisingEventProperties> = [
                .connectableAdvertising,
                .scannableAdvertising,
                .directedAdvertising,
                .highDutyCycleDirectedConnectableAdvertising,
                .useLegacyAdvertisingPDUs,
                .omitAdvertisingAddress,
                .includeTxPower
            ]
        }
    }
    
    /// LE Set Extended Advertising Data Command
    ///
    /// The command is used to set the data used in advertising PDUs that have a data field.
    public struct SetExtendedAdvertisingDataParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setExtendedAdvertisingData //0x0037
        
        public var advertisingHandle: UInt8 //Advertising_Handle
        public var operation: Operation //Operation
        public var fragmentPreference: LowEnergyFragmentPreference //Fragment_Preference
        public var advertisingData: [UInt8] //Advertising_Data
        
        public init(advertisingHandle: UInt8,
                    operation: Operation,
                    fragmentPreference: LowEnergyFragmentPreference,
                    advertisingData: [UInt8]) {
            
            self.advertisingHandle = advertisingHandle
            self.operation = operation
            self.fragmentPreference = fragmentPreference
            self.advertisingData = advertisingData
        }
        
        public var data: Data {
            
            let advertisingDataLength = UInt8(advertisingData.count)
            
            return [advertisingHandle,
                    operation.rawValue,
                    fragmentPreference.rawValue,
                    advertisingDataLength] + advertisingData
        }
        
        public enum Operation: UInt8 { //Operation
            
            /// Intermediate fragment of fragmented extended advertising data
            case intermediateFragment   = 0x00
            
            /// First fragment of fragmented extended advertising data
            case firstFragment          = 0x01
            
            /// Last fragment of fragmented extended advertising data
            case lastFragment           = 0x02
            
            /// Complete extended advertising data
            case completeExtended       = 0x03
            
            /// Unchanged data (just update the Advertising DID)
            case unchangedData          = 0x04
        }
    }
    
    /// LE Set Extended Scan Response Data Command
    ///
    /// The command is used to provide scan response data used in scanning response PDUs. This command may be
    /// issued at any time after the advertising set identified by the Advertising_Handle parameter has been
    /// created using the LE Set Extended Advertising Parameters Command (see Section 7.8.53) regardless of
    /// whether advertising in that set is enabled or disabled.
    public struct SetExtendedScanResponseDataParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setExtendedScanResponseData //0x0038
        
        public var advertisingHandle: UInt8 //Advertising_Handle
        public var operation: Operation //Operation
        public var fragmentPreference: LowEnergyFragmentPreference //Fragment_Preference
        public let scanResponseData: [UInt8] //Advertising_Data
        
        public init(advertisingHandle: UInt8, operation: Operation, fragmentPreference: LowEnergyFragmentPreference, scanResponseData: [UInt8]) {
            
            self.advertisingHandle = advertisingHandle
            self.operation = operation
            self.fragmentPreference = fragmentPreference
            self.scanResponseData = scanResponseData
        }
        
        public var data: Data {
            
            let scanResponseDataLength = UInt8(scanResponseData.count)
            
            return [advertisingHandle, operation.rawValue,
                    fragmentPreference.rawValue, scanResponseDataLength ] + scanResponseData
        }
        
        public enum Operation: UInt8 { //Operation
            
            /// Intermediate fragment of fragmented scan response da
            case intermediateFragment   = 0x00
            
            /// First fragment of fragmented scan response data
            case firstFragment          = 0x01
            
            /// Last fragment of fragmented scan response data
            case lastFragment           = 0x02
            
            /// Complete scan response data
            case complete       = 0x03
        }
    }
    
    /// LE Remove Advertising Set Command
    ///
    /// The command is used to remove an advertising set from the Controller.
    ///
    /// If the advertising set corresponding to the Advertising_Handle parameter does not exist,
    /// then the Controller shall return the error code Unknown Advertising Identifier (0x42).
    /// If advertising on the advertising set is enabled, then the Controller shall return the error code
    /// Command Disallowed (0x0C).
    public struct RemoveAdvertisingSetParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.removeAdvertisingSet //0x003C
        
        /// Used to identify an advertising set
        public var advertisingHandle: UInt8 //Advertising_Handle
        
        public init(advertisingHandle: UInt8) {
            self.advertisingHandle = advertisingHandle
        }
        
        public var data: Data {
            return [advertisingHandle]
        }
    }
    
    /// LE Set Periodic Advertising Parameters Command
    ///
    /// The  command is used by the Host to set the parameters for periodic advertising.
    ///
    /// The Advertising_Handle parameter identifies the advertising set whose periodic advertising
    /// parameters are being configured. If the corresponding advertising set does not already exist,
    /// then the Controller shall return the error code Unknown Advertising Identifier (0x42).
    ///
    /// The Periodic_Advertising_Interval_Min parameter shall be less than or equal to the
    /// Periodic_Advertising_Interval_Max parameter. The Periodic_Advertising_Interval_Min and
    /// Periodic_Advertising_Interval_Max parameters should not be the same value to enable the Controller to
    /// determine the best advertising interval given other activities.
    ///
    /// The Periodic_Advertising_Properties parameter indicates which fields should be included in
    /// the advertising packet.
    ///
    /// If the advertising set identified by the Advertising_Handle specified anonymous advertising,
    /// the Controller shall return the error code Invalid HCI Parameters (0x12).
    ///
    /// If the Host issues this command when periodic advertising is enabled for the specified
    /// advertising set, the Controller shall return the error code Command Disallowed (0x0C).
    ///
    /// If the Advertising_Handle does not identify an advertising set that is already configured for periodic
    /// advertising and the Controller is unable to support more periodic advertising at present, the Controller
    /// shall return the error code Memory Capacity Exceeded (0x07).
    public struct SetPeriodicAdvertisingParametersParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setPeriodicAdvertisingParameters //0x003E
        
        /// Used to identify an advertising set
        public var advertisingHandle: UInt8 //Advertising_Handle
        public var periodicAdvertisingInterval: PeriodicAdvertisingInterval
        public var advertisingEventProperties: AdvertisingEventProperties
        
        public init(advertisingHandle: UInt8,
                    periodicAdvertisingInterval: PeriodicAdvertisingInterval,
                    advertisingEventProperties: AdvertisingEventProperties) {
            
            self.advertisingHandle = advertisingHandle
            self.periodicAdvertisingInterval = periodicAdvertisingInterval
            self.advertisingEventProperties = advertisingEventProperties
        }
        
        public var data: Data {
            
            let periodicAdvertisingIntervalMinBytes = periodicAdvertisingInterval.rawValue.lowerBound.littleEndian.bytes
            let periodicAdvertisingIntervalMaxBytes = periodicAdvertisingInterval.rawValue.upperBound.littleEndian.bytes
            let advertisingEventPropertiesytes = advertisingEventProperties.rawValue.littleEndian.bytes
            return [
                advertisingHandle,
                periodicAdvertisingIntervalMinBytes.0,
                periodicAdvertisingIntervalMinBytes.1,
                periodicAdvertisingIntervalMaxBytes.0,
                periodicAdvertisingIntervalMaxBytes.1,
                advertisingEventPropertiesytes.0,
                advertisingEventPropertiesytes.1
            ]
        }
        
        public struct PeriodicAdvertisingInterval: RawRepresentable, Equatable {
            
            public typealias RawValue = CountableClosedRange<UInt16>
            
            /// Maximum interval range.
            public static let full = PeriodicAdvertisingInterval(rawValue: .min ... .max)
            
            public let rawValue: RawValue
            
            public init(rawValue: RawValue) {
                
                self.rawValue = rawValue
            }
            
            /// Time = N * 0.125 msec.
            public var miliseconds: ClosedRange<Double> {
                
                let miliseconds = Double(0.125)
                
                let min = Double(rawValue.lowerBound) * miliseconds
                
                let max = Double(rawValue.upperBound) * miliseconds
                
                return min ... max
            }
            
            // Equatable
            public static func == (lhs: PeriodicAdvertisingInterval, rhs: PeriodicAdvertisingInterval) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
        }
        
        /// The Advertising_Event_Properties parameter describes the type of advertising event that is being configured
        /// and its basic properties.
        public enum AdvertisingEventProperties: UInt16, BitMaskOption {
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt16
            #endif

            /// Include TxPower in the extended header of the advertising PDU
            case includeTxPower = 0b100000
            
            public static var all: Set<HCILowEnergyCommand.SetPeriodicAdvertisingParametersParameter.AdvertisingEventProperties> = [
                    .includeTxPower
                ]
        }
    }
    
    /// LE Set Periodic Advertising Data Command
    ///
    /// The command is used to set the data used in periodic advertising PDUs.
    public struct SetPeriodicAdvertisingDataParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setPeriodicAdvertisingData //0x003F
        
        public var advertisingHandle: UInt8 //Advertising_Handle
        public var operation: Operation //Operation
        public var advertisingData: [UInt8] //Advertising_Data
        
        public init(advertisingHandle: UInt8,
                    operation: Operation,
                    advertisingData: [UInt8]) {
            
            self.advertisingHandle = advertisingHandle
            self.operation = operation
            self.advertisingData = advertisingData
        }
        
        public var data: Data {
            
            let advertisingDataLength = UInt8(advertisingData.count)
            
            return [advertisingHandle,
                    operation.rawValue,
                    advertisingDataLength] + advertisingData
        }
        
        public enum Operation: UInt8 { //Operation
            
            /// Intermediate fragment of fragmented periodic advertising data
            case intermediateFragment   = 0x00
            
            /// First fragment of fragmented periodic advertising data
            case firstFragment          = 0x01
            
            /// Last fragment of fragmented periodic advertising data
            case lastFragment           = 0x02
            
            /// Complete periodic advertising data
            case complete       = 0x03
        }
    }
    
    /// LE Set Periodic Advertising Enable Command
    ///
    /// The  command is used to request the Controller to enable or disable the periodic advertising
    /// for the advertising set specified by the Advertising_Handle parameter (ordinary advertising is not affected).
    public struct SetPeriodicAdvertisingEnableParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setPeriodicAdvertisingEnable //0x0040
        
        public var enable: Enable
        public var advertisingHandle: UInt8 //Advertising_Handle
        
        public init(enable: Enable, advertisingHandle: UInt8) {
            self.enable = enable
            self.advertisingHandle = advertisingHandle
        }
        
        public var data: Data {
            return [
                enable.rawValue,
                advertisingHandle
            ]
        }
        
        public enum Enable: UInt8 {
            
            /// Periodic advertising is disabled (default)
            case disabled = 0x00
            
            /// Periodic advertising is enabled
            case enabled  = 0x01
        }
    }
    
    /// LE Set Extended Scan Parameters Command
    ///
    /// Used to set the extended scan parameters to be used on the advertising channels.
    public struct SetExtendedScanParametersParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setExtendedScanParameters // 0x0041
        
        public var ownAddressType: LowEnergyAddressType
        public var scanningFilterPolicy: ScanningFilterPolicy
        public var scanningPHY: ScanningPHY
        
        public init(ownAddressType: LowEnergyAddressType,
                    scanningFilterPolicy: ScanningFilterPolicy,
                    scanningPHY: ScanningPHY) {
            self.ownAddressType = ownAddressType
            self.scanningFilterPolicy = scanningFilterPolicy
            self.scanningPHY = scanningPHY
        }
        
        public var data: Data {
            
            let length: Int
            
            switch scanningPHY {
                
            case .le1M:
                
                length = 3
                
            case .coded:
                
                length = 3 + 10
            }
            
            var byteValue = [UInt8]()
            byteValue.reserveCapacity(length) // improve buffer performance
            
            // Own_Address_Type
            byteValue.append(ownAddressType.rawValue)
            
            // Scanning_Filter_Policy
            byteValue.append(scanningFilterPolicy.rawValue)
            
            // Scanning_PHYs
            byteValue.append(scanningPHY.type.rawValue)
            
            switch scanningPHY {
                
            case .le1M:
                break
                
            case let .coded(scanType, scanInterval, scanWindow):
                
                let scanIntervalBytes = (scanInterval.0.rawValue.littleEndian, scanInterval.1.rawValue.littleEndian)
                let scanWindowBytes = (scanWindow.0.rawValue.littleEndian, scanWindow.1.rawValue.littleEndian)
                
                byteValue += [scanType.0.rawValue,
                              scanType.1.rawValue,
                              scanIntervalBytes.0.bytes.0,
                              scanIntervalBytes.0.bytes.1,
                              scanIntervalBytes.1.bytes.0,
                              scanIntervalBytes.1.bytes.1,
                              scanWindowBytes.0.bytes.0,
                              scanWindowBytes.0.bytes.1,
                              scanWindowBytes.1.bytes.0,
                              scanWindowBytes.1.bytes.1]
            }
            
            assert(byteValue.count == length, "Invalid number of bytes")
            
            return byteValue
        }
        
        public enum ScanningFilterPolicy: UInt8 {
            
            /// Accept all advertising packets except directed advertising packets not addressed to this device
            case all = 0x00
            
            /// Accept only advertising packets from devices where the advertiser’s address is in the White List.
            /// Directed advertising packets which are not addressed to this device shall be ignored.
            case fromWhiteList = 0x01
            
            /// Accept all advertising packets except directed advertising packets where the initiator’s identity address does not address this device.
            /// Note: directed advertising packets where the initiator’s address is a resolvable private address that cannot be resolved are also accepted.
            case allExceptDirectedAdvertisingPackets = 0x02
            
            /// Accept all advertising packets except:
            /// * advertising packets where the advertiser’s identity address is not in the White List; and
            /// * directed advertising packets where the initiator’s identity address does not address this device
            /// Note: directed advertising packets where the initiator’s address is a resolvable private address that cannot be resolved are also accepted.
            case allExceptPacketFromWhiteListAndDirectedAdvertising = 0x03
        }
        
        /// Scanning PHY
        public enum ScanningPHYType: UInt8 {
            
            /// Scan advertisements on the LE 1M PHY
            case le1M = 0b00
            
            /// Scan advertisements on the LE Coded PHY
            case coded = 0b10
        }
        
        /// Scanning PHY
        public enum ScanningPHY {
            
            /// Scan advertisements on the LE 1M PHY
            case le1M
            
            /// Scan advertisements on the LE Coded PHY
            case coded(scanType: (ScanType, ScanType),
                scanInterval: (LowEnergyScanInterval, LowEnergyScanInterval),
                scanWindow: (LowEnergyScanInterval, LowEnergyScanInterval))
            
            public var type: ScanningPHYType {
                
                switch self {
                case .le1M: return .le1M
                case .coded: return .coded
                }
            }
        }
        
        public enum ScanType: UInt8 {
            
            /// Passive Scanning. No scan request PDUs shall be sent.
            case passive = 0x00
            
            /// Active Scanning. Scan request PDUs may be sent.
            case active = 0x01
        }
    }
    
    /// LE Set Extended Scan Enable Command
    ///
    /// The command is used to enable or disable scanning.
    public struct SetExtendedScanEnableParameter: HCICommandParameter {
        
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
            
            return [
                enable.rawValue,
                filterDuplicates.rawValue,
                durationBytes.0,
                durationBytes.1,
                periodBytes.0,
                periodBytes.1
            ]
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
    
    /// LE Extended Create Connection Command
    ///
    /// The command is used to create a Link Layer connection to a connectable advertiser.
    public struct ExtendedCreateConnectionParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.extendedCreateConnection // 0x0043
        
        public let initialingFilterPolicy: InitialingFilterPolicy
        public let ownAddressType: OwnAddressType
        public let peerAddressType: LowEnergyPeerIdentifyAddressType
        public let peerAddress: Address
        public let initialingPHY: InitialingPHY
        
        public init(initialingFilterPolicy: InitialingFilterPolicy,
                    ownAddressType: OwnAddressType,
                    peerAddressType: LowEnergyPeerIdentifyAddressType,
                    peerAddress: Address,
                    initialingPHY: InitialingPHY) {
            self.initialingFilterPolicy = initialingFilterPolicy
            self.ownAddressType = ownAddressType
            self.peerAddressType = peerAddressType
            self.peerAddress = peerAddress
            self.initialingPHY = initialingPHY
        }
        
        public var data: Data {
            
            let addressBytes = peerAddress.littleEndian.bytes
            
            return [initialingFilterPolicy.rawValue,
                    ownAddressType.rawValue,
                    peerAddressType.rawValue,
                    addressBytes.0,
                    addressBytes.1,
                    addressBytes.2,
                    addressBytes.3,
                    addressBytes.4,
                    addressBytes.5
                    ]
        }
        
        public enum InitialingFilterPolicy: UInt8 { // Initiating_Filter_Policy
            
            /// White List is not used to determine which advertiser to connect to. Peer_Address_Type and Peer_Address shall be used.
            case whiteListIsNotUsed = 0x00
            
            /// White List is used to determine which advertiser to connect to. Peer_Address_Type and Peer_Address shall be ignored.
            case whiteListIsUsed    = 0x001
        }
        
        public enum OwnAddressType: UInt8 { // Own_Address_Type
            
            /// Public Device Address
            case publicDeviceAddress    = 0x00
            
            /// Random Device Address
            case randomDeviceAddress    = 0x01
            
            /// Controller generates the Resolvable Private Address based on the local IRK from 
            // the resolving list. If the resolving list contains no matching entry, then use the public address.
            case resolvablePrivateAddressOrPublicAddress = 0x02
            
            /// Controller generates the Resolvable Private Address based on the local IRK from the resolving list.
            /// If the resolving list contains no matching entry, then use the random address from
            /// the most recent successful LE_Set_Random_Address Command.
            case resolvablePrivateAddressOrRandomAddress = 0x03
        }
        
        public enum InitialingPHYType: UInt8 { // Initiating_PHYs
            
            /// Scan connectable advertisements on the LE 1M PHY. Connection parameters for the LE 1M PHY are provided.
            case le1m  = 0b00
            
            /// Connection parameters for the LE 2M PHY are provided.
            case le2m  = 0b01
            
            /// Scan connectable advertisements on the LE Coded PHY. Connection parameters for the LE Coded PHY are provided.
            case coded = 0b10
        }
        
        public enum InitialingPHY {
            
            case le1m
            
            case le2m(scanInterval: LowEnergyScanInterval,
                      scanWindow: LowEnergyScanInterval,
                      connIntervalMin: LowEnergyConnectionIntervalRange,
                      connLatency: LowEnergyConnectionLatency,
                      supervisionTimeout: LowEnergySupervisionTimeout,
                      ceLength: CELength)
            
            case coded(scanInterval: (LowEnergyScanInterval, LowEnergyScanInterval),
                scanWindow: (LowEnergyScanInterval, LowEnergyScanInterval),
                connIntervalMin: (LowEnergyConnectionIntervalRange, LowEnergyConnectionIntervalRange),
                connLatency: (LowEnergyConnectionLatency, LowEnergyConnectionLatency),
                supervisionTimeout: (LowEnergySupervisionTimeout, LowEnergySupervisionTimeout),
                ceLength: (CELength, CELength))
            
            public var type: InitialingPHYType {
                
                switch self {
                case .le1m: return .le1m
                case .le2m: return .le2m
                case .coded: return .coded
                }
            }
        }
        
        /// Informative parameter recommending the minimum length of connection event needed for this LE connection.
        ///
        /// Range: 0x0000 – 0xFFFF
        public struct CELength: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static var zero: CELength { return CELength() }
            
            public let rawValue: UInt16
            
            public init() {
                
                self.rawValue = 0
            }
            
            public init?(rawValue: UInt16) {
                
                guard rawValue <= 0xFFFF
                    else { return nil }
                
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: CELength, rhs: CELength) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
            
            // Comparable
            public static func < (lhs: CELength, rhs: CELength) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
        }
    }
    
    /// LE Periodic Advertising Create Sync Command
    ///
    /// The command is used to synchronize with periodic advertising from an advertiser
    /// and begin receiving periodic advertising packets.
    public struct PeriodicAdvertisingCreateSyncParameter: HCICommandParameter {
    
        public static let command = HCILowEnergyCommand.periodicAdvertisingCreateSync //0x0044
    
        public let filterPolicy: FilterPolicy
        
        public let advertisingSid: UInt8
        
        public let advertisingAddressType: AdvertisingAddressType
        
        public let address: Address
        
        /// The number of periodic advertising packets that can be skipped after
        /// a successful receive
        /// Range: 0x0000 to 0x01F3
        public let skip: UInt16
        
        public let syncTimeout: SyncTimeout
        
        /// This value must be used by the Host
        public let unused: UInt8
        
        public init(filterPolicy: FilterPolicy,
                    advertisingSid: UInt8,
                    advertisingAddressType: AdvertisingAddressType,
                    address: Address,
                    skip: UInt16,
                    syncTimeout: SyncTimeout,
                    unused: UInt8) {
            self.filterPolicy = filterPolicy
            self.advertisingSid = advertisingSid
            self.advertisingAddressType = advertisingAddressType
            self.address = address
            self.skip = skip
            self.syncTimeout = syncTimeout
            self.unused = unused
        }
    
        public var data: Data {
            
            let addressBytes = address.littleEndian.bytes
            let skipBytes = skip.littleEndian.bytes
            let syncTimeoutBytes = syncTimeout.rawValue.littleEndian.bytes
            
            return[
                filterPolicy.rawValue,
                advertisingSid,
                advertisingAddressType.rawValue,
                addressBytes.0,
                addressBytes.1,
                addressBytes.2,
                addressBytes.3,
                addressBytes.4,
                addressBytes.5,
                skipBytes.0,
                skipBytes.1,
                syncTimeoutBytes.0,
                syncTimeoutBytes.1,
                unused
            ]
        }
        
        public struct SyncTimeout: RawRepresentable, Equatable, Hashable, Comparable {
            
            /// 100 msec
            public static let min = SyncTimeout(0x000A)
            
            /// 163.84 seconds
            public static let max = SyncTimeout(0x4000)
            
            public let rawValue: UInt16
            
            public init?(rawValue: UInt16) {
                
                guard rawValue >= SyncTimeout.min.rawValue,
                    rawValue <= SyncTimeout.max.rawValue
                    else { return nil }
                
                assert((SyncTimeout.min.rawValue ... SyncTimeout.max.rawValue).contains(rawValue))
                
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
            public static func == (lhs: SyncTimeout, rhs: SyncTimeout) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: SyncTimeout, rhs: SyncTimeout) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
        
        public enum AdvertisingAddressType: UInt8 { //Advertising_Address_Type
            
            /// Public Device Address
            case publicDeviceAddress = 0x00
            
            /// Random Device Address
            case randomDeviceAddress = 0x01
        }
        
        public enum FilterPolicy: UInt8 { //Filter_Policy
            
            /// Use the Advertising_SID, Advertising_Address_Type,
            /// and Advertising_Address parameters to determine which advertiser to listen to.
            case useAdvertisingSIDAndAddressTypeAndAddress = 0x00
            
            /// Use the Periodic Advertiser List to determine which advertiser to listen to.
            case usePeriodicAdvertiserList = 0x01
        }
    }
    
    /// LE Periodic Advertising Terminate Sync Command
    ///
    /// The command is used to stop reception of the periodic advertising identified by the Sync_Handle parameter.
    ///
    /// If the Host issues this command when another LE_Periodic_Advertising_Create_Sync command is pending (see below),
    /// the Controller shall return the error code Command Disallowed (0x0C).
    ///
    /// If the periodic advertising corresponding to the Sync_Handle parameter does not exist,
    /// then the Controller shall return the error code Unknown Advertising Identifier (0x42).
    public struct PeriodicAdvertisingTerminateSyncParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.periodicAdvertisingTerminateSync //0x0046
        
        public let syncHandle: UInt16
        
        public init(syncHandle: UInt16) {
            self.syncHandle = syncHandle
        }
        
        public var data: Data {
            let syncHandleBytes = syncHandle.littleEndian.bytes
            
            return [syncHandleBytes.0, syncHandleBytes.1]
        }
    }
    
    /// LE Add Device To Periodic Advertiser List Command
    ///
    /// The command is used to add a single device to the Periodic Advertiser list stored in the Controller.
    /// Any additions to the Periodic Advertiser list take effect immediately. If the device is already on the list,
    /// the Controller shall return the error code Invalid HCI Command Parameters (0x12).
    ///
    /// If the Host issues this command when an LE_Periodic_Advertising_Create_Sync command is pending,
    /// the Controller shall return the error code Command Disallowed (0x0C).
    ///
    /// When a Controller cannot add a device to the Periodic Advertiser list because the list is full,
    /// the Controller shall return the error code Memory Capacity Exceeded (0x07).
    public struct AddDeviceToPeriodicAdvertiserListParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.addDeviceToPeriodicAdvertiserList //0x0047
        
        public let advertiserAddressType: LowEnergyAdvertiserAddressType
        public let address: Address
        public let advertisingSid: UInt8
        
        public init(advertiserAddressType: LowEnergyAdvertiserAddressType,
                    address: Address,
                    advertisingSid: UInt8) {
            self.advertiserAddressType = advertiserAddressType
            self.address = address
            self.advertisingSid = advertisingSid
        }
        
        public var data: Data {
            
            let addressBytes = address.littleEndian.bytes
            
            return [
                advertiserAddressType.rawValue,
                addressBytes.0,
                addressBytes.1,
                addressBytes.2,
                addressBytes.3,
                addressBytes.4,
                addressBytes.5,
                advertisingSid
            ]
        }
    }
    
    /// LE Remove Device From Periodic Advertiser List Command
    ///
    /// The LE_Remove_Device_From_Periodic_Advertiser_List command is used to remove one device from the list of Periodic
    /// Advertisers stored in the Controller. Removals from the Periodic Advertisers List take effect immediately.
    ///
    /// If the Host issues this command when an LE_Periodic_Advertising_Create_Sync command is pending, the Controller
    /// shall return the error code Command Disallowed (0x0C).
    ///
    /// When a Controller cannot remove a device from the Periodic Advertiser list because it is not found,
    /// the Controller shall return the error code Unknown Advertising Identifier (0x42).
    public struct RemoveDeviceToPeriodicAdvertiserListParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.removeDeviceFromPeriodicAdvertiserList //0x0048
        
        public let advertiserAddressType: LowEnergyAdvertiserAddressType
        public let address: Address
        public let advertisingSid: UInt8
        
        public init(advertiserAddressType: LowEnergyAdvertiserAddressType,
                    address: Address,
                    advertisingSid: UInt8) {
            
            self.advertiserAddressType = advertiserAddressType
            self.address = address
            self.advertisingSid = advertisingSid
        }
        
        public var data: Data {
            
            let addressBytes = address.littleEndian.bytes
            
            return [
                advertiserAddressType.rawValue,
                addressBytes.0,
                addressBytes.1,
                addressBytes.2,
                addressBytes.3,
                addressBytes.4,
                addressBytes.5,
                advertisingSid
            ]
        }
    }
    
    /// LE Write RF Path Compensation Command
    ///
    /// The command is used to indicate the RF path gain or loss between the RF transceiver and
    /// the antenna contributed by intermediate components. A positive value means a net RF path gain
    /// and a negative value means a net RF path loss. The RF Tx Path Compensation Value parameter
    /// shall be used by the Controller to calculate radiative Tx Power Level used in the TxPower field
    /// in the Extended Header using the following equation:
    ///
    /// Radiative Tx Power Level = Tx Power Level at RF transceiver output + RF Tx Path Compensation Value
    ///
    /// For example, if the Tx Power Level is +4 (dBm) at RF transceiver output and the RF
    /// Path Compensation Value is -1.5 (dB), the radiative Tx Power Level is +4+(-1.5) = 2.5 (dBm).
    ///
    /// The RF Rx Path Compensation Value parameter shall be used by the Controller to calculate
    /// the RSSI value reported to the Host.
    public struct WriteRfPathCompensationParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.writeRFPathCompensation // 0x004D
        
        public var rfTxPathCompensationValue: RfTxPathCompensationValue
        public var rfRxPathCompensationValue: RfRxPathCompensationValue

        public init(rfTxPathCompensationValue: RfTxPathCompensationValue,
                    rfRxPathCompensationValue: RfRxPathCompensationValue) {
            self.rfTxPathCompensationValue = rfTxPathCompensationValue
            self.rfRxPathCompensationValue = rfRxPathCompensationValue
        }
        
        public var data: Data {
            let rfTxPathCompensationValueBytes = UInt16.init(bitPattern: rfTxPathCompensationValue.rawValue).littleEndian.bytes
            
            let rfRxPathCompensationValueBytes = UInt16.init(bitPattern: rfRxPathCompensationValue.rawValue).littleEndian.bytes
            
            return [rfTxPathCompensationValueBytes.0,
                    rfTxPathCompensationValueBytes.1,
                    rfRxPathCompensationValueBytes.0,
                    rfRxPathCompensationValueBytes.1]
        }
    }
    
    /// LE Set Privacy Mode Command
    ///
    /// The command is used to allow the Host to specify the privacy mode to be used for a given entry on the resolving list.
    public struct SetPrivacyModeParameter: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.setPrivacyMode // 0x004E
        
        public let peerIdentityAddressType: LowEnergyPeerIdentifyAddressType
        public let peerIdentityAddress: Address
        public let privacyMode: PrivacyMode
        
        public init(peerIdentityAddressType: LowEnergyPeerIdentifyAddressType,
                    peerIdentityAddress: Address,
                    privacyMode: PrivacyMode = PrivacyMode.networkPrivacy) {
            
            self.peerIdentityAddressType = peerIdentityAddressType
            self.peerIdentityAddress = peerIdentityAddress
            self.privacyMode = privacyMode
        }
        
        public var data: Data {
            
            let addressBytes = peerIdentityAddress.littleEndian.bytes
            
            return [
                peerIdentityAddressType.rawValue,
                addressBytes.0,
                addressBytes.1,
                addressBytes.2,
                addressBytes.3,
                addressBytes.4,
                addressBytes.5,
                privacyMode.rawValue
            ]
        }
        
        public enum PrivacyMode: UInt8 {
            
            /// Use Network Privacy Mode for this peer device (default)
            case networkPrivacy     = 0x00
            
            /// Use Device Privacy Mode for this peer device
            case devicePrivacy      = 0x01
        }
    }
}

// MARK: - Command Return Parameters

public extension HCILowEnergyCommand {
    
    /// LE Read Buffer Size Command
    ///
    /// The command is used to read the maximum size of the data portion of HCI LE ACL Data Packets sent from the Host to the Controller.
    public struct ReadBufferSizeReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readBufferSize //0x0002
        public static let length = 3
        
        public let dataPacketLength: UInt16
        public let dataPacket: UInt8
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let dataPacketLength = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            
            self.dataPacketLength = dataPacketLength
            self.dataPacket = byteValue[2]
        }
    }
    
    /// LE Read Local Supported Features Command
    ///
    /// This command requests the list of the supported LE features for the Controller.
    public struct ReadLocalSupportedFeaturesReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readLocalSupportedFeatures // 0x0003
        
        public static let length = 8
        
        public let features: LowEnergyFeatureSet
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let featuresRawValue = UInt64(littleEndian: UInt64(bytes: (byteValue[0],
                                                                       byteValue[1],
                                                                       byteValue[2],
                                                                       byteValue[3],
                                                                       byteValue[4],
                                                                       byteValue[5],
                                                                       byteValue[6],
                                                                       byteValue[7])))
            
            self.features = LowEnergyFeatureSet(rawValue: featuresRawValue)
        }
    }
    
    /// LE Read Advertising Channel Tx Power Command
    ///
    /// The command is used by the Host to read the transmit power level used for LE advertising channel packets.
    public struct ReadAdvertisingChannelTxPowerReturnParameter: HCICommandReturnParameter { //HCI_LE_Read_Advertising_ Channel_Tx_Power
        
        public static let command = HCILowEnergyCommand.readAdvertisingChannelTXPower // 0x0007
        
        public static let length = 1
        
        public let transmitPowerLevel: TransmitPowerLevel
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let transmitPowerLevel = TransmitPowerLevel(rawValue: Int8(bitPattern: byteValue[0]))
                else { return nil }
            
            self.transmitPowerLevel = transmitPowerLevel
        }
        
        /// Size: 1 Octet (signed integer)
        /// Range: -20 ≤ N ≤ 10
        /// Units: dBm
        /// Accuracy: +/- 4 dB
        public struct TransmitPowerLevel: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = TransmitPowerLevel(-20)
            
            public static let max = TransmitPowerLevel(10)
            
            public let rawValue: Int8
            
            public init?(rawValue: Int8) {
                
                guard rawValue >= TransmitPowerLevel.min.rawValue,
                    rawValue <= TransmitPowerLevel.max.rawValue
                    else { return nil }
                
                assert((TransmitPowerLevel.min.rawValue ... TransmitPowerLevel.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: Int8) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: TransmitPowerLevel, rhs: TransmitPowerLevel) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: TransmitPowerLevel, rhs: TransmitPowerLevel) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
    }
    
    /// LE Read White List Size
    ///
    /// The command is used to read the total number of white list entries that can be stored in the Controller.
    public struct ReadWhiteListSizeReturnParameter: HCICommandReturnParameter { // HCI_LE_Read_White_List_Size
        
        public static let command = HCILowEnergyCommand.readWhiteListSize //0x000F
        public static let length = 1
        
        /// The white list size.
        public let size: UInt8 // White_List_Size
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            self.size = byteValue[0]
        }
    }
    
    /// LE Encrypt Command
    ///
    /// The Commnad is used to request the Controller to encrypt the Plaintext_Data in the command using the Key given in the command
    /// and returns the Encrypted_Data to the Host.
    /// The AES-128 bit block cypher is defined in NIST Publication FIPS-197 (http://csrc.nist.gov/publications/fips/fips197/fips-197.pdf).
    public struct EncryptReturnParameter: HCICommandReturnParameter {

        public static let command = HCILowEnergyCommand.encrypt //0x0017
        
        public static let length: Int = 16
        
        /// 128 bit encrypted data block.
        /// The most significant octet of the Encrypted_Data corresponds to out[0] using the notation specified in FIPS 197.
        public let encryptedData: UInt128
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let encryptedData = UInt128(data: Data(byteValue))
                else { return nil }
            
            self.encryptedData = encryptedData
        }
    }
    
    /// LE Rand Command
    ///
    /// The command is used to request the Controller to generate 8 octets of random data to be sent to the Host.
    public struct RandomReturnParameter: HCICommandReturnParameter { // HCI_LE_Rand
        
        public static let command = HCILowEnergyCommand.random //0x0018
        
        public static let length: Int = 8
        
        /// Random Number
        public let randomNumber: UInt64 //Random_Number
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            self.randomNumber = UInt64(littleEndian: UInt64(bytes: ((byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7]))))
        }
    }
    
    /// LE Long Term Key Request Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event from the Controller,
    /// and specifies the Long_Term_Key parameter that shall be used for this Connection_Handle.
    public struct LongTermKeyRequestReplyReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.longTermKeyReply //0x001A
        
        public static let length: Int = 2
        
        /// Connection_Handle
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 // Connection_Handle
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Long Term Key Request Negative Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event
    /// from the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
    public struct LongTermKeyRequestNegativeReplyReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.longTermKeyNegativeReply //0x001B
        
        public static let length: Int = 2
        
        /// Connection_Handle
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 // Connection_Handle
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Remote Connection Parameter Request Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has accepted the remote device’s request to change connection parameters.
    public struct RemoteConnectionParameterRequestReplyReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestReply //0x0020
        
        public static let length: Int = 2
        
        /// Connection_Handle
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 // Connection_Handle
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Remote Connection Parameter Request Negative Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has rejected the remote device’s request to change connection parameters.
    /// The reason for the rejection is given in the Reason parameter.
    public struct RemoteConnectionParameterRequestNegativeReplyReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestNegativeReply //0x0021
        
        public static let length: Int = 2
        
        /// Connection_Handle
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 // Connection_Handle
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// The LE_Set_Data_Length command allows the Host to suggest maximum transmission packet size and maximum packet transmission time
    /// to be used for a given connection. The Controller may use smaller or larger values based on local information.
    public struct SetDataLengthReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.setDataLengthCommand //0x0022
        
        public static let length: Int = 2
        
        /// Connection_Handle
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 // Connection_Handle
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Read Suggested Default Data Length Command
    ///
    /// This command allows the Host to read the Host's suggested values (SuggestedMaxTxOctets and SuggestedMaxTxTime)
    /// for the Controller's maximum transmitted number of payload octets and maximum packet transmission time to be used for new connections.
    public struct ReadSuggestedDefaultDataLengthReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readSuggestedDefaultDataLengthCommand //0x0023
        
        public static let length: Int = 4
        
        public let suggestedMaxTxOctets: LowEnergyMaxTxOctets
        
        public let suggestedMaxTxTime: LowEnergyMaxTxTime
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let suggestedMaxTxOctetsUInt16 = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            let suggestedMaxTxTimeUInt16 = UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3])))
            
            guard let suggestedMaxTxOctets = LowEnergyMaxTxOctets(rawValue: suggestedMaxTxOctetsUInt16)
                else { return nil }
            
            guard let suggestedMaxTxTime = LowEnergyMaxTxTime(rawValue: suggestedMaxTxTimeUInt16)
                else { return nil }
            
            self.suggestedMaxTxOctets = suggestedMaxTxOctets
            self.suggestedMaxTxTime = suggestedMaxTxTime
        }
    }

    /// LE Test End Command
    ///
    /// This command is used to stop any test which is in progress. The Number_Of_Packets
    /// for a transmitter test shall be reported as 0x0000. The Number_Of_Packets is an unsigned number
    /// and contains the number of received packets.
    public struct TestEndReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.testEnd //0x001F
        
        public static let length: Int = 2
        
        public let numberOfPackets: UInt16
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            numberOfPackets = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Read Supported States
    ///
    /// The LE_Read_Supported_States command reads the states and state combinations that the link layer supports.
    public struct ReadSupportedStatesReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readSupportedStates //0x001C
        
        public static let length: Int = 8
        
        public let state: LowEnergyStateSet
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
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
        
        public static let command = HCILowEnergyCommand.readResolvedListSize //0x002A
        
        public static let length: Int = 1
        
        public let resolvingListSize: UInt8 //Resolving_List_Size
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
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
        
        public static let command = HCILowEnergyCommand.readPeerResolvableAddress //0x002B
        
        public static let length: Int = 6
        
        /// Resolvable Private Address being used by the peer device
        public let peerResolvableAddress: UInt64 //Peer_Resolvable_Address
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
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
        
        public static let command = HCILowEnergyCommand.readLocalResolvableAddress //0x002C
        
        public static let length: Int = 6
        
        /// Resolvable Private Address being used by the local device
        public let localResolvableAddress: UInt64 //Local_Resolvable_Address
        
        public init?(data: Data) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            self.localResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7]))))
        }
    }
    
    /// LE Read Maximum Data Length Command
    ///
    /// The command allows the Host to read the Controller’s maximum supported payload octets
    /// and packet duration times for transmission and reception.
    public struct ReadMaximumDataLengthReturnParameter: HCICommandReturnParameter { //HCI_LE_Read_Maximum_Data_ Length 1323
        
        public static let command = HCILowEnergyCommand.readMaximumDataLength //0x002F
        
        public static let length: Int = 8
        
        /// Maximum number of payload octets that the local Controller supports for transmission
        /// of a single Link Layer packet on a data connection.
        public let supportedMaxTxOctets: LowEnergyMaxTxOctets
        
        /// Maximum time, in microseconds, that the local Controller supports for transmission of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxTxTime: LowEnergyMaxTxTime
        
        /// Maximum number of payload octets that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxRxOctets: SupportedMaxRxOctets
        
        /// Maximum time, in microseconds, that the local Controller supports for reception of
        /// a single Link Layer packet on a data connection.
        public let supportedMaxRxTime: SupportedMaxRxTime
        
        public init?(data: Data) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let supportedMaxTxOctets = LowEnergyMaxTxOctets(rawValue: UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1]))))
                else { return nil }
            
            guard let supportedMaxTxTime = LowEnergyMaxTxTime(rawValue: UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3]))))
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
    }
    
    /// LE Read PHY Command
    ///
    /// The command is used to read the current transmitter PHY and receiver PHY
    /// on the connection identified by the Connection_Handle.
    public struct ReadPHYReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readPhy //0x0030
        
        public static let length: Int = 4
        
        public let connectionHandle: UInt16
        
        public let txPhy: LowEnergyTxPhy
        
        public let rxPhy: LowEnergyRxPhy
        
        public init?(data: Data) {
            guard byteValue.count == type(of: self).length
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
    
    /// LE Set Extended Advertising Parameters Command
    ///
    /// The command is used by the Host to set the advertising parameters.
    public struct SetExtendedAdvertisingParametersReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.setExtendedAdvertisingParameters //0x0036
        
        public static let length: Int = 1
        
        public let selectedTxPower: LowEnergyTxPower
        
        public init?(data: Data) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let selectedTxPower = LowEnergyTxPower(rawValue: Int8(bitPattern: byteValue[0]))
                else { return nil }
            
            self.selectedTxPower = selectedTxPower
        }
    }
    
    /// LE Read Maximum Advertising Data Length Command
    ///
    /// The command is used to read the maximum length of data supported by the Controller for use
    /// as advertisement data or scan response data in an advertising event or as periodic advertisement data.
    public struct ReadMaximumAdvertisingDataLengthReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readMaximumAdvertisingDataLength //0x003A
        
        public static let length: Int = 2
        
        /// Maximum supported advertising data length
        public let maximumAdvertisingDataLength: UInt16
        
        public init?(data: Data) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            maximumAdvertisingDataLength = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        }
    }
    
    /// LE Read Number of Supported Advertising Sets Command
    ///
    /// The command is used to read the maximum number of advertising sets supported by
    /// the advertising Controller at the same time. Note: The number of advertising sets that
    /// can be supported is not fixed and the Controller can change it at any time because the memory
    /// used to store advertising sets can also be used for other purposes.
    public struct ReadNumberOfSupportedAdvertisingSetsReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readNumberOfSupportedAdvertisingSets //0x003B
        
        public static let length: Int = 1
        
        /// Number of advertising sets supported at the same time
        public let numSupportedAdvertisingSets: UInt8 //Num_Supported_Advertising_Sets
        
        public init?(data: Data) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            numSupportedAdvertisingSets = byteValue[0]
        }
    }
    
    /// LE Read Periodic Advertiser List Size Command
    ///
    /// The command is used to read the total number of Periodic Advertiser list entries that can be stored in the Controller.
    public struct ReadPeriodicAdvertisingListSizeReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readPeriodicAdvertiserListSize //0x004A
        
        public static let length: Int = 1
        
        /// Total number of Periodic Advertiser list entries that can be stored in the Controller
        public let periodicAdvertiserListSize: UInt8
        
        public init?(data: Data) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            periodicAdvertiserListSize = byteValue[0]
        }
    }
    
    /// LE Read Transmit Power Command
    ///
    /// The command is used to read the minimum and maximum transmit powers supported by the Controller.
    public struct ReadTransmitPowerReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readTransmitPower //0x004B
        
        public static let length: Int = 2
        
        public let minTxPower: TxPower
        
        public let maxTxPower: TxPower
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let minTxPower = TxPower(rawValue: Int8(bitPattern: byteValue[0]))
                else { return nil }
            
            guard let maxTxPower = TxPower(rawValue: Int8(bitPattern: byteValue[1]))
                else { return nil }
            
            self.minTxPower = minTxPower
            self.maxTxPower = maxTxPower
        }
        
        public struct TxPower: RawRepresentable, Equatable, Hashable, Comparable {
            
            public static let min = TxPower(-127)
            
            public static let max = TxPower(126)
            
            public let rawValue: Int8
            
            public init?(rawValue: Int8) {
                
                guard rawValue >= TxPower.min.rawValue,
                    rawValue <= TxPower.max.rawValue
                    else { return nil }
                
                assert((TxPower.min.rawValue ... TxPower.max.rawValue).contains(rawValue))
                
                self.rawValue = rawValue
            }
            
            // Private, unsafe
            private init(_ rawValue: Int8) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: TxPower, rhs: TxPower) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: TxPower, rhs: TxPower) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
    }
    
    /// LE Read RF Path Compensation Command
    ///
    /// The command is used to read the RF Path Compensation Values parameter used in the Tx Power Level and RSSI calculation.
    public struct ReadRfPathCompensationReturnParameter: HCICommandReturnParameter {
        
        public static let command = HCILowEnergyCommand.readRFPathCompensation //0x004C
        
        public static let length: Int = 4
        
        public let rfTxPathCompensationValue: RfTxPathCompensationValue
        public let rfRxPathCompensationValue: RfRxPathCompensationValue
        
        public init?(data: Data) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let rfTxPathCompensationValue = RfTxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (byteValue[0], byteValue[1]))))
                else { return nil }
                
            guard let rfRxPathCompensationValue = RfRxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (byteValue[2], byteValue[3]))))
                else { return nil }
            
            self.rfTxPathCompensationValue = rfTxPathCompensationValue
            self.rfRxPathCompensationValue = rfRxPathCompensationValue
        }
    }
}

// MARK: - Supporting Types

// RF_Rx_Path_Compensation_Value
/// Size: 2 Octets (signed integer)
/// Range: -128.0 dB (0xFB00) ≤ N ≤ 128.0 dB (0x0500)
/// Units: 0.1 dB
public struct RfRxPathCompensationValue: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = RfRxPathCompensationValue(-128)
    
    public static let max = RfRxPathCompensationValue(128)
    
    public let rawValue: Int16
    
    public init?(rawValue: Int16) {
        
        guard rawValue >= RfRxPathCompensationValue.min.rawValue,
            rawValue <= RfRxPathCompensationValue.max.rawValue
            else { return nil }
        
        assert((RfRxPathCompensationValue.min.rawValue ... RfRxPathCompensationValue.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: Int16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: RfRxPathCompensationValue, rhs: RfRxPathCompensationValue) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: RfRxPathCompensationValue, rhs: RfRxPathCompensationValue) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

/// RF_Tx_Path_Compensation_Value
/// Size: 2 Octets (signed integer)
/// Range: -128.0 dB (0xFB00) ≤ N ≤ 128.0 dB (0x0500)
/// Units: 0.1 dB
public struct RfTxPathCompensationValue: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = RfTxPathCompensationValue(-128)
    
    public static let max = RfTxPathCompensationValue(128)
    
    public let rawValue: Int16
    
    public init?(rawValue: Int16) {
        
        guard rawValue >= RfTxPathCompensationValue.min.rawValue,
            rawValue <= RfTxPathCompensationValue.max.rawValue
            else { return nil }
        
        assert((RfTxPathCompensationValue.min.rawValue ... RfTxPathCompensationValue.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: Int16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: RfTxPathCompensationValue, rhs: RfTxPathCompensationValue) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: RfTxPathCompensationValue, rhs: RfTxPathCompensationValue) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

public enum LowEnergyAdvertiserAddressType: UInt8 { //Advertiser_Address_Type:
    /// Public Device Address or Public Identity Address
    case publicDeviceAddress = 0x00
    
    /// Random Device Address or Random (static) Identity Address
    case randomDeviceAddress = 0x01
}

public enum LowEnergyFragmentPreference: UInt8 { //Fragment_Preference
    
    /// The Controller may fragment all Host advertising data
    case fragmentAllHostAdvertisingData = 0x00
    
    /// The Controller should not fragment or should minimize fragmentation of Host advertising data
    case shouldNotFragmentHostAdvertisingData = 0x01
}

/// Units: dBm
/// 127 Host has no preference
public struct LowEnergyTxPower: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = LowEnergyTxPower(-127)
    
    public static let max = LowEnergyTxPower(126)
    
    public let rawValue: Int8
    
    public init?(rawValue: Int8) {
        
        guard rawValue >= LowEnergyTxPower.min.rawValue,
            rawValue <= LowEnergyTxPower.max.rawValue
            else { return nil }
        
        assert((LowEnergyTxPower.min.rawValue ... LowEnergyTxPower.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: Int8) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyTxPower, rhs: LowEnergyTxPower) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyTxPower, rhs: LowEnergyTxPower) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

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

/// Time interval from when the Controller started its last scan until it begins
/// the subsequent scan on the primary advertising channel.
public struct LowEnergyScanInterval: RawRepresentable, Equatable, Comparable, Hashable {
    
    /// 2.5 msec
    public static let min = LowEnergyScanInterval(0x0004)
    
    /// 40.959375 seconds
    public static let max = LowEnergyScanInterval(0xFFFF)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16) {
        
        guard rawValue >= LowEnergyScanInterval.min.rawValue,
            rawValue <= LowEnergyScanInterval.max.rawValue
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
    public static func == (lhs: LowEnergyScanInterval, rhs: LowEnergyScanInterval) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyScanInterval, rhs: LowEnergyScanInterval) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

/// Value for connection event interval
///
/// Range: 0x0006 to 0x0C80
/// Time = N * 1.25 msec
/// Time Range: 7.5 msec to 4 seconds.
public struct LowEnergyConnectionIntervalRange: RawRepresentable, Equatable {
    
    public typealias RawValue = CountableClosedRange<UInt16>
    
    /// 7.5 msec
    public static let min: UInt16 = 0x0006
    
    /// 4000 msec
    public static let max: UInt16 = 0x0C80
    
    /// Maximum interval range.
    public static let full = LowEnergyConnectionIntervalRange(LowEnergyConnectionIntervalRange.min ... LowEnergyConnectionIntervalRange.max)
    
    public let rawValue: RawValue
    
    public init?(rawValue: RawValue) {
        
        guard rawValue.lowerBound >= LowEnergyConnectionIntervalRange.min,
            rawValue.upperBound <= LowEnergyConnectionIntervalRange.max
            else { return nil }
        
        assert(LowEnergyConnectionIntervalRange.full.rawValue.lowerBound == LowEnergyConnectionIntervalRange.min)
        assert(LowEnergyConnectionIntervalRange.full.rawValue.upperBound == LowEnergyConnectionIntervalRange.max)
        
        assert(rawValue.clamped(to: LowEnergyConnectionIntervalRange.full.rawValue) == rawValue)
        assert(rawValue.overlaps(LowEnergyConnectionIntervalRange.full.rawValue))
        
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
    public static func == (lhs: LowEnergyConnectionIntervalRange, rhs: LowEnergyConnectionIntervalRange) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

/// The ALL_PHYS parameter is a bit field that allows the Host to specify, for each direction,
/// whether it has no preference among the PHYs that the Controller supports in a given direction
//// or whether it has specified particular PHYs that it prefers in the TX_PHYS or RX_PHYS parameter.
public enum LowEnergyAllPhys: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
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
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
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
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
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
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt16
    #endif
    
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
    
    // HashableUInt12
    public var hashValue: Int {
        
        return Int(rawValue)
    }
    
    // Comparable
    public static func < (lhs: LowEnergyConnectionLatency, rhs: LowEnergyConnectionLatency) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
}

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

public struct LowEnergyTxChannel: RawRepresentable, Equatable, Hashable, Comparable {
    
    /// 100 msec
    public static let min = LowEnergyTxChannel(0x00)
    
    /// 32 seconds
    public static let max = LowEnergyTxChannel(0x27)
    
    public var rawValue: UInt8
    
    public init?(rawValue: UInt8) {
        guard rawValue >= LowEnergyTxChannel.min.rawValue,
            rawValue <= LowEnergyTxChannel.max.rawValue
            else { return nil }
        
        assert((LowEnergyTxChannel.min.rawValue ... LowEnergyTxChannel.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt8) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyTxChannel, rhs: LowEnergyTxChannel) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyTxChannel, rhs: LowEnergyTxChannel) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
    
}

public struct LowEnergyRxChannel: RawRepresentable, Equatable, Hashable, Comparable {
    
    /// 100 msec
    public static let min = LowEnergyRxChannel(0x00)
    
    /// 32 seconds
    public static let max = LowEnergyRxChannel(0x27)
    
    public var rawValue: UInt8
    
    public init?(rawValue: UInt8) {
        guard rawValue >= LowEnergyRxChannel.min.rawValue,
            rawValue <= LowEnergyRxChannel.max.rawValue
            else { return nil }
        
        assert((LowEnergyRxChannel.min.rawValue ... LowEnergyRxChannel.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt8) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyRxChannel, rhs: LowEnergyRxChannel) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyRxChannel, rhs: LowEnergyRxChannel) -> Bool {
        
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

/// Number of payload octets that the local Control- ler should include in a single Link Layer packet on this connection.
/// Range 0x0148-0x4290
public struct LowEnergyMaxTxTime: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = LowEnergyMaxTxTime(0x0148)
    
    public static let max = LowEnergyMaxTxTime(0x4290)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16 = 0x001B) {
        
        guard rawValue >= LowEnergyMaxTxTime.min.rawValue,
            rawValue <= LowEnergyMaxTxTime.max.rawValue
            else { return nil }
        
        assert((LowEnergyMaxTxTime.min.rawValue ... LowEnergyMaxTxTime.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyMaxTxTime, rhs: LowEnergyMaxTxTime) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyMaxTxTime, rhs: LowEnergyMaxTxTime) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

// Number of microseconds that the local Controller should use to transmit a single Link Layer packet on this connection.
/// Range 0x001B-0x00FB
public struct LowEnergyMaxTxOctets: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = LowEnergyMaxTxOctets(0x001B)
    
    public static let max = LowEnergyMaxTxOctets(0x00FB)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16 = 0x0148) {
        
        guard rawValue >= LowEnergyMaxTxOctets.min.rawValue,
            rawValue <= LowEnergyMaxTxOctets.max.rawValue
            else { return nil }
        
        assert((LowEnergyMaxTxOctets.min.rawValue ... LowEnergyMaxTxOctets.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyMaxTxOctets, rhs: LowEnergyMaxTxOctets) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyMaxTxOctets, rhs: LowEnergyMaxTxOctets) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
