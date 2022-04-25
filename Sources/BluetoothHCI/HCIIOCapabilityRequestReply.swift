//
//  HCIIOCapabilityRequestReply.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/16/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// IO Capability Request Reply Command
    ///
    /// The IO_Capability_Request_Reply command is used to reply to an IO Capability Request event from the controller, and specifies the current I/O capabilities of the host. This includes the Host input, output and out-of-band (OOB) capa- bilities.
    /// The Authentication_Requirements parameter shall be set to man-in-the middle (MITM) Protection Required Single Profile, MITM Protection Required – Gen- eral Bonding, or MITM Protection Required – Dedicated Bonding if an authenti- cated link key is required by the Host. The Authentication_Requirements parameter may be set to MITM Protection Not Required - Single Profile, MITM Protection Not Required – General Bonding, or MITM Protection Not Required – Dedicated Bonding if an authenticated link key is not required. If one or both Hosts set the Authentication_Requirements parameter to MITM Protection Required - Single Profile, MITM Protection Required – General Bonding, or MITM Protection Required – Dedicated Bonding, the Link Managers shall use the IO_Capability parameter to determine the authentication procedure. A Host that sets the Authentication_Requirements parameter to MITM Protection Required - Single Profile, MITM Protection Required – General Bonding, or MITM Protection Required – All Profiles shall verify that the resulting Link Key type meets the security requirements.
    /// If both Hosts set the Authentication_Requirements parameter to MITM Protection Not Required - Single Profile, MITM Protection Not Required – General Bonding, or MITM Protection Not Required – Dedicated Bonding, the Link Managers shall use the numeric comparison authentication procedure and the Hosts shall use the Just Works Association Model.
    /// The OOB_Data_Present parameter shall be set to "OOB authentication data from remote device present" if the host has received OOB data from a device with the same BD_ADDR sent in the IO Capability Request event. Otherwise OOB_Data_Present shall be set to "OOB authentication data not present".
    @discardableResult
    func ioCapabilityRequestReply(address: BluetoothAddress,
                                  ioCapability: HCIIOCapabilityRequestReply.IOCapability,
                                  obbDataPresent: HCIIOCapabilityRequestReply.OBBDataPresent,
                                  authenticationRequirements: HCIIOCapabilityRequestReply.AuthenticationRequirements,
                                  timeout: HCICommandTimeout = .default) async throws -> BluetoothAddress {
        
        let command = HCIIOCapabilityRequestReply(address: address,
                                                  ioCapability: ioCapability,
                                                  obbDataPresent: obbDataPresent,
                                                  authenticationRequirements: authenticationRequirements)
        
        return try await deviceRequest(command, HCIIOCapabilityRequestReplyReturn.self, timeout: timeout).address
    }
}

// MARK: - Command

/// IO Capability Request Reply Command
///
/// The IO_Capability_Request_Reply command is used to reply to an IO Capability Request event from the controller, and specifies the current I/O capabilities of the host. This includes the Host input, output and out-of-band (OOB) capa- bilities.
/// The Authentication_Requirements parameter shall be set to man-in-the middle (MITM) Protection Required Single Profile, MITM Protection Required – Gen- eral Bonding, or MITM Protection Required – Dedicated Bonding if an authenti- cated link key is required by the Host. The Authentication_Requirements parameter may be set to MITM Protection Not Required - Single Profile, MITM Protection Not Required – General Bonding, or MITM Protection Not Required – Dedicated Bonding if an authenticated link key is not required. If one or both Hosts set the Authentication_Requirements parameter to MITM Protection Required - Single Profile, MITM Protection Required – General Bonding, or MITM Protection Required – Dedicated Bonding, the Link Managers shall use the IO_Capability parameter to determine the authentication procedure. A Host that sets the Authentication_Requirements parameter to MITM Protection Required - Single Profile, MITM Protection Required – General Bonding, or MITM Protection Required – All Profiles shall verify that the resulting Link Key type meets the security requirements.
/// If both Hosts set the Authentication_Requirements parameter to MITM Protection Not Required - Single Profile, MITM Protection Not Required – General Bonding, or MITM Protection Not Required – Dedicated Bonding, the Link Managers shall use the numeric comparison authentication procedure and the Hosts shall use the Just Works Association Model.
/// The OOB_Data_Present parameter shall be set to "OOB authentication data from remote device present" if the host has received OOB data from a device with the same BD_ADDR sent in the IO Capability Request event. Otherwise OOB_Data_Present shall be set to "OOB authentication data not present".
@frozen
public struct HCIIOCapabilityRequestReply: HCICommandParameter {
    
    public static let command = LinkControlCommand.ioCapabilityRequestReply
    
    public var address: BluetoothAddress
    
    public var ioCapability: IOCapability
    
    public var obbDataPresent: OBBDataPresent
    
    public var authenticationRequirements: AuthenticationRequirements
    
    public init(address: BluetoothAddress,
                ioCapability: IOCapability,
                obbDataPresent: OBBDataPresent,
                authenticationRequirements: AuthenticationRequirements) {
        
        self.address = address
        self.ioCapability = ioCapability
        self.obbDataPresent = obbDataPresent
        self.authenticationRequirements = authenticationRequirements
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     ioCapability.rawValue,
                     obbDataPresent.rawValue,
                     authenticationRequirements.rawValue
        ])
    }
}

extension HCIIOCapabilityRequestReply {
    
    public enum IOCapability: UInt8 {
        
        /// DisplayOnly
        case displayOnly = 0x00
        
        /// DisplayYesNo
        case displayYesNo = 0x01
        
        /// KeyboardOnly
        case keyboardOnly = 0x02
        
        /// NoInputNoOutput
        case noInputNoOutput = 0x03
    }
    
    public enum OBBDataPresent: UInt8 {
        
        /// OOB authentication data not present
        case oobDataNotPresent = 0x00
        
        /// OOB authentication data from remote device present
        case oobDataFromRemoteDevicePresent = 0x01
    }
    
    public enum AuthenticationRequirements: UInt8 {
        
        /// MITM Protection Not Required – No Bonding. Numeric comparison with automatic accept allowed.
        case noBondingAcceptAllowed = 0x00
        
        /// MITM Protection Required – No Bonding. Use IO Capabilities to deter- mine authentication procedure
        case noBondingWithIOCapabilities = 0x01
        
        /// MITM Protection Not Required – Dedicated Bonding. Numeric compar- ison with automatic accept allowed.
        case dedicatedBondingAcceptAllowed = 0x02
        
        /// MITM Protection Required – Dedicated Bonding. Use IO Capabilities to determine authentication procedure
        case dedicatedBondingWithIOCapabilities = 0x03
        
        /// MITM Protection Not Required – General Bonding. Numeric Compari- son with automatic accept allowed.
        case generalBondingAcceptAllowed = 0x04
        
        /// MITM Protection Required – General Bonding. Use IO capabilities to determine authentication procedure.
        case generalBondingWithIOCapabilities = 0x05
    }
}

// MARK: - Return Parameter

@frozen
public struct HCIIOCapabilityRequestReplyReturn: HCICommandReturnParameter {
    
    public static let command = LinkControlCommand.ioCapabilityRequestReply
    
    public static let length: Int = 6
    
    public let address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == HCIIOCapabilityRequestReplyReturn.length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
