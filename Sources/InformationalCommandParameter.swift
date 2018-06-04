//
//  InformationalCommandParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Return Parameter

public extension InformationalCommand {
    
    /**
     Read Local Version Information
     
     This command reads the values for the version information for the local Controller.
     
     The HCI Version information defines the version information of the HCI layer. The LMP/PAL Version information defines the version of the LMP or PAL. The Manufacturer_Name information indicates the manufacturer of the local device.
     
     The HCI Revision and LMP/PAL Subversion are implementation dependent.
     */
    public struct ReadLocalVersionInformationReturnParameter: HCICommandReturnParameter {
        
        public static let command = InformationalCommand.readLocalVersionInformation
        
        internal static let length = 8 // 1 + 2 + 1 + 2 + 2
        
        /// Version of the Bluetooth Host Controller Interface.
        public let hciVersion: HCIVersion
        
        /// Revision of the Current HCI in the BR/EDR Controller.
        public let hciRevision: UInt16
        
        /// Version of the Current LMP or PAL in the Controller.
        public let lmpVersion: UInt8
        
        /// Manufacturer Name
        public let manufacturer: CompanyIdentifier
        
        /// Subversion of the Current LMP or PAL in the Controller.
        ///
        /// - Note: This value is implementation dependent.
        public let lmpSubversion: UInt16
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            guard let hciVersion = HCIVersion(rawValue: byteValue[0])
                else { return nil }
            
            self.hciVersion = hciVersion
            
            self.hciRevision = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            self.lmpVersion = byteValue[3]
            
            self.manufacturer = CompanyIdentifier(rawValue: UInt16(littleEndian: UInt16(bytes: (byteValue[4], byteValue[5]))))
            
            self.lmpSubversion = UInt16(littleEndian: UInt16(bytes: (byteValue[6], byteValue[7])))
        }
    }
    
    /// Read Device Address
    ///
    /// On a BR/EDR Controller, this command reads the Bluetooth Controller address (BD_ADDR).
    ///
    /// On an LE Controller, this command shall read the Public Device Address.
    /// If this Controller does not have a Public Device Address, the value 0x000000000000 shall be returned.
    ///
    /// - Note: On a BR/EDR/LE Controller, the public address shall be the same as the `BD_ADDR`.
    public struct ReadDeviceAddressReturnParameter: HCICommandReturnParameter {
        
        public static let command = InformationalCommand.readDeviceAddress
        
        internal static let length = 6
        
        /// The Bluetooth address of the device.
        public let address: Address
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == type(of: self).length
                else { return nil }
            
            self.address = Address(littleEndian: Address(bytes: (byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5])))
        }
    }
}
