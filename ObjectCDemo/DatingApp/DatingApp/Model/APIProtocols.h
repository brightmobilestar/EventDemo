//
//  APIProtocols.h
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

@protocol APIProtocols <NSObject>

@optional
- (NSURL *)getURL;
- (id)parseResponse:(id)response;
- (void)getObjectsWithSucessHandler:(void(^)(id response, BOOL finished))successHandler
                        failureHandler:(void(^)(NSError *error))failureHandler;
@end
