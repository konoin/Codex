//
//  Chapter.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 9.04.21.
//

import Foundation
import UIKit

class ChapterViewController: UIViewController {
    
    let tableView = UITableView()
    var chapters: [Chapter]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Выбор главы"
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChapterCell.self, forCellReuseIdentifier: "chapterCell")
        tableView.reloadData()
    }
}

extension ChapterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleViewController = ArticlesViewController()
        articleViewController.articles = chapters?[indexPath.row].articles
        self.navigationController?.pushViewController(articleViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCell
        let chapter = chapters?[indexPath.row]
        cell.nameCharapterLabel.text = chapter?.title
        cell.numberOfCharapterLabel.text = chapter?.chapterNumber
        cell.numberOfArticlesLabel.text = chapter?.numberOfArticles
        
        return cell
    }
    
    
}
