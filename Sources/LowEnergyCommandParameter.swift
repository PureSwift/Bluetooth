//
//  HCILowEnergyCommandParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

public extension HCILowEnergyCommand {
  
    /// LE Enhanced Transmitter Test Command
    ///
    /// This command is used to start a test where the DUT generates test reference packets
    /// at a fixed interval. The Controller shall transmit at maximum power.
    ///
    /// An LE Controller supporting the LE_Enhanced Transmitter_Test command shall support
    /// Packet_Payload values 0x00, 0x01 and 0x02. An LE Controller supporting the LE Coded PHY
    /// shall also support Packet_Payload value 0x04. An LE Controller may support other values
    /// of Packet_Payload.
    public struct HCILEEnhancedTransmitterTest: HCICommandParameter {
        
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
            
            return Data([txChannel.rawValue, lengthOfTestData, packetPayload.rawValue, phy.rawValue])
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
    public struct HCILESetAdvertisingSetRandomAddress: HCICommandParameter { //HCI_LE_Set_Advertising_Set_Ran- dom_Address
        
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
            
            return Data([advertisingHandle,
                    advertisingRandomAddressBytes.0,
                    advertisingRandomAddressBytes.1,
                    advertisingRandomAddressBytes.2,
                    advertisingRandomAddressBytes.3,
                    advertisingRandomAddressBytes.4,
                    advertisingRandomAddressBytes.5])
        }
    }
    
    /// LE Set Extended Advertising Parameters Command
    ///
    /// The command is used by the Host to set the advertising parameters.
    public struct HCILESetExtendedAdvertisingParameters: HCICommandParameter { //HCI_LE_Set_ Extended_ Advertising_ Parameters
        
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
            
            return Data([advertisingHandle,
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
            ])
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
            
            public static var all: Set<HCILowEnergyCommand.HCILESetExtendedAdvertisingParameters.AdvertisingEventProperties> = [
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
    public struct HCILESetExtendedAdvertisingData: HCICommandParameter {
        
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
            
            return Data([advertisingHandle,
                    operation.rawValue,
                    fragmentPreference.rawValue,
                    advertisingDataLength]) + advertisingData
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
            
            return Data([advertisingHandle, operation.rawValue,
                    fragmentPreference.rawValue, scanResponseDataLength]) + scanResponseData
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
            return Data([advertisingHandle])
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
            return Data([
                advertisingHandle,
                periodicAdvertisingIntervalMinBytes.0,
                periodicAdvertisingIntervalMinBytes.1,
                periodicAdvertisingIntervalMaxBytes.0,
                periodicAdvertisingIntervalMaxBytes.1,
                advertisingEventPropertiesytes.0,
                advertisingEventPropertiesytes.1
            ])
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
            
            return Data([advertisingHandle,
                    operation.rawValue,
                    advertisingDataLength]) + advertisingData
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
            return Data([
                enable.rawValue,
                advertisingHandle
            ])
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
            
            var data = Data()
            data.reserveCapacity(length) // improve buffer performance
            
            // Own_Address_Type
            data.append(ownAddressType.rawValue)
            
            // Scanning_Filter_Policy
            data.append(scanningFilterPolicy.rawValue)
            
            // Scanning_PHYs
            data.append(scanningPHY.type.rawValue)
            
            switch scanningPHY {
                
            case .le1M:
                break
                
            case let .coded(scanType, scanInterval, scanWindow):
                
                let scanIntervalBytes = (scanInterval.0.rawValue.littleEndian, scanInterval.1.rawValue.littleEndian)
                let scanWindowBytes = (scanWindow.0.rawValue.littleEndian, scanWindow.1.rawValue.littleEndian)
                
                data += [scanType.0.rawValue,
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
            
            assert(data.count == length, "Invalid number of bytes")
            
            return data
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
            
            return Data([initialingFilterPolicy.rawValue,
                    ownAddressType.rawValue,
                    peerAddressType.rawValue,
                    addressBytes.0,
                    addressBytes.1,
                    addressBytes.2,
                    addressBytes.3,
                    addressBytes.4,
                    addressBytes.5
                    ])
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
            
            return Data([
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
            ])
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
            
            return Data([syncHandleBytes.0, syncHandleBytes.1])
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
            
            return Data([
                advertiserAddressType.rawValue,
                addressBytes.0,
                addressBytes.1,
                addressBytes.2,
                addressBytes.3,
                addressBytes.4,
                addressBytes.5,
                advertisingSid
            ])
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
            
            return Data([
                advertiserAddressType.rawValue,
                addressBytes.0,
                addressBytes.1,
                addressBytes.2,
                addressBytes.3,
                addressBytes.4,
                addressBytes.5,
                advertisingSid
            ])
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
        
        public var rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue
        public var rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue

        public init(rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue,
                    rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue) {
            self.rfTxPathCompensationValue = rfTxPathCompensationValue
            self.rfRxPathCompensationValue = rfRxPathCompensationValue
        }
        
        public var data: Data {
            let rfTxPathCompensationValueBytes = UInt16.init(bitPattern: rfTxPathCompensationValue.rawValue).littleEndian.bytes
            
            let rfRxPathCompensationValueBytes = UInt16.init(bitPattern: rfRxPathCompensationValue.rawValue).littleEndian.bytes
            
            return Data([rfTxPathCompensationValueBytes.0,
                    rfTxPathCompensationValueBytes.1,
                    rfRxPathCompensationValueBytes.0,
                    rfRxPathCompensationValueBytes.1])
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
            
            return Data([
                peerIdentityAddressType.rawValue,
                addressBytes.0,
                addressBytes.1,
                addressBytes.2,
                addressBytes.3,
                addressBytes.4,
                addressBytes.5,
                privacyMode.rawValue
            ])
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            let dataPacketLength = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            self.dataPacketLength = dataPacketLength
            self.dataPacket = data[2]
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            let featuresRawValue = UInt64(littleEndian: UInt64(bytes: (data[0],
                                                                       data[1],
                                                                       data[2],
                                                                       data[3],
                                                                       data[4],
                                                                       data[5],
                                                                       data[6],
                                                                       data[7])))
            
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let transmitPowerLevel = TransmitPowerLevel(rawValue: Int8(bitPattern: data[0]))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.size = data[0]
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let encryptedData = UInt128(data: Data(data))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.randomNumber = UInt64(littleEndian: UInt64(bytes: ((data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]))))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            let suggestedMaxTxOctetsUInt16 = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            let suggestedMaxTxTimeUInt16 = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
            
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            numberOfPackets = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            let stateRawValue = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
            
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.resolvingListSize = data[0]
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.peerResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]))))
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
            guard data.count == type(of: self).length
                else { return nil }
            
