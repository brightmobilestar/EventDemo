//
//  EventFactory.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "EventFactory.h"

@implementation EventFactory

- (void)getEventWithDelegation:(id<EventFactoryDelegate>)delegation{
    GetEventAPI *getEventAPI = [[GetEventAPI alloc]init];
    [getEventAPI getObjectsWithSucessHandler:^(id response, BOOL finished) {
        if (finished) {
            [delegation getEventWithSuccessHandler:(NSArray *)response];
        }
    } failureHandler:^(NSError *error) {
        [delegation getEventWithFailureHandler:error];
    }];
}
@end
