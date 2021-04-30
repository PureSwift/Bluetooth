//
//  HCICreateConnection.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Create Connection Command
    ///
    /// This command causes the Link Manager to create a connection to the remote device with the BD_ADDR specified by the command parameters. This command causes the local BR/EDR Controller to begin the Page process to create a link level connection. The Link Manager will determine how the new ACL connection is established. This ACL connection is determined by the current state of the device, its piconet, and the state of the device to be connected.
    func createConnection(address: BluetoothAddress,
                          packetType: UInt16,
                          pageScanRepetitionMode: PageScanRepetitionMode,
                          clockOffset: BitMaskOptionSet<HCICreateConnection.ClockOffset>,
                          allowRoleSwitch: HCICreateConnection.AllowRoleSwitch,
                          timeout: HCICommandTimeout = .default) throws -> HCIConnectionComplete {
        
        let createConnection = HCICreateConnection(address: address,
                                                   packetType: packetType,
                                                   pageScanRepetitionMode: pageScanRepetitionMode,
                                                   clockOffset: clockOffset,
                                                   allowRoleSwitch: allowRoleSwitch)
        
        return try deviceRequest(createConnection, HCIConnectionComplete.self, timeout: timeout)
    }
}

// MARK: - Command

/// Create Connection Command
///
/// This command causes the Link Manager to create a connection to the remote device with the BD_ADDR specified by the command parameters. This command causes the local BR/EDR Controller to begin the Page process to create a link level connection. The Link Manager will determine how the new ACL connection is established. This ACL connection is determined by the current state of the device, its piconet, and the state of the device to be connected.
///
/// - Note:
/// The Host should enable as many packet types as possible for the Link Manager to perform efficiently. However, the Host must not enable packet types that the local device does not support.
@frozen
public struct HCICreateConnection: HCICommandParameter {
    
    public static let command = LinkControlCommand.createConnection
    
    /// BD_ADDR of the Device to be connected.
    public var address: BluetoothAddress
    
    /// The Packet_Type command parameter specifies which packet types the Link Manager shall use for the ACL connection. When sending HCI ACL Data Packets the Link Manager shall only use the packet type(s) specified by the Packet_Type command parameter or the always-allowed DM1 packet type. Multiple packet types may be specified for the Packet Type parameter by performing a bit-wise OR operation of the different packet types. The Link Manager may choose which packet type to be used from the list of acceptable packet types.
    public var packetType: UInt16
    
    /// The Page_Scan_Repetition_Mode parameter specifies the page scan repetition mode supported by the remote device with the BD_ADDR. This is the information that was acquired during the inquiry process.
    public var pageScanRepetitionMode: PageScanRepetitionMode
    
    // Must be set to 0x00
    internal var reserved: Reserved
    
    /// The Clock_Offset parameter is the difference between its own clock and the clock of the remote device with BD_ADDR. Only bits 2 through 16 of the difference are used, and they are mapped to this parameter as bits 0 through 14 respectively.
    public var clockOffset: BitMaskOptionSet<ClockOffset>
    
    /// The Allow_Role_Switch parameter specifies if the local device accepts or rejects the request of a master-slave role switch when the remote device requests it at the connection setup (in the Role parameter of the Accept_Connection_Request command) (before the local Controller returns a Connection Complete event).
    public var allowRoleSwitch: AllowRoleSwitch
    
    public init(address: BluetoothAddress,
                packetType: UInt16,
                pageScanRepetitionMode: PageScanRepetitionMode,
                clockOffset: BitMaskOptionSet<ClockOffset>,
                allowRoleSwitch: AllowRoleSwitch) {
        
        self.address = address
        self.packetType = packetType
        self.pageScanRepetitionMode = pageScanRepetitionMode
        self.reserved = .mandatory
        self.clockOffset = clockOffset
        self.allowRoleSwitch = allowRoleSwitch
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        let packetTypeBytes = packetType.littleEndian.bytes
        
        let clockOffsetBytes = clockOffset.rawValue.littleEndian.bytes
        
        return Data([addressBytes.0, addressBytes.1, addressBytes.2, addressBytes.3, addressBytes.4, addressBytes.5, // address
            packetTypeBytes.0, packetTypeBytes.1, // packet type
            pageScanRepetitionMode.rawValue, // page scan repetition mode
            reserved.rawValue, // reserved
            clockOffsetBytes.0, clockOffsetBytes.1, // clock offset
            allowRoleSwitch.rawValue]) // allow role switch
    }
}

extension HCICreateConnection {
    
    // Must be set to 0x00
    public enum Reserved: UInt8 {
        
        case mandatory = 0x00
    }
}

extension HCICreateConnection {
    
    /// The Clock_Offset parameter is the difference between its own clock and the clock of the remote device with BD_ADDR. Only bits 2 through 16 of the difference are used, and they are mapped to this parameter as bits 0 through 14 respectively.
    public enum ClockOffset: UInt16, BitMaskOption {
        
        case valid = 0b10000000_00000000
        
        public static let allCases: [ClockOffset] = [.valid]
    }
}

extension HCICreateConnection {
    
    /// The Allow_Role_Switch parameter specifies if the local device accepts or rejects the request of a master-slave role switch when the remote device requests it at the connection setup (in the Role parameter of the Accept_Connection_Request command) (before the local Controller returns a Connection Complete event).
    public enum AllowRoleSwitch: UInt8 {
        
        /// The local device will be a master, and will not accept a role switch requested by the remote device at the connection setup.
        case master = 0x00
        
        /// The local device may be a master, or may become a slave after accepting a role switch requested by the remote device at the connection setup.
        case masterOrSlave = 0x01
    }
}
