//
//  LocalJsonStruct.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation

// MARK: - CriminalCodex
struct CriminalCodexLoacalJSON: Codable {
    let part: [Part]
}

// MARK: - Part
struct Part: Codable {
    let title, numberOfArticles: String
    let section: [Section]
}

// MARK: - Section
struct Section: Codable {
    let sectionNumber, title, numberOfArticles: String
    let chapter: [Chapter]
}

// MARK: - Chapter
struct Chapter: Codable {
    let chapterNumber, title, numberOfArticles: String?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let id: Int
    let title, name, content: String
}
