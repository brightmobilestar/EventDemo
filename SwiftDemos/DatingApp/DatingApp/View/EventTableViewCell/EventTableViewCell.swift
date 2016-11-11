//
//  EventTableViewCell.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var layerView: UIView!
    
    var eventModel : EventModel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        layerView.layer.cornerRadius = 5
        layerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setEventModel(event : EventModel) {
        eventModel = event
        eventNameLabel.text = event.eventName
        timeLabel.text = event.eventDate
        addressLabel.text = event.eventAddress
        countryLabel.text = event.eventCountry
    }
    
}
