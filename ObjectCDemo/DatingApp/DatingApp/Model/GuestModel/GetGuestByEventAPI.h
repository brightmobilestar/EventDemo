//
//  GetGuestByEventAPI.h
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "BaseAPI.h"

@interface GetGuestByEventAPI : BaseAPI
{
    EventModel *eventModel;
}
- (GetGuestByEventAPI *)initWithEvent:(EventModel *)event;
@end
