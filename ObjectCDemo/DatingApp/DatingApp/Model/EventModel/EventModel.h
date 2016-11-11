//
//  EventModel.h
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject

@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) NSString *eventName;
@property (nonatomic, strong) NSString *eventDate;
@property (nonatomic, strong) NSString *eventAddress;
@property (nonatomic, strong) NSString *eventSuburb;
@property (nonatomic, strong) NSString *eventState;
@property (nonatomic, strong) NSString *eventCountry;

- (EventModel *)initWithDictionary:(NSDictionary *)dict;
@end
