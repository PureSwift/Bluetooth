//
//  LowEnergyEventParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public extension LowEnergyEvent {
    
    /// LE Connection Complete Event
    /// 
    /// The LE Connection Complete event indicates to both of the Hosts forming the connection 
    /// that a new connection has been created. Upon the creation of the connection a 
    /// `Connection_Handle` shall be assigned by the Controller, and passed to the Host in this event. 
    /// If the connection establishment fails this event shall be provided to the Host that had issued 
    /// the LE Create Connection command.
    ///
    /// This event indicates to the Host which issued a LE Create Connection command 
    /// and received a Command Status event if the connection establishment failed or was successful.
    ///
    /// The `masterClockAccuracy` parameter is only valid for a slave. 
    /// On a master, this parameter shall be set to 0x00.
    public struct ConnectionCompleteParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.connectionComplete // 0x01
        public static let length = 18
        
        /// Connection supervision timeout.
        ///
        /// Range: 0x000A to 0x0C80
        /// Time = N * 10 msec
        /// Time Range: 100 msec to 32 seconds
        public typealias SupervisionTimeout = LowEnergySupervisionTimeout
        
        public typealias Status = HCIStatus
        
        /// `0x00` if Connection successfully completed.
        /// `HCIError` value otherwise.
        public let status: Status
        
        /// Connection Handle
        ///
        /// Connection Handle to be used to identify a connection between two Bluetooth devices.
        /// The handle is used as an identifier for transmitting and receiving data.
        ///
        /// Range: 0x0000-0x0EFF (0x0F00 - 0x0FFF Reserved for future use)
        ///
        /// Size: 2 Octets (12 bits meaningful)
        public let handle: UInt16 // Connection_Handle
        
        /// Connection role (master or slave).
        public let role: LowEnergyRole // Role
        
        /// Peer Bluetooth address type.
        public let peerAddressType: LowEnergyAddressType // Peer_Address_Type
        
        /// Public Device Address or Random Device Address of the peer device.
        public let peerAddress: Address
        
        /// Connection interval used on this connection.
        ///
        /// Range: 0x0006 to 0x0C80
        /// Time = N * 1.25 msec
        /// Time Range: 7.5 msec to 4000 msec.
        public let interval: LowEnergyConnectionInterval
        
        /// Connection latency for this connection.
        ///
        /// Range: 0x0006 to 0x0C80
        /// Time = N * 1.25 msec
        /// Time Range: 7.5 msec to 4000 msec.
        public let latency: LowEnergyConnectionInterval
        
        /// Connection supervision timeout.
        ///
        /// Range: 0x000A to 0x0C80
        /// Time = N * 10 msec
        /// Time Range: 100 msec to 32 seconds
        public let supervisionTimeout: SupervisionTimeout
        
        /// The `masterClockAccuracy` parameter is only valid for a slave.
        ///
        /// On a master, this parameter shall be set to 0x00.
        public let masterClockAccuracy: MasterClockAccuracy // Master_Clock_Accuracy
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == ConnectionCompleteParameter.length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            let roleByte = byteValue[3]
            
            let peerAddressTypeByte = byteValue[4]
            
            let peerAddress = Address(littleEndian:
                Address(bytes: (byteValue[5],
                                byteValue[6],
                                byteValue[7],
                                byteValue[8],
                                byteValue[9],
                                byteValue[10])))
            
            let intervalRawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[11], byteValue[12])))
            
            let latencyRawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[13], byteValue[14])))
            
            let supervisionTimeoutRaw = UInt16(littleEndian: UInt16(bytes: (byteValue[15], byteValue[16])))
            
            let masterClockAccuracyByte = byteValue[17]
            
            // Parse enums and values ranges
            guard let status = Status(rawValue: statusByte),
                let role = LowEnergyRole(rawValue: roleByte),
                let peerAddressType = LowEnergyAddressType(rawValue: peerAddressTypeByte),
                let supervisionTimeout = SupervisionTimeout(rawValue: supervisionTimeoutRaw),
                let masterClockAccuracy = MasterClockAccuracy(rawValue: masterClockAccuracyByte)
                else { return nil }
            
            self.status = status
            self.handle = handle
            self.role = role
            self.peerAddressType = peerAddressType
            self.peerAddress = peerAddress
            self.interval = LowEnergyConnectionInterval(rawValue: intervalRawValue)
            self.latency = LowEnergyConnectionInterval(rawValue: latencyRawValue)
            self.supervisionTimeout = supervisionTimeout
            self.masterClockAccuracy = masterClockAccuracy
        }
        
        /// Master Clock Accuracy
        public enum MasterClockAccuracy: UInt8 {
            
            case ppm500     = 0x00
            case ppm250     = 0x01
            case ppm150     = 0x02
            case ppm100     = 0x03
            case ppm75      = 0x04
            case ppm50      = 0x05
            case ppm30      = 0x06
            case ppm20      = 0x07
            
            public var ppm: UInt {
                
                switch self {
                case .ppm500: return 500
                case .ppm250: return 250
                case .ppm150: return 150
                case .ppm100: return 100
                case .ppm75: return 75
                case .ppm50: return 50
                case .ppm30: return 30
                case .ppm20: return 20
                }
            }
        }
    }
    
    /// LE Advertising Report Event
    /// 
    /// The LE Advertising Report event indicates that a Bluetooth device 
    /// or multiple Bluetooth devices have responded to an active scan 
    /// or received some information during a passive scan. 
    /// The Controller may queue these advertising reports and send 
    /// information from multiple devices in one LE Advertising Report event.
    public struct AdvertisingReportEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.advertisingReport // 0x02
        public static let length = 1 + Report.length // must have at least one report
        
        public let reports: [Report]
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count >= AdvertisingReportEventParameter.length
                else { return nil }
            
            // Number of responses in event.
            let reportCount = Int(byteValue[0]) // Num_Reports
            
            // 0x01 - 0x19
            guard reportCount > 0,
                reportCount <= 19
                else { return nil }
            
            var reports = [Report]()
            reports.reserveCapacity(reportCount)
            
            var offset = 1
            for _ in 0 ..< reportCount {
                
                let reportBytes = [UInt8](byteValue.suffix(from: offset))
                
                guard let report = Report(byteValue: reportBytes)
                    else { return nil }
                
                offset += Report.length + report.data.count
                reports.append(report)
            }
            
            self.reports = reports
        }
        
        public struct Report {
            
            public static let length = 1 + 1 + 6 + 1 + /* 0 - 31 */ 0 + 1
            
            public let event: Event
            
            public let addressType: LowEnergyAddressType // Address_Type
            
            public let address: Address // Address
            
            /// Advertising or scan response data
            public let data: [UInt8] // Data
            
            /// RSSI
            ///
            /// Size: 1 Octet (signed integer) 
            /// Range: -127 ≤ N ≤ +20
            /// Units: dBm
            public let rssi: RSSI // RSSI
            
            public init?(byteValue: [UInt8]) {
                
                guard byteValue.count >= Report.length
                    else { return nil }
                
                // parse enums
                guard let event = Event(rawValue: byteValue[0]),
                    let addressType = LowEnergyAddressType(rawValue: byteValue[1])
                    else { return nil }
                
                let address = Address(littleEndian:
                    Address(bytes: (byteValue[2],
                                    byteValue[3],
                                    byteValue[4],
                                    byteValue[5],
                                    byteValue[6],
                                    byteValue[7])))
                
                let length = Int(byteValue[8])
                
                self.event = event
                self.addressType = addressType
                self.address = address
                
                let data = [UInt8](byteValue[9 ..< (9 + length)])
                assert(data.count == length)
                self.data = data
                
                // not enough bytes
                guard byteValue.count == (Report.length + length)
                    else { return nil }
                
                // last byte
                let rssiByte = Int8(bitPattern: byteValue[9 + length])
                
                guard let rssi = RSSI(rawValue: rssiByte)
                    else { return nil }
                
                self.rssi = rssi
            }
            
            public enum Event: UInt8 { // Event_Type
                
                /// Connectable undirected advertising event
                case undirected         = 0x00 // ADV_IND
                
                /// Connectable directed advertising event
                case directed           = 0x01 // ADV_DIRECT_IND
                
                /// Scannable undirected advertising event
                case scannable          = 0x02 // ADV_SCAN_IND
                
                /// Non-connectable undirected advertising event
                case nonConnectable     = 0x03 // ADV_NONCONN_IND
                
                /// Scan Response
                case scanResponse       = 0x04 // SCAN_RSP
            }
        }
    }
    
    /// LE Connection Update Complete Event
    ///
    /// The event is used to indicate that the Controller process to update the connection has completed.
    public struct ConnectionUpdateCompleteEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.connectionUpdateComplete // 0x03
        
        public static let length: Int = 9
        
        /// `0x00` if Connection successfully completed.
        /// `HCIError` value otherwise.
        public let status: HCIStatus
        
        /// Connection Handle
        ///
        /// Range: 0x0000-0x0EFF (all other values reserved for future use)
        public let handle: UInt16 // Connection_Handle
        
        public let connInterval: LowEnergyConnectionInterval
        
        public let connLatency: LowEnergyConnectionLatency
        
        public let supervisionTimeout: LowEnergySupervisionTimeout
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            let intervalRawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[3], byteValue[4])))
            
            let latencyRawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[5], byteValue[6])))
            
            let supervisionTimeoutRaw = UInt16(littleEndian: UInt16(bytes: (byteValue[7], byteValue[8])))
            
            // Parse enums and values ranges
            guard let status = HCIStatus(rawValue: statusByte),
                let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: supervisionTimeoutRaw),
                let connLatency = LowEnergyConnectionLatency(rawValue: latencyRawValue)
                else { return nil }
            
            let connInterval = LowEnergyConnectionInterval(rawValue: intervalRawValue)
            
            self.status = status
            self.handle = handle
            self.connInterval = connInterval
            self.connLatency = connLatency
            self.supervisionTimeout = supervisionTimeout
        }
    }
    
    /// LE Read Remote Features Complete Event
    ///
    /// The event is used to indicate the completion of the process of the Controller
    /// obtaining the features used on the connection and the features supported by the remote Blu
    public struct ReadRemoteUsedFeaturesCompleteEventParameter: HCIEventParameter {
    
        public static let event = LowEnergyEvent.readRemoteUsedFeaturesComplete // 0x04
        
        public static let length: Int = 11
        
        public typealias Status = HCIStatus
        
        /// `0x00` if Connection successfully completed.
        /// `HCIError` value otherwise.
        public let status: Status
        
        /// Connection Handle
        ///
        /// Range: 0x0000-0x0EFF (all other values reserved for future use)
        public let handle: UInt16 // Connection_Handle
        
        /// LE features of the remote controller.
        public let features: LowEnergyFeatureSet
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            let featuresRawValue = UInt64(littleEndian: UInt64(bytes: (byteValue[3],
                                                                       byteValue[4],
                                                                       byteValue[5],
                                                                       byteValue[6],
                                                                       byteValue[7],
                                                                       byteValue[8],
                                                                       byteValue[9],
                                                                       byteValue[10])))
            
            guard let status = Status(rawValue: statusByte)
                else { return nil }
            
            self.status = status
            self.handle = handle
            self.features = LowEnergyFeatureSet(rawValue: featuresRawValue)
        }
    }
    
    /// LE Long Term Key Request Event
    ///
    /// The LE Long Term Key Request event indicates that the master device is attempting
    /// to encrypt or re-encrypt the link and is requesting the Long Term Key from the Host.
    public struct LongTermKeyRequestEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.longTermKeyRequest // 0x05
        
        public static let length: Int = 12
        
        public let handle: UInt16 // Connection_Handle
        
        /// Random Number
        public let randomNumber: UInt64 //Random_Number
        
        public let encryptedDiversifier: UInt16
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            
            let randomNumber = UInt64(littleEndian: UInt64(bytes: ((byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9]))))
            
            let encryptedDiversifier = UInt16(bytes: (byteValue[10], byteValue[11]))
            
            self.handle = handle
            self.randomNumber = randomNumber
            self.encryptedDiversifier = encryptedDiversifier
        }
    }
    
    /// LE Remote Connection Parameter Request Event
    ///
    /// This event indicates to the master’s Host or the slave’s Host that the remote device is requesting
    /// a change in the connection parameters. The Host replies either with the HCI LE Remote Connection
    /// Parameter Request Reply command or the HCI LE Remote Connection Parameter Request Negative
    /// Reply command.
    public struct RemoteConnectionParameterRequestEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.remoteConnectionParameterRequest // 0x06
        
        public static let length: Int = 10
        
        public let handle: UInt16 // Connection_Handle
        
        public let interval: LowEnergyConnectionIntervalRange
        
        public let connLatency: LowEnergyConnectionLatency
        
        public let supervisionTimeout: LowEnergySupervisionTimeout
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            
            let intervalMinRawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3])))
            
            let intervalMaxRawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[4], byteValue[5])))
            
            let latencyRawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[6], byteValue[7])))
            
            let supervisionTimeoutRaw = UInt16(littleEndian: UInt16(bytes: (byteValue[8], byteValue[9])))
            
            // Parse enums and values ranges
            guard let interval = LowEnergyConnectionIntervalRange(rawValue: intervalMinRawValue ... intervalMaxRawValue),
                let connLatency = LowEnergyConnectionLatency(rawValue: latencyRawValue),
                let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: supervisionTimeoutRaw)
                else { return nil }
            
            self.handle = handle
            self.interval = interval
            self.connLatency = connLatency
            self.supervisionTimeout = supervisionTimeout
        }
    }
    
    /// LE Data Length Change Event
    ///
    /// event notifies the Host of a change to either the maximum Payload length or the maximum transmission time of packets
    /// in either direction. The values reported are the maximum that will actually be used on the connection following the change,
    /// except that on the LE Coded PHY a packet taking up to 2704 μs to transmit may be sent even though the corresponding
    /// parameter has a lower value.
    public struct  DataLengthChangeEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.dataLengthChange // 0x07
        
        public static let length: Int = 10
        
        public let handle: UInt16 // Connection_Handle
        
        /// The maximum number of payload octets in a Link Layer packet that the local Controller will send on this connection
        /// (connEffectiveMaxTxOctets defined in [Vol 6] Part B, Section 4.5.10).
        /// onnInitialMaxTxOctets - the value of connMaxTxOctets that the Controller will use for a new connection.
        /// Range 0x001B-0x00FB (all other values reserved for future use)
        public let maxTxOctets: UInt16
        
        /// The maximum time that the local Controller will take to send a Link Layer packet on this connection
        /// (connEffectiveMaxTxTime defined in [Vol 6] Part B, Section 4.5.10).
        /// connEffectiveMaxTxTime - equal to connEffectiveMaxTxTimeUncoded while the connection is on an LE Uncoded PHY
        /// and equal to connEffectiveMaxTxTimeCoded while the connection is on the LE Coded PHY.
        public let maxTxTime: UInt16
        
        /// The maximum number of payload octets in a Link Layer packet that the local Controller expects to receive on
        /// this connection (connEffectiveMaxRxOctets defined in [Vol 6] Part B, Section 4.5.10).
        /// connEffectiveMaxRxOctets - the lesser of connMaxRxOctets and connRemoteMaxTxOctets.
        public let maxRxOctets: UInt16
        
        /// The maximum time that the local Controller expects to take to receive a Link Layer packet on this
        /// connection (connEffectiveMaxRxTime defined in [Vol 6] Part B, Section 4.5.10).
        /// connEffectiveMaxRxTime - equal to connEffectiveMaxRxTimeUncoded while the connection is on an LE Uncoded PHY
        /// and equal to connEffectiveMaxRxTimeCoded while the connection is on the LE Coded PHY.
        public let maxRxTime: UInt16
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            let maxTxOctets = UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3])))
            let maxTxTime = UInt16(littleEndian: UInt16(bytes: (byteValue[4], byteValue[5])))
            let maxRxOctets = UInt16(littleEndian: UInt16(bytes: (byteValue[6], byteValue[7])))
            let maxRxTime = UInt16(littleEndian: UInt16(bytes: (byteValue[8], byteValue[9])))
            
            self.handle = handle
            self.maxTxOctets = maxTxOctets
            self.maxTxTime = maxTxTime
            self.maxRxOctets = maxRxOctets
            self.maxRxTime = maxRxTime
        }
    }
    
    /// LE Read Local P-256 Public Key Complete Event
    ///
    /// This event is generated when local P-256 key generation is complete.
    public struct ReadLocalP256PublicKeyCompleteEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.readLocalP256PublicKeyComplete // 0x08
        
        public static let length: Int = 65
        
         public let status: HCIStatus
        
        public let localP256PublicKey: UInt512
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            guard let status = HCIStatus(rawValue: statusByte)
                else { return nil }
            
            let localP256PublicKey = UInt512(littleEndian: UInt512(bytes: ((byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9], byteValue[10], byteValue[11], byteValue[12], byteValue[13], byteValue[14], byteValue[15], byteValue[16], byteValue[17], byteValue[18], byteValue[19], byteValue[20], byteValue[21], byteValue[22], byteValue[23], byteValue[24], byteValue[25], byteValue[26], byteValue[27], byteValue[28], byteValue[29], byteValue[30], byteValue[31], byteValue[32], byteValue[33], byteValue[34], byteValue[35], byteValue[36], byteValue[37], byteValue[38], byteValue[39], byteValue[40], byteValue[41], byteValue[42], byteValue[43], byteValue[44], byteValue[45], byteValue[46], byteValue[47], byteValue[48], byteValue[49], byteValue[50], byteValue[51], byteValue[52], byteValue[53], byteValue[54], byteValue[55], byteValue[56], byteValue[57], byteValue[58], byteValue[59], byteValue[60], byteValue[61], byteValue[62], byteValue[63], byteValue[64]))))
            
            self.status = status
            self.localP256PublicKey = localP256PublicKey
        }
    }
    
    /// LE Generate DHKey Complete Event
    ///
    /// This event indicates that LE Diffie Hellman key generation has been completed by the Controller.
    public struct GenerateDHKeyCompleteEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.generateDHKeyComplete // 0x09
        
        public static let length: Int = 33
        
        public let status: HCIStatus
        
        public let dhKey: UInt256
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            guard let status = HCIStatus(rawValue: statusByte)
                else { return nil }
            
            let dhKey = UInt256(littleEndian: UInt256(bytes: ((byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9], byteValue[10], byteValue[11], byteValue[12], byteValue[13], byteValue[14], byteValue[15], byteValue[16], byteValue[17], byteValue[18], byteValue[19], byteValue[20], byteValue[21], byteValue[22], byteValue[23], byteValue[24], byteValue[25], byteValue[26], byteValue[27], byteValue[28], byteValue[29], byteValue[30], byteValue[31], byteValue[32]))))
            
            self.status = status
            self.dhKey = dhKey
        }
    }
    
    /// LE Enhanced Connection Complete Event
    ///
    /// The event indicates to both of the Hosts forming the connection that a new connection has been created.
    public struct EnhancedConnectionCompleteEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.enhancedConnectionComplete // 0x0A
        
        public static let length: Int = 30
        
        public let status: HCIStatus
        
        public let connectionHandle: UInt16
        
        public let role: LowEnergyRole
        
        /// Peer Bluetooth address type.
        public let peerAddressType: LowEnergyAddressType // Peer_Address_Type
        
        /// Public Device Address, or Random Device Address, Public Identity Address or
        /// Random (static) Identity Address of the device to be con- nected.
        public let peerAddress: Address
        
        /// Resolvable Private Address being used by the local device for this connection.
        /// This is only valid when the Own_Address_Type (from the HCI_LE_Create_Connection,
        /// HCI_LE_Set_Advertising_Parameters, HCI_LE_Set_Extended_Advertising_Parameters, or
        /// HCI_LE_Extended_Create_Connection commands) is set to 0x02 or 0x03, and the Controller
        /// generated a resolvable private address for the local device using a non-zero local IRK.
        /// For other Own_Address_Type values, the Controller shall return all zeros.
        public let localResolvablePrivateAddress: Address
        
        /// Resolvable Private Address being used by the peer device for this con- nection.
        /// This is only valid for Peer_Address_Type 0x02 and 0x03. For other Peer_Address_Type
        /// values, the Controller shall return all zeros.
        public let peerResolvablePrivateAddress: Address
        
        /// Connection interval used on this connection.
        ///
        /// Range: 0x0006 to 0x0C80
        /// Time = N * 1.25 msec
        /// Time Range: 7.5 msec to 4000 msec.
        public let interval: LowEnergyConnectionInterval
        
        /// Slave latency for the connection in number of connection events.
        /// Range: 0x0000 to 0x01F3
        public let latency: LowEnergyConnectionLatency
        
        /// Connection supervision timeout. Range: 0x000A to 0x0C80
        /// Time = N * 10 ms
        /// Time Range: 100 ms to 32 s
        public let supervisionTimeout: LowEnergySupervisionTimeout
        
        public let masterClockAccuracy: LowEnergyClockAccuracy
        
        public init?(byteValue: [UInt8]) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let status = HCIStatus(rawValue: byteValue[0])
                else { return nil }
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            guard let role = LowEnergyRole(rawValue: byteValue[3])
                else { return nil }
            
            guard let peerAddressType = LowEnergyAddressType(rawValue: byteValue[4])
                else { return nil }
            
            let peerAddress = Address(littleEndian: Address(bytes: (byteValue[5],
                                                                    byteValue[6], byteValue[7],
                                                                    byteValue[8], byteValue[9],
                                                                    byteValue[10])))
            
            let localResolvableprivateAddress = Address(littleEndian: Address(bytes: (byteValue[11],
                                                                                      byteValue[12], byteValue[13],
                                                                                      byteValue[14], byteValue[15],
                                                                                      byteValue[16])))
            
            let peerResolvablePrivateAddress = Address(littleEndian: Address(bytes: (byteValue[17],
                                                                                     byteValue[18], byteValue[19],
                                                                                     byteValue[20], byteValue[21],
                                                                                     byteValue[22])))
            
            let connInternal = LowEnergyConnectionInterval(rawValue: UInt16(bytes: (byteValue[23], byteValue[24])))
            
            guard let latency = LowEnergyConnectionLatency(rawValue: UInt16(bytes: (byteValue[25], byteValue[26])))
                else { return nil }
            
            guard let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: UInt16(bytes: (byteValue[27], byteValue[28])))
                else { return nil }
            
            guard let masterClockAccuracy = LowEnergyClockAccuracy(rawValue: byteValue[29])
                else { return nil }
            
            self.status = status
            self.connectionHandle = handle
            self.role = role
            self.peerAddressType = peerAddressType
            self.peerAddress = peerAddress
            self.localResolvablePrivateAddress = localResolvableprivateAddress
            self.peerResolvablePrivateAddress = peerResolvablePrivateAddress
            self.interval = connInternal
            self.latency = latency
            self.supervisionTimeout = supervisionTimeout
            self.masterClockAccuracy = masterClockAccuracy
        }
    }
    
    /// LE Directed Advertising Report Event
    ///
    /// The event indicates that directed advertisements have been received where the advertiser
    /// is using a resolvable private address for the TargetA field of the advertising PDU which
    /// the Controller is unable to resolve and the Scanning_Filter_Policy is equal to 0x02 or 0x03.
    public struct DirectedAdvertisingReportEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.directedAdvertisingReport // 0x0B
        
        public static let length: Int = 17
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
        }
    }
    
    /// LE PHY Update Complete Event
    ///
    /// The LE PHY Update Complete Event is used to indicate that the Controller has changed
    /// the transmitter PHY or receiver PHY in use.
    ///
    /// If the Controller changes the transmitter PHY, the receiver PHY, or both PHYs,
    /// this event shall be issued.
    ///
    /// If an LE_Set_PHY command was sent and the Controller determines that neither PHY will
    /// change as a result, it issues this event immediately.
    public struct PhyUpdateCompleteEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.phyUpdateComplete // 0x0C
        
        public static let length: Int = 5
        
        public let status: HCIStatus
        
        public let handle: UInt16 // Connection_Handle
        
        public let txPhy: LowEnergyTxPhy
        
        public let rxPhy: LowEnergyRxPhy
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            guard let status = HCIStatus(rawValue: statusByte)
                else { return nil }
            
            guard let txPhy = LowEnergyTxPhy(rawValue: byteValue[3])
                else { return nil }
            
            guard let rxPhy = LowEnergyRxPhy(rawValue: byteValue[4])
                else { return nil }
            
            self.status = status
            self.handle = handle
            self.txPhy = txPhy
            self.rxPhy = rxPhy
        }
    }
    
    /// LE Extended Advertising Report Event
    ///
    /// The event indicates that one or more Bluetooth devices have responded to an active scan
    /// or have broadcast advertisements that were received during a passive scan.
    /// The Controller may coalesce multiple advertising reports from the same or different advertisers
    /// into a single LE Extended Advertising Report event, provided all the parameters from all the advertising reports
    /// fit in a single HCI event.
    public struct ExtendedAdvertisingReportEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.extendedAdvertisingReport // 0x0D
        
        public static let length = 0
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
        }
    }
    
    /// LE Periodic Advertising Sync Established Event
    ///
    /// The event indicates that the Controller has received the first periodic advertising packet from an advertiser
    /// after the LE_Periodic_Advertising_Create_Sync Command has been sent to the Controller.
    ///
    /// The Sync_Handle shall be assigned by the Controller.
    ///
    /// This event indicates to the Host which issued an LE_Periodic_Advertising_Create_Sync command and received a
    /// Command Status event if the periodic advertising reception failed or was successful.
    public struct PeriodicAdvertisingSyncEstablishedEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.periodicAdvertisingSyncEstablished // 0x0E
        
        public static let length = 15
        
        public let status: HCIStatus
        
        /// Sync_Handle to be used to identify the periodic advertiser
        /// Range: 0x0000-0x0EFF
        public let syncHandle: UInt16 // Sync_Handle
        
        /// Value of the Advertising SID subfield in the ADI field of the PDU
        public let advertisingSID: UInt8
        
        public let advertiserAddressType: LowEnergyAddressType
        
        public let advertiserAddress: Address
        
        public let advertiserPHY: AdvertiserPhy
        
        public let periodicAdvertisingInterval: PeriodicAdvertisingInterval
        
        public let advertiserClockAccuracy: LowEnergyClockAccuracy
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let status = HCIStatus(rawValue: byteValue[0])
                else { return nil }
            
            let syncHandle = UInt16(bytes: (byteValue[1], byteValue[2]))
            
            let advertisingSID = byteValue[3]
            
            guard let advertiserAddressType = LowEnergyAddressType(rawValue: byteValue[4])
                else { return nil }
            
            let advertiserAddress = Address(bytes: (byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9], byteValue[10]))
            
            guard let advertiserPHY = AdvertiserPhy(rawValue: byteValue[11])
                else { return nil }
            
            let periodicAdvertisingInterval = PeriodicAdvertisingInterval(rawValue: UInt16(bytes: (byteValue[12], byteValue[13])))
            
            guard let advertiserClockAccuracy = LowEnergyClockAccuracy(rawValue: byteValue[14])
                else { return nil }
            
            self.status = status
            self.syncHandle = syncHandle
            self.advertisingSID = advertisingSID
            self.advertiserAddressType = advertiserAddressType
            self.advertiserAddress = advertiserAddress
            self.advertiserPHY = advertiserPHY
            self.periodicAdvertisingInterval = periodicAdvertisingInterval
            self.advertiserClockAccuracy = advertiserClockAccuracy
        }
        
        public enum AdvertiserPhy: UInt8 { // Advertiser_PHY
            
            /// Advertiser PHY is LE 1M
            case le1m       = 0x01
            
            /// Advertiser PHY is LE 2M
            case le2m       = 0x02
            
            /// Advertiser PHY is LE Coded
            case coded      = 0x03
        }
        
        public struct PeriodicAdvertisingInterval: RawRepresentable, Equatable, Hashable, Comparable {
            
            /// 7.5 msec
            public static let min = PeriodicAdvertisingInterval(0x0006)
            
            /// 4000 msec
            public static let max = PeriodicAdvertisingInterval(0xFFFF)
            
            public let rawValue: UInt16
            
            public init(rawValue: UInt16) {
                
                self.rawValue = rawValue
            }
            
            /// Time = N * 1.25 msec
            public var miliseconds: Double {
                
                return Double(rawValue) * 1.25
            }
            
            // Private, unsafe
            private init(_ rawValue: UInt16) {
                self.rawValue = rawValue
            }
            
            // Equatable
            public static func == (lhs: PeriodicAdvertisingInterval, rhs: PeriodicAdvertisingInterval) -> Bool {
                
                return lhs.rawValue == rhs.rawValue
            }
            
            // Comparable
            public static func < (lhs: PeriodicAdvertisingInterval, rhs: PeriodicAdvertisingInterval) -> Bool {
                
                return lhs.rawValue < rhs.rawValue
            }
            
            // Hashable
            public var hashValue: Int {
                
                return Int(rawValue)
            }
        }
    }
    
    /// LE Periodic Advertising Report Event
    ///
    /// The event indicates that the Controller has received a Periodic Advertising packet.
    public struct PeriodicAdvertisingReportEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.periodicAdvertisingReport // 0x0F
        
        /// Minimum length
        public static let length = 7
        
        public let syncHandle: UInt16 // Sync_Handle
        
        public let txPower: LowEnergyTxPower
        
        public let rssi: RSSI
        
        /// This parameter is intended to be used in a future feature.
        public let unused: UInt8 // This value must be used by the Controller.
        
        public let dataStatus: DataStatus
        
        public let data: Data
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count >= type(of: self).length
                else { return nil }
            
            let syncHandle = UInt16(bytes: (byteValue[0], byteValue[1]))
            
            guard let txPower = LowEnergyTxPower(rawValue: Int8(bitPattern: byteValue[2]))
                else { return nil }

            guard let rssi = RSSI(rawValue: Int8(bitPattern: byteValue[3]))
                else { return nil }
            
            let unused = byteValue[4]
            
            guard let dataStatus = DataStatus(rawValue: byteValue[5])
                else { return nil }
            
            let dataLength = Int(byteValue[6])
            
            if dataLength > 0 {
                
                let bytes = byteValue[7 ... (7 + dataLength)]
                
                self.data = Data(bytes)
                
            } else {
                
                self.data = Data()
            }
            
            self.syncHandle = syncHandle
            self.txPower = txPower
            self.rssi = rssi
            self.unused = unused
            self.dataStatus = dataStatus
            
            assert(data.count == dataLength, "Invalid data length")
            assert(unused == 0xFF, "Invalid value for unused byte")
        }
        
        public enum DataStatus: UInt8 {
            
            /// Data complete
            case complete       = 0x00
            
            /// Data incomplete, more data to come
            case incomplete     = 0x01
            
            /// Data incomplete, data truncated, no more to come
            case truncated      = 0x02
        }
    }
    
    /// LE Periodic Advertising Sync Lost Event
    ///
    /// The event indicates that the Controller has not received a Periodic Advertising packet identified
    /// by Sync_Handle within the timeout period.
    public struct PeriodicAdvertisingSyncLostEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.periodicAdvertisingSyncLost // 0x10
        
        public static let length = 2
        
        public let syncHandle: UInt16 // Sync_Handle
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let syncHandle = UInt16.init(bytes: (byteValue[0], byteValue[1]))
            
            self.syncHandle = syncHandle
        }
    }
    
    /// LE Advertising Set Terminated Event
    ///
    /// The event indicates that the Controller has terminated advertising in the advertising sets specified by the Advertising_Handle parameter.
    public struct AdvertisingSetTerminatedEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.advertisingSetTerminated // 0x12
        
        public static let length: Int = 5
        
        public let status: HCIStatus
        
        public let advertisingHandle: UInt8
        
        public let connectionHandle: UInt16 // Connection_Handle
        
        public let numCompletedExtendedAdvertisingEvents: UInt8
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let status = HCIStatus(rawValue: byteValue[0])
                else { return nil }
            
            let advertisingHandle =  byteValue[1]
            
            let connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3])))
            
            let numCompletedExtendedAdvertisingEvents = byteValue[4]
            
            self.status = status
            self.advertisingHandle = advertisingHandle
            self.connectionHandle = connectionHandle
            self.numCompletedExtendedAdvertisingEvents = numCompletedExtendedAdvertisingEvents
        }
    }
    
    /// LE Scan Request Received Event
    ///
    /// The vent indicates that a SCAN_REQ PDU or an AUX_SCAN_REQ PDU has been received by the advertiser.
    /// The request contains a device address from a scanner that is allowed by the advertising filter policy.
    /// The advertising set is identified by Advertising_Handle.
    public struct ScanRequestReceivedEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.scanRequestReceived // 0x13
        
        public static let length: Int = 8
        
        public let advertisingHandle: UInt8
        
        public let scannerAddressType: LowEnergyAddressType
        
        public let scannerAddress: Address
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let advertisingHandle =  byteValue[0]
            
            guard let scannerAddressType = LowEnergyAddressType(rawValue: byteValue[1])
                else { return nil }
            
            let scannerAddress = Address(bytes: (byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7]))
            
            self.advertisingHandle = advertisingHandle
            self.scannerAddressType = scannerAddressType
            self.scannerAddress = scannerAddress
        }
    }
    
    /// LE Channel Selection Algorithm Event
    ///
    /// The LE Channel Selection Algorithm Event indicates which channel selection algorithm is used on a data channel connection.
    public struct ChannelSelectionAlgorithmEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.channelSelectionAlgorithm // 0x14
        
        public static let length: Int = 3
    
        public let connectionHandle: UInt16 // Connection_Handle
        
        public let channelSelectionAlgorithm: ChannelSelectionAlgorithm
        
        public init?(byteValue: [UInt8]) {
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            let connectionHandle = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
            
            guard let channelSelectionAlgorithm = ChannelSelectionAlgorithm.init(rawValue: byteValue[2])
                else { return nil }
            
            self.connectionHandle = connectionHandle
            self.channelSelectionAlgorithm = channelSelectionAlgorithm
        }
        
        public enum ChannelSelectionAlgorithm: UInt8 { // Channel_Selection_Algorithm
            
            /// LE Channel Selection Algorithm #1 is used
            case algorithm1         = 0x00
            
            /// LE Channel Selection Algorithm #2 is used
            case algorithm2         = 0x01
        }
    }
}

