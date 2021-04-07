//
//  CodexCellView.swift
//  Codex
//
//  Created by Никита Полыко on 6.03.21.
//

import UIKit

class CodexCellView: UITableViewCell {
    
    var codex: CodexItem?{
        didSet{
            guard let codexItem = codex else { return }
            codexTitle.text = codexItem.codexTitle
            imageBook.image = UIImage(named: codexItem.codexImage)
        }
    }
    
    let codexTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20)
        return title
    }()
    
    let imageBook: UIImageView = {
        let imageBook = UIImageView()
        imageBook.contentMode = .scaleAspectFill
        return imageBook
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(codexTitle)
        contentView.addSubview(imageBook)
        contentView.addSubview(lineView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        codexTitle.translatesAutoresizingMaskIntoConstraints = false
        imageBook.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            codexTitle.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 20),
            codexTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            imageBook.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageBook.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageBook.heightAnchor.constraint(equalToConstant: 100),
            imageBook.widthAnchor.constraint(equalToConstant: 50),
            
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
}
