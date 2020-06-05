//
//  ViewController.swift
//  CustomApp
//
//  Created by Imran on 21/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit

class DashBoard: BaseVC {
    
    var nextButton = UIButton()
    
    
    let heading = UILabel(),
    username = UITextField(),
    password = UITextField()
    var testMyLabel = MyUILabel()
    var nameField = MyUITextField()
    var passwordField = MyUITextField()
    
    var submitButton = MyButton()
    
    
    var alerView = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // setupBottomTabBar()
        isTabBarShow = true
        print(isTabBarShow)
        setupLoginUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        isTabBarShow = true
    }
    
    
    var leftCons : NSLayoutConstraint?
    
    func setupLoginUI(){
        view.addSubview(heading)
        view.addSubview(username)
        view.addSubview(password)
        
        
        let leftIconName = UIImage(named: "locked-2")!
        self.nameField = MyUITextField(frame: .zero, placeholderText: "Email", leftIconName)
        nameField.keyboardType = .emailAddress
        view.addSubview(nameField)
        nameField.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding:.init(top: 80, left: 20, bottom: 0, right: 20), size: .init(width: nameField.frame.width, height: 40))
        
        let leftIconEmail = UIImage(named: "archive-2")!
        self.passwordField = MyUITextField( placeholderText: "password", leftIconEmail)
        passwordField.keyboardType = .decimalPad
        passwordField.isSecureTextEntry = true
        view.addSubview(passwordField)
        passwordField.anchor(top: nameField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding:.init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: passwordField.frame.width, height: 40))
        
        self.submitButton  = MyButton(setTitle: "Submit")
        view.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        
        
    }
    @objc func handleSubmit(sender:UIButton){
        
        
        UIView.animate(withDuration: 0.5, animations: {
            sender.alpha = 0.5
        }) { (Bool) in
            sender.alpha = 0.8
            let name =  self.nameField.text
            let pass =  self.passwordField.text
            if name == "" || pass == "" {
                print("Missing Field")
                
                self.view.addSubview(self.alerView)
                //                self.alerView.translatesAutoresizingMaskIntoConstraints = false
                
                self.alerView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
                                     leading: self.view.leadingAnchor,
                                     bottom: self.view.bottomAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: .init(),
                                     size: .init(width: self.view.frame.width,
                                                 height: self.alerView.frame.height)
                )
                print(self.alerView)
                
                
            }
            print(name!,pass!)
        }
        
    }
}

