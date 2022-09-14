//
//  Headline.swift
//  PaperNews
//
//  Created by pc on 14.09.2022.
//

import Foundation

enum headlineTopic {
    case breakingNews
    case world
    case nation
    case entertainment
    case science
    case sports
    case health
    case technology
    case business
}

func getHeadline(topic: headlineTopic) -> String {
    switch topic {
    case .breakingNews:
        return "Breaking-news"
    case .entertainment:
        return "Entertainment"
    case .world:
        return "World"
    case .nation:
        return "Nation"
    case .science:
        return "Science"
    case .sports:
        return "Sports"
    case .health:
        return "Health"
    case .technology:
        return "Technology"
    case .business:
        return "Business"
    }
}
