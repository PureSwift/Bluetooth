//
//  Data.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

internal extension Data {
    
    @usableFromInline
    func subdataNoCopy(in range: Range<Int>) -> Data {
        
        // stored in heap, can reuse buffer
        if count > Data.inlineBufferSize {
            
            return withUnsafeBytes { (buffer: UnsafeRawBufferPointer) in
                Data(bytesNoCopy: UnsafeMutableRawPointer(mutating: buffer.baseAddress!.advanced(by: range.lowerBound)),
                     count: range.count,
                     deallocator: .none)
            }
            
        } else {
            
            // stored in stack, must copy
            return subdata(in: range)
        }
    }
    
    @usableFromInline
    func withUnsafeBytes <Result> (in range: Range<Int>, _ block: ((UnsafeRawBufferPointer) throws -> Result)) rethrows -> Result {
        
        return try withUnsafeBytes {
            return try block(UnsafeRawBufferPointer(rebasing: $0[range]))
        }
    }
    
    @usableFromInline
    func suffixNoCopy(from index: Int) -> Data {
        return subdataNoCopy(in: index ..< count)
    }
}

internal extension Data {
    
    /// Size of the inline buffer for `Foundation.Data` used in Swift 5.
    ///
    /// Used to determine wheather data is stored on stack or in heap.
    @usableFromInline
    static var inlineBufferSize: Int {
        
        // Keep up to date
        // https://github.com/apple/swift/blob/aa3e5904f8ba8bf9ae06d96946774d171074f6e5/stdlib/public/Darwin/Foundation/Data.swift#L656
        // https://github.com/apple/swift-corelibs-foundation/blob/76068b8caf54f250a7be5336a7c6bb97f55469f8/Sources/Foundation/Data.swift#L649
        #if arch(x86_64) || arch(arm64) || arch(s390x) || arch(powerpc64) || arch(powerpc64le)
        typealias Buffer = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8,
                            UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) //len  //enum
        #elseif arch(i386) || arch(arm)
        typealias Buffer = (UInt8, UInt8, UInt8, UInt8,
                            UInt8, UInt8) //len  //enum
        #elseif os(watchOS) // arm64_32
        typealias Buffer = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8,
                            UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) //len  //enum
        #else
        #error("This architecture isn't known. Add it to the 32-bit or 64-bit line.")
        #endif
        
        return MemoryLayout<Buffer>.size
    }
}
