//
//  UnifiedStateRegisterStruct.swift
//  Codex
//
//  Created by Никита Полыко on 10.03.21.
//

import Foundation

struct EGRRequest: Codable {
    var fullName: String // vnaim
    var shortName: String // vn
    var name: String // vfn
    var registrationNumber: Int //ngrn
    var registrationDate: String //dfrom
    var atThatMoment: Action
    
    enum CodingKeys: String, CodingKey {
        case fullName = "vnaim"
        case shortName = "vn"
        case name = "vfn"
        case registrationNumber = "ngrn"
        case registrationDate = "dfrom"
        case atThatMoment = "nsi00219"
    }
}

struct Action: Codable {
    var nowAction: String?
    var typeOfEntity: Int?
    
    enum CodingKeys: String, CodingKey {
        case nowAction = "vnsostk"
        case typeOfEntity = "nksost"
    }
}

