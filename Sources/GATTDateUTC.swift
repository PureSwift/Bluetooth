//
//  GATTDateUTC.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct GATTDateUTC: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt24>.size
    
    internal static let min = GATTDateUTC(1)
    
    internal static let max = GATTDateUTC(16777214)
    
    internal static let unknown = GATTDateUTC(0)
    
    public static var uuid: BluetoothUUID { return .dateUtc }
    
    public let rawValue: UInt24
    
    public init?(rawValue: UInt24) {
        
        guard rawValue == GATTDateUTC.unknown.rawValue
            || (GATTDateUTC.min.rawValue <= rawValue && GATTDateUTC.max.rawValue >= rawValue)
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    fileprivate init(_ unsafe: UInt24) {
        
        self.rawValue = unsafe
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let dateUTC = UInt24(littleEndian: UInt24(bytes: (data[0], data[1], data[2])))
        
        self.init(rawValue: dateUTC)
    }
    
    public var data: Data {
        
        let bytes = rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1, bytes.2])
    }
    
}

extension GATTDateUTC: Equatable {
    
    public static func == (lhs: GATTDateUTC, rhs: GATTDateUTC) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTDateUTC: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
