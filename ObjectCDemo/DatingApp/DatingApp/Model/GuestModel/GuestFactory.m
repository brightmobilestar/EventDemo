//
//  GuestFactory.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "GuestFactory.h"
#import "GetGuestByEventAPI.h"

@implementation GuestFactory
- (void)getGuestOfEvent:(EventModel *)event withDelegation:(id<GuestFactoryDelegate>)delegation{
    GetGuestByEventAPI *getGuestAPI = [[GetGuestByEventAPI alloc]initWithEvent:event];
    [getGuestAPI getObjectsWithSucessHandler:^(id response, BOOL finished) {
        if (finished) {
            [delegation getGuestOfEventWithSuccessHandler:(NSArray *)response];
        }
    } failureHandler:^(NSError *error) {
        [delegation getGuestOfEventWithFailureHandler:error];
    }];
}
@end
