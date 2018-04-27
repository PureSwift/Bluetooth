//
//  LowEnergyAdvertisingData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth Low Energy Advertising Data.
///
/// ![Image](https://github.com/PureSwift/Bluetooth/raw/master/Assets/LowEnergyAdvertisingDataExample1.png)
public struct LowEnergyAdvertisingData {
    
    // MARK: - ByteValue
    
    /// Raw Bluetooth Low Energy Advertising Data 31 byte value.
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    // MARK: - Properties
    
    public var length: UInt8 {
        
        didSet { precondition(length <= 31, "LE Advertising Data can only less than or equal to 31 octets") }
    }
    
    public var bytes: ByteValue
    
    // MARK: - Initialization
    
    public init(length: UInt8, bytes: ByteValue) {
        
        precondition(length <= 31, "LE Advertising Data can only less than or equal to 31 octets")
        
        self.bytes = bytes
        self.length = length
    }
    
    public init() {
        
        self.length = 0
        self.bytes = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    }
}

// MARK: - Equatable

extension LowEnergyAdvertisingData: Equatable {
    
    public static func == (lhs: LowEnergyAdvertisingData, rhs: LowEnergyAdvertisingData) -> Bool {
        
        return lhs.length == rhs.length &&
            lhs.bytes.0 == rhs.bytes.0 &&
            lhs.bytes.1 == rhs.bytes.1 &&
            lhs.bytes.2 == rhs.bytes.2 &&
            lhs.bytes.3 == rhs.bytes.3 &&
            lhs.bytes.4 == rhs.bytes.4 &&
            lhs.bytes.5 == rhs.bytes.5 &&
            lhs.bytes.6 == rhs.bytes.6 &&
            lhs.bytes.7 == rhs.bytes.7 &&
            lhs.bytes.8 == rhs.bytes.8 &&
            lhs.bytes.9 == rhs.bytes.9 &&
            lhs.bytes.10 == rhs.bytes.10 &&
            lhs.bytes.11 == rhs.bytes.11 &&
            lhs.bytes.12 == rhs.bytes.12 &&
            lhs.bytes.13 == rhs.bytes.13 &&
            lhs.bytes.14 == rhs.bytes.14 &&
            lhs.bytes.15 == rhs.bytes.15 &&
            lhs.bytes.16 == rhs.bytes.16 &&
            lhs.bytes.17 == rhs.bytes.17 &&
            lhs.bytes.18 == rhs.bytes.18 &&
            lhs.bytes.19 == rhs.bytes.19 &&
            lhs.bytes.20 == rhs.bytes.20 &&
            lhs.bytes.21 == rhs.bytes.21 &&
            lhs.bytes.22 == rhs.bytes.22 &&
            lhs.bytes.23 == rhs.bytes.23 &&
            lhs.bytes.24 == rhs.bytes.24 &&
            lhs.bytes.25 == rhs.bytes.25 &&
            lhs.bytes.26 == rhs.bytes.26 &&
            lhs.bytes.27 == rhs.bytes.27 &&
            lhs.bytes.28 == rhs.bytes.28 &&
            lhs.bytes.29 == rhs.bytes.29 &&
            lhs.bytes.30 == rhs.bytes.30
    }
}

// MARK: - Hashable

extension LowEnergyAdvertisingData: Hashable {
    
    public var hashValue: Int {
        
        return data.hashValue
    }
}

// MARK: - Data Convertible

public extension LowEnergyAdvertisingData {
    
    public init?(data: Data) {
        
        guard data.count == 32 else { return nil }
        
        self.init(length: data[0], bytes: (data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31]))
    }
    
    public var data: Data {
        
        return Data([length, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15, bytes.16, bytes.17, bytes.18, bytes.19, bytes.20, bytes.21, bytes.22, bytes.23, bytes.24, bytes.25, bytes.26, bytes.27, bytes.28, bytes.29, bytes.30])
    }
}
