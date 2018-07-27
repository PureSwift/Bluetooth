//
//  HCIPeriodicInquiryMode.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Periodic Inquiry Mode Command
    ///
    /// Used to configure the BR/EDR Con- troller to enter the Periodic Inquiry Mode that performs an automatic Inquiry.
    func periodicInquiryMode(maxLength: HCIPeriodicInquiryMode.MaxPeriodLength,
                             minLength: HCIPeriodicInquiryMode.MinPeriodLength,
                             lap: HCIPeriodicInquiryMode.LAP,
                             length: HCIPeriodicInquiryMode.Length,
                             responses: HCIPeriodicInquiryMode.Responses,
                             timeout: HCICommandTimeout = .default) throws {
        
        let inquiry = HCIPeriodicInquiryMode(maxPeriodLength: maxLength,
                                             minPeriodLength: minLength,
                                             lap: lap,
                                             length: length,
                                             responses: responses)
        
        try deviceRequest(inquiry, timeout: timeout)
    }
}

// MARK: - Command

/// Periodic Inquiry Mode Command
/// The Periodic_Inquiry_Mode command is used to configure the BR/EDR Con- troller to enter the Periodic Inquiry Mode that performs an automatic Inquiry. Max_Period_Length and Min_Period_Length define the time range between two consecutive inquiries, from the beginning of an inquiry until the start of the next inquiry. The BR/EDR Controller shall use this range to determine a new random time between two consecutive inquiries for each Inquiry. The LAP input parameter contains the LAP from which the inquiry access code shall be derived when the inquiry procedure is made. The Inquiry_Length parameter specifies the total duration of the Inquiry Mode and, when time expires, Inquiry will be halted. The Num_Responses parameter specifies the number of responses that can be received before the Inquiry is halted. This command is completed when the Inquiry process has been started by the BR/EDR Control- ler, and a Command Complete event is sent from the Controller to the Host. When each of the periodic Inquiry processes are completed, the Controller will send an Inquiry Complete event to the Host indicating that the latest periodic Inquiry process has finished. When a BR/EDR Controller responds to the Inquiry message an Inquiry Result event will occur to notify the Host of the dis- covery.
///
/// - Note: Max_Period_Length > Min_Period_Length > Inquiry_Length
///
/// A device which responds during an inquiry or inquiry period should always be reported to the Host in an Inquiry Result event if the device has not been reported earlier during the current inquiry or inquiry period and the device has not been filtered out using the command Set_Event_Filter. If the device has been reported earlier during the current inquiry or inquiry period, it may or may not be reported depending on the implementation (depending on if earlier results have been saved in the BR/EDR Controller and in that case how many responses that have been saved). It is recommended that the BR/EDR Con- troller tries to report a particular device only once during an inquiry or inquiry period.
public struct HCIPeriodicInquiryMode: HCICommandParameter {
    
    public static let command = LinkControlCommand.periodicInquiry
    
    internal static let length = 2 + 2 + 3 + 1 + 1
    
    /// Minimum amount of time specified between consecutive inquiries. Size: 2 octets
    /// Range: 0x02 – 0xFFFE
    /// Time = N * 1.28 sec
    /// Range: 2.56 – 83883.52 Sec 0.0 – 23.3 hours
    public var minPeriodLength: MinPeriodLength
    
    /// Maximum amount of time specified between consecutive inquiries. Size: 2 octets
    /// Range: 0x03 – 0xFFFF
    /// Time = N * 1.28 sec
    /// Range: 3.84 – 83884.8 Sec 0.0 – 23.3 hours
    public var maxPeriodLength: MaxPeriodLength
    
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
    
    public init(maxPeriodLength: MaxPeriodLength,
                minPeriodLength: MinPeriodLength,
                lap: LAP,
                length: Length,
                responses: Responses) {
        
        self.maxPeriodLength = maxPeriodLength
        self.minPeriodLength = minPeriodLength
        self.lap = lap
        self.length = length
        self.responses = responses
    }
    
    public var data: Data {
        
        let minPeriodLengthBytes = minPeriodLength.rawValue.littleEndian.bytes
        
        let maxPeriodLengthBytes = maxPeriodLength.rawValue.littleEndian.bytes
        
        let lapBytes = lap.rawValue.littleEndian.bytes
        
        return Data([
            maxPeriodLengthBytes.0, maxPeriodLengthBytes.1,
            minPeriodLengthBytes.0, minPeriodLengthBytes.1,
            lapBytes.0, lapBytes.1, lapBytes.2,
            length.rawValue,
            responses.rawValue])
    }
}

public extension HCIPeriodicInquiryMode {
    
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

public extension HCIPeriodicInquiryMode {
    
    /// Minimum amount of time specified between consecutive inquiries. Size: 2 octets
    /// Range: 0x02 – 0xFFFE
    public struct MinPeriodLength: RawRepresentable {
        
        public static let min = MinPeriodLength(0x0002)
        
        public static let max = MinPeriodLength(0xFFFF)
        
        public var rawValue: UInt16
        
        /// Time = N * 1.28 sec
        /// Range: 2.56 – 83883.52 Sec 0.0 – 23.3 hours
        public var seconds: Double {
            
            return Double(rawValue) * 1.28
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= MinPeriodLength.max.rawValue, rawValue >= MinPeriodLength.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}

public extension HCIPeriodicInquiryMode {
    
    /// Maximum amount of time specified between consecutive inquiries. Size: 2 octets
    /// Range: 0x03 – 0xFFFF
    public struct MaxPeriodLength: RawRepresentable {
        
        public static let min = MaxPeriodLength(0x0003)
        
        public static let max = MaxPeriodLength(0xFFFF)
        
        public var rawValue: UInt16
        
        /// Time = N * 1.28 sec
        /// Range: 3.84 – 83884.8 Sec 0.0 – 23.3 hours
        public var seconds: Double {
            
            return Double(rawValue) * 1.28
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= MaxPeriodLength.max.rawValue, rawValue >= MaxPeriodLength.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}

public extension HCIPeriodicInquiryMode {
    
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

public extension HCIPeriodicInquiryMode {
    
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