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
    func periodicInquiryMode(maxDuration: HCIPeriodicInquiryMode.MaxDuration,
                             minDuration: HCIPeriodicInquiryMode.MinDuration,
                             lap: HCIPeriodicInquiryMode.LAP,
                             length: HCIPeriodicInquiryMode.Duration,
                             responses: HCIPeriodicInquiryMode.Responses,
                             timeout: HCICommandTimeout = .default) async throws {
        
        let periodicInquiryMode = HCIPeriodicInquiryMode(maxDuration: maxDuration,
                                                         minDuration: minDuration,
                                                         lap: lap,
                                                         length: length,
                                                         responses: responses)
        
        try await deviceRequest(periodicInquiryMode, timeout: timeout)
    }
}

// MARK: - Command

/// Periodic Inquiry Mode Command
/// The Periodic_Inquiry_Mode command is used to configure the BR/EDR Con- troller to enter the Periodic Inquiry Mode that performs an automatic Inquiry. Max_Period_Duration and Min_Period_Duration define the time range between two consecutive inquiries, from the beginning of an inquiry until the start of the next inquiry. The BR/EDR Controller shall use this range to determine a new random time between two consecutive inquiries for each Inquiry. The LAP input parameter contains the LAP from which the inquiry access code shall be derived when the inquiry procedure is made. The Inquiry_Duration parameter specifies the total duration of the Inquiry Mode and, when time expires, Inquiry will be halted. The Num_Responses parameter specifies the number of responses that can be received before the Inquiry is halted. This command is completed when the Inquiry process has been started by the BR/EDR Control- ler, and a Command Complete event is sent from the Controller to the Host. When each of the periodic Inquiry processes are completed, the Controller will send an Inquiry Complete event to the Host indicating that the latest periodic Inquiry process has finished. When a BR/EDR Controller responds to the Inquiry message an Inquiry Result event will occur to notify the Host of the dis- covery.
///
/// - Note: Max_Period_Duration > Min_Period_Duration > Inquiry_Duration
///
/// A device which responds during an inquiry or inquiry period should always be reported to the Host in an Inquiry Result event if the device has not been reported earlier during the current inquiry or inquiry period and the device has not been filtered out using the command Set_Event_Filter. If the device has been reported earlier during the current inquiry or inquiry period, it may or may not be reported depending on the implementation (depending on if earlier results have been saved in the BR/EDR Controller and in that case how many responses that have been saved). It is recommended that the BR/EDR Con- troller tries to report a particular device only once during an inquiry or inquiry period.
@frozen
public struct HCIPeriodicInquiryMode: HCICommandParameter {
    
    public static let command = LinkControlCommand.periodicInquiry
    
    internal static let length = 2 + 2 + 3 + 1 + 1
    
    /// Minimum amount of time specified between consecutive inquiries. Size: 2 octets
    /// Range: 0x02 – 0xFFFE
    /// Time = N * 1.28 sec
    /// Range: 2.56 – 83883.52 Sec 0.0 – 23.3 hours
    public var minDuration: MinDuration
    
    /// Maximum amount of time specified between consecutive inquiries. Size: 2 octets
    /// Range: 0x03 – 0xFFFF
    /// Time = N * 1.28 sec
    /// Range: 3.84 – 83884.8 Sec 0.0 – 23.3 hours
    public var maxDuration: MaxDuration
    
    /// This is the LAP from which the inquiry access code should be derived when the inquiry procedure is made
    public var lap: LAP
    
    /// Maximum amount of time specified before the Inquiry is halted. Size: 1 octet
    /// Range: 0x01 – 0x30
    /// Time = N * 1.28 sec
    /// Range: 1.28 – 61.44 Sec
    public var length: Duration
    
    /// Maximum number of responses from the Inquiry before the Inquiry is halted.
    /// Range: 0x01 – 0xFF
    public var responses: Responses
    
    public init(maxDuration: MaxDuration,
                minDuration: MinDuration,
                lap: LAP,
                length: Duration,
                responses: Responses) {
        
        self.maxDuration = maxDuration
        self.minDuration = minDuration
        self.lap = lap
        self.length = length
        self.responses = responses
    }
    
    public var data: Data {
        
        let minDurationBytes = minDuration.rawValue.littleEndian.bytes
        
        let maxDurationBytes = maxDuration.rawValue.littleEndian.bytes
        
        let lapBytes = lap.rawValue.littleEndian.bytes
        
        return Data([
            maxDurationBytes.0, maxDurationBytes.1,
            minDurationBytes.0, minDurationBytes.1,
            lapBytes.0, lapBytes.1, lapBytes.2,
            length.rawValue,
            responses.rawValue])
    }
}

public extension HCIPeriodicInquiryMode {
    
    /// This is the LAP from which the inquiry access code should be derived when the inquiry procedure is made
    struct LAP: RawRepresentable {
        
        public static let min = LAP(0x9E8B00)
        
        public static let max = LAP(0x9E8B3F)
        
        public let rawValue: UInt24
        
        public init?(rawValue: UInt24) {
            
            guard rawValue <= LAP.max.rawValue,
                rawValue >= LAP.min.rawValue
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
    struct MinDuration: RawRepresentable {
        
        public static let min = MinDuration(0x0002)
        
        public static let max = MinDuration(0xFFFE)
        
        public let rawValue: UInt16
        
        /// Time = N * 1.28 sec
        /// Range: 2.56 – 83883.52 Sec 0.0 – 23.3 hours
        public var seconds: Double {
            
            return Double(rawValue) * 1.28
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= MinDuration.max.rawValue, rawValue >= MinDuration.min.rawValue
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
    struct MaxDuration: RawRepresentable {
        
        public static let min = MaxDuration(0x0003)
        
        public static let max = MaxDuration(0xFFFF)
        
        public let rawValue: UInt16
        
        /// Time = N * 1.28 sec
        /// Range: 3.84 – 83884.8 Sec 0.0 – 23.3 hours
        public var seconds: Double {
            
            return Double(rawValue) * 1.28
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= MaxDuration.max.rawValue,
                rawValue >= MaxDuration.min.rawValue
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
    struct Duration: RawRepresentable {
        
        public static let min = Duration(0x01)
        
        public static let max = Duration(0x30)
        
        public let rawValue: UInt8
        
        /// Time = N * 1.28 sec
        /// Range: 1.28 – 61.44 Sec
        public var seconds: Double {
            
            return Double(rawValue) * 1.28
        }
        
        public init?(rawValue: UInt8) {
            
            guard rawValue <= Duration.max.rawValue,
                rawValue >= Duration.min.rawValue
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
    struct Responses: RawRepresentable {
        
        public static let min = Responses(0x01)
        
        public static let max = Responses(0xFF)
        
        public static let unlimited = Responses(0x00)
        
        public let rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}
