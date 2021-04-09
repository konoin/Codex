//
//  UILabel.swift
//  NewsProject
//
//  Created by Mikita Palyka on 5.04.21.
//

import Foundation
import UIKit

class CodexTitle: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
