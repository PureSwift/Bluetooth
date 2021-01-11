//
//  Appearance.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/1/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// GAP Appearance
///
/// - SeeAlso: [org.bluetooth.characteristic.gap.appearance.xml](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.gap.appearance.xml)
@frozen
public struct GAPAppearance: RawRepresentable, Equatable, Hashable {
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
    
    public init(category: Category,
                subcategory: Subcategory = 0) {
        
        self.rawValue = category.rawValue << 6 + subcategory.rawValue
    }
    
    public var category: Category {
        
        // category is stored in the first 10 bits
        return Category(rawValue: rawValue >> 6)
    }
    
    public var subcategory: Subcategory {
        
        return Subcategory(rawValue: rawValue - (rawValue >> 6) << 6)
    }
}

extension GAPAppearance: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.rawValue = value
    }
}

public extension GAPAppearance {
    
    struct Category: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
}

extension GAPAppearance.Category: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.rawValue = value
    }
}

public extension GAPAppearance {
    
    struct Subcategory: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
}

extension GAPAppearance.Subcategory: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.rawValue = value
    }
}

// MARK: - Values

public extension GAPAppearance.Category {
    
    /// GAP Appearance Unknown category
    static var unknown: GAPAppearance.Category { return 0 }
    
    /// GAP Appearance Phone category
    static var phone: GAPAppearance.Category { return 1 }
    
    /// GAP Appearance Computer category
    static var computer: GAPAppearance.Category { return 2 }
    
    /// GAP Appearance Watch category
    static var watch: GAPAppearance.Category { return 3 }
    
    /// GAP Appearance Clock category
    static var clock: GAPAppearance.Category { return 4 }
    
    /// GAP Appearance Display category
    static var display: GAPAppearance.Category { return 5 }
    
    /// GAP Appearance RemoteControl category
    static var remoteControl: GAPAppearance.Category { return 6 }
}

public extension GAPAppearance {
    
    /// GAP Appearance Unknown
    enum Unknown {
        
        public static let category: GAPAppearance.Category = .unknown
        
        public static let unknown: GAPAppearance = 0
    }
    
    /// GAP Appearance Phone
    enum Phone {
        
        public static let category: GAPAppearance.Category = .phone
        
        public static let generic: GAPAppearance = 64
    }
    
    /// GAP Appearance Computer
    enum Computer {
        
        public static let category: GAPAppearance.Category = .computer
        
        public static let generic: GAPAppearance = 128
    }
    
    /// GAP Appearance Watch category namepace
    enum Watch {
        
        /// GAP Appearance Watch category
        public static let category: GAPAppearance.Category = .watch
        
        /// Generic Watch
        public static let generic: GAPAppearance = 192
        
        /// Watch: Sports Watch
        public static let sports: GAPAppearance = 193
    }
    
    /// GAP Appearance Clock category namepace
    enum Clock {
        
        public static let category: GAPAppearance.Category = .clock
        
        public static let generic: GAPAppearance = 256
    }
    
    enum Display {
        
        public static let category: GAPAppearance.Category = .display
        
        public static let generic: GAPAppearance = 320
    }
    
    enum RemoteControl {
        
        public static let category: GAPAppearance.Category = 6
        
        /// Generic Remote Control
        public static let generic: GAPAppearance = 384
    }
    
    enum EyeGlasses {
        
        public static let category: GAPAppearance.Category = 7
        
        public static let generic: GAPAppearance = 448
    }
    
    enum Tag {
        
        public static let category: GAPAppearance.Category = 8
        
        public static let generic: GAPAppearance = 512
    }
    
    enum Keyring {
        
        public static let category: GAPAppearance.Category = 9
        
        public static let generic: GAPAppearance = 576
    }
    
    enum MediaPlayer {
        
        public static let category: GAPAppearance.Category = 10
        
        public static let generic: GAPAppearance = 640
    }
    
    enum BarcodeScanner {
        
        public static let category: GAPAppearance.Category = 11
        
        public static let generic: GAPAppearance = 704
    }
    
    enum Thermometer {
        
        public static let category: GAPAppearance.Category = 12
        
        public static let generic: GAPAppearance = 768
    }
    
    enum HeartrateSensor {
        
        public static let category: GAPAppearance.Category = 13
        
        public static let generic: GAPAppearance = 832
    }
}

// TODO: Complete list of definitions
