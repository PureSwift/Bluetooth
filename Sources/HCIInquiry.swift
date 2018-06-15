//
//  HCIInquiry.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct HCIInquiry: HCICommandParameter {
    
    public static let command = LinkControlCommand.inquiry
    
    internal static let length = 5
    
    public var lap: (UInt8, UInt8, UInt8) = (0, 0, 0)
    
    public var length: UInt8 = 0 /* 1.28s units */
    
    public var count: UInt8 = 0
    
    public init() { }
    
    public var data: Data {
        
        return Data([lap.0, lap.1, lap.2, length, count])
    }
}
