//
//  ChapterCell.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 9.04.21.
//

import Foundation
import UIKit

class ChapterCell: UITableViewCell {
    
    let numberOfCharapterLabel: UILabel = {
        let numberOfCharapterLabel = UILabel()
        numberOfCharapterLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfCharapterLabel.numberOfLines = 0
        return numberOfCharapterLabel
    }()
    
    let nameCharapterLabel: UILabel = {
        let numberCharapterLabel = UILabel()
        numberCharapterLabel.translatesAutoresizingMaskIntoConstraints = false
        numberCharapterLabel.numberOfLines = 0
        return numberCharapterLabel
    }()
    
    let numberOfArticlesLabel: UILabel = {
        let numberOfArticlesLabel = UILabel()
        numberOfArticlesLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfArticlesLabel.numberOfLines = 0
        return numberOfArticlesLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(numberOfCharapterLabel)
        contentView.addSubview(nameCharapterLabel)
        contentView.addSubview(numberOfArticlesLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            numberOfCharapterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            numberOfCharapterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            numberOfCharapterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            nameCharapterLabel.topAnchor.constraint(equalTo: numberOfCharapterLabel.bottomAnchor, constant: 8),
            nameCharapterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameCharapterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            numberOfArticlesLabel.topAnchor.constraint(equalTo: nameCharapterLabel.bottomAnchor, constant: 8),
            numberOfArticlesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            numberOfArticlesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            numberOfArticlesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

