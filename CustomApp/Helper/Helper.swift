//
//  Helper.swift
//  CustomApp
//
//  Created by Imran on 6/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
//class Helper : UIViewController{
//    var alerView = AlertView()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        showAlertMessage()
//        print("hi")
//    }
//     func showAlertMessage(){
//           self.view.addSubview(self.alerView)
//           self.alerView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
//                                leading: self.view.leadingAnchor,
//                                bottom: self.view.bottomAnchor,
//                                trailing: self.view.trailingAnchor,
//                                padding: .init(),
//                                size: .init(width: self.view.frame.width,
//                                            height: self.alerView.frame.height)
//           )
//
//       }
//}

func hexToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//let mainwindow = UIApplication.shared.keyWindow!
let colorBlue = hexToUIColor(hex: "#007AD0")
let btnColorBlue = colorBlue
let txtColorBlue = colorBlue


func getAttributedText(string:String, font:UIFont, color:UIColor, lineSpace:Float, alignment:NSTextAlignment) -> NSMutableAttributedString{
    let textStyle = NSMutableParagraphStyle()
    textStyle.alignment=alignment
    textStyle.lineSpacing=CGFloat(lineSpace)
    //paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
    let aMutableString = NSMutableAttributedString(
        string: string,
        attributes:[NSAttributedString.Key.font:font,NSAttributedString.Key.paragraphStyle:textStyle,NSAttributedString.Key.foregroundColor:color])
    return aMutableString
}



enum GradientDirection {
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
}

extension UIView {
    func multipleGradientBG(color1: UIColor, color2: UIColor, color3:UIColor, direction: GradientDirection) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [color1.cgColor, color2.cgColor,color3.cgColor]
        gradient.cornerRadius = 8
        switch direction {
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        default:
            break
        }
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
