//
//  EventGuestTableViewCell.h
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventGuestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *layerView;

@property (nonatomic, strong) UIScrollView *guestScrollView;
- (void)reloadWithGuestArray:(NSArray *)guestArray;

@property (nonatomic, strong) NSMutableArray *guestViewArray;
@end
