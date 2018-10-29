//
//  POSIXError.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/22/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import Foundation

public extension POSIXError {
    
    /// Creates error from C ```errno```.
    static var fromErrno: POSIXError? {
        
        guard let code = POSIXErrorCode(rawValue: errno)
            else { return nil }
        
        return self.init(code: code)
    }
    
    #if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
    
    /// Creates `POSIXError` from error code.
    init(code: POSIXErrorCode) {
        
        let nsError = NSError(domain: NSPOSIXErrorDomain,
                              code: Int(code.rawValue),
                              userInfo: nil)
        
        self.init(_nsError: nsError)
    }
    
    #endif
}

// MARK: - CustomStringConvertible

extension POSIXError: CustomStringConvertible {
    
    public var description: String {
        
        return String(cString: strerror(code.rawValue), encoding: .ascii) ?? "\(code)"
    }
}
