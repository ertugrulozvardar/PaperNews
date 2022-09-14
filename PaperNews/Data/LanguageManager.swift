//
//  LanguageManager.swift
//  PaperNews
//
//  Created by pc on 14.09.2022.
//

import Foundation

struct LanguageManager {
    
    var supportedLanguages = [getURLLanguage(language: .arabic), getURLLanguage(language: .german),                                        getURLLanguage(language: .greek), getURLLanguage(language: .english),
                              getURLLanguage(language: .spanish), getURLLanguage(language: .french),
                              getURLLanguage(language: .hebrew), getURLLanguage(language: .hindi),
                              getURLLanguage(language: .italian), getURLLanguage(language: .japanese),
                              getURLLanguage(language: .malayalam), getURLLanguage(language: .marathi),
                              getURLLanguage(language: .dutch), getURLLanguage(language: .norwegian),
                              getURLLanguage(language: .portuguese), getURLLanguage(language: .romanian),
                              getURLLanguage(language: .russian), getURLLanguage(language: .swedish),
                              getURLLanguage(language: .tamil), getURLLanguage(language: .telugu),
                              getURLLanguage(language: .ukrainian), getURLLanguage(language: .chinese)]
    
    func isSupportedLanguage(language: String) -> Bool {
        for supportedLanguage in supportedLanguages {
            if language == supportedLanguage {
                return true
            }
        }
        return false
    }
}
