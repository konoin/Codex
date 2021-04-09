//
//  ArticleCell.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 9.04.21.
//

import Foundation
import UIKit

class ArticleCell: UITableViewCell {
    
    let articleTitleLabel: UILabel = {
        let articleLabel = UILabel()
        articleLabel.translatesAutoresizingMaskIntoConstraints = false
        return articleLabel
    }()
    
    let articleNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articleNameLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            articleTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            articleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            articleNameLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 8),
            articleNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            articleNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
