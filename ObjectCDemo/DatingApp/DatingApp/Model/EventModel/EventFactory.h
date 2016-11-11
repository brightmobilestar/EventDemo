//
//  EventFactory.h
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetEventAPI.h"

@class EventFactory;
@protocol EventFactoryDelegate <NSObject>

@optional
- (void)getEventWithSuccessHandler:(NSArray *)results;
- (void)getEventWithFailureHandler:(NSError *)error;

@end

@interface EventFactory : NSObject
- (void)getEventWithDelegation:(id<EventFactoryDelegate>)delegation;

@end
