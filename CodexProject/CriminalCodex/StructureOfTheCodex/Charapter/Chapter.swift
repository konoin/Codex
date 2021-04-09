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
    var request: CriminalCodexLoacalJSON?
    var localManager = LoadLocalCriminalCodexJsonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Выбор главы"
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChapterCell.self, forCellReuseIdentifier: "chapterCell")
        
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

extension ChapterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ArticlesViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return request?.part.first?.section.first?.chapter.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCell
        let chapter = request?.part.first?.section.first?.chapter[indexPath.row]
        cell.nameCharapterLabel.text = chapter?.title
        cell.numberOfCharapterLabel.text = chapter?.chapterNumber
        cell.numberOfArticlesLabel.text = chapter?.numberOfArticles
        
        return cell
    }
    
    
}
