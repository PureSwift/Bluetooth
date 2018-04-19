//
//  XCTest.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import XCTest

// MARK: - XCTest Linux Support

#if swift(>=3.1)
#elseif swift(>=3.0)
public func XCTAssertNoThrow<T>(_ expression: @autoclosure () throws -> T,
                                _ message: @autoclosure () -> String = "",
                                file: StaticString = #file,
                                line: UInt = #line) {
    
    do { let _ = try expression() }
        
    catch {
        print("threw error \"\(error)\"")
        XCTFail(message(), file: file, line: line)
    }
}
#endif
