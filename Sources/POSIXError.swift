//
//  POSIXError.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/22/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import Foundation

internal extension POSIXError {
    
    /// Creates error from C ```errno```.
    static var fromErrno: POSIXError? {
        
        let errorCode = errno
        
        #if canImport(Darwin)
        guard let code = POSIXError.Code(rawValue: POSIXError.Code.RawValue(errorCode))
            else { return nil }
        
        return self.init(code)
        #else
        guard errorCode != 0
            else { return nil }
        
        self.init(errorCode)
        #endif
    }
    
    /// Initializes `POSIXError` from error code.
    init(_ errorCode: Int32) {
        
        var userInfo = [String: Any](minimumCapacity: 1)
        
        if let description = String(cString: strerror(errorCode), encoding: .ascii) {
            userInfo[NSLocalizedDescriptionKey] = description
        }
        
        let nsError = NSError(
            domain: NSPOSIXErrorDomain,
            code: Int(errorCode),
            userInfo: userInfo)
        
        self.init(_nsError: nsError)
    }
}
