//
//  GeneralSection.swift
//  Codex 1.1
//
//  Created by Mikita Palyka on 8.04.21.
//

import Foundation
import UIKit

class GeneralSection: UIViewController {
    
    let tableView = UITableView()
    var sections: [Section]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.frame
        title = "Разделы"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PartCell.self, forCellReuseIdentifier: "sectionCell")
        tableView.reloadData()
    }
}

extension GeneralSection: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chapterViewController = ChapterViewController()
        chapterViewController.chapters = sections?[indexPath.row].chapter
        self.navigationController?.pushViewController(chapterViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! PartCell
        let section = sections?[indexPath.row]
        cell.partName.text = section?.title
        cell.articlesNumber.text = section?.numberOfArticles
        cell.sectionNumber.text = section?.sectionNumber
        return cell
    }
}
