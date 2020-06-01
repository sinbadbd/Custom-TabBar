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
        
        ///heading.center.x -= view.bounds.width
        
    }
}

