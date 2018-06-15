//
//  GAPLESupportedFeatures.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The LE Supported Features data type defines the LE features supported by the device.
/// All 0x00 octets after the last non-zero octet shall be omitted from the value transmitted.
///
/// The LE Supported Features data type size is zero or more octets long.
/// This allows the LE Supported Features to be represented while using
/// the minimum number of octets within the data packet.
public struct GAPLESupportedFeatures: GAPData {
    
    internal static let omittedValue: UInt8 = 0x00
    
    public static let dataType: GAPDataType = .lowEnergySupportedFeatures
    
    public let supportedFeatures: Data
    
    public init(supportedFeatures: Data) {
        
        self.supportedFeatures = supportedFeatures
    }
    
    public init?(data: Data) {
        
        var supportedFeatures = Data()
        var lastNonZero: UInt8?
        
        for element in data {
            
            if lastNonZero != nil, element == GAPLESupportedFeatures.omittedValue {
                continue
            }
            
            supportedFeatures.append(element)
            
            if element != GAPLESupportedFeatures.omittedValue {
                lastNonZero = element
            }
        }
        
        self.init(supportedFeatures: supportedFeatures)
    }
    
    public var data: Data {
        
        var supportedData = Data()
        var lastNonZero: UInt8?
        
        for element in supportedFeatures {
            
            if lastNonZero != nil, element == GAPLESupportedFeatures.omittedValue {
                continue
            }
            
            supportedData.append(element)
            
            if element != GAPLESupportedFeatures.omittedValue {
                lastNonZero = element
            }
        }
        
        return supportedData
    }
}

extension GAPLESupportedFeatures: Equatable {
    
    public static func == (lhs: GAPLESupportedFeatures, rhs: GAPLESupportedFeatures) -> Bool {
        
        return lhs.supportedFeatures == rhs.supportedFeatures
    }
}

extension GAPLESupportedFeatures: CustomStringConvertible {
    
    public var description: String {
        
        return supportedFeatures.description
    }
}
