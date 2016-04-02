//
//  LinkControlCommandParameter.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(Linux)
    import Glibc
#elseif os(OSX) || os(iOS)
    import Darwin.C
#endif

import SwiftFoundation

public extension LinkControlCommand {
    
    public struct InquiryParameter: HCICommandParameter {
        
        public static let command = LinkControlCommand.Inquiry
        
        public static let length = 5
        
        public var lap: (UInt8, UInt8, UInt8) = (0, 0, 0)
        
        public var length: UInt8 = 0 /* 1.28s units */
        
        public var count: UInt8 = 0
        
        public init() { }
        
        public var byteValue: [UInt8] {
            
            return [lap.0, lap.1, lap.2, length, count]
        }
    }
    
    public struct RemoteNameRequestParameter: HCICommandParameter {
        
        public static let command = LinkControlCommand.RemoteNameRequest
        
        public static let length = 10
        
        public var address = Address()
        
        public var pscanRepMode: UInt8 = 0
        
        public var pscanMode: UInt8 = 0
        
        public var clockOffset: UInt16 = 0
        
        public init() { }
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == RemoteNameRequestParameter.length
                else { return nil }
            
            self.address = Address(byteValue: (byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5]))
            
            self.pscanRepMode = byteValue[6]
            self.pscanMode = byteValue[7]
            self.clockOffset = UInt16(littleEndian: (byteValue[8], byteValue[9]))
        }
        
        public var byteValue: [UInt8] {
            
            let address = self.address.byteValue
            
            let clockOffsetBytes = clockOffset.littleEndianBytes
            
            return [address.0, address.1, address.2, address.3, address.4, address.5, pscanRepMode, pscanMode, clockOffsetBytes.0, clockOffsetBytes.1]
        }
    }
}
