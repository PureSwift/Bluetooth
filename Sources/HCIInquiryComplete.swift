//
//  HCIInquiryComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct HCIInquiryComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.inquiryComplete
    
    public static let length: Int = 1
    
    public let status: HCIStatus
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        self.status = status
    }
}
