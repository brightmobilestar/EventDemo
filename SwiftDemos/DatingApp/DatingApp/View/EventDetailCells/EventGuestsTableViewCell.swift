//
//  EventGuestsTableViewCell.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

class EventGuestsTableViewCell: UITableViewCell {
    @IBOutlet weak var layerView: UIView!
    var scrollView : UIScrollView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        layerView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadView(guests : NSArray) {
        for subView : UIView in layerView.subviews {
            subView.removeFromSuperview()
        }
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: layerView.frame.size.width, height: layerView.frame.size.height))
        scrollView.backgroundColor = UIColor.clear
        layerView.addSubview(scrollView)
        
        let padding : CGFloat = 5
        let width : CGFloat = layerView.frame.size.height - 2*padding
        
        for i:NSInteger in 0..<guests.count {
            let x : CGFloat = padding * CGFloat(i+1) + width * CGFloat(i)
            let guestView : GuestCircleView = GuestCircleView(frame: CGRect(x: x, y: padding, width: width, height: width))
            guestView.setUserModel(user: guests.object(at: i) as! UserModel)
            scrollView.addSubview(guestView)
            if i == (guests.count-1) {
                scrollView.contentSize = CGSize(width: (x+width+padding), height: layerView.frame.size.height)
            }
            
        }
    }
    
}
