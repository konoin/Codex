//
//  UnifiedStateRegisterCell.swift
//  Codex
//
//  Created by Никита Полыко on 11.03.21.
//

import UIKit

class UnifiedStateRegisterCell: UITableViewCell {
    
    var companyInfoItem: CompanyInfoItem? {
        didSet {
            guard let companyInfoItem = companyInfoItem else { return }
            nameInfoLabel.text = companyInfoItem.lineName
            infoText.text = companyInfoItem.infoCompany
        }
    }
    
    let nameInfoLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 10)
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let infoText: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 10)
        text.textAlignment = .left
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameInfoLabel)
        contentView.addSubview(infoText)
        contentView.addSubview(lineView)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameInfoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            infoText.leadingAnchor.constraint(equalTo: nameInfoLabel.trailingAnchor, constant: 16),
            infoText.centerYAnchor.constraint(equalTo: centerYAnchor),
        
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
