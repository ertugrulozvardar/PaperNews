//
//  NewsService.swift
//  PaperNews
//
//  Created by pc on 7.09.2022.
//

import Foundation

protocol NewsServiceProtocol {
    mutating func fetchNews(completion: @escaping (Result<News, NetworkError>) -> Void)
    mutating func fetchTopHeadlines(topic: String, completion: @escaping (Result<News, NetworkError>) -> Void)
    mutating func searchNews(searchQuery: String, completion: @escaping (Result<News, NetworkError>) -> Void)
}

struct NewsService: NewsServiceProtocol {
    private let network = Network()
    private var urlManager = URLManager()
    
    mutating func fetchTopHeadlines(topic: String, completion: @escaping (Result<News, NetworkError>) -> Void) {
        var url: URL? {
            var components = URLComponents()
            components.scheme = urlManager.getURLScheme()
            components.host = urlManager.getURLHost()
            components.path = urlManager.setPath(newPath: getURLPathName(path: .topHeadlines))
            components.queryItems = [
                URLQueryItem(name: "token", value: urlManager.getAPIKey()),
                URLQueryItem(name: "topic", value: String(topic)),
                URLQueryItem(name: "lang", value: urlManager.setLanguage(newLanguage: getURLLanguage(language: .english)))
            ]
            return components.url
        }
        if let finalURL = url {
            print(finalURL)
            let urlRequest = URLRequest(url: finalURL)
            network.performRequest(request: urlRequest, completion: completion)
        }
    }
    
    mutating func fetchNews(completion: @escaping (Result<News, NetworkError>) -> Void) {
        var url: URL? {
            var components = URLComponents()
            components.scheme = urlManager.getURLScheme()
            components.host = urlManager.getURLHost()
            components.path = urlManager.setPath(newPath: getURLPathName(path: .topHeadlines))
            components.queryItems = [
                URLQueryItem(name: "token", value: urlManager.getAPIKey()),
                URLQueryItem(name: "topic", value: "breaking-news"),
                URLQueryItem(name: "lang", value: urlManager.setLanguage(newLanguage: getURLLanguage(language: .english)))
            ]
            return components.url
        }
        if let finalURL = url {
            let urlRequest = URLRequest(url: finalURL)
            network.performRequest(request: urlRequest, completion: completion)
        }
    }
    
    mutating func searchNews(searchQuery: String, completion: @escaping (Result<News, NetworkError>) -> Void) {
        var url: URL? {
            var components = URLComponents()
            components.scheme = urlManager.getURLScheme()
            components.host = urlManager.getURLHost()
            components.path = urlManager.setPath(newPath: getURLPathName(path: .searchNews))
            components.queryItems = [
                URLQueryItem(name: "token", value: urlManager.getAPIKey()),
                URLQueryItem(name: "q", value: String(searchQuery)),
                URLQueryItem(name: "lang", value: urlManager.setLanguage(newLanguage: getURLLanguage(language: .english)))
            ]
            return components.url
        }
    
        if let finalURL = url {
            let urlRequest = URLRequest(url: finalURL)
            network.performRequest(request: urlRequest, completion: completion)
        }
    }
}
