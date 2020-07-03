//
//  SettingsVC.swift
//  CustomApp
//
//  Created by Imran on 22/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class SettingsVC: BaseVC{
    let CELL_MOVIE = "cell"
    var tabScrollView = UIScrollView()
    let buttonWidth:CGFloat = 100.0
    let padding:CGFloat = 10.0
    
    var coinV:UIScrollView!
    let arrayCoin = ["Movie", "TV Serise", "Pofile", "Test","Movie","Movie", "TV Serise", "Pofile", "Test","Movie","Movie", "TV Serise", "Pofile", "Test","Movie","Movie", "TV Serise", "Pofile", "Test","Movie","Movie", "TV Serise", "Pofile", "Test","Movie"]
    
    let tableView = UITableView()
    
    var isSelected = false
    var heightCell:CGFloat = 120
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        resetBase()
        
        //    setupBottomTabBar()
        // setuiSettting()
            self.tableView.delegate = self
          self.tableView.dataSource = self
          tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: CELL_MOVIE)
        //contentView.addSubview(tableView)
       contentView.addSubview(tableView)
        tableView.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
         //  tableView.widthAnchor.constraint(equalToConstant: tableView.frame.width).isActive = true
      //   tableView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
       setContentHeight(height: heightCell*CGFloat(arrayCoin.count))
         tableView.backgroundColor = .red
         tableView.reloadData()
    }
    
    func setuiSettting(){
        
        let contentWidth = self.view.frame.width-10*2 - 10*2
        
        
        coinV = getCoinView(rect: CGRect(x: 10, y: 100 , width: contentWidth, height: 36))
        //        print(coinV)
        view.addSubview(coinV)
        //        setContentHeight(height: coinV.frame.height)
        //        coinV.setNeedsLayout()
        //        self.view.layoutIfNeeded()
        
        
        
        //        tableView.anc
        
        
    }
    
    func getCoinView(rect:CGRect) -> UIScrollView {
        
        let coinView = UIScrollView(frame: rect)
        coinView.showsHorizontalScrollIndicator = false
        for i in 0..<arrayCoin.count {
            let aDict = arrayCoin[i]
            let coinAmount = aDict
            let coinBtn = UIButton(type: .custom)
            coinBtn.tag = i
            coinBtn.addTarget(self, action: #selector(didTapImage), for: .touchUpInside)
            coinBtn.frame = CGRect(x: 73 * CGFloat(i) + 6 * CGFloat(i), y: 0, width: 73 , height: coinView.frame.size.height)
            coinBtn.layer.cornerRadius = coinBtn.frame.size.height*0.43;
            coinBtn.setTitle("\(coinAmount)", for: UIControl.State.normal)
            coinBtn.setTitleColor(.black, for: UIControl.State.normal)
            coinBtn.backgroundColor = .gray
            coinBtn.titleLabel?.font = UIFont(name: "appFont", size: 12)
            coinView.addSubview(coinBtn)
            coinView.contentSize = CGSize(width: coinBtn.frame.origin.x+coinBtn.frame.size.width, height: coinView.frame.size.height)
            
        }
        return coinView
    }
    
    
    @objc func didTapImage(_ sender: UIButton){
        print(sender.tag)
        
        
        for aView in self.coinV.subviews {
            if  aView is UIButton {
                let coinBtn = aView as! UIButton
                coinBtn.setTitleColor(.black, for: UIControl.State.normal)
                coinBtn.backgroundColor = .gray
            }
        }
        sender.setTitleColor(.white, for: UIControl.State.normal)
        sender.backgroundColor = .blue
        
    }
    
    func setupBottomTabBar(){
        view.addSubview(bottomTab)
        bottomTab.translatesAutoresizingMaskIntoConstraints = false
        //        bottomTab.center
        //bottomTab.backgroundColor = .gray
        bottomTab.systemLayoutSizeFitting(.zero, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .defaultHigh)
        bottomTab.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomTab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomTab.heightAnchor.constraint(equalToConstant: 50).isActive = true
        if #available(iOS 11.0, *) {
            bottomTab.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            bottomTab.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCoin.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_MOVIE, for: indexPath) as! MovieListTableViewCell
        cell.titleLabel.text = arrayCoin[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCell
    }
    
}


