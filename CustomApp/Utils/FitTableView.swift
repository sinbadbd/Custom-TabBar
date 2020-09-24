//
//  FitTableView.swift
//  MyTelenor
//
//  Created by Nazim Uddin on 9/1/20.
//  Copyright © 2020 Portonics. All rights reserved.
//

import UIKit

class FitTableView: UITableView {

        override var intrinsicContentSize: CGSize {
            self.layoutIfNeeded()
            return self.contentSize
        }

        override var contentSize: CGSize {
            didSet{
                self.invalidateIntrinsicContentSize()
            }
        }

        override func reloadData() {
            super.reloadData()
            self.invalidateIntrinsicContentSize()
        }
    

}
