//
//  ArticlesViewController.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 9.04.21.
//

import Foundation
import UIKit

class ArticlesViewController: UIViewController {
    
    let tableView = UITableView()
    var articles: [Article]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Статьи"
        tableView.estimatedRowHeight = 200
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "articlesCell")
        tableView.reloadData()

    }
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let finalArticleViewController = FinalArticleView()
        finalArticleViewController.finalArticle = articles?[indexPath.row]
        self.navigationController?.pushViewController(finalArticleViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articlesCell", for: indexPath) as! ArticleCell
        let articleInfo = articles?[indexPath.row]
        cell.articleNameLabel.sizeToFit()
        
        cell.articleTitleLabel.text = articleInfo?.title
        cell.articleNameLabel.text = articleInfo?.name
        return cell
    }
    
    
    
}
