//
//  Data.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

#if os(Linux)
internal extension Data {
    
    static func += (data: inout Data, bytes: [UInt8]) {
        
        data.append(contentsOf: bytes)
    }
}
#endif
