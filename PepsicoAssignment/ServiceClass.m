//
//  ServiceClass.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "ServiceClass.h"

@implementation ServiceClass

+ (id)sharedManager {
    static ServiceClass *serviceManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        serviceManager = [[self alloc] init];
    });
    return serviceManager;
}

-(void)getJsonResponse:(NSString *)urlStr success:(void (^)(NSArray *responseDict))success failure:(void(^)(NSError* error))failure
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error)
                                                    failure(error);
                                                else {
                                                    NSArray *json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    success(json);
                                                }
                                            }];
    [dataTask resume];
}

@end
