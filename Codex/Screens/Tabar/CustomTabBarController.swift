//
//  CustomTabBarController.swift
//  Codex
//
//  Created by Никита Полыко on 6.03.21.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate, UINavigationControllerDelegate {
    
    let codexVC = CodexVC()
    let unifiedState = UnifiedStateRegisterVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let codexVC = UINavigationController(rootViewController: CodexVC())
        codexVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        
        let stateRegisterVC = UnifiedStateRegisterVC()
        stateRegisterVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let tabBArList = [codexVC, stateRegisterVC]
        
        viewControllers = tabBArList
        
        self.delegate = self
        self.tabBar.barTintColor = .white
    }
}
