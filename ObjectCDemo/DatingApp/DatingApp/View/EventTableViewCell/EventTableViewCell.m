//
//  EventTableViewCell.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell
@synthesize eventModel = _eventModel;

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layerView.layer.cornerRadius = 5.0f;
    self.layerView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEventModel:(EventModel *)eventModel{
    _eventModel = eventModel;
    self.eventNameLabel.text = eventModel.eventName;
    self.eventTimeLabel.text = eventModel.eventDate;
    self.eventAddressLabel.text = eventModel.eventAddress;
    self.eventCountryLabel.text = eventModel.eventCountry;
}
@end
