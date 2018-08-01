//
//  ClassOfDevice.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/1/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct ClassOfDevice {
    
    internal static let length = 3
    
    public let formatType: UInt8
    
    public let majorServiceClass: BitMaskOptionSet<MajorServiceClass>
    
    public let majorDeviceClass: MajorDeviceClass
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.formatType = (data[0] << 6) >> 6
        
        let majorServiceValue = UInt16(littleEndian: UInt16(bytes: (data[1], data[2]))) >> 5
        
        self.majorServiceClass = BitMaskOptionSet<MajorServiceClass>(rawValue: majorServiceValue)
        
        guard let majorDeviceClassType = MajorDeviceClassType(rawValue: (data[1] << 3) >> 3)
            else { return nil }
        
        switch majorDeviceClassType {
            
        case .miscellaneous:
            self.majorDeviceClass = .miscellaneous
            
        case .computer:
            self.majorDeviceClass = .computer(Computer(rawValue: data[0] >> 2) ?? .uncathegorized)
            
        case .phone:
            self.majorDeviceClass = .phone(Phone(rawValue: data[0] >> 2) ?? .uncathegorized)
            
        case .lanNetwork:
            self.majorDeviceClass = .lanNetwork(NetworkAccessPoint(rawValue: data[0] >> 2) ?? .fullyAvailable)
            
        case .audioVideo:
            self.majorDeviceClass = .audioVideo(AudioVideo(rawValue: data[0] >> 2) ?? .uncathegorized)
            
        case .peripheral:
            self.majorDeviceClass = .peripheral(PeripheralKeyboardPointing(rawValue: data[0] >> 6) ?? .notKeyboard,
                                                PeripheralDevice(rawValue: (data[0] << 2) >> 4) ?? .uncathegorized)
            
        case .imaging:
            self.majorDeviceClass = .imaging(Imaging(rawValue: data[0] >> 4) ?? .uncathegorized)
            
        case .wearable:
            self.majorDeviceClass = .wearable(Wearable(rawValue: data[0] >> 2) ?? .uncathegorized)
            
        case .toy:
            self.majorDeviceClass = .toy(Toy(rawValue: data[0] >> 2) ?? .uncathegorized)
            
        case .health:
            self.majorDeviceClass = .health(Health(rawValue: data[0] >> 2) ?? .uncathegorized)
            
        case .uncathegorized:
            self.majorDeviceClass = .uncathegorized
        }
    }
}

public extension ClassOfDevice {
    
    public enum MajorServiceClass: UInt16, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        /// Limited Discoverable Mode [Ref #1]
        case limitedDiscoverable = 0b01
        
        /// Positioning (Location identification)
        case positioning = 0b1000
        
        /// Networking (LAN, Ad hoc, ...)
        case networking = 0b10000
        
        /// Rendering (Printing, Speakers, ...)
        case rendering = 0b100000
        
        /// Capturing (Scanner, Microphone, ...)
        case capturing = 0b1000000
        
        /// Object Transfer (v-Inbox, v-Folder, ...)
        case objectTransfer = 0b10000000
        
        /// Audio (Speaker, Microphone, Headset service, ...)
        case audio = 0b1_00000000
        
        /// Telephony (Cordless telephony, Modem, Headset service, ...)
        case telephony = 0b10_00000000
        
        /// Information (WEB-server, WAP-server, ...)
        case information = 0b100_00000000
        
        public static var all: Set<MajorServiceClass> = [
            .limitedDiscoverable,
            .positioning,
            .networking,
            .rendering,
            .capturing,
            .objectTransfer,
            .audio,
            .telephony,
            .information
        ]
    }
}

public extension ClassOfDevice {
    
    public enum MajorDeviceClass {
        
        /// Miscellaneous
        case miscellaneous
        
        /// Computer (desktop, notebook, PDA, organizer, ... )
        case computer(Computer)
        
        /// Phone (cellular, cordless, pay phone, modem, ...)
        case phone(Phone)
        
        /// Networking (LAN, Ad hoc, ...)
        case lanNetwork(NetworkAccessPoint)
        
        /// Audio/Video (headset, speaker, stereo, video display, VCR, ...
        case audioVideo(AudioVideo)
        
        /// Peripheral (mouse, joystick, keyboard, ... )
        case peripheral(PeripheralKeyboardPointing, PeripheralDevice)
        
        /// Imaging (printer, scanner, camera, display, ...)
        case imaging(Imaging)

