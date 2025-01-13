//
//  String.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/4/24.
//

#if canImport(Darwin)
import Darwin
#endif

internal extension String {

    /// Initialize from UTF8 data.
    init?<Data: DataContainer>(utf8 data: Data) {
        #if canImport(Darwin)
        // Newer Darwin and other platforms use StdLib parsing
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            self.init(validating: data, as: UTF8.self)
        } else {
            // Older Darwin uses Foundation
            self.init(bytes: data, encoding: .utf8)
        }
        #else
        self.init(validating: data, as: UTF8.self)
        #endif
    }

    #if hasFeature(Embedded)
    // Can't use `CVarArg` in Embedded Swift
    init?(format: String, length: Int, _ value: UInt8) {
        var cString: [CChar] = .init(repeating: 0, count: length + 1)
        guard _snprintf_uint8_t(&cString, cString.count, format, value) >= 0 else {
            return nil
        }
        self.init(cString: cString)
    }
    #elseif canImport(Darwin)
    init?<T: CVarArg>(format: String, length: Int, _ value: T) {
        var cString: [CChar] = .init(repeating: 0, count: length + 1)
        guard snprintf(ptr: &cString, cString.count, format, value) >= 0 else {
            return nil
        }
        self.init(cString: cString)
    }
    #endif
}
