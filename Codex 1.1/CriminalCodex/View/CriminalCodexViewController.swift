//
//  CriminalCodexViewController.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation
import UIKit

class CriminalCodexViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .cyan
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToFirstVC(sender:)))
    }
    @objc func backToFirstVC(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}

extension CriminalCodexViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
