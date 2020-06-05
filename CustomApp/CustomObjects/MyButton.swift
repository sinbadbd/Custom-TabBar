//
//  MyButton.swift
//  CustomApp
//
//  Created by Imran on 5/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class MyButton: UIButton {
    
    // var buttonTitle:String!
    convenience init(frame:CGRect = .zero, setTitle:String = "") {
        self.init(frame : frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.backgroundColor = .red
        self.layer.cornerRadius = 4
        self.setTitle(setTitle.uppercased(), for: .normal)
    }
}
