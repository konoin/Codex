//
//  FirstViewController.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let codex = CodexInformation.getCodex()
    let tableView = UITableView()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CodexCell.self, forCellReuseIdentifier: "codexCell")
        setConstraints()
    }
    
    func setConstraints() {
        view.addSubview(tableView)
        tableView.frame = self.view.frame
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        title = "Кодексы Республики Белаурсь"
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codex.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(CriminalCodexPartViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "codexCell") as! CodexCell
        cell.codexInformation = codex[indexPath.row]
        return cell
    }
}