        /// Wearable
        case wearable(Wearable)
        
        /// Toy
        case toy(Toy)
        
        /// Health
        case health(Health)
        
        /// Uncategorized: device code not specified
        case uncathegorized
    }
    
    public enum MajorDeviceClassType: UInt8 {
        
        /// Miscellaneous
        case miscellaneous = 0b00
        
        /// Computer (desktop, notebook, PDA, organizer, ... )
        case computer = 0b1
        
        /// Phone (cellular, cordless, pay phone, modem, ...)
        case phone = 0b10
        
        /// LAN /Network Access point
        case lanNetwork = 0b11

        /// Audio/Video (headset, speaker, stereo, video display, VCR, ...
        case audioVideo = 0b100

        /// Peripheral (mouse, joystick, keyboard, ... )
        case peripheral = 0b101

        /// Imaging (printer, scanner, camera, display, ...)
        case imaging = 0b110

        /// Wearable
        case wearable = 0b111

        /// Toy
        case toy = 0b1000

        /// Health
        case health = 0b1001

        /// Uncategorized: device code not specified
        case uncathegorized = 0b11111
    }
}

public extension ClassOfDevice {
    
    typealias Computer = MinorDeviceClass.Computer
    typealias Phone = MinorDeviceClass.Phone
    typealias NetworkAccessPoint = MinorDeviceClass.NetworkAccessPoint
    typealias AudioVideo = MinorDeviceClass.AudioVideo
    typealias PeripheralKeyboardPointing = MinorDeviceClass.PeripheralKeyboardPointing
    typealias PeripheralDevice = MinorDeviceClass.PeripheralDevice
    typealias Imaging = MinorDeviceClass.Imaging
    typealias Wearable = MinorDeviceClass.Wearable
    typealias Toy = MinorDeviceClass.Toy
    typealias Health = MinorDeviceClass.Health
    
    public enum MinorDeviceClass {}
}

public extension ClassOfDevice.MinorDeviceClass {
    
    public enum Computer: UInt8 {
        
        /// Uncathegorized
        case uncathegorized = 0b00
        
        /// Desktop workstation
        case desktopWorkstation = 0b01
        
        /// Server-class computer
        case serverClassComputer = 0b10
        
        /// Laptop
        case laptop = 0b11
        
        /// Handheld PC/PDA (clamshell)
        case handHeld = 0b100
        
        /// Palm-size PC/PDA
        case palmSize = 0b101
        
        /// Wearable computer (watch size)
        case wearable = 0b110
        
        // Tablet
        case tablet = 0b111
    }
}

public extension ClassOfDevice.MinorDeviceClass {

    public enum Phone: UInt8 {
        
        /// Uncategorized, code for device not assigned
        case uncathegorized = 0b00
        
        /// Cellular
        case celullar = 0b01
        
        /// Cordless
        case cordless = 0b10
        
        /// Smartphone
        case smartphone = 0b11
        
        /// Wired modem or voice gateway
        case wiredModem = 0b100
        
        /// Common ISDN access
        case commonISDNAccess = 0b101
    }
}

public extension ClassOfDevice.MinorDeviceClass {
    
    public enum NetworkAccessPoint: UInt8 {
        
        /// Fully available
        case fullyAvailable = 0b00
        
        /// 1% to 17% utilized
        case from1To17Used = 0b01
        
        /// 17% to 33% utilized
        case from17To33Used = 0b10
        
        /// 33% to 50% utilized
        case from33To50Used = 0b11
        
        /// 50% to 67% utilized
        case from50to67Used = 0b100
        
        /// 67% to 83% utilized
        case from67to83Used = 0b101
        
        /// 83% to 99% utilized
        case from83to99Used = 0b110
        
        /// No service available
        case noServiceAvailable = 0b111
    }
}

public extension ClassOfDevice.MinorDeviceClass {
    
    public enum AudioVideo: UInt8 {

        /// Uncategorized, code not assigned
        case uncathegorized = 0b00
        
        /// Wearable Headset Device
        case wearableHeadSet = 0b01
        
        /// Hands-free Device
        case handsFree = 0b10
        
        /// Microphone
        case microphone = 0b100
        
        /// Loudspeaker
        case loudspeaker = 0b101
        
        /// Headphones
        case headphones = 0b110
        
        /// Portable Audio
        case portableAudio = 0b111
        
        /// Car audio
        case carAudio = 0b1000
        
        /// Set-top box
        case setTopBox = 0b1001
        
