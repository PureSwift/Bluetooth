//
//  POSIXError.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/22/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import Foundation

#if canImport(MSVCRT)
import MSVCRT
import WinSDK
#elseif canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

internal extension POSIXError {
    
    /// Creates error from C ```errno```.
    static var fromErrno: POSIXError? {
        
        guard let code = POSIXErrorCode(rawValue: errno)
            else { return nil }
        
        return self.init(code)
    }
    
    /// Initializes `POSIXError` from an error code.
    init(_ errorCode: POSIXErrorCode) {
        
        var userInfo = [String: Any](minimumCapacity: 1)
        
        if let description = String(cString: strerror(errorCode.rawValue), encoding: .ascii) {
            userInfo[NSLocalizedDescriptionKey] = description
        }
        
        let nsError = NSError(
            domain: NSPOSIXErrorDomain,
            code: Int(errorCode.rawValue),
            userInfo: userInfo)
        
        self.init(_nsError: nsError)
    }
}
