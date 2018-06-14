//
//  GAPIndoorPositioning.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Indoor Positioning Service exposes location information to support mobile devices to position themselves in an environment where GNSS signals are not available, for example in indoor premises.
/// The location information is mainly exposed via advertising and the GATT- based service is primarily intended for configuration.
public struct GAPIndoorPositioning: GAPData {
    
    internal static let length = 18
    
    public static let dataType: GAPDataType = .indoorPositioning
    
    public let flags: BitMaskOptionSet<GAPIndoorPositioningFlag>
    
    public let globalCoordinatesLatitude: UInt32
    
    public let globalCoordinatesLongitude: UInt32
    
    public let localCoordinatesNorth: UInt16
    
    public let localCoordinatesEast: UInt16
    
    public let txPower: UInt8
    
    public let floorNumber: UInt8
    
    public let altitude: UInt16
    
    public let uncertainty: UInt8
    
    public init(flags: BitMaskOptionSet<GAPIndoorPositioningFlag>,
                globalCoordinatesLatitude: UInt32,
                globalCoordinatesLongitude: UInt32,
                localCoordinatesNorth: UInt16,
                localCoordinatesEast: UInt16,
                txPower: UInt8,
                floorNumber: UInt8,
                altitude: UInt16,
                uncertainty: UInt8) {
        
        self.flags = flags
        self.globalCoordinatesLatitude = globalCoordinatesLatitude
        self.globalCoordinatesLongitude = globalCoordinatesLongitude
        self.localCoordinatesNorth = localCoordinatesNorth
        self.localCoordinatesEast = localCoordinatesEast
        self.txPower = txPower
        self.floorNumber = floorNumber
        self.altitude = altitude
        self.uncertainty = uncertainty
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let flags = BitMaskOptionSet<GAPIndoorPositioningFlag>(rawValue: data[0])
        let globalCoordinatesLatitude = UInt32(littleEndian: UInt32(bytes: (data[1], data[2], data[3], data[4])))
        let globalCoordinatesLongitude = UInt32(littleEndian: UInt32(bytes: (data[5], data[6], data[7], data[8])))
        let localCoordinatesNorth = UInt16(littleEndian: UInt16(bytes: (data[9], data[10])))
        let localCoordinatesEast = UInt16(littleEndian: UInt16(bytes: (data[11], data[12])))
        let txPower = data[13]
        let floorNumber = data[14]
        let altitude = UInt16(littleEndian: UInt16(bytes: (data[15], data[16])))
        let uncertainty = data[17]
        
        self.init(flags: flags, globalCoordinatesLatitude: globalCoordinatesLatitude, globalCoordinatesLongitude: globalCoordinatesLongitude, localCoordinatesNorth: localCoordinatesNorth, localCoordinatesEast: localCoordinatesEast, txPower: txPower, floorNumber: floorNumber, altitude: altitude, uncertainty: uncertainty)
    }
    
    public var data: Data {
        
        var data = Data([flags.rawValue])
        data.reserveCapacity(GAPIndoorPositioning.length)
        
        let latitude = globalCoordinatesLatitude.littleEndian.bytes
        data += [latitude.0, latitude.1, latitude.2, latitude.3]
        
        let longitude = globalCoordinatesLongitude.littleEndian.bytes
        data += [longitude.0, longitude.1, longitude.2, longitude.3]
        
        let north = localCoordinatesNorth.littleEndian.bytes
        data += [north.0, north.1]
        
        let east = localCoordinatesEast.littleEndian.bytes
        data += [east.0, east.1]
        
        data.append(txPower)
        
        data.append(floorNumber)
        
        let altitude = self.altitude.littleEndian.bytes
        data += [altitude.0, altitude.1]
        
        data.append(uncertainty)
        
        return data
    }
    
}

public enum GAPIndoorPositioningFlag: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    /// Presence of coordinates in advertising packets
    /// (0 = coordinates are not present, 1 = coordinates are present)
    case coordinates = 0b01
    
    /// Coordinate system used in advertising packets
    /// (0 = WGS84 coordinate system, 1 = Local coordinate system)
    case coordinateSystemUsed = 0b10
    
    /// Presence of Tx Power field in advertising packets
    /// (0 = Tx Power is not present, 1 = Tx Power is present)
    case txPower = 0b100
    
    /// Presence of Altitude field in advertising packets
    /// (0 = Altitude is not present, 1 = Altitude is present)
    case altitudePresence = 0b1000
    
    /// Presence of Floor Number in advertising packets
    /// (0 = Floor Number is not present, 1 = Floor Number is present)
    case floorNumber = 0b10000
    
    /// Presence of Uncertainty in advertising packets
    /// (0 = Uncertainty is not present, 1 = Uncertainty is present)
    case uncertainty = 0b100000
    
    /// Location Name available in the GATT database.
    /// (0 = Location Name is not present, 1 = Location Name is present)
    case locationName = 0b1000000
    
    public static let all: Set<GAPIndoorPositioningFlag> = [
        .coordinates,
        .coordinateSystemUsed,
        .txPower,
        .altitudePresence,
        .floorNumber,
        .uncertainty,
        .locationName
    ]
}
