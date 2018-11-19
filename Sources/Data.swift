//
//  Data.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

internal extension Data {
    
    #if swift(>=4.2)
    func subdataNoCopy(in range: Range<Int>) -> Data {
    
        let pointer = withUnsafeBytes { UnsafeMutableRawPointer(mutating: $0).advanced(by: range.lowerBound) }
        return Data(bytesNoCopy: pointer, count: range.count, deallocator: .none)
    }
    #else
    func subdataNoCopy(in range: CountableRange<Int>) -> Data {
        
        let pointer = withUnsafeBytes { UnsafeMutableRawPointer(mutating: $0).advanced(by: range.lowerBound) }
        return Data(bytesNoCopy: pointer, count: range.count, deallocator: .none)
    }
    
    func subdata(in range: CountableRange<Int>) -> Data {
        return Data(self[range])
    }
    #endif
    
    func suffixNoCopy(from index: Int) -> Data {
        
        return subdataNoCopy(in: index ..< count)
    }
}
