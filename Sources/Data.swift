//
//  Data.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

internal extension Data {
    
    func subdataNoCopy(in range: CountableRange<Int>) -> Data {
        
        let pointer = withUnsafeBytes { UnsafeMutableRawPointer(mutating: $0).advanced(by: range.lowerBound) }
        
        return Data(bytesNoCopy: pointer, count: range.count, deallocator: .none)
    }
    
    func suffixNoCopy(from index: Int) -> Data {
        
        return subdataNoCopy(in: index ..< count)
    }
}
