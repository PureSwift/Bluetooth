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
    
    /// Get the byte at the specified index.
    public subscript (index: Int) -> UInt8 {
        
        get {
            
            switch index {
            case 0: return bytes.0
            case 1: return bytes.1
            case 2: return bytes.2
            case 3: return bytes.3
            case 4: return bytes.4
            case 5: return bytes.5
            case 6: return bytes.6
            case 7: return bytes.7
            case 8: return bytes.8
            case 9: return bytes.9
            case 10: return bytes.10
            case 11: return bytes.11
            case 12: return bytes.12
            case 13: return bytes.13
            case 14: return bytes.14
            case 15: return bytes.15
            case 16: return bytes.16
            case 17: return bytes.17
            case 18: return bytes.18
            case 19: return bytes.19
            case 20: return bytes.20
            case 21: return bytes.21
            case 22: return bytes.22
            case 23: return bytes.23
            case 24: return bytes.24
            case 25: return bytes.25
            case 26: return bytes.26
            case 27: return bytes.27
            case 28: return bytes.28
            case 29: return bytes.29
            case 30: return bytes.30
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
            case 0: bytes.0 = newValue
            case 1: bytes.1 = newValue
            case 2: bytes.2 = newValue
            case 3: bytes.3 = newValue
            case 4: bytes.4 = newValue
            case 5: bytes.5 = newValue
            case 6: bytes.6 = newValue
            case 7: bytes.7 = newValue
            case 8: bytes.8 = newValue
            case 9: bytes.9 = newValue
            case 10: bytes.10 = newValue
            case 11: bytes.11 = newValue
            case 12: bytes.12 = newValue
            case 13: bytes.13 = newValue
            case 14: bytes.14 = newValue
            case 15: bytes.15 = newValue
            case 16: bytes.16 = newValue
            case 17: bytes.17 = newValue
            case 18: bytes.18 = newValue
            case 19: bytes.19 = newValue
            case 20: bytes.20 = newValue
            case 21: bytes.21 = newValue
            case 22: bytes.22 = newValue
            case 23: bytes.23 = newValue
            case 24: bytes.24 = newValue
            case 25: bytes.25 = newValue
            case 26: bytes.26 = newValue
            case 27: bytes.27 = newValue
            case 28: bytes.28 = newValue
            case 29: bytes.29 = newValue
            case 30: bytes.30 = newValue
            default: fatalError("Invalid index \(index)")
            }
        }
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

// MARK: - ExpressibleByArrayLiteral

extension LowEnergyAdvertisingData: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt8...) {
        
        guard let value = LowEnergyAdvertisingData(data: Data(elements))
            else { fatalError("Invalid length \(elements.count)") }
        
        self = value
    }
}

// MARK: - Data Convertible

public extension LowEnergyAdvertisingData {
    
    public init?(data: Data) {
        
        let length = data.count
        
        guard length >= 0,
            length <= 31
            else { return nil }
        
        self.init(length: UInt8(length),
                  bytes: (length > 0 ? data[0] : 0,
                          length > 1 ? data[1] : 0,
                          length > 2 ? data[2] : 0,
                          length > 3 ? data[3] : 0,
                          length > 4 ? data[4] : 0,
                          length > 5 ? data[5] : 0,
                          length > 6 ? data[6] : 0,
                          length > 7 ? data[7] : 0,
                          length > 8 ? data[8] : 0,
                          length > 9 ? data[9] : 0,
                          length > 10 ? data[10] : 0,
                          length > 11 ? data[11] : 0,
                          length > 12 ? data[12] : 0,
                          length > 13 ? data[13] : 0,
                          length > 14 ? data[14] : 0,
                          length > 15 ? data[15] : 0,
                          length > 16 ? data[16] : 0,
                          length > 17 ? data[17] : 0,
                          length > 18 ? data[18] : 0,
                          length > 19 ? data[19] : 0,
                          length > 20 ? data[20] : 0,
                          length > 21 ? data[21] : 0,
                          length > 22 ? data[22] : 0,
                          length > 23 ? data[23] : 0,
                          length > 24 ? data[24] : 0,
                          length > 25 ? data[25] : 0,
                          length > 26 ? data[26] : 0,
                          length > 27 ? data[27] : 0,
                          length > 28 ? data[28] : 0,
                          length > 29 ? data[29] : 0,
                          length > 30 ? data[30] : 0)
        )
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - Collection

extension LowEnergyAdvertisingData: Collection {
    
    public var count: Int {
        
        return Int(length)
    }
    
    public func index(after index: Int) -> Int {
        
        return index + 1
    }
    
    public var startIndex: Int {
        
        return 0
    }
    
    public var endIndex: Int {
        
        return count
    }
}

// MARK: - RandomAccessCollection

#if swift(>=3.3)
#elseif swift(>=3.0)
public extension LowEnergyAdvertisingData {

    public typealias Slice = Swift.RandomAccessSlice
}
#endif

#if swift(>=3.1)
extension LowEnergyAdvertisingData: RandomAccessCollection {
    
    public subscript(bounds: Range<Int>) -> Slice<LowEnergyAdvertisingData> {
        
        return Slice<LowEnergyAdvertisingData>(base: self, bounds: bounds)
    }
    
    public func makeIterator() -> IndexingIterator<LowEnergyAdvertisingData> {
        
        return IndexingIterator(_elements: self)
    }
}
#endif
