//
//  CodexVC.swift
//  Codex
//
//  Created by Никита Полыко on 6.03.21.
//

import UIKit

class CodexVC: UIViewController, UINavigationControllerDelegate {
    
    private let codex = CodexAPI.getCodex()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        title = "Кодексы Республики Беларусь"
        
    }
   
    func setTableView() {
        self.view.addSubview(tableView)
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CodexCellView.self, forCellReuseIdentifier: "codexCell")
        tableView.separatorStyle = .none

    }
}

extension CodexVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "codexCell", for: indexPath) as! CodexCellView
        cell.codex = codex[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
