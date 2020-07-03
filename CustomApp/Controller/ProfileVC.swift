//
//  ProfileVC.swift
//  CustomApp
//
//  Created by Imran on 22/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class ProfileVC: BaseVC {
    
    
    var topBarView = UIView()
    var titleLabel = MyUILabel()
    var addIcon = MyButton()
    
    var alerView = AlertView()
    var slider:HorizontalItemList!
    
    var topBarHeightCon : NSLayoutConstraint!
    var TitleCenterY:NSLayoutConstraint!
    
    var items: [Int] = [5, 6, 7]
    var isMenuOpen:Bool = false
    
    let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]
    
    let CELL_LIST = "CELL"
    
    let tableView = UITableView()
    let rowHeight:CGFloat = 60
    
//    var setAlert = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
    }
    
    func setupUI(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(AnimationListTableViewCell.self, forCellReuseIdentifier: CELL_LIST)
        //        self.ta
        
        
    //    isTabBarShow = false
        self.navigationController!.navigationBar.isHidden = true
        
        
        view.addSubview(topBarView)
        topBarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topBarView.widthAnchor.constraint(equalToConstant: topBarView.frame.width).isActive = true
        
        topBarHeightCon = topBarView.heightAnchor.constraint(equalToConstant: 60)
        topBarHeightCon.isActive = true
        topBarView.backgroundColor = .lightGray
        
        self.titleLabel = MyUILabel(frame: .zero, text: "Packs List", textColor: .white, fontSize: UIFont.systemFont(ofSize: 18), textAlign: .center)
        
        //        self.titleLabel.co
        topBarView.addSubview(titleLabel)
        titleLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init())
        titleLabel.centerInSuperview()
        
        //        TitleCenterY.constant = titleLabel.center.y
        
        self.addIcon = MyButton(frame: .zero)
        topBarView.addSubview(addIcon)
        addIcon.anchor(top: nil, leading: nil, bottom: nil, trailing: topBarView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20), size: .init(width: 20, height: 20))
        addIcon.centerYInSuperview()
        addIcon.setImage(UIImage(named: "add"), for: .normal)
        addIcon.addTarget(self, action: #selector(actionToggleMenu), for: .touchUpInside)
        
        
        
        // MARK: TABELVIEW CONSTRAIN
        view.addSubview(tableView)
        tableView.anchor(top: topBarView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,size: CGSize(width: .init(), height: CGFloat(rowHeight*CGFloat(itemTitles.count))))
        //        tableView.backgroundColor  = .wh
        
    }
    
    
    @objc func actionToggleMenu(sender:UIButton){
        print(sender.tag)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0, options: .curveEaseIn,animations: {
            self.isMenuOpen = !self.isMenuOpen
            self.topBarHeightCon.constant = self.isMenuOpen ? 200.0 : 60.0
            
            self.titleLabel.text = self.isMenuOpen ? "Selected Item" : "Packs Item"
            
            self.view.layoutIfNeeded()
            
            let angle: CGFloat = self.isMenuOpen ? .pi / 4 : 0.0
            print(angle)
            self.addIcon.transform = CGAffineTransform(rotationAngle: angle)
            //            self.titleLabel.con
            self.titleLabel.superview?.constraints.forEach { constraint in
                if constraint.firstItem === self.titleLabel &&
                    constraint.firstAttribute == .centerX {
                    constraint.constant = self.isMenuOpen ? -120.0 : 0.0
                    return
                }
                if constraint.identifier == "identifier" {
                    constraint.isActive = false
                    //add new constraint
                    //                    titleLabel.CenterY = isMenuOpen.CenterY * 1.0 + 0.0
                    //                  continue
                    return
                }
            }
        },completion: nil)
        
        if isMenuOpen{
            slider = HorizontalItemList(inView: view)
            topBarView.addSubview(slider)
            slider.anchor(top: titleLabel.bottomAnchor, leading: topBarView.leadingAnchor, bottom: nil , trailing: nil, padding: .init(top: 5, left: 10, bottom: 0, right: 5), size: .init(width: slider.frame.width, height: 60))
            
            slider.didSelectItem = { index in
                if !self.items.contains(where: {$0 == index}) {
                    self.items.append(index)
                    self.tableView.reloadData()
                }else {
                    print("alert box need====")
                    self.showAlertMessage()
                    self.alerView.showAlert(title: "Alredy Exist 🙁", message: "Please try again!", alertType: .Failed)
                }
            }
            
        }else {
            slider.removeFromSuperview()
        }
    }
    func showItem(_ index: Int) {
        print("tapped item \(index)")
        let imageView = UIImageView(image: UIImage(named: "summericons_100px_0\(index).png"))
        imageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let conX = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let conBottom = imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: imageView.frame.height)
        let conWidth = imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33, constant: -50.0)
        let conHeight = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        
        NSLayoutConstraint.activate([conX, conBottom, conWidth, conHeight])
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.8, delay: 0.0,
                       usingSpringWithDamping:  0.4, initialSpringVelocity: 0.0,
                       animations: {
                        conBottom.constant = -imageView.frame.size.height/2
                        conWidth.constant = 0.0
                        self.view.layoutIfNeeded()
        },
                       completion: nil
        )
    }
    func showAlertMessage(){
        self.view.addSubview(self.alerView)
        self.alerView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
                             leading: self.view.leadingAnchor,
                             bottom: self.view.bottomAnchor,
                             trailing: self.view.trailingAnchor,
                             padding: .init(),
                             size: .init(width: self.view.frame.width,
                                         height: self.alerView.frame.height)
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: true)
        
    }
    
}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        return items.count
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_LIST, for: indexPath) as! AnimationListTableViewCell
        cell.iconTitle.text = itemTitles[items[indexPath.item]]
        cell.iconImage.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        //        cell.backgroundColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItem(items[indexPath.row])
    }
}
