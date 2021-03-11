//
//  UnifiedStateRegisterApi.swift
//  Codex
//
//  Created by Никита Полыко on 11.03.21.
//

import Foundation
import UIKit

class UnifiedStateRegisterStruct {
    static func getInfo() -> [CompanyInfoItem] {
        let information = [
            CompanyInfoItem(lineName: "Наименование компании: ", infoCompany: ""),
            CompanyInfoItem(lineName: "Регистрационный номер: ", infoCompany: ""),
            CompanyInfoItem(lineName: "Дата регистрации: ", infoCompany: ""),
            CompanyInfoItem(lineName: "Тип субъекта хозяйствования: ", infoCompany: ""),
            CompanyInfoItem(lineName: "Состояние субъекта хозяйствования: ", infoCompany: "")
        ]
        return information
    }
}


struct CompanyInfoItem {
    let lineName: String
    let infoCompany: String
}
