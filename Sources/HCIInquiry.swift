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
    
    /// Inquiry Command
    ///
    /// Causes the BR/EDR Controller to enter Inquiry Mode. Inquiry Mode is used to discover other nearby BR/EDR Controllers.
    func inquiry(lap: HCIInquiry.LAP,
                 length: HCIInquiry.Length,
                 responses: HCIInquiry.Responses,
                 timeout: HCICommandTimeout = .default) throws {
        
        let inquiry = HCIInquiry(lap: lap, length: length, responses: responses)
        
        try deviceRequest(inquiry, timeout: timeout)
    }
}

/// Inquiry Command
///
/// This command causes the BR/EDR Controller to enter Inquiry Mode. Inquiry Mode is used to discover other nearby BR/EDR Controllers. The LAP input parameter contains the LAP from which the inquiry access code shall be derived when the inquiry procedure is made. The Inquiry_Length parameter specifies the total duration of the Inquiry Mode and, when this time expires, Inquiry will be halted. The Num_Responses parameter specifies the number of responses that can be received before the Inquiry is halted. The event parame- ters of Inquiry Complete event will have a summary of the result from the Inquiry process, which reports the number of nearby BR/EDR Controllers that responded.

/// A device which responds during an inquiry or inquiry period should always be reported to the Host in an Inquiry Result event if the device has not been reported earlier during the current inquiry or inquiry period and the device has not been filtered out using the command Set_Event_Filter. If the device has been reported earlier during the current inquiry or inquiry period, it may or may not be reported depending on the implementation (depending on if earlier results have been saved in the BR/EDR Controller and in that case how many responses that have been saved). It is recommended that the BR/EDR Con- troller tries to report a particular device only once during an inquiry or inquiry period.
public struct HCIInquiry: HCICommandParameter {
    
    public static let command = LinkControlCommand.inquiry
    
    internal static let length = 3 + 1 + 1
    
    /// This is the LAP from which the inquiry access code should be derived when the inquiry procedure is made
    public var lap: LAP
    
    /// Maximum amount of time specified before the Inquiry is halted. Size: 1 octet
    /// Range: 0x01 – 0x30
    /// Time = N * 1.28 sec
    /// Range: 1.28 – 61.44 Sec
    public var length: Length
    
    /// Maximum number of responses from the Inquiry before the Inquiry is halted.
    /// Range: 0x01 – 0xFF
    public var responses: Responses
    
    public init(lap: LAP, length: Length, responses: Responses) {
        
        self.lap = lap
        self.length = length
        self.responses = responses
    }
    
    public var data: Data {
        
        let lapBytes = lap.rawValue.littleEndian.bytes
        
        return Data([lapBytes.0, lapBytes.1, lapBytes.2, length.rawValue, responses.rawValue])
    }
}

public extension HCIInquiry {
    
    /// This is the LAP from which the inquiry access code should be derived when the inquiry procedure is made
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
    
    /// Maximum amount of time specified before the Inquiry is halted. Size: 1 octet
    /// Range: 0x01 – 0x30
    /// Time = N * 1.28 sec
    /// Range: 1.28 – 61.44 Sec
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

public extension HCIInquiry {
    
    /// Maximum number of responses from the Inquiry before the Inquiry is halted.
    /// Range: 0x01 – 0xFF
    public struct Responses: RawRepresentable {

        public static let min = Responses(0x01)
        
        public static let max = Responses(0xFF)
        
        public static let unlimited = Responses(0x00)
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}
