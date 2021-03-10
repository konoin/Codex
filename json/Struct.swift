//
//  ParseCriminalCodex.swift
//  Codex
//
//  Created by Никита Полыко on 10.03.21.
//
import Foundation

struct Part: Decodable {
    var title: String
    var section: [Section]!
}

struct Section: Decodable {
    var sectionnumber: String
    var title: String
    var chapter: [Chapter]!
}

struct Chapter: Decodable {
    var chapternumber: String
    var title: String
    var articles: [Article]!
}

struct Article: Decodable {
    var id: Int
    var title: String
    var name: String
    var content: String
}


