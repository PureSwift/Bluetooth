//
//  String.swift
//  
//
//  Created by Alsey Coleman Miller on 6/12/22.
//

import Foundation

public extension String {
    
    
    // https://gist.github.com/AmitaiB/bbfcba3a21411ee6d3f972320bcd1ecd
    func camelCase() -> String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .map { $0.capitalized }
            .joined()
    }

    func llamaCase() -> String {
        var result = self.camelCase()
        if let firstLetterCharacter = result.first {
            result = String(result.dropFirst())
            let firstLetter = String(firstLetterCharacter)
            result = firstLetter.lowercased() + result
        }
        return result
    }

    func uppercaseFirstLetter() -> String {
        var result = self
        if let firstLetterCharacter = result.first {
            result = String(result.dropFirst())
            let firstLetter = String(firstLetterCharacter)
            result = firstLetter.uppercased() + result
        }
        return result
    }
    
    func sanitizeName() -> String {
        
        let blackList = ["ASSA ABLOY"]
        guard blackList.contains(self) == false
            else { return self }
        
        var name = self
        name = name.replacingOccurrences(of: "LLC \"", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "\"", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "3D ", with: "uuid3D")
        name = name.replacingOccurrences(of: "IF, LLC", with: "ifLLC")
        name = name.replacingOccurrences(of: "WHERE, Inc.", with: "whereInc")
        name = name.replacingOccurrences(of: "Amazon.com Services, Inc.", with: "Amazon")
        name = name.replacingOccurrences(of: ", Ltd. (QTIL)", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "The ", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "A/V", with: "av")
        name = name.replacingOccurrences(of: " Incorporated", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Corporation", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Limited", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Pvt.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "GmbH & Co. KG", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "GmbH & Co KG", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "AG & Co. KGaA", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "AG & Co. KG", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "AG & Co.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Corp.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Corp", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "Co.,Ltd", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: ",Co.Ltd", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "Co.,", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "Co.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: "sp. z o.o. sp. k.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Sp. z o.o.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " ASA", with: "")
        name = name.replacingOccurrences(of: " AS", with: "")
        name = name.replacingOccurrences(of: " SA", with: "")
        name = name.replacingOccurrences(of: " AB", with: "")
        name = name.replacingOccurrences(of: " BV", with: "")
        name = name.replacingOccurrences(of: " AG", with: "")
        name = name.replacingOccurrences(of: " d.o.o.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Oy", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " gmbh", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " B.V.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: ",Inc.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: ", inc.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Inc", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " LLC", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " LTD", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " A/S", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " S.A.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " S.L.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " ApS", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " s.r.o.", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " Srl", with: "", options: .caseInsensitive)
        name = name.replacingOccurrences(of: " S.r.l. ", with: "", options: .caseInsensitive)
        
        // if first letter is a number, add prefix
        if let firstCharacter = name.first,
            let _ = Int(String(firstCharacter)) {
            
            name = "uuid" + name
        }
        
        return name
    }
}
