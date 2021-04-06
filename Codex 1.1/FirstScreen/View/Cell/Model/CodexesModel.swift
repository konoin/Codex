//
//  CodexesModel.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation

struct CodexesViewCell {
    let codexName: String
    let codexImage: String
}

class CodexInformation {
    static func getCodex() -> [CodexesViewCell] {
        let codex = [
            CodexesViewCell(codexName: "Уголовный кодекс", codexImage: "criminal"),
            CodexesViewCell(codexName: "Трудовой кодекс", codexImage: "labor")]
        return codex
    }
}
