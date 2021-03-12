//
//  UnifiedStateRegisterApi.swift
//  Codex
//
//  Created by Никита Полыко on 11.03.21.
//

import Foundation
import UIKit

struct CompanyInfo {
	var infoItem: [CompanyInfoItem]
	
	init(request: EGRRequest) {
		let item1 = CompanyInfoItem(lineName: "Наименование компании: ", infoCompany: request.name)
		let item2 = CompanyInfoItem(lineName: "Регистрационный номер: ", infoCompany: "\(request.registrationNumber)")
        let item3 = CompanyInfoItem(lineName: "Дата регистрации: ", infoCompany: "\(request.registrationDate)")
        let item4 = CompanyInfoItem(lineName: "Тип субъекта хозяйствования: ", infoCompany: "\(request.atThatMoment.typeOfEntity ?? 0)")
        let item5 = CompanyInfoItem(lineName: "Состояние субъекта хозяйствования", infoCompany: request.atThatMoment.nowAction ?? "")
		self.infoItem = [item1, item2, item3, item4, item5]
	}
}

struct CompanyInfoItem {
    let lineName: String
    let infoCompany: String
}
