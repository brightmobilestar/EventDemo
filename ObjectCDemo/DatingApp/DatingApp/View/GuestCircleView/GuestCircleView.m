//
//  GuestCircleView.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "GuestCircleView.h"

@implementation GuestCircleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.height - 10;
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, width, width)];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.layer.cornerRadius = width/2;
        self.nameLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        self.nameLabel.layer.borderWidth = 1.0f;
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.nameLabel setFont:[UIFont systemFontOfSize:10.0f]];
        self.nameLabel.numberOfLines = 0;
        [self addSubview:self.nameLabel];
    }
    return self;
}

- (void)setGuestModel:(GuestModel *)guestModel{
    _guestModel = guestModel;
    self.nameLabel.text = [guestModel getName];
}
@end
