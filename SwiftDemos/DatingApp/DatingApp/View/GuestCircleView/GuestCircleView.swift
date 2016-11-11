//
//  GuestCircleView.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

class GuestCircleView: UIView {

    var nameLabel : UILabel!
    public var userModel : UserModel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width : CGFloat = frame.size.height - 10
        
        nameLabel = UILabel.init(frame: CGRect(x: 5, y: 5, width: width, height: width))
        nameLabel.backgroundColor = UIColor.clear
        nameLabel.layer.cornerRadius = width/2
        nameLabel.layer.borderColor = UIColor.white.cgColor
        nameLabel.layer.borderWidth = 1
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.numberOfLines = 0
        nameLabel.textColor = UIColor.white
        
        self.addSubview(nameLabel)
    }
    
    func setUserModel(user : UserModel) {
        nameLabel.text = user.getNameString()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
