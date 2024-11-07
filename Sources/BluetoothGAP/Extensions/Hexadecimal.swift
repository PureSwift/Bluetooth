//
//  Hexadecimal.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

internal extension FixedWidthInteger {
    
    func toHexadecimal() -> String {
        let length = MemoryLayout<Self>.size * 2
        var string: String
        #if hasFeature(Embedded) || (canImport(Darwin) && DEBUG)
        string = ""
        string.reserveCapacity(length)
        self.bigEndian.bytes.forEach { byte in
            string.append(String(format: "%02X", length: 2, byte)!)
        }
        #else // Linux and non-Embedded release builds use Swift StdLib
        string = String(self, radix: 16, uppercase: true)
        // Add Zero padding
        while string.utf8.count < length {
            string = "0" + string
        }
        #endif
        assert(string.utf8.count == length)
        #if !hasFeature(Embedded)
        assert(string == string.uppercased(), "String should be uppercased")
        #endif
        return string
    }
}

internal extension Collection where Element: FixedWidthInteger {
    
    func toHexadecimal() -> String {
        let length = count * MemoryLayout<Element>.size * 2
        var string = ""
        string.reserveCapacity(length)
        string = reduce(into: string) { $0 += $1.toHexadecimal() }
        assert(string.utf8.count == length)
        return string
    }
}

internal extension FixedWidthInteger {
    
    init?<S: StringProtocol>(parse string: S, radix: Self) {
        #if !hasFeature(Embedded)
        let string = string.uppercased()
        #endif
        self.init(utf8: string.utf8, radix: radix)
    }
    
    init?<S: StringProtocol>(hexadecimal string: S) {
        guard string.utf8.count == MemoryLayout<Self>.size * 2 else {
            return nil
        }
        #if hasFeature(Embedded) || DEBUG
        guard let value = Self(parse: string, radix: 16) else {
            return nil
        }
        self.init(value)
        #else
        self.init(string, radix: 16)
        #endif
    }
    
    init?<C>(hexadecimal utf8: C) where C: Collection, C.Element == UInt8 {
        guard utf8.count == MemoryLayout<Self>.size * 2 else {
            return nil
        }
        guard let value = Self(utf8: utf8, radix: 16) else {
            return nil
        }
        self.init(value)
    }
    
    /// Expects uppercase UTF8 data.
    init?<C>(utf8: C, radix: Self) where C: Collection, C.Element == UInt8 {
        #if !hasFeature(Embedded) && DEBUG
        assert(String(decoding: utf8, as: UTF8.self) == String(decoding: utf8, as: UTF8.self).uppercased(), "Expected uppercase string")
        #endif
        let digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".utf8
        var result = Self(0)
        for character in utf8 {
            if let stringIndex = digits.enumerated().first(where: { $0.element == character })?.offset {
                let val = Self(stringIndex)
                if val >= radix {
                    return nil
                }
                result = result * radix + val
            } else {
                return nil
            }
        }
        self = result
    }
}
