//
//  Parse.swift
//  Codex
//
//  Created by Никита Полыко on 10.03.21.
//

import Foundation

func loadJson(fileName: String) -> Welcome? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Welcome.self, from: data)
            return jsonData
        } catch {
            print(error)
        }
    }
    return nil
}
