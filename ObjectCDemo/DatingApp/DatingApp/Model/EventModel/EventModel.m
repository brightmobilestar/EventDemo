//
//  EventModel.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "EventModel.h"

@implementation EventModel
- (EventModel *)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.eventId = [dict[@"id"] stringValue];
        self.eventName = dict[@"name"];
        self.eventDate = dict[@"date"];
        self.eventAddress = dict[@"address"];
        self.eventSuburb = dict[@"suburb"];
        self.eventState = dict[@"state"];
        self.eventCountry = dict[@"country"];
    }
    return self;
}
@end
