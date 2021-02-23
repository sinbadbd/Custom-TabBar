//
//  OtherVC.swift
//  CustomApp
//
//  Created by Imran on 22/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import UIKit
class OtherVC: UIViewController {
    
    let contentView = UIView()
    let scrollView = UIScrollView()
    let scrollViewContent = UIView()
    
        var popupView = PopupView()
    
    let internetBubbleView = UIView()
    
    let list = [3,2,1,4,1,2,6,5,10,8,0]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getIndex()
        setupScrollView()
  
    }
    func getIndex(){
        
        internetBubbleView.backgroundColor = .red
        internetBubbleView.frame = CGRect(x: 0, y: 100, width: view.frame.width-20, height: 500)
        view.addSubview(internetBubbleView)
    
//        @discardableResult
        let internetData = mergeSort(arr: list)
        if internetData.count > 0 {
           
            //print("internertList:\(self.internetData)")
            var btnCounter:Int=0
            let paddingX=13
            let paddingY=10
            let column=4
            let btnWidth=Int(Float(self.internetBubbleView.frame.size.width-CGFloat((paddingX*column-1)))/Float(column))//50//Float(self.sizeBtnView.frame.size.width)/Float(column)//
            let btnHeight=35
            let rows=ceil(Double(internetData.count)/Double(column))
            //print(rows)
            for anotherNo  in 0..<Int(rows) {
                for number  in 0..<column {
                    if btnCounter<internetData.count {
                        let info = internetData[btnCounter]
                        let bubbleBtn = UIButton(frame: CGRect(x: (paddingX+btnWidth)*number, y: (paddingY+btnHeight)*anotherNo, width: btnWidth, height: btnHeight))
                        
                        bubbleBtn.tag = info//internetStartingTag+btnCounter
                        bubbleBtn.backgroundColor = UIColor.green
                        bubbleBtn.layer.cornerRadius = 18
                        bubbleBtn.layer.borderWidth = 1
                        bubbleBtn.layer.borderColor = UIColor.lightGray.cgColor
                        bubbleBtn.setTitleColor(UIColor.black, for: .normal)
 
                        bubbleBtn.setTitle("\(info)", for: UIControl.State.normal)
                    
                        //shadowForViewLight(shadow: bubbleBtn)
                        //sizebtn.addTarget(self, action: "sizeButton:", for: UIControlEvents.touchUpInside)
                        bubbleBtn.addTarget(self, action: #selector(self.bubbleBtn), for: UIControl.Event.touchUpInside)
//                        //self.view.addSubview(sizebtn)
//                        bubbleBtn.titleLabel?.textAlignment = .center
//                        bubbleBtn.titleLabel?.font =  UIFont(name: appFontBold, size: 13*factX)
                        self.internetBubbleView.addSubview(bubbleBtn)
                        btnCounter+=1
                    }
                    
                }
            }
            //let  viewH=rows*Double(btnHeight+paddingY)
            //self.internetBubbleViewHCons.constant += CGFloat(viewH)
        }
//        return internetData
    }
    
    func setupScrollView(){
//
        view.addSubview(contentView)
        // contentView.backgroundColor = UIColor.init(red: 247/255, green: 242/255, blue: 237/255, alpha: 1)
        contentView.layer.cornerRadius = 4
        contentView.backgroundColor = .red
        contentView.layer.shadowColor = UIColor.darkGray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 2
        
        //
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        contentView.setContentHuggingPriority(.init(rawValue: 250), for: .vertical)
        
        
        
        
        contentView.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        //        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        contentView.addSubview(buttonTap)
        buttonTap.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10).isActive = true
        //  buttonTap.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        buttonTap.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40).isActive = true
        buttonTap.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        buttonTap.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonTap.widthAnchor.constraint(equalToConstant: 80).isActive = true
        buttonTap.addTarget(self, action: #selector(tapTarge), for: .touchUpInside)
    }
    

    func showPopup(){
          
          // -
          let window = UIApplication.shared.keyWindow!
          window.addSubview(popupView)
          self.popupView.anchor(top: window.topAnchor,
                                leading: window.leadingAnchor,
                                bottom: window.bottomAnchor,
                                trailing: window.trailingAnchor)
           
          self.popupView.contentViewPopup.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
          UIView.animate(withDuration: 0.4) {
              self.popupView.contentViewPopup.transform = CGAffineTransform.identity
          }
          
      }
    
    
    
    let textLabel : UILabel = {
        let text = UILabel()
        text.text = ".cView MoreView MoreView"
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    let buttonTap : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View More", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.backgroundColor = .lightText
        button.layer.cornerRadius = 4
        return button
    }()
    
    
    func mergeSort(arr: [Int])-> [Int] {
        guard arr.count > 1 else {
            return arr
        }
        
        let midIndex = arr.count / 2
        let leftArray = mergeSort(arr: Array(arr[0..<midIndex]))
        let rightArray = mergeSort(arr: Array(arr[midIndex..<arr.count]))
        return merge(left: leftArray, right: rightArray)
    }

    func merge(left: [Int], right: [Int])-> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var orderArray : [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            if (left[leftIndex] < right[rightIndex]) {
                orderArray.append(left[leftIndex])
                leftIndex += 1
            } else if (right[rightIndex] < left[leftIndex]){
                orderArray.append(right[rightIndex])
                rightIndex += 1
                
            } else {
                orderArray.append(left[leftIndex])
                leftIndex += 1
                orderArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderArray.append(left[leftIndex])
            leftIndex += 1
        }
        while rightIndex < right.count {
            orderArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderArray
        
    }
    
    var dataArray = [Int]()
    @objc func bubbleBtn(_ button: UIButton){
//        print(button.tag)
        
        let item = button.tag
        
        dataArray.append(item)
        button.backgroundColor = .white
        
        
        
//        showPopup()
//        popupView.showMessage(titleText: "\(dataArray)", detailsText:  "gameData.details", offerText:  "gameData.offer",  popupType: .bestWish)
 
        
    }
    
    @objc func tapTarge(){
        print("hi...")
  
        let data = dataArray
        
        for item in data {
            print(item)
            var stringArrayCleaned = data.description.replacingOccurrences(of: "", with: "").replacingOccurrences(of: ",", with: ",").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").replacingOccurrences(of: " ", with: "")

            showPopup()
            popupView.showMessage(titleText: "\(stringArrayCleaned)", detailsText:  "gameData.details", offerText:  "gameData.offer",  popupType: .bestWish)
            
        }
        
        
//        print(item)
      
        
//        dataArray.forEach { item in
//
//            print(item)
//            showPopup()
//            popupView.showMessage(titleText: "\(item)", detailsText:  "gameData.details", offerText:  "gameData.offer",  popupType: .bestWish)
//
//        }
    }
}
