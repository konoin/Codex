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
    var request: CriminalCodexLoacalJSON?
    var localManager = LoadLocalCriminalCodexJsonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Общая часть"
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PartCell.self, forCellReuseIdentifier: "sectionCell")
        
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

extension GeneralSection: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ChapterViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return request?.part.first?.section.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! PartCell
        let section = request?.part.first?.section[indexPath.row]
        cell.partName.text = section?.title
        cell.articlesNumber.text = section?.numberOfArticles
        return cell
    }
    
    
}