        /// HiFi Audio Device
        case hifiAudio = 0b1010
        
        /// VCR
        case vcr = 0b1011
        
        /// Video Camera
        case videoCamera = 0b1100
        
        /// Camcorder
        case camcorder = 0b1101
        
        /// Video Monitor
        case videoMonitor = 0b1110
        
        /// Video Display and Loudspeaker
        case videoDisplayLoudspeaker = 0b1111
        
        /// Video Conferencing
        case videoConferencing = 0b10000
        
        /// Gaming/Toy
        case gamingToy = 0b10010
    }
}

public extension ClassOfDevice.MinorDeviceClass {
    
    public enum PeripheralKeyboardPointing: UInt8 {
        
        /// Not Keyboard / Not Pointing Device
        case notKeyboard = 0b00
        
        /// Keyboard
        case keyboard = 0b01
        
        /// Pointing device
        case pointingDevice = 0b10
        
        /// Combo keyboard/pointing device
        case comboKeyboardPointingDevice = 0b11
    }
    
    public enum PeripheralDevice: UInt8 {
        
        /// Uncategorized device
        case uncathegorized = 0b00
        
        /// Joystick
        case joystick = 0b01
        
        /// Gamepad
        case gamepad = 0b10
        
        /// Remote control
        case remoteControl = 0b11
        
        /// Sensing Device
        case sensingDevice = 0b100
        
        /// Digitizer Tablet
        case digitizerTablet = 0b101
        
        /// Card Reader (e.g. SIM Card Reader)
        case cardReader = 0b110
        
        /// Digital Pen
        case digitalPen = 0b111
        
        /// Handheld scanner for bar-codes, RFID, etc.
        case handheldScannerBarCodes = 0b1000
        
        /// Handheld gestural input device (e.g., "wand" form factor)
        case handheldGesturalInput = 0b1001
    }
}

public extension ClassOfDevice.MinorDeviceClass {

    public enum Imaging: UInt8 {
        
        /// Uncathegorized
        case uncathegorized = 0b00
        
        /// Display
        case display = 0b01
        
        /// Camera
        case camera = 0b10
        
        /// Scanner
        case scanner = 0b100
        
        /// Printer
        case printer = 0b1000
    }
}

public extension ClassOfDevice.MinorDeviceClass {
    
    public enum Wearable: UInt8 {
        
        /// Uncathegorized
        case uncathegorized = 0b00
        
        /// Wristwatch
        case wristwatch = 0b01
        
        /// Pager
        case pager = 0b10
        
        /// Jacket
        case jacket = 0b11
        
        /// Helmet
        case helmet = 0b100
        
        /// Glasses
        case glasses = 0b101
    }
}

public extension ClassOfDevice.MinorDeviceClass {
    
    public enum Toy: UInt8 {
        
        /// Uncathegorized
        case uncathegorized = 0b00
        
        /// Robot
        case robot = 0b01
        
        /// Vehicle
        case vehicle = 0b10
        
        /// Doll / Action figure
        case actionFigure = 0b11
        
        /// Controller
        case controller = 0b100
        
        /// Game
        case game = 0b101
    }
}

public extension ClassOfDevice.MinorDeviceClass {
    
    public enum Health: UInt8 {
        
        /// Uncathegorized
        case uncathegorized = 0b00
        
        /// Blood Pressure Monitor
        case bloodPressureMonitor = 0b01
        
        /// Thermometer
        case thermometer = 0b10
        
        /// Weighing Scale
        case weighingScale = 0b11
        
        /// Glucose Meter
        case glucoseMeter = 0b100
        
        /// Pulse Oximeter
        case pulseOximeter = 0b101
        
        /// Heart/Pulse Rate Monitor
        case heartRateMonitor = 0b110
        
        /// Health Data Display
        case healthDataDisplay = 0b111
        
        /// Step Counter
        case stepCounter = 0b1000
        
        /// Body Composition Analyzer
        case bodyCompositionAnalyzer = 0b1001
        
        /// Peak Flow Monitor
        case peakFlowMonitor = 0b1010
        
        /// Medication Monitor
        case medicationMonitor = 0b1011
        
        /// Knee Prosthesis
        case kneeProsthesis = 0b1100
        
        /// Ankle Prosthesis
        case ankleProsthesis = 0b1101
        
        /// Generic Health Manager
        case genericHealthManager = 0b1110
        
        /// Personal Mobility Device
        case personalMobilityDevice = 0b1111
    }
}
