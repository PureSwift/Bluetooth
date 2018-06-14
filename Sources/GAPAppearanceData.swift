//
//  GAPAppearanceData.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Appearance data type defines the external appearance of the device.
/// This value shall be the same as the Appearance characteristic, as defined in Vol. 3, Part C, Section 12.2.
public struct GAPAppearanceData: GAPData {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .appearance
    
    public let appearance: GAPAppearance
    
    public init(appearance: GAPAppearance) {
        
        self.appearance = appearance
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let appearance = GAPAppearance(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        self.init(appearance: appearance)
    }
    
    public var data: Data {
        
        let bytes = appearance.rawValue.littleEndian.bytes
        
        return Data(bytes: [bytes.0, bytes.1])
    }
}

extension GAPAppearanceData: Equatable {
    
    public static func == (lhs: GAPAppearanceData, rhs: GAPAppearanceData) -> Bool {
        
        return lhs.appearance == rhs.appearance
    }
}
