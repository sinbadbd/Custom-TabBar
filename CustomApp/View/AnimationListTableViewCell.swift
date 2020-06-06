//
//  AnimationListTableViewCell.swift
//  CustomApp
//
//  Created by Imran on 6/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class AnimationListTableViewCell: UITableViewCell {
    
    
    let iconImage = UIImageView()
    var iconTitle = MyUILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    func setupUI() {
        addSubview(iconImage)
        iconImage.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: nil, trailing: nil,
                         padding:.init(top: 10, left: 10, bottom: 10, right: 10),
                         size: .init(width: 40, height: 40))
        
        iconImage.clipsToBounds = true
        iconImage.layer.masksToBounds = true
        self.iconTitle = MyUILabel(frame: .zero, text: "hha", textColor: .black)
        addSubview(iconTitle)
        iconTitle.anchor(top: topAnchor, leading: iconImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: iconTitle.frame.width, height: iconTitle.frame.height))
        iconTitle.centerYInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
