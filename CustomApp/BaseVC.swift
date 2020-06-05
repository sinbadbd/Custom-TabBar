//
//  BaseVC.swift
//  CustomApp
//
//  Created by Imran on 22/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class BaseVC: UIViewController {
     var bottomTab  = BottomTabView()
    
    
    var isTabBarShow = false
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isTabBarShow {
            print(isTabBarShow)
            setupBottomTabBar()
        }
//        self.navigationController!.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isHidden = false
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
