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
    var criminalCodex: CriminalCodexLocalJSON?
    var localManager = LoadLocalCriminalCodexJsonManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        parseJson()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        title = "Уголовный кодекс"
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PartCell.self, forCellReuseIdentifier: "partCell")
    }
    
    func parseJson() {
        localManager.paseJSON { [weak self] (result) in
            switch result {
            case .success(let criminalCodex):
                self?.criminalCodex = criminalCodex
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension CriminalCodexPartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return criminalCodex?.part.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let generalSectionViewController = GeneralSection()
            generalSectionViewController.sections = criminalCodex?.part[indexPath.row].section
            self.navigationController?.pushViewController(generalSectionViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell") as! PartCell
        let part = criminalCodex?.part[indexPath.row]
        cell.partName.text = part?.title
        cell.articlesNumber.text = part?.numberOfArticles
        return cell
        
    }
}
