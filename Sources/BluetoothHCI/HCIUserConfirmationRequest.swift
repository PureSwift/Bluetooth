//
//  HCIUserConfirmationRequest.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The User Confirmation Request event is used to indicate that user confirmation of a numeric value is required. The Host shall reply with either the User_Confirmation_Request_Reply or the User_Confirmation_Request_Negative_Reply command. If the Host has output capability (DisplayYesNo or KeyboardOnly), it shall display the Numeric_Value until the Simple Pairing Complete event is received. It shall reply based on the yes/no response from the user. If the Host has no input and no output it shall reply with the User Confirmation Request Reply command. When the Controller generates a User Confirmation Request event, in order for the local Link Manager to respond to the request from the remote Link Manager, the local Host must respond with either a User_Confirmation_Request_Reply or a User_Confirmation_Request_Negative_Reply command before the remote Link Manager detects LMP response timeout.
@frozen
public struct HCIUserConfirmationRequest: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.userConfirmationRequest
    
    public static let length: Int = 10
    
    public let address: BluetoothAddress
    
    public let numericValue: NumericValue
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        guard let numericValue = NumericValue(rawValue: UInt32(littleEndian: UInt32(bytes: (data[6], data[7], data[8], data[9]))))
            else { return nil }
        
        self.address = address
        self.numericValue = numericValue
    }
}

extension HCIUserConfirmationRequest {
    
    public struct NumericValue: RawRepresentable {
        
        public static let min = NumericValue(0x00000000)
        
        public static let max = NumericValue(0x000F423F)
        
        public let rawValue: UInt32
        
        public init?(rawValue: UInt32) {
            
            guard rawValue <= NumericValue.max.rawValue,
                rawValue >= NumericValue.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt32) {
            
            self.rawValue = unsafe
        }
    }
}
