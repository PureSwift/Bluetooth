//
//  UnitIdentifier.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

@frozen
public struct UnitIdentifier: RawRepresentable, Equatable, Hashable, Sendable {

    public var rawValue: UInt16

    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UnitIdentifier: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - CustomStringConvertible

extension UnitIdentifier: CustomStringConvertible {

    public var description: String {
        #if canImport(Foundation) && canImport(BluetoothMetadata) && !os(WASI) && !hasFeature(Embedded)
        return self.name ?? rawValueDescription
        #else
        return rawValueDescription
        #endif
    }

    internal var rawValueDescription: String {
        "0x" + rawValue.toHexadecimal()
    }
}
