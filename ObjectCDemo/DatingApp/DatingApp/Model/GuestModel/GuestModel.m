//
//  GuestModel.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "GuestModel.h"

@implementation GuestModel
- (GuestModel *)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.guestLastname = dict[@"lastname"];
        self.guestFirstname = dict[@"firstname"];
    }
    return self;
}

- (NSString *)getName{
    return [NSString stringWithFormat:@"%@ %@", self.guestFirstname, self.guestLastname];
}
@end
