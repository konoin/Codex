//
//  CodexCell.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation
import UIKit

class CodexCell: UITableViewCell {
    
    var codexInformation: CodexesViewCell? {
        didSet {
            guard let codexInfo = codexInformation else { return }
            codexImage.image = UIImage(named: codexInfo.codexImage)
            codexTitle.text = codexInfo.codexName
        }
    }
    
    let codexImage: CodexImageView = CodexImageView(frame: CGRect())
    let codexTitle: CodexTitle = CodexTitle()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(codexImage)
        contentView.addSubview(codexTitle)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            codexImage.heightAnchor.constraint(equalToConstant: 84),
            codexImage.widthAnchor.constraint(equalToConstant: 50),
            codexImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            codexImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            codexTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            codexTitle.leadingAnchor.constraint(equalTo: codexImage.trailingAnchor, constant: 16)
        ])
    }
}
