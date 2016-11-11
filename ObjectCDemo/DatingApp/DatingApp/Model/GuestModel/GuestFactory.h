//
//  GuestFactory.h
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import <Foundation/Foundation.h>

@class GuestFactory;
@protocol GuestFactoryDelegate <NSObject>

@optional
- (void)getGuestOfEventWithSuccessHandler:(NSArray *)results;
- (void)getGuestOfEventWithFailureHandler:(NSError *)error;

@end

@interface GuestFactory : NSObject
- (void)getGuestOfEvent:(EventModel *)event withDelegation:(id<GuestFactoryDelegate>)delegation;

@end
