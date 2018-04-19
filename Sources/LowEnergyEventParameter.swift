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
        public let latency: ConnectionInterval
        
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
            self.latency = ConnectionInterval(rawValue: latencyRawValue)
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
    
    /// LE Enhanced Connection Complete Event
    ///
    /// The event indicates to both of the Hosts forming the connection that a new connection has been created.
    public struct EnhancedConnectionCompleteEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.enhancedConnectionComplete // 0x3E
        
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
        public let interval: ConnectionInterval

        /// Slave latency for the connection in number of connection events.
        /// Range: 0x0000 to 0x01F3
        public let latency: LowEnergyConnectionLatency
        
        /// Connection supervision timeout. Range: 0x000A to 0x0C80
        /// Time = N * 10 ms
        /// Time Range: 100 ms to 32 s
        public let supervisionTimeout: LowEnergySupervisionTimeout
        
        public let masterClockAccuracy: MasterClockAccuracy
        
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
            
            let connInternal = ConnectionInterval(rawValue: UInt16(bytes: (byteValue[23], byteValue[24])))
            
            guard let latency = LowEnergyConnectionLatency(rawValue: UInt16(bytes: (byteValue[25], byteValue[26])))
                else { return nil }
            
            guard let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: UInt16(bytes: (byteValue[27], byteValue[28])))
                else { return nil }

            guard let masterClockAccuracy = MasterClockAccuracy(rawValue: byteValue[29])
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
    
    public enum MasterClockAccuracy: UInt8 { // Master_Clock_Accuracy
        
        case ppm500     = 0x00
        case ppm250     = 0x01
        case ppm150     = 0x02
        case ppm100     = 0x03
        case ppm75      = 0x04
        case ppm50      = 0x05
        case ppm30      = 0x06
        case ppm20      = 0x07
    }
    
    /// Connection interval / latency used on this connection.
    ///
    /// Range: 0x0006 to 0x0C80
    /// Time = N * 1.25 msec
    /// Time Range: 7.5 msec to 4000 msec.
    public struct ConnectionInterval: RawRepresentable, Equatable, Hashable, Comparable {
        
        /// 7.5 msec
        public static let min = ConnectionInterval(0x0006)
        
        /// 4000 msec
        public static let max = ConnectionInterval(0x0C80)
        
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
        public static func == (lhs: ConnectionInterval, rhs: ConnectionInterval) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
        
        // Comparable
        public static func < (lhs: ConnectionInterval, rhs: ConnectionInterval) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
        
        // Hashable
        public var hashValue: Int {
            
            return Int(rawValue)
        }
    }
}

// MARK: - Supporting Types

/// Connection role
public enum LowEnergyRole: UInt8 {
    
    /// Connection is master.
    case master
    
    /// Connection is slave
    case slave
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
