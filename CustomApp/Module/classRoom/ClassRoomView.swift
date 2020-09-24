//
//  ClassRoomView.swift
//  MyTelenor
//
//  Created by Imran on 21/9/20.
//  Copyright © 2020 Portonics. All rights reserved.
//


import UIKit
import Alamofire

class ClassRoomView: UIView {
    let cell_id = "CELL"
    
    let tableView  = FitTableView()
    
    let icon = "https://via.placeholder.com/80x80"
    let icon2 = "https://via.placeholder.com/80.png/09f/fff"
    
    var classRoom = [[String:Any]]()
    
    var tableHeightConst: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        serverResponseData()
        
    }
    
    func serverResponseData(){
        AF.request("https://its-rng.com/images/classroom.json").responseJSON { [self] (response) in
            if let response  = response.value as! [String: Any]? {
                if let json = response["data"] as! [String: Any]? {
                    print(json)
                    if let attr = json["attribute"] as! [String: Any]? {
                        if let list = attr["list"] as! [[String: Any]]? {
                            if list.count > 0{
                                self.classRoom = list
                                self.tableView.reloadData()
                                self.classRoomUI()
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        super.updateConstraints()
        self.tableHeightConst?.constant = self.tableView.contentSize.height
    }
    
    func classRoomUI(){
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(TelenorClassRoomTableCell.self, forCellReuseIdentifier: cell_id)
        addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.position( top: topAnchor,left:  leadingAnchor, bottom:  bottomAnchor, right:  trailingAnchor, insets: .init(top: 10, left: 15, bottom: 15, right: 15))
         tableView.backgroundColor  = colorBlue
        tableView.separatorStyle   = .none
        tableView.isScrollEnabled  = false
        tableView.allowsSelection  = false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ClassRoomView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("classRoom-count: \(classRoom.count)")
        return classRoom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_id, for: indexPath) as! TelenorClassRoomTableCell
        
        let index =  classRoom[indexPath.item]
        
        
        
        let title = index["title"] as? String ?? ""
        let description = index["description"] as? String ?? ""
        
        let image = index["image"] as? String ?? ""
        let idNum = index["id"] as? Int ?? 0
        let showIdNumber = index["is_extranal"] as? Int ?? 0
        
        cell.getBannerImage(imageUrl: image)
//
//        let attr1: NSMutableAttributedString = getAttributedText(string: "\(idNum):- \(title)-\(showIdNumber)\n", color: .black, lineSpace: 5, alignment: .left)
//
//        let attr2: NSMutableAttributedString = getAttributedText(string: "\(description)", color: hexToUIColor(hex:"#0C1026"), lineSpace: 0, alignment: .left)
//
//        attr1.append(attr2)
        cell.titleWithDesLbl.text = "\(title) \(description)"
        cell.classRoom = index
        cell.setupClassRoomUI()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // loadData()//maximus comment
        self.layoutSubviews()
    }
    
}
