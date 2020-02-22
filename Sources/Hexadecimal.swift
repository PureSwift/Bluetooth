//
//  Hexadecimal.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if swift(>=5.0)
internal extension FixedWidthInteger {
    
    func toHexadecimal() -> String {
        
        var string = String(self, radix: 16)
        while string.utf8.count < (MemoryLayout<Self>.size * 2) {
            string = "0" + string
        }
        return string.uppercased()
    }
}
#else
internal extension UInt8 {
    
    func toHexadecimal() -> String {
        var string = String(self, radix: 16)
        if string.utf8.count == 1 {
            string = "0" + string
        }
        return string.uppercased()
    }
}

internal extension UInt16 {
    
    func toHexadecimal() -> String {
        var string = String(self, radix: 16)
        while string.utf8.count < (MemoryLayout<UInt16>.size * 2) {
            string = "0" + string
        }
        return string.uppercased()
    }
}

internal extension UInt32 {
    
    func toHexadecimal() -> String {
        var string = String(self, radix: 16)
        while string.utf8.count < (MemoryLayout<UInt32>.size * 2) {
            string = "0" + string
        }
        return string.uppercased()
    }
}

internal extension UInt64 {
    
    func toHexadecimal() -> String {
        var string = String(self, radix: 16)
        while string.utf8.count < (MemoryLayout<UInt64>.size * 2) {
            string = "0" + string
        }
        return string.uppercased()
    }
}
#endif
