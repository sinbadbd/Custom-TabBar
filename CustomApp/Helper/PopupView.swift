//
//  MonsoonPopupView.swift
//  CustomApp
//
//  Created by Imran on 3/7/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

import UIKit


@objc protocol PopupDelegate {
    @objc optional func monsoonPopupClosePressed()
    @objc optional func monsoonPopupSharePressed(sender:UIButton)
    @objc optional func monsoonPopupOkPressed(sender:UIButton)
    @objc optional func monsoonPopupBuyPressed(sender:UIButton)
}


class PopupView: UIView {
    
    
    enum PopupType{
        case wonGame
        case bestWish
        case luckyChance
        case buyNow
        case failed
    }
    
    // MARK: OUTLETS
    let mainContainer  = UIView()
    let contentViewPopup = UIView()
    let statusLogo     = UIImageView()
    let logoImage      = UIImageView()
    let textDesLabel   = UILabel()
    let closeButton    = UIButton()
    let shareWithOkBtn = UIButton()
    
    
    @objc var delegate : PopupDelegate!
    
    var heightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        setPopuiViewUI()
    }
    
    override func layoutSubviews() {
        contentViewPopup.multipleGradientBG(color1: hexToUIColor(hex: "#c0ddb3"), color2: hexToUIColor(hex: "#f5f2db"), color3: hexToUIColor(hex: "#ffffff"), direction: .topToBottom)
    }
    
    func setPopuiViewUI(){
        
        addSubview(mainContainer)
        mainContainer.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: .init(),
                             size: .init(width: mainContainer.frame.width,
                                         height: mainContainer.frame.height)
        )
        
        
        mainContainer.addSubview(contentViewPopup)
        contentViewPopup.anchor(top: nil,
                                leading:  mainContainer.leadingAnchor,
                                bottom: nil,
                                trailing: mainContainer.trailingAnchor,
                                padding: .init(top: 0, left: 40, bottom: 0, right:   40)
            //size: .init(width: .init(), height: 420)
        )
        contentViewPopup.centerInSuperview()
        contentViewPopup.layer.cornerRadius = 8
        contentViewPopup.backgroundColor = .white
        
        
        contentViewPopup.addSubview(statusLogo)
        statusLogo.anchor(top: contentViewPopup.topAnchor,
                          leading: contentViewPopup.leadingAnchor,
                          bottom: nil, trailing: nil,
                          padding: .init(top: 20, left: 20, bottom: 0, right: 0)
                          //size: CGSize(width: statusLogo.frame.width, height: statusLogo.frame.height)
//            size: CGSize(width: 100, height: 28)
        )
        
        statusLogo.image = UIImage(named: "summericons_100px_02")
        statusLogo.contentMode = .scaleAspectFit
        statusLogo.layer.masksToBounds = true
        
        contentViewPopup.addSubview(closeButton)
        closeButton.anchor(top: contentViewPopup.topAnchor,
                           leading: nil,
                           bottom: nil,
                           trailing: contentViewPopup.trailingAnchor,
                           padding: .init(top: 20, left: 0, bottom: 0, right: 20),
                           size: CGSize(width: 16 , height: 16)
        )
        
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(handleCloseBtn), for: .touchUpInside)
        
        
        
        contentViewPopup.addSubview(logoImage)
        logoImage.anchor(top: statusLogo.bottomAnchor,
                         leading: nil, bottom: nil, trailing: nil,
                         padding: .init(top: 20, left: 0, bottom: 0, right: 0)
//            size: CGSize(width:136, height: 72)
        )

        logoImage.centerXInSuperview()
        logoImage.image = UIImage(named: "summericons_100px_02")
        logoImage.contentMode = .scaleAspectFill
        logoImage.layer.masksToBounds = true
        
        contentViewPopup.addSubview(textDesLabel)
        textDesLabel.anchor(top: logoImage.bottomAnchor,
                            leading: contentViewPopup.leadingAnchor,
                            bottom: nil,
                            trailing: contentViewPopup.trailingAnchor,
                            padding: .init(top: 15, left: 20, bottom: 0, right: 20)
        )
        
        textDesLabel.centerXInSuperview()
        textDesLabel.numberOfLines = 0
        textDesLabel.textAlignment = .center
        textDesLabel.lineBreakMode = .byWordWrapping
        
        contentViewPopup.addSubview(shareWithOkBtn)
        shareWithOkBtn.anchor(top: textDesLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: nil,
                              padding: .init(top: 15, left: 0, bottom: 0, right: 0)
        )
        shareWithOkBtn.centerXInSuperview()
        
        
        
        
        
        let marbelImage = UIImageView()
        contentViewPopup.addSubview(marbelImage)
        marbelImage.anchor(top: shareWithOkBtn.bottomAnchor,
                           leading: contentViewPopup.leadingAnchor,
                           bottom: contentViewPopup.bottomAnchor, trailing: contentViewPopup.trailingAnchor,
                           padding: .init(top: 10, left: 20, bottom: 10, right: 20),
                           size: CGSize(width: .init(), height:50)
        )
        
        marbelImage.image = UIImage(named: "marbel_popup")
        marbelImage.contentMode = .scaleAspectFit
        marbelImage.layer.masksToBounds = true
        
    }
    
    @objc func handleCloseBtn(_ sender: UIButton){
        if self.delegate != nil {
            self.delegate.monsoonPopupClosePressed?()
        }
        
        removeFromSuperview()
    }
    
    
    @objc func handleShareButton(_ sender: UIButton){
        
        if self.delegate != nil {
            self.delegate.monsoonPopupSharePressed?(sender: sender)
        }
    }
    
    @objc func handleBuyButton(_ sender: UIButton){
        if self.delegate != nil {
            self.delegate.monsoonPopupBuyPressed?(sender: sender)
        }
    }
    
    
    @objc func handleOkButton(_ sender: UIButton){
        
        if self.delegate != nil {
            self.delegate.monsoonPopupOkPressed?(sender: sender)
        }
        
        removeFromSuperview()
        
    }
    
    
    func showMessage(titleText: String?, detailsText: String?,offerText:String?, popupType: PopupType){
        
        switch popupType {
            
        case .wonGame:
 
            textDesLabel.attributedText = getAttributtedMsg(title: titleText?.uppercased(), msg: detailsText, offer: offerText)
             
            // BUTTON
            shareWithOkBtn.backgroundColor = hexToUIColor(hex: "#3B5998")
            shareWithOkBtn.setTitle("Share", for: .normal)
            shareWithOkBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
            shareWithOkBtn.setImage(UIImage(named: "monsoon_f_logo"), for: .normal)
            shareWithOkBtn.widthAnchor.constraint(equalToConstant: 130).isActive = true
            shareWithOkBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
            shareWithOkBtn.layer.cornerRadius = 20
            
            shareWithOkBtn.addTarget(self, action: #selector(handleShareButton), for: .touchUpInside)
            
        case .luckyChance:
            textDesLabel.attributedText = getAttributtedMsg(title: titleText?.uppercased(), msg: detailsText, offer: offerText)
            // BUTTON
            shareWithOkBtn.backgroundColor = hexToUIColor(hex: "#3B5998")
            shareWithOkBtn.setTitle("Share", for: .normal)
            shareWithOkBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
            shareWithOkBtn.setImage(UIImage(named: "monsoon_f_logo"), for: .normal)
            shareWithOkBtn.widthAnchor.constraint(equalToConstant: 130).isActive = true
            shareWithOkBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
            shareWithOkBtn.layer.cornerRadius = 20
            
            shareWithOkBtn.addTarget(self, action: #selector(handleShareButton), for: .touchUpInside)
            
            
        case .buyNow:
 
            textDesLabel.attributedText = getAttributtedMsg(title: titleText?.uppercased(), msg: detailsText, offer: offerText)
            
            
            // BUTTON
            shareWithOkBtn.backgroundColor = btnColorBlue
            shareWithOkBtn.setTitle("Buy now".uppercased(), for: .normal)
            shareWithOkBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
            shareWithOkBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
            shareWithOkBtn.layer.cornerRadius = 4
            
            shareWithOkBtn.addTarget(self, action: #selector(handleBuyButton), for: .touchUpInside)
            
            
            
        case .bestWish:
            
            // MARK: TOP-LOGO
            statusLogo.isHidden = true
            
            // MARK: BUTTON
            
            textDesLabel.attributedText = getAttributtedMsg(title: titleText?.uppercased(), msg: detailsText, offer: offerText)
            
            shareWithOkBtn.backgroundColor = btnColorBlue
            shareWithOkBtn.setTitle("ok".uppercased(), for: .normal)
            shareWithOkBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
            shareWithOkBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
            shareWithOkBtn.layer.cornerRadius = 4
            
            shareWithOkBtn.addTarget(self, action: #selector(handleOkButton), for: .touchUpInside)
            
        default: break
            // print("Have you done something new?")
        }
    }
    
    // MARK::- MULTIPLE TEXT
    func getAttributtedMsg(title:String?, msg:String?, offer:String?)->NSMutableAttributedString{
        let atrTxt = NSMutableAttributedString(string: "")
        var newLine = ""
        if title != nil {
            let attrTitle: NSMutableAttributedString = getAttributedText(string: title!, font: UIFont(name: "Helvetica", size: 20)!, color:UIColor.init(red: 0, green: 0.48, blue: 0.82, alpha: 1) , lineSpace: 5, alignment: .center)
            atrTxt.append(attrTitle)
            newLine = "\n"
        }
        if msg != nil {
            let attrValue: NSMutableAttributedString = getAttributedText(string: "\(newLine)\(msg!)", font: UIFont(name: "Helvetica", size: 16)!, color: .black, lineSpace: 5, alignment: .center)
            atrTxt.append(attrValue)
        }
        
        if offer != nil {

            let attrValue: NSMutableAttributedString = getAttributedText(string: "\(newLine)\(offer!)", font: UIFont(name: "Helvetica", size: 28)!, color: UIColor.init(red: 0, green: 0.48, blue: 0.82, alpha: 1), lineSpace: 2, alignment: .center)
            atrTxt.append(attrValue)
        }
        
        return atrTxt
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


