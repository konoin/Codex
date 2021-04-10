//
//  FinalArticleView.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 9.04.21.
//

import Foundation
import UIKit

class FinalArticleView: UIViewController {
    
    var finalArticle: Article?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let conteinerView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 20)
        return titleLabel
    }()
    
    let nameOfArticleLabel: UILabel = {
        let nameOfArticlesLabel = UILabel()
        nameOfArticlesLabel.translatesAutoresizingMaskIntoConstraints = false
        nameOfArticlesLabel.numberOfLines = 0
        nameOfArticlesLabel.textAlignment = .left
        nameOfArticlesLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 20)
        return nameOfArticlesLabel
    }()
    
    let contentTextView: UILabel = {
        let contentTextView = UILabel()
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.textAlignment = .justified
        contentTextView.font = UIFont(name: "TimesNewRomanPSMT", size: 16)
        contentTextView.numberOfLines = 0
        return contentTextView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(conteinerView)
        conteinerView.addSubview(titleLabel)
        conteinerView.addSubview(nameOfArticleLabel)
        conteinerView.addSubview(contentTextView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2000)
        titleLabel.text = finalArticle?.title
        nameOfArticleLabel.text = finalArticle?.name
        contentTextView.text = finalArticle?.content
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            conteinerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            conteinerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            conteinerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: conteinerView.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            
            nameOfArticleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            nameOfArticleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            nameOfArticleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),
            
            contentTextView.topAnchor.constraint(equalTo: nameOfArticleLabel.bottomAnchor, constant: 8),
            contentTextView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),
            contentTextView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -8)
        ])
        
//        DispatchQueue.main.async {
//            let article = self.articleInfo?.part.first?.section.first?.chapter.first?.articles?.first
//            self.titleLabel.text = "\(article?.title ?? "")"
//            self.nameOfArticleLabel.text = "\(article?.name ?? "")"
//            self.contentTextView.text = "\(article?.content ?? "")"
//        }
    }
}
