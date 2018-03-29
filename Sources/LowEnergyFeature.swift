//
//  LowEnergyFeature.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/29/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/**
 LE Feature Support
 
 The set of features supported by a Link Layer is represented by a bit mask called FeatureSet. The value of FeatureSet shall not change while the Controller has a connection to another device. A peer device may cache information about features that the device supports. The Link Layer may cache information about features that a peer supports during a connection.
 Within FeatureSet, a bit set to 0 indicates that the Link Layer Feature is not supported in this Controller; a bit set to 1 indicates that the Link Layer Feature is supported in this Controller.
 
 A Link Layer shall not use a procedure that is not supported by the peer’s Link Layer. A Link Layer shall not transmit a PDU listed in the following subsections unless it supports at least one of the features that requires support for that PDU.

 The bit positions for each Link Layer Feature shall be as shown in Table 4.4. This table also shows if these bits are valid between Controllers. If a bit is shown as not valid, using ‘N’, then this bit shall be ignored upon receipt by the peer Controller.
 */
public enum LowEnergyFeature: UInt16, BitMaskOption {
    
    /// LE Encryption
    case encryption                                     = 0b0000000000000001
    
    /// Connection Parameters Request Procedure
    case connectionParametersRequestProcedure           = 0b0000000000000010
    
    public static let all: Set<LowEnergyFeature> = [.encryption,
                                                    .connectionParametersRequestProcedure]
}

// MARK: - CustomStringConvertible

extension LowEnergyFeature: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

// MARK: - Values

public extension LowEnergyFeature {
    
    /// FeatureSet field’s bit mapping to Controller features
    internal var values: (isValid: Bool, name: String) {
        
        @inline(__always)
        get {
            
            guard let value = featureSet[self]
                else { fatalError("Invalid enum \(self)" ) }
            
            return value
        }
    }
    
    /// Whether the feaure is valid from Controller to Controller.
    public var isValidControllerToController: Bool {
        
        return values.isValid
    }
    
    /// Name of LE feature.
    public var name: String {
        
        return values.name
    }
}

/// FeatureSet field’s bit mapping to Controller features
internal let featureSet: [LowEnergyFeature: (isValid: Bool, name: String)] = [
    
    .encryption: (true, "LE Encryption"),
    .connectionParametersRequestProcedure: (true, "Connection Parameters Request Procedure")
]

// MARK: - Supporting Types

public typealias LowEnergyFeatureSet = BitMaskOptionSet<LowEnergyFeature>
