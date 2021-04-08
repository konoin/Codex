//
//  LoadLocalJsonManager.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation
import UIKit

class LoadLocalJsonManager {
    func loadJson(fileName: String) -> CriminalCodexLoacalJSON? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CriminalCodexLoacalJSON.self, from: data)
                return jsonData
            } catch {
                print(error)
            }
        }
        return nil
    }
}

