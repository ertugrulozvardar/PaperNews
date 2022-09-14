//
//  Article.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import Foundation

struct Article: Codable {
    let title: String?
    let description: String?
    let content: String?
    let url: String?
    let image: String?
    let publishedAt: String?
    let source: Source?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case content
        case url
        case image
        case publishedAt
        case source
    }
    
    private let modelURLFormatter = ModelURLFormatter()
    private let modelDateFormatter = ModelDateFormatter()
    
    var imageURL: URL {
        return modelURLFormatter.getURL(by: image)
    }
    
    var publicationDate: String {
        return modelDateFormatter.getPublicationDate(by: publishedAt)
    }
}
