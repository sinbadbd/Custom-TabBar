//
//  OtherVC.swift
//  CustomApp
//
//  Created by Imran on 22/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class OtherVC: UIViewController {
    
    let contentView = UIView()
    let scrollView = UIScrollView()
    let scrollViewContent = UIView()
    
        var popupView = PopupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        setupScrollView()
    }
    
    func setupScrollView(){
//
        view.addSubview(contentView)
        // contentView.backgroundColor = UIColor.init(red: 247/255, green: 242/255, blue: 237/255, alpha: 1)
        contentView.layer.cornerRadius = 4
        contentView.backgroundColor = .red
        contentView.layer.shadowColor = UIColor.darkGray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 2
        
        //
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        contentView.setContentHuggingPriority(.init(rawValue: 250), for: .vertical)
        
        
        
        
        contentView.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        //        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        contentView.addSubview(buttonTap)
        buttonTap.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10).isActive = true
        //  buttonTap.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        buttonTap.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40).isActive = true
        buttonTap.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        buttonTap.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonTap.widthAnchor.constraint(equalToConstant: 80).isActive = true
        buttonTap.addTarget(self, action: #selector(tapTarge), for: .touchUpInside)
    }
    

    func showPopup(){
          
          // -
          let window = UIApplication.shared.keyWindow!
          window.addSubview(popupView)
          self.popupView.anchor(top: window.topAnchor,
                                leading: window.leadingAnchor,
                                bottom: window.bottomAnchor,
                                trailing: window.trailingAnchor)
           
          self.popupView.contentViewPopup.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
          UIView.animate(withDuration: 0.4) {
              self.popupView.contentViewPopup.transform = CGAffineTransform.identity
          }
          
      }
    
    
    
    let textLabel : UILabel = {
        let text = UILabel()
        text.text = ".cView MoreView MoreView"
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    let buttonTap : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View More", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.backgroundColor = .lightText
        button.layer.cornerRadius = 4
        return button
    }()
    
    @objc func tapTarge(){
        print("hi...")
        showPopup()
        
        popupView.showMessage(titleText: "self.gameData.title", detailsText:  "gameData.details", offerText:  "gameData.offer",  popupType: .bestWish)
        
//        popupView.show
//        let vc = DashBoard()
//        navigationController?.pushViewController(vc, animated: true)
    }
}
