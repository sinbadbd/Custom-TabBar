//
//  MovieListTableViewCell.swift
//  CustomApp
//
//  Created by Imran on 8/6/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class MovieListTableViewCell: UITableViewCell {
    
    let titleLabel = MyUILabel(frame: .zero, text: "text", textColor: .red, fontSize: nil, textAlign: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 101, bottom: 10, right: 10), size: .init(width: titleLabel.frame.width, height: titleLabel.frame.height))
        titleLabel.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
