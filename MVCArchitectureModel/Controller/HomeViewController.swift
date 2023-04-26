//
//  HomeViewController.swift
//  MVCArchitectureModel
//
//  Created by mayank ranka on 26/04/23.
//

import UIKit

class HomeViewController: UIViewController {

    var stackView : UIStackView!
    var labelEmail : UILabel!
    var labelName  : UILabel!
    var labelage  : UILabel!
    var labelAddress  : UILabel!
    var labelPassword  : UILabel!
    
    
    var user : UserModel!
      
    override func viewDidLoad() {
        super.viewDidLoad()

        user = NetworkService.shared.getLoggedInUser()
        view.backgroundColor = .white
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        
        labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = "\(user.name!)"
        labelName.textColor = .black
        stackView.addArrangedSubview(labelName)
        
        labelage = UILabel()
        labelage.translatesAutoresizingMaskIntoConstraints = false
        labelage.text = "\(user.age!)"
        labelage.textColor = .black
        stackView.addArrangedSubview(labelage)
        
        labelEmail = UILabel()
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        labelEmail.text = "\(user.email!)"
        labelEmail.textColor = .black
        stackView.addArrangedSubview(labelEmail)
        
        labelPassword = UILabel()
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        labelPassword.text = "\(user.password!)"
        labelPassword.textColor = .black
        stackView.addArrangedSubview(labelPassword)
        
        labelAddress = UILabel()
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        labelAddress.text = "\(user.address!)"
        labelAddress.textColor = .black
        stackView.addArrangedSubview(labelAddress)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
