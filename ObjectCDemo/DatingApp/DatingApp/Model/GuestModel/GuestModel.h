//
//  GuestModel.h
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuestModel : NSObject

@property (nonatomic, strong) NSString *guestLastname;
@property (nonatomic, strong) NSString *guestFirstname;

- (GuestModel *)initWithDictionary:(NSDictionary *)dict;
- (NSString *)getName;
@end
