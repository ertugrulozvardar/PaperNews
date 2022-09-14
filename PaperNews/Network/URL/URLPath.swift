//
//  URLPath.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import Foundation

enum URLPath {
    case topHeadlines
    case searchNews
}

func getURLPathName(path: URLPath) -> String? {
    switch path {
    case .topHeadlines:
        return "/api/v4/top-headlines"
    case .searchNews:
        return "/api/v4/search"
    }
}
