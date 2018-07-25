//
//  HCIInquiry.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    func inquiry(lap: HCIInquiry.LAP,
                 length: HCIInquiry.Length,
                 responses: UInt8,
                 timeout: HCICommandTimeout = .default) throws {
        
        let inquiry = HCIInquiry(lap: lap, length: length, responses: responses)
        
        try deviceRequest(inquiry, timeout: timeout)
    }
}

public struct HCIInquiry: HCICommandParameter {
    
    public static let command = LinkControlCommand.inquiry
    
    internal static let length = 3 + 1 + 1
    
    public var lap: LAP
    
    public var length: Length
    
    public var responses: UInt8
    
    public init(lap: LAP, length: Length, responses: UInt8) {
        
        self.lap = lap
        self.length = length
        self.responses = responses
    }
    
    public var data: Data {
        
        let lapBytes = lap.rawValue.littleEndian.bytes
        
        return Data([lapBytes.0, lapBytes.1, lapBytes.2, length.rawValue, responses])
    }
}

public extension HCIInquiry {
    
    public struct LAP: RawRepresentable {
        
        public static let min = LAP(0x9E8B00)
        
        public static let max = LAP(0x9E8B3F)
        
        public var rawValue: UInt24
        
        public init?(rawValue: UInt24) {
            
            guard rawValue <= LAP.max.rawValue, rawValue >= LAP.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt24) {
            
            self.rawValue = unsafe
        }
    }
}

public extension HCIInquiry {
    
    public struct Length: RawRepresentable {
        
        public static let min = Length(0x01)
        
        public static let max = Length(0x30)
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue <= Length.max.rawValue, rawValue >= Length.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}
