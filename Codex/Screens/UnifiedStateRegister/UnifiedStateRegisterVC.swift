//
//  UnifiedStateRegisterVC.swift
//  Codex
//
//  Created by Никита Полыко on 6.03.21.
//

import UIKit

class UnifiedStateRegisterVC: UIViewController {
	var selectedRequest: EGRRequest?
	
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
        text.placeholder = "Введите УНП"
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
        button.addTarget(self, action: #selector(apiRequest), for: .touchUpInside)
        
        return button
    }()
    
    @objc func apiRequest() {
    
        let unpNumber = textField.text ?? ""
        let urlString = "http://egr.gov.by/api/v2/egr/getShortInfoByRegNum/\(unpNumber)"
        //191295624
        request(urlString: urlString) { (egrRequest, error) in
            
            self.changeVC(with: egrRequest!)
        }
    }
    
	func changeVC(with egrRequest: EGRRequest) {
		let viewController = UnifiedStateRegisterInfoVC()
		viewController.request = egrRequest
        let infoVC = UINavigationController(rootViewController: viewController)
        infoVC.modalPresentationStyle = .fullScreen
		//DispatchQueue.main.async {
        present(infoVC, animated: true, completion: nil)
	//	}
    }
        
    let wrongLAbel: UILabel = {
        let label = UILabel()
        label.text = "Неправильно введен УНП. Введите 9 цифр."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let notFindLabel: UILabel = {
        let notFindLAbel = UILabel()
        notFindLAbel.text = "Введенынй Вами УНП не найден."
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
    }
    
    func request (urlString: String, completion: @escaping(EGRRequest?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
       let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    JSONDecoder().dateDecodingStrategy = .iso8601
                    let egrRequests = try JSONDecoder().decode([EGRRequest].self, from: data)
					completion(egrRequests.first, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(nil, error)
                }
                if let error = error {
                    print("Some error")
                    completion(nil, error)
                    return
                }
            }
        }
		
		dataTask.resume()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField)
    }
}
