//
//  StringExtension.swift
//  PaperNews
//
//  Created by pc on 13.09.2022.
//

import Foundation

extension String {
    var withoutPunctuations: String {
        return self.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
    }
}
