//
//  LinkControlCommandParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(Linux)
    import Glibc
#elseif os(OSX) || os(iOS)
    import Darwin.C
#endif

public extension LinkControlCommand {
    
    public struct InquiryParameter: HCICommandParameter {
        
        public static let command = LinkControlCommand.inquiry
        
        public static let length = 5
        
        public var lap: (UInt8, UInt8, UInt8) = (0, 0, 0)
        
        public var length: UInt8 = 0 /* 1.28s units */
        
        public var count: UInt8 = 0
        
        public init() { }
        
        public var data: Data {
            
            return Data([lap.0, lap.1, lap.2, length, count])
        }
    }
    
    public struct RemoteNameRequestParameter: HCICommandParameter {
        
        public static let command = LinkControlCommand.remoteNameRequest
        
        public static let length = 10
        
        public var address = Address()
        
        public var pscanRepMode: UInt8 = 0
        
        public var pscanMode: UInt8 = 0
        
        public var clockOffset: UInt16 = 0
        
        public init() { }
        
        public init?(data: Data) {
            
            guard data.count == RemoteNameRequestParameter.length
                else { return nil }
            
            self.address = Address(bytes: (data[0], data[1], data[2], data[3], data[4], data[5]))
            
            self.pscanRepMode = data[6]
            self.pscanMode = data[7]
            self.clockOffset = UInt16(bytes: (data[8], data[9])).littleEndian
        }
        
        public var data: Data {
            
            let address = self.address.bytes
            
            let clockOffsetBytes = clockOffset.littleEndian.bytes
            
            return Data([address.0, address.1, address.2, address.3, address.4, address.5, pscanRepMode, pscanMode, clockOffsetBytes.0, clockOffsetBytes.1])
        }
    }
}
