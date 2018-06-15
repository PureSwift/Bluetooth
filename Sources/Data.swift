//
//  Data.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

#if swift(>=3.1)
#elseif swift(>=3.0)
internal extension Data {
    
    static func += (data: inout Data, bytes: [UInt8]) {
        
        data.append(contentsOf: bytes)
    }
    
    static func += (rhs: inout Data, lhs: Data) {
        
        rhs.append(lhs)
    }
}
#endif
