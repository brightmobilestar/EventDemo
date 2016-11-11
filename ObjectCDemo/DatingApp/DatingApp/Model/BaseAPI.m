//
//  BaseAPI.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "BaseAPI.h"

@implementation BaseAPI
- (NSURL *)getURL{
    return nil;
}

- (id)parseResponse:(id)response{
    return nil;
}

- (void)getObjectsWithSucessHandler:(void (^)(id, BOOL))successHandler failureHandler:(void (^)(NSError *))failureHandler{
    NSURLRequest *request = [NSURLRequest requestWithURL:[self getURL]];
    NSURLSession *taskSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [taskSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error parsing JSON: %@", error);
            failureHandler(error);
            return;
        }
        NSError *e = nil;
        id jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        NSLog(@"JSON: %@", jsonArray);
        if (e) {
            failureHandler(e);
            return;
        }
        if (!jsonArray) {
            successHandler(jsonArray, YES);
        } else {
            successHandler([self parseResponse:jsonArray], YES);
            return;
        }
    }];
    [task resume];
}
@end
