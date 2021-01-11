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
@frozen
public struct GAPAppearanceData: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .appearance
    
    public let appearance: GAPAppearance
    
    public init(appearance: GAPAppearance) {
        
        self.appearance = appearance
    }
}

public extension GAPAppearanceData {
    
    init?(data: Data) {
        
        guard data.count == 2
            else { return nil }
        
        let appearance = GAPAppearance(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        self.init(appearance: appearance)
    }
    
    func append(to data: inout Data) {
        
        data += appearance.rawValue.littleEndian
    }
    
    var dataLength: Int {
        
        return 2
    }
}
