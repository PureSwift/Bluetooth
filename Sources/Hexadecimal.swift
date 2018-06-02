//
//  Hexadecimal.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

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
        
        let bytes = self.bigEndian.bytes
        
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
    }
}

internal extension UInt32 {
    
    func toHexadecimal() -> String {
        
        let bytes = self.bigEndian.bytes
        
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal()
    }
}

internal extension UInt64 {
    
    func toHexadecimal() -> String {
        
        let bytes = self.bigEndian.bytes
        
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal()
            + bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal()
            + bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal()
    }
}
