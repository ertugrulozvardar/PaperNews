//
//  URLManager.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import Foundation

struct URLManager {
    
    private let scheme = "https"
    private let host = "gnews.io"
    private let newsAPIKey = "c2fee3deff2abfef513e006ab20347ce"
    private var path: String?
    private var language: String?
    private var topic: String?
    
    mutating func setPath(newPath: String?) -> String {
        if let validatedPath = newPath {
            path = validatedPath
        }
        return path ?? "/api/v4"
    }
    
    mutating func setLanguage(newLanguage: String?) -> String {
        if let validatedLanguage = newLanguage {
            language = validatedLanguage
        }
        return language ?? "en"
    }
    
    func getURLScheme() -> String {
        return scheme
    }
    
    func getURLHost() -> String {
        return host
    }
    
    func getAPIKey() -> String {
        return newsAPIKey
    }
}
