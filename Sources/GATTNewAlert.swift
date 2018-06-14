//
//  GATTNewAlert.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 New Alert
 
 This characteristic defines the category of the alert and how many new alerts of that category have occurred in the server device.
 Brief text information may also be included for the last alert in the category.
 
 This characteristic consists of “Category ID”, “uint8”, and “UTF-8 string” fields.
 The size of this characteristic is dynamic because of the variable length text (“UTF-8”) field.
 The minimum length of “UTF-8 string” is 0 octets and maximum length of “UTF-8 string” is 18 octets.
 
 • Example:
 
 The value `0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64` are interpreted that the server has 4 new email messages and the last message was sent by “Richard”.
 */
public struct GATTNewAlert: GATTCharacteristic {
    
    internal static let minLength = 2
    
    public static var uuid: BluetoothUUID { return .newAlert }
    
    /// Alert category.
    public var category: GATTAlertCategory
    
    /// Number of new alerts.
    public var newAlertsCount: UInt8
    
    /// Alert textual information.
    public var information: Information
    
    public init(category: GATTAlertCategory,
                newAlertsCount: UInt8,
                information: Information) {
        
        self.category = category
        self.newAlertsCount = newAlertsCount
        self.information = information
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minLength
            else { return nil }
        
        guard let categoryID = GATTAlertCategory(rawValue: data[0])
            else { return nil }
        
        let numberOfNewAlerts = data[1]
        let textStringInformationData = data.subdata(in: (2 ..< data.count))
        
        guard let information = Information(data: textStringInformationData)
            else { return nil }
        
        self.init(category: categoryID,
                  newAlertsCount: numberOfNewAlerts,
                  information: information)
    }
    
    public var data: Data {
        
        return Data([category.rawValue, newAlertsCount]) + information.data
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).uuid,
                                   value: data,
                                   permissions: [.read, .write],
                                   properties: [.notify],
                                   descriptors: [])
    }
}

extension GATTNewAlert: Equatable {
    
    public static func == (lhs: GATTNewAlert,
                           rhs: GATTNewAlert) -> Bool {
        
        return lhs.category == rhs.category &&
            lhs.newAlertsCount == rhs.newAlertsCount &&
            lhs.information == rhs.information
    }
}

public extension GATTNewAlert {
    
    /// Alert textual information.
    public struct Information: RawRepresentable {
        
        /// The minimum length of “UTF-8 string” is 0 octets and maximum length of “UTF-8 string” is 18 octets.
        internal static let length = (min: 0, max: 18)
        
        public let rawValue: String
        
        public init() {
            
            self.rawValue = ""
        }
        
        public init?(rawValue: String) {
            
            let length = rawValue.utf8.count
            
            guard length >= type(of: self).length.min,
                length <= type(of: self).length.max
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        public init?(data: Data) {
            
            guard let string = String(data: data, encoding: .utf8)
                else { return nil }
            
            self.init(rawValue: string)
        }
        
        public var data: Data {
            
            guard let data = rawValue.data(using: .utf8)
                else { fatalError("Could not encode string") }
            
            return data
        }
    }
}

extension GATTNewAlert.Information: Equatable {
    
    public static func == (lhs: GATTNewAlert.Information, rhs: GATTNewAlert.Information) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTNewAlert.Information: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}
