//
//  EventInforTableViewCell.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

class EventInforTableViewCell: UITableViewCell {

    @IBOutlet weak var layerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layerView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
