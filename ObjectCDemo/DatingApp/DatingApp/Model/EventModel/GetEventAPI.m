//
//  GetEventAPI.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "GetEventAPI.h"
#define GET_EVENT_URL @"http://104.236.141.246/api/events"

@implementation GetEventAPI
- (NSURL *)getURL{
    return [NSURL URLWithString:GET_EVENT_URL];
}

- (id)parseResponse:(id)response{
    if ([response isKindOfClass:[NSArray class]]) {
        NSMutableArray *results = [NSMutableArray new];
        for (NSDictionary *dict in response) {
            EventModel *event = [[EventModel alloc]initWithDictionary:dict];
            [results addObject:event];
        }
        NSLog(@"results --> %@", results);
        return results;
    }
    return nil;
}
@end
