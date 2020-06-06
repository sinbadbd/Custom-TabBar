//
//  HorizontalItemList.swift
//  CustomApp
//
//  Created by Imran on 6/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit

class HorizontalItemList: UIScrollView, UIScrollViewDelegate {
    
    var didSelectItem : ((_ index:Int) ->())?
    
    let buttonWidth:CGFloat = 60.0
    let padding:CGFloat = 10.0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
//        self.
    }
    
    
    
    convenience init(inView: UIView) {
        let rect = CGRect(x: inView.frame.width, y: 120.0, width: inView.frame.width, height: 60.0)
        self.init(frame: rect)
        
        alpha = 0.0
        
        for i in 0..<10 {
            let image = UIImage(named: "summericons_100px_0\(i).png")
            let imageView = UIImageView(image: image)
            imageView.center = CGPoint(x: CGFloat(i) * buttonWidth + buttonWidth/2, y: buttonWidth/2)
            imageView.tag = i
            imageView.layer.borderColor = UIColor.blue.cgColor
            imageView.layer.borderWidth = 1
            imageView.isUserInteractionEnabled = true
            addSubview(imageView)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(HorizontalItemList.didTapImage))
            imageView.addGestureRecognizer(tap)
        }
         contentSize = CGSize(width: padding * buttonWidth, height:  60)
    }
    
    @objc func didTapImage(_ tap: UITapGestureRecognizer){
        didSelectItem?(tap.view!.tag)
         print(tap.view!.tag)
    }
    
    
    override func didMoveToSuperview() {
      super.didMoveToSuperview()
      
      guard superview != nil else {
        return
      }
      
      UIView.animate(withDuration: 1.0, delay: 0.01, usingSpringWithDamping: 0.5,
        initialSpringVelocity: 10.0, options: .curveEaseIn,
        animations: {
          self.alpha = 1.0
          self.center.x -= self.frame.size.width
        },
        completion: nil
      )
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
