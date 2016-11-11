//
//  GetGuestByEventAPI.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "GetGuestByEventAPI.h"

#define API_GET_GUESTS_URL @"http://104.236.141.246/api/guests/"

@implementation GetGuestByEventAPI
- (GetGuestByEventAPI *)initWithEvent:(EventModel *)event{
    self = [super init];
    if (self) {
        eventModel = event;
    }
    return self;
}

- (NSURL *)getURL{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",API_GET_GUESTS_URL, eventModel.eventId]];
}

- (id)parseResponse:(id)response{
    if ([response[@"guests"] isKindOfClass:[NSArray class]]) {
        NSMutableArray *results = [NSMutableArray new];
        for (NSDictionary *dict in response[@"guests"]) {
            GuestModel *guest = [[GuestModel alloc]initWithDictionary:dict];
            [results addObject:guest];
        }
        NSLog(@"results --> %@", results);
        return results;
    }
    return nil;
}
@end
