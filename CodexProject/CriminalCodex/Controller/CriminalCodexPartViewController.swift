//
//  CriminalCodexViewController.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation
import UIKit

class CriminalCodexPartViewController: UIViewController {
    
    let tableView = UITableView()
    var request: CriminalCodexLoacalJSON?
    var localManager = LoadLocalCriminalCodexJsonManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Уголовный кодекс"
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PartCell.self, forCellReuseIdentifier: "partCell")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToFirstVC(sender:)))
        
        localManager.paseJSON { [weak self] (result) in
            switch result {
            case .success(let criminalCodex):
                self?.request = criminalCodex
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    @objc func backToFirstVC(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}

extension CriminalCodexPartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return request?.part.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(GeneralSection(), animated: true)
        } else {
            self.navigationController?.pushViewController(SpecialSection(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell") as! PartCell
        let part = request?.part[indexPath.row]
        cell.partName.text = part?.title
        cell.articlesNumber.text = part?.numberOfArticles
        return cell
        
    }
}
