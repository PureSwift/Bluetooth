//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/5/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation

internal extension UUID {
    
    static var length: Int { return 16 }
    static var stringLength: Int { return 36 }
    static var unformattedStringLength: Int { return 32 }
}

internal extension UUID { // ByteValue
    
    typealias ByteValue = uuid_t
    
    static var bitWidth: Int { return 128 }
    
    @inline(__always)
    init(bytes: uuid_t) {
        
        self.init(uuid: bytes)
    }
    
    var bytes: uuid_t {
        
        @inline(__always)
        get { return uuid }
        
        @inline(__always)
        set { self = UUID(uuid: newValue) }
    }
}

internal extension UUID {
    
    init?(data: Data) {
        guard data.count == UUID.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
    
    var data: Data {
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
    }
}
#endif

internal extension UInt128 {
    
    /// Parse a UUID string.
    init?(uuidString string: String) {
        let separator: Character = "-"
        guard string.count == 36 else {
            return nil
        }
        guard string[string.index(string.startIndex, offsetBy: 8)] == separator,
              string[string.index(string.startIndex, offsetBy: 13)] == separator,
              string[string.index(string.startIndex, offsetBy: 18)] == separator,
              string[string.index(string.startIndex, offsetBy: 23)] == separator
            else { return nil }
        let a = string[string.startIndex ..< string.index(string.startIndex, offsetBy: 8)]
        let b = string[string.index(string.startIndex, offsetBy: 9) ..< string.index(string.startIndex, offsetBy: 13)]
        let c = string[string.index(string.startIndex, offsetBy: 14) ..< string.index(string.startIndex, offsetBy: 18)]
        let d = string[string.index(string.startIndex, offsetBy: 19) ..< string.index(string.startIndex, offsetBy: 23)]
        let e = string[string.index(string.startIndex, offsetBy: 24) ..< string.index(string.startIndex, offsetBy: 36)]
        let hexadecimal = (a + b + c + d + e)
        guard hexadecimal.count == 32,
              let bytes = [UInt8].init(hexadecimal: hexadecimal),
              let value = UInt128(bytes) else {
            return nil
        }
        self.init(bigEndian: value)
    }
    
    /// Generate UUID string, e.g. `0F4DD6A4-0F71-48EF-98A5-996301B868F9`.
    var uuidString: String {
        
        let bytes = self.bigEndian.bytes
        
        let a = (bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal())
            
        let b = (bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal())
        
        let c = (bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal())

        let d = (bytes.8.toHexadecimal()
            + bytes.9.toHexadecimal())

        let e = (bytes.10.toHexadecimal()
            + bytes.11.toHexadecimal()
            + bytes.12.toHexadecimal()
            + bytes.13.toHexadecimal()
            + bytes.14.toHexadecimal()
            + bytes.15.toHexadecimal())
        
        return a + "-" + b + "-" + c + "-" + d + "-" + e
    }
}
