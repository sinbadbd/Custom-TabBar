//
//  AlertView.swift
//  CustomApp
//
//  Created by Imran on 5/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class AlertView: UIView {
    
    let mainContainer = UIView()
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainContainer)
        mainContainer.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: .init(),
                             size: .init(width: mainContainer.frame.width,
                                         height: mainContainer.frame.height)
        )
        mainContainer.backgroundColor = .black
        mainContainer.alpha = 0.8
        
        mainContainer.addSubview(contentView)
        contentView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(), size: .init(width: 300, height: 300))
        contentView.centerInSuperview()
        contentView.alpha = 1
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
