//
//  TmClassRoomPopupView.swift
//  MyTelenor
//
//  Created by Imran on 21/9/20.
//  Copyright © 2020 Portonics. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ClassRoomProtocol {
    @objc optional func classRoomPressbtn(sender:UIButton)
}

class TmClassRoomPopupView: UIView {
    
    
    enum PopupType {
        case popupConfirmation
    }
    
    
    let mainContainer       = UIView()
    let contentViewPopup    = UIView()
 
    let popupTitle          = UILabel()
    let closeButton         = UIButton()
    let buttonConfirm       = UIButton()
 
 
    
    @objc var delegate : ClassRoomProtocol!
    
    
    let imageContainer = UIView()
    let popupImage     = UIImageView()
    let imageCloseBtn  = UIButton()
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        setPopupUI()
    }
    
    override func layoutSubviews() {
        layoutIfNeeded()
    }
    
    func setPopupUI(){
        
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
                                padding: .init(top: 0, left: 20, bottom: 0, right:   20)
        )
        contentViewPopup.centerInSuperview()
        contentViewPopup.layer.cornerRadius = 8
        contentViewPopup.backgroundColor = .white
        
        
        
        
        contentViewPopup.addSubview(closeButton)
        closeButton.anchor(top: contentViewPopup.topAnchor,
                           leading: nil,
                           bottom: nil,
                           trailing: contentViewPopup.trailingAnchor,
                           padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                           size: CGSize(width: 80 , height: 50)
        )
        // closeButton.backgroundColor = .red
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(handleCloseBtn), for: .touchUpInside)
        closeButton.backgroundRect(forBounds: CGRect(x: 0, y: 0, width: 20, height: 20))
        closeButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 10, right: 20)
        
        
        contentViewPopup.addSubview(popupTitle)
        popupTitle.position(top: closeButton.bottomAnchor, left: contentViewPopup.leadingAnchor, bottom: nil, right: contentViewPopup.trailingAnchor, insets: .init(top: 10, left: 20, bottom: 0, right: 20))
        popupTitle.text = "confirm purchase"
        popupTitle.textAlignment = .center
        popupTitle.font = UIFont(name: "appFontBold", size: 18)
        popupTitle.numberOfLines = 0
        
      
        contentViewPopup.addSubview(buttonConfirm)
        buttonConfirm.anchor(top: popupTitle.bottomAnchor, leading: nil, bottom: contentViewPopup.bottomAnchor, trailing: nil, padding: .init(top: 15, left: 0, bottom: 20, right: 0))
        //        buttonConfirm.centerInSuperview()
        buttonConfirm.centerXInSuper()
        
     }
    
   
    @objc func imagePopupColse(){
        removeFromSuperview()
    }
    @objc func pressedOkButton(_ sender: UIButton){
        if self.delegate != nil {
            self.delegate.classRoomPressbtn?(sender: sender)
        }
       removeFromSuperview()
    }
 
    
    func setPopupMessage( setTitle: String? = nil,setMessage: String? = nil, popupType: PopupType){
        switch popupType {
        case .popupConfirmation: 
            self.popupTitle.attributedText = getAttributtedMsg(title: setTitle, msg: setMessage)
             self.setButtonStyle(btnTitle: "Ok")
            self.buttonConfirm.addTarget(self, action: #selector(pressedOkButton), for: .touchUpInside)
   
        default:
            break
        }
    }
    
    // MARK::- MULTIPLE TEXT
    func getAttributtedMsg(title:String?, msg:String?, ischangeColor: Bool? = nil)->NSMutableAttributedString{
        let atrTxt = NSMutableAttributedString(string: "")
        var newLine = ""
        var color = UIColor.init()
        if ischangeColor == true {
            color = UIColor.init(red: 0.05, green: 0.06, blue: 0.015, alpha: 1)
        }else {
            color = UIColor.init(red: 0.05, green: 0.06, blue: 0.015, alpha: 1)
        }
        
        if title != nil {
            let attrTitle: NSMutableAttributedString = getAttributedText(string: title!.uppercased(), font: UIFont(name: "appFontBold", size: 18 )!, color:color , lineSpace: 20, alignment: .center)
            atrTxt.append(attrTitle)
            newLine = "\n"
        }
        if msg != nil {
            let attrValue: NSMutableAttributedString = getAttributedText(string: "\(newLine)\(msg!)", font: UIFont(name: "appFont", size: 14 )!, color: .darkGray, lineSpace: 5, alignment: .center)
            atrTxt.append(attrValue)
        }
        
        //MARK: DELETE NEW LINE:
        while !atrTxt.string.isEmpty && CharacterSet.newlines.contains(atrTxt.string.unicodeScalars.last!) {
            atrTxt.deleteCharacters(in: NSRange(location: atrTxt.length - 1, length: 1))
        }
        
        return atrTxt
    }
    func setButtonStyle(btnTitle: String){
        self.buttonConfirm.setTitle(btnTitle.uppercased(), for: .normal)
        self.buttonConfirm.updateWidth(constant: 120)
        self.buttonConfirm.updateHeight(constant: 40)
        self.buttonConfirm.titleLabel?.font = UIFont(name: "appFont", size: 14)
        // self.buttonConfirm.setTitle("OK", for: .normal)
        self.buttonConfirm.backgroundColor = btnColorBlue
        self.buttonConfirm.layer.cornerRadius = 4
    }
    
    
    @objc func handleCloseBtn(){
        removeFromSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

