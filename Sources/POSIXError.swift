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
        
        guard let code = POSIXError.Code(rawValue: POSIXError.Code.RawValue(errno))
            else { return nil }
        
        return self.init(code)
    }
}
