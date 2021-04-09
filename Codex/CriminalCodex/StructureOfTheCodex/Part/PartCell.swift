//
//  PartCell.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 7.04.21.
//

import Foundation
import UIKit

class PartCell: UITableViewCell {
    
    let articlesNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(partName)
        contentView.addSubview(articlesNumber)

        partName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        partName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        
        articlesNumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        articlesNumber.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
