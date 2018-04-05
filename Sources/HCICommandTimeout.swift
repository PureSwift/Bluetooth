//
//  HCICommandTimeout.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/31/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The duration of an HCI command.
public struct HCICommandTimeout: RawRepresentable {
    
    /// The duration of the timeout in miliseconds.
    public var rawValue: UInt
    
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    /// Default timeout of HCI commands in miliseconds.
    public static let `default`: HCICommandTimeout = 1000
}

public extension HCICommandTimeout {
    
    /// Duration in seconds.
    var duration: TimeInterval {
        
        return TimeInterval(rawValue) / 1000.0
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension HCICommandTimeout: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt) {
        
        self.init(rawValue: value)
    }
}

// MARK: - Equatable

extension HCICommandTimeout: Equatable {
    
    public static func == (lhs: HCICommandTimeout, rhs: HCICommandTimeout) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: - Hashable

extension HCICommandTimeout: Hashable {
    
    public var hashValue: Int {
        
        return rawValue.hashValue
    }
}

// MARK: - CustomStringConvertible

extension HCICommandTimeout: CustomStringConvertible {
    
    public var description: String {
        
        return "\(duration) seconds"
    }
}
