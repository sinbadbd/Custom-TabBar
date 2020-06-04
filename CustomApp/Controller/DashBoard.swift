//
//  ViewController.swift
//  CustomApp
//
//  Created by Imran on 21/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit

class DashBoard: BaseVC {
    
    //var bottomTab  = BottomTabView()
    var nextButton = UIButton()
    
    
    let heading = UILabel(),
    username = UITextField(),
    password = UITextField()
    var testMyLabel = MyUILabel()
   var nameField = MyUITextField()
    
//    let loveFirst = MyUILabel(frame: .zero)
    
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
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.9) {
          //  self.heading.center.x += self.view.bounds.width
//            self.leftCons =  self.heading.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: view.frame.width)
//            self.leftCons?.isActive = true
        }
    }
//    func setupBottomTabBar(){
//        view.addSubview(bottomTab)
//        bottomTab.translatesAutoresizingMaskIntoConstraints = false
//        //bottomTab.backgroundColor = .gray
//        bottomTab.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        bottomTab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        bottomTab.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        if #available(iOS 11.0, *) {
//            bottomTab.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        } else {
//            bottomTab.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        }
//    }
    var leftCons : NSLayoutConstraint?
    
    func setupLoginUI(){
        view.addSubview(heading)
        view.addSubview(username)
        view.addSubview(password)
        
        
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        
        leftCons =  heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        leftCons?.constant = 909
//        leftCons?.isActive = false
        
        heading.heightAnchor.constraint(equalToConstant: 60).isActive = true
        heading.text = "Heading"
        heading.textColor = .red
        heading.font = UIFont.boldSystemFont(ofSize: 40)
        
        self.testMyLabel = MyUILabel(frame: .zero, text: "Awesome", textColor: .blue, fontSize: UIFont.systemFont(ofSize: 30), textAlign: .center)
        view.addSubview(testMyLabel)
        testMyLabel.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 20).isActive = true
        testMyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        testMyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        testMyLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        testMyLabel.backgroundColor = .red
        
        let leftIcon = UIImage(named: "checkbox-on")!
        self.nameField = MyUITextField(frame: .zero, placeholderText: "Email", leftIcon )
      
//        nameField.keyboardType = .decimalPad
//        nameField.isSecureTextEntry = true
//        self.nameField.isIconShow = true
        view.addSubview(nameField)
        nameField.topAnchor.constraint(equalTo: testMyLabel.bottomAnchor, constant: 20).isActive = true
               nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
               nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
               nameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        nameField.
    }
}