            self.localResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]))))
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
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let supportedMaxTxOctets = LowEnergyMaxTxOctets(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
                else { return nil }
            
            guard let supportedMaxTxTime = LowEnergyMaxTxTime(rawValue: UInt16(littleEndian: UInt16(bytes: (data[2], data[3]))))
                else { return nil }
            
            guard let supportedMaxRxOctets = SupportedMaxRxOctets(rawValue: UInt16(littleEndian: UInt16(bytes: (data[4], data[5]))))
                else { return nil }
            
            guard let supportedMaxRxTime = SupportedMaxRxTime(rawValue: UInt16(littleEndian: UInt16(bytes: (data[6], data[7]))))
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
            guard data.count == type(of: self).length
                else { return nil }
            
            connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            guard let txPhy = LowEnergyTxPhy(rawValue: data[2])
                else { return nil }
            
            guard let rxPhy = LowEnergyRxPhy(rawValue: data[3])
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
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let selectedTxPower = LowEnergyTxPower(rawValue: Int8(bitPattern: data[0]))
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
            guard data.count == type(of: self).length
                else { return nil }
            
            maximumAdvertisingDataLength = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
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
            guard data.count == type(of: self).length
                else { return nil }
            
            numSupportedAdvertisingSets = data[0]
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
            guard data.count == type(of: self).length
                else { return nil }
            
            periodicAdvertiserListSize = data[0]
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
            
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let minTxPower = TxPower(rawValue: Int8(bitPattern: data[0]))
                else { return nil }
            
            guard let maxTxPower = TxPower(rawValue: Int8(bitPattern: data[1]))
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
        
        public let rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue
        public let rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let rfTxPathCompensationValue = LowEnergyRfTxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (data[0], data[1]))))
                else { return nil }
                
            guard let rfRxPathCompensationValue = LowEnergyRfTxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (data[2], data[3]))))
                else { return nil }
            
            self.rfTxPathCompensationValue = rfTxPathCompensationValue
            self.rfRxPathCompensationValue = rfRxPathCompensationValue
        }
    }
}
