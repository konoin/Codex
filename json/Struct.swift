//
//  ParseCriminalCodex.swift
//  Codex
//
//  Created by Никита Полыко on 10.03.21.
//
import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let part: [Part]
}

// MARK: - Part
struct Part: Codable {
    let title: String
    let section: [Section]
}

// MARK: - Section
struct Section: Codable {
    let sectionNumber, title: String
    let chapter: [Chapter]
}

// MARK: - Chapter
struct Chapter: Codable {
    let chapterNumber, title: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let id: Int
    let title, name, content: String
}
