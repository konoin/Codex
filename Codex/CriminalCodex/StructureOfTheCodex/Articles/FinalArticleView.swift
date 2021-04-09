//
//  FinalArticleView.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 9.04.21.
//

import Foundation
import UIKit

class FinalArticleView: UIViewController {
    
    var request: CriminalCodexLoacalJSON?
    var localManager = LoadLocalCriminalCodexJsonManager()
    
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let nameOfArticleLabel: UILabel = {
        let nameOfArticlesLabel = UILabel()
        nameOfArticlesLabel.translatesAutoresizingMaskIntoConstraints = false
        nameOfArticlesLabel.numberOfLines = 0
        nameOfArticlesLabel.textAlignment = .left
        return nameOfArticlesLabel
    }()
    
    let contentTextView: UILabel = {
        let contentTextView = UILabel()
        contentTextView.numberOfLines = 0
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        return contentTextView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(titleLabel)
        view.addSubview(nameOfArticleLabel)
        view.addSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            nameOfArticleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            nameOfArticleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            contentTextView.topAnchor.constraint(equalTo: nameOfArticleLabel.bottomAnchor, constant: 8),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        localManager.paseJSON { (result) in
            switch result {
            case .success(let criminalCodex):
                self.request = criminalCodex
                DispatchQueue.main.async {
                    let article = self.request?.part.first?.section.first?.chapter.first?.articles?.first
                    self.titleLabel.text = "\(article?.title ?? "")"
                    self.nameOfArticleLabel.text = "\(article?.name ?? "")"
                    self.contentTextView.text = "\(article?.content ?? "")"
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
