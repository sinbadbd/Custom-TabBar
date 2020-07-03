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
    
    let bgImageView = UIImageView()
    
    var alerView = AlertView()
    
    
    var cloud1 =  UIImageView()
    var cloud2 =  UIImageView()
    var cloud3  =  UIImageView()
    var cloud4 =  UIImageView()
    
    //    let visualEffect : UIVisualEffectView = {
    //        let blurEffect = UIBlurEffect(style: .light)
    //        let view = UIVisualEffectView(effect: blurEffect)
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()
    
    
    
    // MARK: NSLayoutConstraint
    var nameLeftCons : NSLayoutConstraint?
    var nameRightCons: NSLayoutConstraint?
    var nameWidthCons: NSLayoutConstraint?
    
    var passWidthCons: NSLayoutConstraint?
    var passLeftCons : NSLayoutConstraint?
    var passRightCons: NSLayoutConstraint?
    
    
    var saveAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        resetBase()
        // setupBottomTabBar()
    //    isTabBarShow = true
     //   print(isTabBarShow)
        //setupLoginUI()
        setupBottomTabBar()
        
        self.navigationController!.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        
     ///   isTabBarShow = true
        // if saveAnimation == true {
        
        self.setupLoginUI()
        //    saveAnimation = false
        // }
    }
    override func viewDidAppear(_ animated: Bool) {
        self.setAnimation()
    }
    
    
    
    func setupLoginUI(){
        
        
        view.addSubview(bgImageView)
        bgImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 70, right: 0), size: .init(width: bgImageView.frame.width, height: bgImageView.frame.height))
        bgImageView.image = UIImage(named: "bg-sunny")
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.zPosition = -4
        
        
        
        view.addSubview(cloud1)
        view.addSubview(cloud2)
        view.addSubview(cloud3)
        view.addSubview(cloud4)
        
        cloud1.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 40, left: -50, bottom: 0, right: 0), size: .init(width: 120, height: 50))
        cloud1.image = UIImage(named: "bg-sunny-cloud-1")
        cloud1.contentMode = .scaleAspectFill
        cloud1.layer.masksToBounds = true
        cloud1.alpha = 0
        cloud2.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 60, left:0, bottom: 0, right: 30), size: .init(width: 140, height: 50))
        cloud2.image = UIImage(named: "bg-sunny-cloud-2")
        cloud2.contentMode = .scaleAspectFill
        cloud2.layer.masksToBounds = true
        cloud2.alpha = 0
        cloud3.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 290, left:30, bottom: 0, right: 30), size: .init(width: 190, height: 80))
        cloud3.image = UIImage(named: "bg-sunny-cloud-3")
        cloud3.contentMode = .scaleAspectFill
        cloud3.layer.masksToBounds = true
        cloud3.alpha = 0
        
        
        view.addSubview(heading)
        //        view.addSubview(username)
        view.addSubview(password)
        
        //MARK: WITHOUT ANIMATION
        //        let leftIconName = UIImage(named: "locked-2")!
        //        self.nameField = MyUITextField(frame: .zero, placeholderText: "Email", leftIconName)
        //        nameField.keyboardType = .emailAddress
        //        view.addSubview(nameField)
        //        nameField.alpha = 0
        //        nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        //        nameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //
        //        nameLeftCons = nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        //        nameLeftCons?.isActive = false
        //
        //        nameRightCons = nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        //        nameRightCons?.isActive = false
        
        
        //MARK: WITH ANIMATION
        view.addSubview(username)
        let leftIconName = UIImage(named: "locked-2")!
        self.nameField = MyUITextField( placeholderText: "Email", leftIconName)
        nameField.keyboardType = .emailAddress
        view.addSubview(nameField)
        //        nameField.alpha = 0
        nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameWidthCons = nameField.widthAnchor.constraint(equalToConstant: 0)
        nameWidthCons?.isActive = true
        //
        nameLeftCons = nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        nameLeftCons?.isActive = false
        
        nameRightCons = nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        nameRightCons?.isActive = false
        
        
        
        
        let leftIconEmail = UIImage(named: "archive-2")!
        self.passwordField = MyUITextField( placeholderText: "password", leftIconEmail)
        passwordField.keyboardType = .decimalPad
        passwordField.isSecureTextEntry = true
        view.addSubview(passwordField)
        // passwordField.anchor(top: nameField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding:.init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: passwordField.frame.width, height: 40))
        
        
        
        passwordField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passWidthCons = passwordField.widthAnchor.constraint(equalToConstant: 0)
        passWidthCons?.isActive = true
        //
        passLeftCons = passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        passLeftCons?.isActive = false
        
        passRightCons = passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        passRightCons?.isActive = false
        
        
        
        
        
        
        
        self.submitButton  = MyButton( setTitle: "Submit", bgColor: .blue, textColor: .white)
        view.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        
        
    }
    @objc func handleSubmit(sender:UIButton){
        UIView.animate(withDuration: 0.5, animations: {
            sender.alpha = 0.5
        }) { (Bool) in
            sender.alpha = 1
            var name =  self.nameField.text ?? ""
            var pass =  self.passwordField.text ?? ""
            
            self.showAlertMessage()
            
            if name == "" || pass == "" {
                print("Missing Field")
                self.alerView.showAlert(title: "Failed 🙁", message: "Missing entry field", alertType: .Failed)
            }else {
                self.alerView.showAlert(title: "Success 😁", message: "name: \(name) pass: \(pass)", alertType: .success)
                name = ""
                pass = ""
            }
        }
    }
    
    func setAnimation() -> Void {
        
        
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .transitionCurlUp, animations: {
            self.nameWidthCons?.isActive = false
            self.nameLeftCons?.isActive =  true
            self.nameRightCons?.isActive = true
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.9, delay: 0.6, options: .transitionCurlUp, animations: {
            self.passWidthCons?.isActive = false
            self.passLeftCons?.isActive =  true
            self.passRightCons?.isActive = true
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
           self.cloud1.alpha = 1.0
         }, completion: nil)

         UIView.animate(withDuration: 0.5, delay: 0.7, options: [], animations: {
           self.cloud2.alpha = 1.0
         }, completion: nil)

         UIView.animate(withDuration: 0.5, delay: 0.9, options: [], animations: {
           self.cloud3.alpha = 1.0
         }, completion: nil)
                
    }
    
    
    func showAlertMessage(){
        self.view.addSubview(self.alerView)
        self.alerView.anchor(top: self.view.topAnchor,
                             leading: self.view.leadingAnchor,
                             bottom: self.view.bottomAnchor,
                             trailing: self.view.trailingAnchor,
                             padding: .init(),
                             size: .init(width: self.view.frame.width,
                                         height: self.alerView.frame.height)
        ) 
        
    }
    
    func setupBottomTabBar(){
        view.addSubview(bottomTab)
        bottomTab.translatesAutoresizingMaskIntoConstraints = false
        //bottomTab.backgroundColor = .gray
        bottomTab.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomTab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomTab.heightAnchor.constraint(equalToConstant: 50).isActive = true
        if #available(iOS 11.0, *) {
            bottomTab.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            bottomTab.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}

