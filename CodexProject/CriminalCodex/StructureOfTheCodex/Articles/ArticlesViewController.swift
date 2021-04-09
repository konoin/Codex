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
    var request: CriminalCodexLoacalJSON?
    var localManager = LoadLocalCriminalCodexJsonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "articlesCell")
        
        localManager.paseJSON { (result) in
            switch result {
            case .success(let criminalCodex):
                self.request = criminalCodex
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(FinalArticleView(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return request?.part.first?.section.first?.chapter.first?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articlesCell") as! ArticleCell
        let articles = request?.part.first?.section.first?.chapter.first?.articles?[indexPath.row]
        cell.articleTitleLabel.text = articles?.title
        cell.articleNameLabel.text = articles?.name
        return cell
    }
    
    
    
}
