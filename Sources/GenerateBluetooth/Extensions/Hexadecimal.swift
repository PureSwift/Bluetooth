//
//  Hexadecimal.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

internal extension FixedWidthInteger {

    func toHexadecimal() -> String {

        var string = String(self, radix: 16)
        while string.utf8.count < (MemoryLayout<Self>.size * 2) {
            string = "0" + string
        }
        return string.uppercased()
    }
}
