//
//  GAPURI.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 GAP URI
 */
@frozen
public struct GAPURI: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .uri
    
    public var uri: URL
    
    public init(uri: URL) {
        
        self.uri = uri
    }
}

public extension GAPURI {
    
    init?(data: Data) {
        
        guard let string = String(data: data, encoding: .utf8),
            let uri = URL(string: string)
            else { return nil }
        
        self.uri = uri
    }
    
    func append(to data: inout Data) {
        
        data += uri.absoluteString.utf8
    }
    
    var dataLength: Int {
        
        return uri.absoluteString.utf8.count
    }
}

// MARK: - CustomStringConvertible

extension GAPURI: CustomStringConvertible {
    
    public var description: String {
        
        return uri.absoluteString
    }
}
