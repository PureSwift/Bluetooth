//
//  DataContainer.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/4/24.
//

#if canImport(Foundation)
import Foundation
#endif

/// Data container type.
public protocol DataContainer: RandomAccessCollection where Self.Index == Int, Self.Element == UInt8, Self: Hashable {
    
    init()
    
    init<C: Collection> (_ collection: C) where C.Element == UInt8
    
    mutating func reserveCapacity(_ capacity: Int)
    
    subscript(index: Int) -> UInt8 { get }
        
    mutating func append(_ newElement: UInt8)
    
    mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int)
    
    mutating func append <C: Collection> (contentsOf bytes: C) where C.Element == UInt8
    
    static func += (lhs: inout Self, rhs: UInt8)
    
    static func += <C: Collection> (lhs: inout Self, rhs: C) where C.Element == UInt8
    
    /// Return a new copy of the data in a specified range.
    ///
    /// - parameter range: The range to copy.
    func subdata(in range: Range<Index>) -> Self
}

#if canImport(Foundation)
extension Data: DataContainer {
    
    public static func += (lhs: inout Data, rhs: UInt8) {
        lhs.append(rhs)
    }
}
#endif

extension LowEnergyAdvertisingData: DataContainer {
    
    public mutating func reserveCapacity(_ capacity: Int) {
        // does nothing
    }
    
    public func subdata(in range: Range<Int>) -> LowEnergyAdvertisingData {
        var data = LowEnergyAdvertisingData()
        for (newIndex, oldIndex) in range.enumerated() {
            data[newIndex] = self[oldIndex]
        }
        return data
    }
}

extension Array: DataContainer where Self.Element == UInt8 {
    
    public static func += (lhs: inout Array<Element>, rhs: UInt8) {
        lhs.append(rhs)
    }
    
    public mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int) {
        let newCapacity = self.count + count
        self.reserveCapacity(newCapacity)
        for index in 0 ..< count {
            self.append(pointer[index])
        }
    }
    
    public func subdata(in range: Range<Int>) -> [UInt8] {
        .init(self[range])
    }
}
