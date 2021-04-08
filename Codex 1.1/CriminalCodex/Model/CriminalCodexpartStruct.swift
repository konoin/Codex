//
//  CriminalCodexpartStruct.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation

struct CriminalCodexPartStruct {
    let partName: String
    let numberOfArticle: String

    init?(partOfCodex: CriminalCodexLoacalJSON) {
        
        partName = "\(partOfCodex.part.first?.title ?? "")"
        numberOfArticle = "\(partOfCodex.part.first?.numberOfArticles ?? "")"
    }
}
