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
    
    let scrollView = UIScrollView(),
    contentView = UIView(),
    containerView = UIView()
    var contentHeight:NSLayoutConstraint?
    // var isTabBarShow = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //        if !isTabBarShow {
        //            print(isTabBarShow)
        //            setupBottomTabBar()
        //
        //        }
        //        self.navigationController!.navigationBar.isHidden = false
        
        
        setupBaseUI()
        
    }
    
    func setupBaseUI() {
        
        
        //containerView.backgroundColor = .white
        self.view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //
        //          //statusBarView.backgroundColor = .blue
        //          statusBarView.translatesAutoresizingMaskIntoConstraints = false
        //          self.view.addSubview(statusBarView)
        //
        //
        //          statusBarHeight = statusBarView.heightAnchor.constraint(equalToConstant: UIApplication.shared.statusBarFrame.height)
        //          statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //          statusBarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //          statusBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //          //statusBarView.heightAnchor.constraint(equalToConstant: ).isActive = true
        //          statusBarHeight!.isActive = true
        //
        //          //topBarView.backgroundColor = .cyan
        //          topBarView.clipsToBounds = true
        //          topBarView.translatesAutoresizingMaskIntoConstraints = false
        //          self.view.addSubview(topBarView)
        //
        //          topBarHeight = topBarView.heightAnchor.constraint(equalToConstant: 40.dynamic())
        //          topBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //          topBarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //          topBarView.topAnchor.constraint(equalTo: statusBarView.bottomAnchor).isActive = true
        //          topBarHeight!.isActive = true
        
        //scrollView.backgroundColor = .red
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        self.view.addConstraints([
            NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: scrollView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        //contentView.backgroundColor = .purple
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentHeight = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 0)
        
        scrollView.addConstraints([
            NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            contentHeight!
        ])
        
        //yourView.addConstraint(NSLayoutConstraint(item: yourView, attribute: .height, relatedBy: .equal, toItem: yourView, attribute: .width, multiplier: 9.0 / 16.0, constant: 0))
        
        //setupTopbar()
        
        /*
         DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
         //self.contentHeight!.constant = 5000
         self.resetBase()
         
         }
         */
        
    }
    
    
    func resetBase() {
        print("bbkjk")
        self.view.layoutIfNeeded()
        self.contentHeight!.constant = scrollView.frame.size.height
        
    }
    func setContentHeight(height:CGFloat) {
        self.contentHeight!.constant = height+20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isHidden = false
    }
    
}
