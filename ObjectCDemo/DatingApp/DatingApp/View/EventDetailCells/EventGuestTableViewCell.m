//
//  EventGuestTableViewCell.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "EventGuestTableViewCell.h"
#import "GuestCircleView.h"

@implementation EventGuestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layerView.layer.cornerRadius = 5.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadWithGuestArray:(NSArray *)guestArray{
    for (UIView *subview in self.layerView.subviews) {
        [subview removeFromSuperview];
    }
    self.guestScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.layer.frame.size.width, self.layer.frame.size.height)];
    self.guestScrollView.backgroundColor = [UIColor clearColor];
    [self.layerView addSubview:self.guestScrollView];
    
    self.guestViewArray = [NSMutableArray new];
    
    for (NSInteger i = 0; i < guestArray.count; i++) {
        CGFloat padding = 5;
        CGFloat width = 70;
        CGFloat x = padding*(i+1) + width*i;
        GuestCircleView *guestView = [[GuestCircleView alloc]initWithFrame:CGRectMake(x, padding, width, width)];
        guestView.guestModel = [guestArray objectAtIndex:i];
        [self.guestScrollView addSubview:guestView];
        guestView.tag = i;
        [self.guestViewArray addObject:guestView];
        if (i == (guestArray.count-1)) {
            [self.guestScrollView setContentSize:CGSizeMake(x + width + padding, width + 2*padding)];
        }
    }
}
@end
