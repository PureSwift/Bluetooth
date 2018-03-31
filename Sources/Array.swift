//
//  Array.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/31/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

internal extension Array {
    
    mutating func popFirst() -> Element? {
        
        guard let first = self.first else { return nil }
        
        self.removeFirst()
        
        return first
    }
}
