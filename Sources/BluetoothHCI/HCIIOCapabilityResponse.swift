//
//  HCIIOCapabilityResponse.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The IO Capability Response event is used to indicate to the host that IO capa- bilities from a remote device specified by BD_ADDR have been received dur- ing a simple pairing process. This event will only be generated if simple pairing has been enabled with the Write_Simple_Pairing_Mode command.
@frozen
public struct HCIIOCapabilityResponse: HCIEventParameter {
    
    public typealias IOCapability = HCIIOCapabilityRequestReply.IOCapability
    public typealias OBBDataPresent = HCIIOCapabilityRequestReply.OBBDataPresent
    public typealias AuthenticationRequirements = HCIIOCapabilityRequestReply.AuthenticationRequirements
    
    public static let event = HCIGeneralEvent.ioCapabilityResponse
    
    public static let length: Int = 9
    
    public let address: BluetoothAddress
    
    public var ioCapability: IOCapability
    
    public var obbDataPresent: OBBDataPresent
    
    public var authenticationRequirements: AuthenticationRequirements
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        guard let ioCapability = IOCapability(rawValue: data[6])
            else { return nil }
        
        guard let obbDataPresent = OBBDataPresent(rawValue: data[7])
            else { return nil }
        
        guard let authenticationRequirements = AuthenticationRequirements(rawValue: data[8])
            else { return nil }
        
        self.address = address
        self.ioCapability = ioCapability
        self.obbDataPresent = obbDataPresent
        self.authenticationRequirements = authenticationRequirements
    }
}
