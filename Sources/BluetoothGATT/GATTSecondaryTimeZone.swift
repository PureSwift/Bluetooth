//
//  GATTSecondaryTimeZone.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Secondary Time Zone
 
 - SeeAlso: [Secondary Time Zone](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.secondary_time_zone.xml)
 */
@frozen
public struct GATTSecondaryTimeZone: GATTCharacteristic, Equatable {
    
    internal static let length = MemoryLayout<UInt8>.size + GATTLocalTimeInformation.length
    
    public static var uuid: BluetoothUUID { return .secondaryTimeZone }
    
    public var timeZone: TimeZone
    
    public var relativeInformation: RelativeInformation
    
    public var localTimeInformation: GATTLocalTimeInformation
    
    public init(timeZone: TimeZone,
                relativeInformation: RelativeInformation,
                localTimeInformation: GATTLocalTimeInformation) {
        
        self.timeZone = timeZone
        self.relativeInformation = relativeInformation
        self.localTimeInformation = localTimeInformation
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let timeZone = TimeZone(rawValue: (data[0] << 1) >> 1)
            else { return nil }
        
        guard let relativeInformation = RelativeInformation(rawValue: (data[0] >> 7))
            else { return nil }
        
        let rangeLocalTime = 1 ..< GATTLocalTimeInformation.length + 1
        
        guard let localTimeInformation = GATTLocalTimeInformation(data: data.subdataNoCopy(in: rangeLocalTime))
            else { return nil }
        
        self.init(timeZone: timeZone,
                  relativeInformation: relativeInformation,
                  localTimeInformation: localTimeInformation)
    }
    
    public var data: Data {
        
        return Data([timeZone.rawValue | (relativeInformation.rawValue << 7)]) + localTimeInformation.data
    }
}

extension GATTSecondaryTimeZone {
    
    public enum TimeZone: UInt8 {
        
        /// Signification Unknown
        case significationUnknown = 0
        
        /// Manually set Time Zone
        case manuallySet = 1
        
        /// Time Zone at place of departure
        case atPlaceOfDeparture = 2
        
        /// Time Zone at destination
        case atDestination = 3
        
        /// Time Zone at home
        case atHome = 4
    }
    
    public enum RelativeInformation: UInt8 {
        
        /// Information relative to UTC
        case utc = 0
        
        /// Information relative to local time
        case localTime = 1
    }
}
