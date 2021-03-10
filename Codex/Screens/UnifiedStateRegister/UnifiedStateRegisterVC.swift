//
//  UnifiedStateRegisterVC.swift
//  Codex
//
//  Created by Никита Полыко on 6.03.21.
//

import UIKit

class UnifiedStateRegisterVC: UIViewController {
    
    let minustImage: UIImageView = {
        let minustImage = UIImageView()
        minustImage.image = UIImage(named: "minust")
        minustImage.translatesAutoresizingMaskIntoConstraints = false
        return minustImage
    }()
    
    let textField: UITextField = {
        let text = UITextField()
        text.font = .boldSystemFont(ofSize: 12)
        text.borderStyle = .roundedRect
        text.placeholder = "Введите регистрационный номер"
        text.keyboardType = .numberPad
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "Проверить"
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .application)
        button.setTitle("Проверить", for: .normal)
        
        
        return button
    }()
    
    let wrongLAbel: UILabel = {
        let label = UILabel()
        label.text = "Неправильно введен регистрационный номер. Введите 9 цифр."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let notFindLabel: UILabel = {
        let notFindLAbel = UILabel()
        notFindLAbel.text = "Введенынй Вами регистрационный номер не найден."
        notFindLAbel.translatesAutoresizingMaskIntoConstraints = false
        
        return notFindLAbel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        view.backgroundColor = .white
        view.addSubview(minustImage)
        view.addSubview(textField)
        view.addSubview(checkButton)
        setupConstraints()
        
        let urlString = "http://egr.gov.by/egrn/API.jsp?NM=100059271"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString)
            }
            
        }
        task.resume()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: minustImage.bottomAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            checkButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkButton.heightAnchor.constraint(equalToConstant: 50),
            checkButton.widthAnchor.constraint(equalToConstant: 150),
            
            minustImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minustImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            minustImage.heightAnchor.constraint(equalToConstant: 300),
            minustImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
}

extension UnifiedStateRegisterVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 9
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
