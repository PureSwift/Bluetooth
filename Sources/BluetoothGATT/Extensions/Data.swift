//
//  Data.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

internal extension DataContainer {
    
    @usableFromInline
    func suffixCheckingBounds(from start: Int) -> Self {
        
        if count > start {
            return Self(suffix(from: start))
        } else {
            return Self()
        }
    }
}
