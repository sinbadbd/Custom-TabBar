//
//  ProfileVC.swift
//  CustomApp
//
//  Created by Imran on 22/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class ProfileVC: BaseVC {
    
    
    var topBarView = UIView()
    var titleLabel = MyUILabel()
    var addIcon = MyButton()
    
    var topBarHeightCon : NSLayoutConstraint!
    var TitleCenterY:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        isTabBarShow = false
        self.navigationController!.navigationBar.isHidden = true
        
        
        view.addSubview(topBarView)
        topBarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topBarView.widthAnchor.constraint(equalToConstant: topBarView.frame.width).isActive = true
        
        topBarHeightCon = topBarView.heightAnchor.constraint(equalToConstant: 60)
        topBarHeightCon.isActive = true
        topBarView.backgroundColor = .lightGray
        
        self.titleLabel = MyUILabel(frame: .zero, text: "Packs List", textColor: .white, fontSize: UIFont.systemFont(ofSize: 18), textAlign: .center)
        
//        self.titleLabel.co
        topBarView.addSubview(titleLabel)
        titleLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init())
        titleLabel.centerInSuperview()
        
//        TitleCenterY.constant = titleLabel.center.y
        
        self.addIcon = MyButton(frame: .zero)
        topBarView.addSubview(addIcon)
        addIcon.anchor(top: nil, leading: nil, bottom: nil, trailing: topBarView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20), size: .init(width: 20, height: 20))
        addIcon.centerYInSuperview()
        addIcon.setImage(UIImage(named: "add"), for: .normal)
        addIcon.addTarget(self, action: #selector(actionToggleMenu), for: .touchUpInside)
        
    }
    var isMenuOpen:Bool = false
    
    @objc func actionToggleMenu(sender:UIButton){
        print(sender.tag)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0, options: .curveEaseIn,animations: {
            self.isMenuOpen = !self.isMenuOpen
            self.topBarHeightCon.constant = self.isMenuOpen ? 200.0 : 60.0
            
            self.titleLabel.text = self.isMenuOpen ? "Selected Item" : "Packs Item"
            
            self.view.layoutIfNeeded()
            
            let angle: CGFloat = self.isMenuOpen ? .pi / 4 : 0.0
            print(angle)
            self.addIcon.transform = CGAffineTransform(rotationAngle: angle)
//            self.titleLabel.con
            self.titleLabel.superview?.constraints.forEach { constraint in
                if constraint.firstItem === self.titleLabel &&
                    constraint.firstAttribute == .centerX {
                    constraint.constant = self.isMenuOpen ? -120.0 : 0.0
                    return
                }
                if constraint.identifier == "identifier" {
                    constraint.isActive = false
                //add new constraint
//                    titleLabel.CenterY = isMenuOpen.CenterY * 1.0 + 0.0
//                  continue
                    return
                }
            }
        },completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: true)
        
    }
    
}