// MARK: - Supporting Types

/// Connection role
public enum LowEnergyRole: UInt8 {
    
    /// Connection is master.
    case master = 0x00
    
    /// Connection is slave
    case slave = 0x01
}

/// Connection interval / latency used on this connection.
///
/// Range: 0x0006 to 0x0C80
/// Time = N * 1.25 msec
/// Time Range: 7.5 msec to 4000 msec.
public struct LowEnergyConnectionInterval: RawRepresentable, Equatable, Hashable, Comparable {
    
    /// 7.5 msec
    public static let min = LowEnergyConnectionInterval(0x0006)
    
    /// 4000 msec
    public static let max = LowEnergyConnectionInterval(0x0C80)
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
    
    /// Time = N * 1.25 msec
    public var miliseconds: Double {
        
        return Double(rawValue) * 1.25
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyConnectionInterval, rhs: LowEnergyConnectionInterval) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyConnectionInterval, rhs: LowEnergyConnectionInterval) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

public enum LowEnergyClockAccuracy: UInt8 {
    
    case ppm500     = 0x00
    case ppm250     = 0x01
    case ppm150     = 0x02
    case ppm100     = 0x03
    case ppm75      = 0x04
    case ppm50      = 0x05
    case ppm30      = 0x06
    case ppm20      = 0x07
}
