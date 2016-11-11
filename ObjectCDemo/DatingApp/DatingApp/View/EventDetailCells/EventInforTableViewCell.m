//
//  EventInforTableViewCell.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "EventInforTableViewCell.h"

@implementation EventInforTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layerView.layer.cornerRadius = 5.0f;
    self.layerView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
