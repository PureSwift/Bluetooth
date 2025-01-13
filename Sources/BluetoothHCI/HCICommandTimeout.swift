//
//  HCICommandTimeout.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/31/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

/// The duration of an HCI command.
@frozen
public struct HCICommandTimeout: RawRepresentable, Equatable, Hashable, Sendable {

    /// The duration of the timeout in miliseconds.
    public var rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    /// Default timeout of HCI commands in miliseconds.
    public static var `default`: HCICommandTimeout { 1000 }
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

// MARK: - CustomStringConvertible

extension HCICommandTimeout: CustomStringConvertible {

    public var description: String {
        return "\(duration)s"
    }
}
