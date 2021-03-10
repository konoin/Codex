//
//  UnifiedStateRegisterStruct.swift
//  Codex
//
//  Created by Никита Полыко on 10.03.21.
//

import Foundation


struct EGRRequest: Codable {
    var businessEntity: Int
    var registrationNumber: Int
    var dateOfRegistration: String
    var exclusionDate: String?
    var nameOfBusinessEntity: String
    var fullName: String
    var currentStatus: String
    var prohibitionOfAlienation: Bool
    
    enum CodingKeys: String, CodingKey {
        case businessEntity = "TP"
        case registrationNumber = "NM"
        case dateOfRegistration = "DC"
        case exclusionDate = "DD"
        case nameOfBusinessEntity = "VU"
        case fullName = "VNM"
        case currentStatus = "VS"
        case prohibitionOfAlienation = "Z"
//        
//        init(businessEntity: Int, registrationNumber: Int, dateOfRegistration: String, exclusionDate: String?, nameOfBusinessEntity: String, fullName: String, currentStatus: String, prohibitionOfAlienation: Bool)
//        
//        self.businessEntity = businessEntity
//        self.registrationNumber = registrationNumber
//        self.dateOfRegistration = dateOfRegistration
//        self.exclusionDate = exclusionDate
//        self.nameOfBusinessEntity = nameOfBusinessEntity
//        self.fullName = fullName
//        self.currentStatus = currentStatus
//        self.prohibitionOfAlienation = prohibitionOfAlienation
        
    }
}
