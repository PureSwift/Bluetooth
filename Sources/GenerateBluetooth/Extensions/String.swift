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
            .replacingOccurrences(of: "LLC \"", with: "")
            .replacingOccurrences(of: "\"", with: "")
            .replacingOccurrences(of: "3D ", with: "uuid3D")
            .replacingOccurrences(of: "IF, LLC", with: "ifLLC")
            .replacingOccurrences(of: "WHERE, Inc.", with: "whereInc")
            .replacingOccurrences(of: "Amazon.com Services, Inc.", with: "Amazon")
            .replacingOccurrences(of: ", Ltd. (QTIL)", with: "")
            .replacingOccurrences(of: "The ", with: "")
            .replacingOccurrences(of: "A/V", with: "av")
            .replacingOccurrences(of: " Incorporated", with: "")
            .replacingOccurrences(of: " Corporation", with: "")
            .replacingOccurrences(of: " Limited", with: "")
            .replacingOccurrences(of: " Pvt.", with: "")
            .replacingOccurrences(of: "GmbH & Co. KG", with: "")
            .replacingOccurrences(of: "GmbH & Co KG", with: "")
            .replacingOccurrences(of: "AG & Co. KGaA", with: "")
            .replacingOccurrences(of: "AG & Co. KG", with: "")
            .replacingOccurrences(of: "AG & Co.", with: "")
            .replacingOccurrences(of: " Corp.", with: "")
            .replacingOccurrences(of: " Corp", with: "")
            .replacingOccurrences(of: "Co.,Ltd", with: "")
            .replacingOccurrences(of: ",Co.Ltd", with: "")
            .replacingOccurrences(of: "CO.,LTD.", with: "")
            .replacingOccurrences(of: "Co.,", with: "")
            .replacingOccurrences(of: "Co.", with: "")
            .replacingOccurrences(of: " Sp. z o.o.", with: "")
            .replacingOccurrences(of: " ASA", with: "")
            .replacingOccurrences(of: " AS", with: "")
            .replacingOccurrences(of: " SA", with: "")
            .replacingOccurrences(of: " AB", with: "")
            .replacingOccurrences(of: " BV", with: "")
            .replacingOccurrences(of: " AG", with: "")
            .replacingOccurrences(of: " d.o.o.", with: "")
            .replacingOccurrences(of: " D.O.O.", with: "")
            .replacingOccurrences(of: " Oy", with: "")
            .replacingOccurrences(of: " gmbh", with: "")
            .replacingOccurrences(of: " GmbH", with: "")
            .replacingOccurrences(of: " B.V.", with: "")
            .replacingOccurrences(of: " b.v.", with: "")
            .replacingOccurrences(of: ",Inc.", with: "")
            .replacingOccurrences(of: ", inc.", with: "")
            .replacingOccurrences(of: " Inc", with: "")
            .replacingOccurrences(of: " INC", with: "")
            .replacingOccurrences(of: " LLC", with: "")
            .replacingOccurrences(of: " LTD", with: "")
            .replacingOccurrences(of: " Ltd", with: "")
            .replacingOccurrences(of: " ltd", with: "")
            .replacingOccurrences(of: " Ltd", with: "")
            .replacingOccurrences(of: " A/S", with: "")
            .replacingOccurrences(of: " S.A.", with: "")
            .replacingOccurrences(of: " S.L.", with: "")
            .replacingOccurrences(of: " ApS", with: "")
            .replacingOccurrences(of: " s.r.o.", with: "")
            .replacingOccurrences(of: " Srl", with: "")
        
        // if first letter is a number, add prefix
        if let firstCharacter = name.first,
            let _ = Int(String(firstCharacter)) {
            
            name = "uuid" + name
        }
        
        return name
    }
}
