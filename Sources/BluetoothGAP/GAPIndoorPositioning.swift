//
//  GAPIndoorPositioning.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 The Indoor Positioning Service exposes location information to support mobile devices to position themselves in an environment where GNSS signals are not available, for example in indoor premises.

 The location information is mainly exposed via advertising and the GATT-based service is primarily intended for configuration.
 
 - SeeAlso: [Indoor Positioning Service Specification](https://www.bluetooth.org/docman/handlers/downloaddoc.ashx?doc_id=302114)
 */
@frozen
public struct GAPIndoorPositioning: GAPData, Equatable {
    
    public static var dataType: GAPDataType { return .indoorPositioning }
    
    /// Global or Local Coordinates
    public var coordinates: Coordinates?
    
    /// Tx Power
    public var txPower: UInt8?
    
    /// Floor Number
    public var floorNumber: UInt8?
    
    /// Altitude
    public var altitude: UInt16?
    
    /// Uncertainty
    public var uncertainty: UInt8?
    
    /// Whether the Location Name available in the GATT database.
    public var isLocationNamePresent: Bool
    
    public init(coordinates: Coordinates? = nil,
                txPower: UInt8? = nil,
                floorNumber: UInt8? = nil,
                altitude: UInt16? = nil,
                uncertainty: UInt8? = nil,
                isLocationNamePresent: Bool = false) {
        
        self.coordinates = coordinates
        self.txPower = txPower
        self.floorNumber = floorNumber
        self.altitude = altitude
        self.uncertainty = uncertainty
        self.isLocationNamePresent = isLocationNamePresent
    }
}

internal extension GAPIndoorPositioning {
    
    var flags: BitMaskOptionSet<Flag> {
        
        var flags = BitMaskOptionSet<Flag>()
        
        if let coordinates = coordinates {
            
            flags.insert(.coordinates)
            
            switch coordinates {
            case .local:
                flags.insert(.coordinateSystemUsed)
            case .global:
                break
            }
        }
        
        if txPower != nil {
            flags.insert(.txPower)
        }
        
        if floorNumber != nil {
            flags.insert(.floorNumber)
        }
        
        if altitude != nil {
            flags.insert(.altitude)
        }
        
        if uncertainty != nil {
            flags.insert(.uncertainty)
        }
        
        if isLocationNamePresent {
            flags.insert(.locationName)
        }
        
        return flags
    }
}
    
public extension GAPIndoorPositioning {
    
    init?(data: Data) {
        
        self.init() // empty data
        
        guard data.isEmpty == false
            else { return }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: data[0])
        
        var offset = 1
        
        if flags.contains(.coordinates) {
            
            guard data.count >= offset + 4
                else { return nil }
            
            let latitude = UInt16(littleEndian: UInt16(bytes: (data[offset], data[offset + 1])))
            let longitude = UInt16(littleEndian: UInt16(bytes: (data[offset + 2], data[offset + 3])))
            
            offset += 4
            
            if flags.contains(.coordinateSystemUsed) {
                
                self.coordinates = .local(north: latitude, east: longitude)
                
            } else {
                
                self.coordinates = .global(latitude: latitude, longitude: longitude)
            }
        }
        
        if flags.contains(.txPower) {
            
            guard data.count >= offset + 1
                else { return nil }
            
            self.txPower = data[offset]
            offset += 1
        }
        
        if flags.contains(.floorNumber) {
            
            guard data.count >= offset + 1
                else { return nil }
            
            self.floorNumber = data[offset]
            offset += 1
        }
        
        if flags.contains(.altitude) {
            
            guard data.count >= offset + 2
                else { return nil }
            
            self.altitude = UInt16(littleEndian: UInt16(bytes: (data[offset], data[offset + 1])))
            offset += 2
        }
        
        if flags.contains(.uncertainty) {
            
            guard data.count >= offset + 1
                else { return nil }
            
            self.uncertainty = data[offset]
            offset += 1
        }
        
        if flags.contains(.locationName) {
            
            self.isLocationNamePresent = true
        }
    }
    
    var dataLength: Int {
        
        // If all flag values are set to zero,
        // the Server shall omit the Flags field from the advertisement packet.
        guard flags.isEmpty == false
            else { return 0 }
        
        var length = 1
        
        if coordinates != nil {
            length += 4
        }
        
        if txPower != nil {
            length += 1
        }
        
        if floorNumber != nil {
            length += 1
        }
        
        if altitude != nil {
            length += 2
        }
        
        if uncertainty != nil {
            length += 1
        }
        
        return length
    }
    
    func append(to data: inout Data) {
        
        // If all flag values are set to zero,
        // the Server shall omit the Flags field from the advertisement packet.
        
        guard flags.isEmpty == false else { return } // empty data
        
        data += flags.rawValue
        
        if let coordinates = coordinates {
            data += coordinates
        }
        
        if let txPower = txPower {
            data += txPower
        }
        
        if let floorNumber = floorNumber {
            data += floorNumber
        }
        
        if let altitude = altitude {
            data += altitude
        }
        
        if let uncertainty = uncertainty {
            data += uncertainty
        }
    }
}

// MARK: - Supporting Types

public extension GAPIndoorPositioning {
    
    enum Coordinates: Equatable {
        
        /// WGS84 coordinate system
        case global(latitude: UInt16, longitude: UInt16)
        
        /// Local coordinate system
        case local(north: UInt16, east: UInt16)
    }
}

extension GAPIndoorPositioning.Coordinates: DataConvertible {
    
    var dataLength: Int {
        
        return 4
    }
    
    static func += <T: DataContainer> (data: inout T, value: GAPIndoorPositioning.Coordinates) {
        
        switch value {
        case let .global(latitude, longitude):
            data += latitude.littleEndian
            data += longitude.littleEndian
        case let .local(north, east):
            data += north.littleEndian
            data += east.littleEndian
        }
    }
}

internal extension GAPIndoorPositioning {
    
    /// GAP Indoor Positioning Flag
    enum Flag: UInt8, BitMaskOption {
        
        /// Presence of coordinates in advertising packets
        /// (0 = coordinates are not present, 1 = coordinates are present)
        case coordinates                = 0b00000001
        
        /// Coordinate system used in advertising packets
        /// (0 = WGS84 coordinate system, 1 = Local coordinate system)
        case coordinateSystemUsed       = 0b00000010
        
        /// Presence of Tx Power field in advertising packets
        /// (0 = Tx Power is not present, 1 = Tx Power is present)
        case txPower                    = 0b00000100
        
        /// Presence of Altitude field in advertising packets
        /// (0 = Altitude is not present, 1 = Altitude is present)
        case altitude                   = 0b00001000
        
        /// Presence of Floor Number in advertising packets
        /// (0 = Floor Number is not present, 1 = Floor Number is present)
        case floorNumber                = 0b00010000
        
        /// Presence of Uncertainty in advertising packets
        /// (0 = Uncertainty is not present, 1 = Uncertainty is present)
        case uncertainty                = 0b00100000
        
        /// Location Name available in the GATT database.
        /// (0 = Location Name is not present, 1 = Location Name is present)
        case locationName               = 0b01000000
        
        public static let allCases: [Flag] = [
            .coordinates,
            .coordinateSystemUsed,
            .txPower,
            .altitude,
            .floorNumber,
            .uncertainty,
            .locationName
        ]
    }
}
