//
//  MyUITextField.swift
//  CustomApp
//
//  Created by Imran on 4/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class MyUITextField :UITextField {
    
    
    let padding = 8
    let size = 20
    var isIconShow = false
    
    convenience init(frame: CGRect = .zero,placeholderText:String? = "placeholderText",_ icon: UIImage) {
        self.init(frame: frame)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.placeholder = placeholderText
        self.backgroundColor = UIColor.white
        self.textColor = UIColor.blue
        self.layer.cornerRadius = 6
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        
        self.leftIcon(icon)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return  CGRect(x: 40, y: 0, width: self.frame.width-45, height: self.frame.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return  CGRect(x: 40, y: 0, width: self.frame.width-45, height: self.frame.height)
    }
    
    func leftIcon(_ icon: UIImage){
          let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
          let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
          iconView.image = icon
          outerView.addSubview(iconView)
          self.leftView = outerView
          self.leftViewMode = .always
    }

    
}
