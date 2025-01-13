//
//  LowEnergyScanTimeInterval.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// LE Scan Time Interval
///
/// Range: 0x0004 to 0x4000
/// Time = N * 0.625 msec
/// Time Range: 2.5 msec to 10240 msec
@frozen
public struct LowEnergyScanTimeInterval: RawRepresentable, Equatable, Comparable, Hashable, Sendable {

    /// 2.5 msec
    public static var min: LowEnergyScanTimeInterval { LowEnergyScanTimeInterval(0x0004) }

    /// 10.24 seconds
    public static var max: LowEnergyScanTimeInterval { LowEnergyScanTimeInterval(0x4000) }

    public let rawValue: UInt16

    public init?(rawValue: UInt16) {

        guard rawValue >= LowEnergyScanTimeInterval.min.rawValue,
            rawValue <= LowEnergyScanTimeInterval.max.rawValue
        else { return nil }

        self.rawValue = rawValue
    }

    /// Time = N * 0.625 msec
    public var miliseconds: Double {

        return Double(rawValue) * 0.625
    }

    // Private, unsafe
    init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }

    // Comparable
    public static func < (lhs: LowEnergyScanTimeInterval, rhs: LowEnergyScanTimeInterval) -> Bool {

        return lhs.rawValue < rhs.rawValue
    }
}
