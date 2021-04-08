//
//  LoadLocalCriminalCodexJsonManager.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation
import UIKit

enum ObtainCriminalCodexResult {
    case success(criminalCodex: CriminalCodexLoacalJSON)
    case failure(error: Error)
}

class LoadLocalCriminalCodexJsonManager {
    
    let sessionConfigeration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func paseJSON(completion: @escaping (ObtainCriminalCodexResult) -> Void) {
        guard let urlString = Bundle.main.url(forResource: "criminalCodex", withExtension: "json") else { return }
        
        session.dataTask(with: urlString) { [weak self] (data, response, error) in
            
            let result: ObtainCriminalCodexResult
            guard let strongSelf = self else { return }
            
            if error == nil, let data = data {
                guard let criminalCodex = try? strongSelf.decoder.decode(CriminalCodexLoacalJSON.self, from: data) else { return }
                result = .success(criminalCodex: criminalCodex)
                print("\(criminalCodex.part)")
            } else {
                result = .failure(error: error!)
                print("Error: \(error?.localizedDescription ?? "")")
            }
            completion(result)
        }.resume()
    }
    
    
    //    func loadJson(fileName: String) -> CriminalCodexLoacalJSON? {
    //        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
    //            do {
    //                let data = try Data(contentsOf: url)
    //                let decoder = JSONDecoder()
    //                let jsonData = try decoder.decode(CriminalCodexLoacalJSON.self, from: data)
    //                return jsonData
    //            } catch {
    //                print(error)
    //            }
    //        }
    //        return nil
    //    }
    
    
}
