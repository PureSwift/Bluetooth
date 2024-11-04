//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/5/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import Foundation

internal extension UUID {
    
    init?(data: Data) {
        
        guard data.count == (UUID.bitWidth / 8) else { return nil }
        
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
    
    var data: Data {
        
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
    }
}
