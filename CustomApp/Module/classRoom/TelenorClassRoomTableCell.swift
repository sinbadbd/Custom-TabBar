//
//  TelenorClassRoomTableCell.swift
//  MyTelenor
//
//  Created by Imran on 21/9/20.
//  Copyright © 2020 Portonics. All rights reserved.
//

import UIKit
import Kingfisher

class TelenorClassRoomTableCell: UITableViewCell {
    
    
    
    let iconImage       = UIImageView()
    let titleWithDesLbl = UILabel()
    let viewMoreButton  = UIButton()
    
    let mainContainer   = UIView()
    
    var classRoomPopup  : TmClassRoomPopupView?
    var classRoom = [String:Any]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func setupClassRoomUI(){
        //        self.backgroundColor = .clear
        //        contentView.addSubview(mainContainer)
        
        /*
         mainContainer.translatesAutoresizingMaskIntoConstraints = false
         mainContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
         mainContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
         mainContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
         mainContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
         */
        
        self.backgroundColor = .clear
        mainContainer.layer.cornerRadius = 6//rgba(0,0,0,0.27)
        mainContainer.backgroundColor = hexToUIColor(hex:"#E7EEF4")
        contentView.addSubview(mainContainer)
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.position(top: contentView.topAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, insets: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
        
        
        mainContainer.addSubview(iconImage)
        mainContainer.addSubview(titleWithDesLbl)
        mainContainer.addSubview(viewMoreButton)
        
        // iconImage.centerYInSuperview()
        iconImage.size(  width: 100, height: 100)
        iconImage.backgroundColor = .red
        
        //        getBannerImage(imageUrl: icon)
        
        iconImage.position(top: mainContainer.topAnchor, left: mainContainer.leadingAnchor,insets: .init(top: 20, left: 20, bottom: 10, right: 0))
        
        titleWithDesLbl.position(top: mainContainer.topAnchor, left: iconImage.trailingAnchor, right: mainContainer.trailingAnchor,insets: .init(top:20, left: 20, bottom: 0, right: 10))
        
        //        titleWithDesLbl.size(dimensionHeight: mainContainer.heightAnchor)
        titleWithDesLbl.numberOfLines = 0
        
        
        viewMoreButton.position(top: titleWithDesLbl.bottomAnchor, bottom: mainContainer.bottomAnchor, right: mainContainer.trailingAnchor, insets: .init(top: 15, left: 0, bottom: 15, right: 15))
        
        //        viewMoreButton.backgroundColor = .red
        viewMoreButton.size(width: 100, height: 40)
        //        viewMoreButton.setTitle("Learn More".uppercased(), for: .normal)
        //        viewMoreButton.titleLabel?.font = UIFont(name: appFontBold, size: 14)
        viewMoreButton.addTarget(self, action: #selector(handlePopupBtn), for: .touchUpInside)
        //        viewMoreButton.setTitleColor(btnColorBlue, for: .normal)
        viewMoreButton.frame = CGRect(x: 10, y: 0, width: viewMoreButton.frame.width, height: 20)
        //        viewMoreButton.backgroundColor = .red
        let learnMoreLbl = UILabel()
        learnMoreLbl.frame = CGRect(x: 0, y: 9, width: 85, height: 16)
        learnMoreLbl.textAlignment = .center
        learnMoreLbl.text = "Learn More".uppercased()
        learnMoreLbl.font = UIFont.init(name: "appFontBold", size: 12)
        learnMoreLbl.textColor = btnColorBlue
        viewMoreButton.addSubview(learnMoreLbl)
        
        var rightArrowIcon = UIImageView()
        rightArrowIcon = UIImageView(frame: CGRect(x: learnMoreLbl.frame.origin.x+learnMoreLbl.frame.width+5, y: 8, width: 10, height: 16))
        rightArrowIcon.image = UIImage(named: "chevron-right")
        viewMoreButton.addSubview(rightArrowIcon)
        
        
        
    }
    @objc func handlePopupBtn(_ button:UIButton){
        print(button.tag)
        print("hiiii")
        showpopup()
        classRoomPopup?.setPopupMessage(setTitle: "Telenor Classroom", setMessage: "You will be redirected to selected Classroom.(Note - Data charges applied for browsing)", popupType: .popupConfirmation)
        
    }
    
    func showpopup(){
        
        let window = UIApplication.shared.keyWindow!
        classRoomPopup = TmClassRoomPopupView()
        classRoomPopup?.delegate = self
        window.addSubview(classRoomPopup!)
        self.classRoomPopup?.anchor(top: window.topAnchor,
                                    leading: window.leadingAnchor,
                                    bottom: window.bottomAnchor,
                                    trailing: window.trailingAnchor)
        self.classRoomPopup?.contentViewPopup.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
        UIView.animate(withDuration: 0.4) {
            self.classRoomPopup?.contentViewPopup.transform = CGAffineTransform.identity
        }
        
    }
    
    func getBannerImage(imageUrl: String?){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            let url = URL(string: imageUrl ?? "")
            if url != nil {
                self.iconImage.kf.setImage(with: url, completionHandler:  { result in
                    switch result {
                    case .success(let value):
                        print("Image: \(value.image). Got from: \(value.cacheType)")
                        //if value.image != nil{
                        self.iconImage.image = value.image
                        let ratio = value.image.size.height/value.image.size.width
                        let hAnchor = self.iconImage.heightAnchor.constraint(equalTo: self.iconImage.widthAnchor, multiplier: ratio)
                        self.iconImage.size(hAnchor: hAnchor)
                    //}
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                })
                
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TelenorClassRoomTableCell: ClassRoomProtocol {
    func classRoomPressbtn(sender: UIButton) {
        
        //        let data =  classRoom[
        let link = classRoom["link"] as? String ?? ""
        let link_in_app = classRoom["is_extranal"] as? Int ?? 0
        print("link_in_app: \(link_in_app)")
        
        if link_in_app == 1 {
            if let url = URL(string: link) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
            }
        } else {
            if link != "" {
                if let url = URL(string: link) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        // Fallback on earlier versions
                    }
                }
//                let vc = WebVC()
//                vc.urlString = link
//                /*
//                 if cardTitle != "" {
//                 vc.pageTitle = cardTitle
//                 }else {
//                 vc.pageTitle = title
//                 }*/
//
//                navController.pushViewController(vc, animated: true)
            }
        }
    }
}
