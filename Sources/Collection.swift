//
//  Collection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/14/19.
//  Copyright © 2019 PureSwift. All rights reserved.
//

#if swift(>=5.0)
#else
internal extension Collection {
    
    @inline(__always)
    func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Index? {
        return try index(where: predicate)
    }
}
#endif
