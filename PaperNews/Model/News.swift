//
//  News.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import Foundation

struct News: Codable {
    let totalArticles: Int?
    let articles: [Article]?
}
