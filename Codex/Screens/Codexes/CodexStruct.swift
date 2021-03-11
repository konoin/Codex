//
//  CodexStruct.swift
//  Codex
//
//  Created by Никита Полыко on 9.03.21.
//

import Foundation
import UIKit


class CodexAPI {
    static func getCodex() -> [CodexItem] {
        let codex = [
        CodexItem(codexTitle: "Уголовный кодекс", codexImage: "criminal"),
        CodexItem(codexTitle: "Гражданский кодекс", codexImage: "civil"),
        CodexItem(codexTitle: "Труовой кодекс", codexImage: "labor"),
        CodexItem(codexTitle: "Кодекс о браке и семье", codexImage: "family")]
        return codex
    }
}

struct CodexItem {
    let codexTitle: String
    let codexImage: String
}
