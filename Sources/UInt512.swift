//
//  UInt512.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// A 512 bit number stored according to host endianness.
public struct UInt512: ByteValue {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { return 512 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)) {
        
        self.bytes = bytes
    }
}

public extension UInt512 {
    
    /// The minimum representable value in this type.
    public static var min: UInt512 { return UInt512(bytes: (.min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    public static var max: UInt512 { return UInt512(bytes: (.max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max)) }
    
    /// The value with all bits set to zero.
    public static var zero: UInt512 { return .min }
}

// MARK: - Equatable

extension UInt512: Equatable {
    
    public static func == (lhs: UInt512, rhs: UInt512) -> Bool {
        
        return lhs.bytes.0 == rhs.bytes.0 && lhs.bytes.1 == rhs.bytes.1 &&
            lhs.bytes.2 == rhs.bytes.2 && lhs.bytes.3 == rhs.bytes.3 &&
            lhs.bytes.4 == rhs.bytes.4 && lhs.bytes.5 == rhs.bytes.5 &&
            lhs.bytes.6 == rhs.bytes.6 && lhs.bytes.7 == rhs.bytes.7 &&
            lhs.bytes.8 == rhs.bytes.8 && lhs.bytes.9 == rhs.bytes.9 &&
            lhs.bytes.10 == rhs.bytes.10 && lhs.bytes.11 == rhs.bytes.11 &&
            lhs.bytes.12 == rhs.bytes.12 && lhs.bytes.13 == rhs.bytes.13 &&
            lhs.bytes.14 == rhs.bytes.14 && lhs.bytes.15 == rhs.bytes.15 &&
            lhs.bytes.16 == rhs.bytes.16 && lhs.bytes.17 == rhs.bytes.17 &&
            lhs.bytes.18 == rhs.bytes.18 && lhs.bytes.19 == rhs.bytes.19 &&
            lhs.bytes.20 == rhs.bytes.20 && lhs.bytes.21 == rhs.bytes.21 &&
            lhs.bytes.22 == rhs.bytes.22 && lhs.bytes.23 == rhs.bytes.23 &&
            lhs.bytes.24 == rhs.bytes.24 && lhs.bytes.25 == rhs.bytes.25 &&
            lhs.bytes.26 == rhs.bytes.26 && lhs.bytes.27 == rhs.bytes.27 &&
            lhs.bytes.28 == rhs.bytes.28 && lhs.bytes.29 == rhs.bytes.29 &&
            lhs.bytes.30 == rhs.bytes.30 && lhs.bytes.31 == rhs.bytes.31 &&
            lhs.bytes.32 == rhs.bytes.32 && lhs.bytes.33 == rhs.bytes.33 &&
            lhs.bytes.34 == rhs.bytes.34 && lhs.bytes.35 == rhs.bytes.35 &&
            lhs.bytes.36 == rhs.bytes.36 && lhs.bytes.37 == rhs.bytes.37 &&
            lhs.bytes.38 == rhs.bytes.38 && lhs.bytes.39 == rhs.bytes.39 &&
            lhs.bytes.40 == rhs.bytes.40 && lhs.bytes.41 == rhs.bytes.41 &&
            lhs.bytes.42 == rhs.bytes.42 && lhs.bytes.43 == rhs.bytes.43 &&
            lhs.bytes.44 == rhs.bytes.44 && lhs.bytes.45 == rhs.bytes.45 &&
            lhs.bytes.46 == rhs.bytes.46 && lhs.bytes.47 == rhs.bytes.47 &&
            lhs.bytes.48 == rhs.bytes.48 && lhs.bytes.49 == rhs.bytes.49 &&
            lhs.bytes.50 == rhs.bytes.50 && lhs.bytes.51 == rhs.bytes.51 &&
            lhs.bytes.52 == rhs.bytes.52 && lhs.bytes.53 == rhs.bytes.53 &&
            lhs.bytes.54 == rhs.bytes.54 && lhs.bytes.55 == rhs.bytes.55 &&
            lhs.bytes.56 == rhs.bytes.56 && lhs.bytes.57 == rhs.bytes.57 &&
            lhs.bytes.58 == rhs.bytes.58 && lhs.bytes.59 == rhs.bytes.59 &&
            lhs.bytes.60 == rhs.bytes.60 && lhs.bytes.61 == rhs.bytes.61 &&
            lhs.bytes.62 == rhs.bytes.62 && lhs.bytes.63 == rhs.bytes.63
    }
}

// MARK: - Hashable

extension UInt512: Hashable {
    
    public var hashValue: Int {
        
        return data.hashValue
    }
}

// MARK: - CustomStringConvertible

extension UInt512: CustomStringConvertible {
    
    public var description: String {
        
        let bytes = self.bigEndian.bytes
        
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal()
            + bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal()
            + bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal()
            + bytes.8.toHexadecimal()
            + bytes.9.toHexadecimal()
            + bytes.10.toHexadecimal()
            + bytes.11.toHexadecimal()
            + bytes.12.toHexadecimal()
            + bytes.13.toHexadecimal()
            + bytes.14.toHexadecimal()
            + bytes.15.toHexadecimal()
            + bytes.16.toHexadecimal()
            + bytes.17.toHexadecimal()
            + bytes.18.toHexadecimal()
            + bytes.19.toHexadecimal()
            + bytes.20.toHexadecimal()
            + bytes.21.toHexadecimal()
            + bytes.22.toHexadecimal()
            + bytes.23.toHexadecimal()
            + bytes.24.toHexadecimal()
            + bytes.25.toHexadecimal()
            + bytes.26.toHexadecimal()
            + bytes.27.toHexadecimal()
            + bytes.28.toHexadecimal()
            + bytes.29.toHexadecimal()
            + bytes.30.toHexadecimal()
            + bytes.31.toHexadecimal()
            + bytes.32.toHexadecimal()
            + bytes.33.toHexadecimal()
            + bytes.34.toHexadecimal()
            + bytes.35.toHexadecimal()
            + bytes.36.toHexadecimal()
            + bytes.37.toHexadecimal()
            + bytes.38.toHexadecimal()
            + bytes.39.toHexadecimal()
            + bytes.40.toHexadecimal()
            + bytes.41.toHexadecimal()
            + bytes.42.toHexadecimal()
            + bytes.43.toHexadecimal()
            + bytes.44.toHexadecimal()
            + bytes.45.toHexadecimal()
            + bytes.46.toHexadecimal()
            + bytes.47.toHexadecimal()
            + bytes.48.toHexadecimal()
            + bytes.49.toHexadecimal()
            + bytes.50.toHexadecimal()
            + bytes.51.toHexadecimal()
            + bytes.52.toHexadecimal()
            + bytes.53.toHexadecimal()
            + bytes.54.toHexadecimal()
            + bytes.55.toHexadecimal()
            + bytes.56.toHexadecimal()
            + bytes.57.toHexadecimal()
            + bytes.58.toHexadecimal()
            + bytes.59.toHexadecimal()
            + bytes.60.toHexadecimal()
            + bytes.61.toHexadecimal()
            + bytes.62.toHexadecimal()
            + bytes.63.toHexadecimal()
    }
}

// MARK: - Data Convertible

public extension UInt512 {
    
    public static var length: Int { return 64 }
    
    public init?(data: Data) {
        
        guard data.count == UInt128.length else { return nil }
        
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31], data[32], data[33], data[34], data[35], data[36], data[37], data[38], data[39], data[40], data[41], data[42], data[43], data[44], data[45], data[46], data[47], data[48], data[49], data[50], data[51], data[52], data[53], data[54], data[55], data[56], data[57], data[58], data[59], data[60], data[61], data[62], data[63]))
    }
    
