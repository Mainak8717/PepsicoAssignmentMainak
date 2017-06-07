//
//  ServiceClass.h
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceClass : NSObject

+ (id)sharedManager;
-(void)getJsonResponse:(NSString *)urlStr success:(void (^)(NSArray *responseDict))success failure:(void(^)(NSError* error))failure;
@end
