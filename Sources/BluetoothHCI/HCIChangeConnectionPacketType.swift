//
//  HCIChangeConnectionPacketType.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/9/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Change Connection Packet Type Command
    ///
    /// The Change_Connection_Packet_Type command is used to change which packet types can be used for a connection that is currently established. This allows current connections to be dynamically modified to support different types of user data. The Packet_Type command parameter specifies which packet types the Link Manager can use for the connection. When sending HCI ACL Data Packets the Link Manager shall only use the packet type(s) specified by the Packet_Type command parameter or the always-allowed DM1 packet type. The interpretation of the value for the Packet_Type command parameter will depend on the Link_Type command parameter returned in the Connection Complete event at the connection setup. Multiple packet types may be speci- fied for the Packet_Type command parameter by bitwise OR operation of the different packet types. For a definition of the different packet types see the Part B, Baseband Specification on page 59.
    func changeConnectionPacketType(handle: UInt16,
                                    packetType: PacketType,
                                    timeout: HCICommandTimeout = .default) async throws -> HCIStatus {
        
        let command = HCIChangeConnectionPacketType(handle: handle, packetType: packetType)
        
        return try await deviceRequest(command,
                                 HCIAuthenticationComplete.self,
                                 timeout: timeout).status
    }
}

// MARK: - Command

/// Change Connection Packet Type Command
///
/// The Change_Connection_Packet_Type command is used to change which packet types can be used for a connection that is currently established. This allows current connections to be dynamically modified to support different types of user data. The Packet_Type command parameter specifies which packet types the Link Manager can use for the connection. When sending HCI ACL Data Packets the Link Manager shall only use the packet type(s) specified by the Packet_Type command parameter or the always-allowed DM1 packet type. The interpretation of the value for the Packet_Type command parameter will depend on the Link_Type command parameter returned in the Connection Complete event at the connection setup. Multiple packet types may be speci- fied for the Packet_Type command parameter by bitwise OR operation of the different packet types. For a definition of the different packet types see the Part B, Baseband Specification on page 59.
///
/// - Note: The Host should enable as many packet types as possible for the Link Manager to perform efficiently. However, the Host must not enable packet types that the local device does not support.
///
/// - Note: To change an eSCO connection, use the Setup Synchronous Connection command.
@frozen
public struct HCIChangeConnectionPacketType: HCICommandParameter {
    
    public static let command = LinkControlCommand.setConnectionPacketType
    
    /// Connection_Handle to be used to set up authentication for all Connection Handles with the same BR/EDR Controller end-point as the specified Connection_Handle.
    public var handle: UInt16
    
    public var packetType: PacketType
    
    public init(handle: UInt16, packetType: PacketType) {
        
        self.handle = handle
        self.packetType = packetType
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        let packetTypeBytes = packetType.rawValue.littleEndian.bytes
        
        return Data([handleBytes.0, handleBytes.1, packetTypeBytes.0, packetTypeBytes.1])
    }
}