    public var data: Data {
        
        return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15, bytes.16, bytes.17, bytes.18, bytes.19, bytes.20, bytes.21, bytes.22, bytes.23, bytes.24, bytes.25, bytes.26, bytes.27, bytes.28, bytes.29, bytes.30, bytes.31, bytes.32, bytes.33, bytes.34, bytes.35, bytes.36, bytes.37, bytes.38, bytes.39, bytes.40, bytes.41, bytes.42, bytes.43, bytes.44, bytes.45, bytes.46, bytes.47, bytes.48, bytes.49, bytes.50, bytes.51, bytes.52, bytes.53, bytes.54, bytes.55, bytes.56, bytes.57, bytes.58, bytes.59, bytes.60, bytes.61, bytes.62, bytes.63])
    }
}

// MARK: - Byte Swap

extension UInt512: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt512 {
        
        return UInt512(bytes: (bytes.63,
                               bytes.62,
                               bytes.61,
                               bytes.60,
                               bytes.59,
                               bytes.58,
                               bytes.57,
                               bytes.56,
                               bytes.55,
                               bytes.54,
                               bytes.53,
                               bytes.52,
                               bytes.51,
                               bytes.50,
                               bytes.49,
                               bytes.48,
                               bytes.47,
                               bytes.46,
                               bytes.45,
                               bytes.44,
                               bytes.43,
                               bytes.42,
                               bytes.41,
                               bytes.40,
                               bytes.39,
                               bytes.38,
                               bytes.37,
                               bytes.36,
                               bytes.35,
                               bytes.34,
                               bytes.33,
                               bytes.32,
                               bytes.31,
                               bytes.30,
                               bytes.29,
                               bytes.28,
                               bytes.27,
                               bytes.26,
                               bytes.25,
                               bytes.24,
                               bytes.23,
                               bytes.22,
                               bytes.21,
                               bytes.20,
                               bytes.19,
                               bytes.18,
                               bytes.17,
                               bytes.16,
                               bytes.15,
                               bytes.14,
                               bytes.13,
                               bytes.12,
                               bytes.11,
                               bytes.10,
                               bytes.9,
                               bytes.8,
                               bytes.7,
                               bytes.6,
                               bytes.5,
                               bytes.4,
                               bytes.3,
                               bytes.2,
                               bytes.1,
                               bytes.0))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt512: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        
        let bytes = value.bigEndian.bytes
        
        self = UInt512(bigEndian: UInt512(bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
}
