//
//  URLLanguage.swift
//  PaperNews
//
//  Created by pc on 8.09.2022.
//

import Foundation

enum URLLanguage {
    case arabic
    case german
    case greek
    case english
    case spanish
    case french
    case hebrew
    case hindi
    case italian
    case japanese
    case malayalam
    case marathi
    case dutch
    case norwegian
    case portuguese
    case romanian
    case russian
    case swedish
    case tamil
    case telugu
    case ukrainian
    case chinese
}

func getURLLanguage(language: URLLanguage) -> String? {
    switch language {
    case .arabic:
        return "ar"
    case .german:
        return "de"
    case .greek:
        return "el"
    case .english:
        return "en"
    case .spanish:
        return "es"
    case .french:
        return "fr"
    case .hebrew:
        return "he"
    case .hindi:
        return "hi"
    case .italian:
        return "it"
    case .japanese:
        return "ja"
    case .malayalam:
        return "ml"
    case .marathi:
        return "mr"
    case .dutch:
        return "nl"
    case .norwegian:
        return "no"
    case .portuguese:
        return "pt"
    case .romanian:
        return "ro"
    case .russian:
        return "ru"
    case .swedish:
        return "sv"
    case .tamil:
        return "ta"
    case .telugu:
        return "te"
    case .ukrainian:
        return "uk"
    case .chinese:
        return "zh"
    }
}
