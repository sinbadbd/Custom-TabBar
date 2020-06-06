//
//  Helper.swift
//  CustomApp
//
//  Created by Imran on 6/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class Helper : UIViewController{
    var alerView = AlertView()
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlertMessage()
        print("hi")
    }
     func showAlertMessage(){
           self.view.addSubview(self.alerView)
           self.alerView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
                                leading: self.view.leadingAnchor,
                                bottom: self.view.bottomAnchor,
                                trailing: self.view.trailingAnchor,
                                padding: .init(),
                                size: .init(width: self.view.frame.width,
                                            height: self.alerView.frame.height)
           )
           
       }
}
