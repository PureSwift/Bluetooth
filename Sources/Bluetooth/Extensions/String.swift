//
//  String.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/4/24.
//

internal extension String {
    
    /// Initialize from UTF8 data.
    init?<Data: DataContainer>(utf8 data: Data) {
        #if hasFeature(Embedded)
        self.init(validating: data, as: UTF8.self)
        #else
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            self.init(validating: data, as: UTF8.self)
        } else {
            self.init(bytes: data, encoding: .utf8)
        }
        #endif
    }
}
