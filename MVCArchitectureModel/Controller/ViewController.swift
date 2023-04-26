//
//  ViewController.swift
//  MVCArchitectureModel
//
//  Created by mayank ranka on 26/04/23.
//

import UIKit

class ViewController: UIViewController {

    var emailTextField : UITextField!
    var passwordTextField : UITextField!
    var displayLabel : UILabel!
    var saveButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = .white
        emailTextField.addTarget(self, action: #selector(validateText), for: .editingChanged)
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .white
        passwordTextField.placeholder = "Password"
        passwordTextField.addTarget(self, action: #selector(validateText), for: .editingChanged)
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.isEnabled = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            saveButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        displayLabel = UILabel()
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.textAlignment = .center
        displayLabel.textColor = .white
        view.addSubview(displayLabel)
        
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 30),
            displayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        
        
    }

    @objc func validateText(){
        if emailTextField.text != " " && passwordTextField.text != " "{
            saveButton.isEnabled = true
        }
    }
    
    @objc func saveButtonClicked(){
        NetworkService.shared.login(email: emailTextField.text!, password: passwordTextField.text!) { success in
            if success{
                self.goToHomePage()
            }else{
                print("Invalid Credential")
            }
        }
        displayLabel.text = "Success"
    }
    
    func goToHomePage(){
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

