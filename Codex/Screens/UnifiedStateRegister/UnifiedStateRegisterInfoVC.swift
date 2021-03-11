//
//  UnifiedStateRegisterInfoVC.swift
//  Codex
//
//  Created by Никита Полыко on 11.03.21.
//

import Foundation
import UIKit

class UnifiedStateRegisterInfoVC: UIViewController {
    
    private let info = UnifiedStateRegisterStruct.getInfo()
    let tableVIew = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(barButtonPressed))
        view.backgroundColor = .white
        setTableView()
    }

    @objc func barButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setTableView() {
        self.view.addSubview(tableVIew)
        tableVIew.frame = self.view.frame
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(UnifiedStateRegisterCell.self, forCellReuseIdentifier: "infoCell")
        tableVIew.separatorStyle = .none
    }
    
}

extension UnifiedStateRegisterInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! UnifiedStateRegisterCell
        cell.information = info[indexPath.row]
        return cell
        
    }
    
    
}
