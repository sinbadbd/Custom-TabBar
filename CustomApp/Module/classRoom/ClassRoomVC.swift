//
//  ClassRoomVC.swift
//  CustomApp
//
//  Created by Imran on 21/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation
import UIKit
 

    class ClassRoomVc : RootVC {
        
        let cell_id = "CELL"
        
        var stackView        : UIStackView?
        //    let tableView        = UITableView()
     //   var cardViewGlobal   = GlobalCardView()
        
        var classRoomView : ClassRoomView?
        var classRoom = [[String:Any]]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupVC()
            // setCarouselCard()
            setupClassRoomUI()
        }
        
        
        func setupVC(){
            topViewHeight?.constant = navigationController!.navigationBar.frame.size.height
            resetBase()
        }
        
//        func setCarouselCard(){
//            cardViewGlobal.isHidden = true
//            contentView.addSubview(cardViewGlobal)
//            cardViewGlobal.position( top:contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor, insets: .init(top: 0, left: 15, bottom: 0, right:  15))
//        }
        
        func setupClassRoomUI(){
            
            
            classRoomView = ClassRoomView()
            //        classRoomView?.backgroundColor = .brown
            contentView.addSubview(classRoomView!)
            
            classRoomView?.position(  top:contentView.bottomAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor,  right: contentView.trailingAnchor, insets: .init(top: 15, left:  0, bottom: 0, right:  0))
            classRoomView?.backgroundColor = .red
            classRoomView?.size( height: 1200)
            
        }
        
        
        /*
        func getXShopData(){
            showActivityIndic(loaderColor: buttonColor)
            MyTMManager.shared.fetchData(urlString: apiURL(type: .xshop), method: HTTPMethod.get, parameters: nil) { (result) in
                hideActivityIndicator()
                
                let shopList = XShopList.init(dict: result)
                //            print("shopList:\(shopList)")
                if shopList.bannerData.count > 0 {
                    self.cardViewGlobal.isHidden = false
                    showRadiusForCardView = true
                    self.cardViewGlobal.advertiseArray = shopList.bannerData
                    self.cardViewGlobal.tableView.reloadData()
                    self.cardViewGlobal.heightAnchor.constraint(equalToConstant:  getSuperViewCardHeight(arrayDict: self.cardViewGlobal.advertiseArray)).isActive = true
                }
            }
        }*/
    }

