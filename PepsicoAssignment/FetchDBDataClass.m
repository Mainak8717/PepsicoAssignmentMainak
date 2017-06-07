//
//  FetchDBDataClass.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "FetchDBDataClass.h"

@implementation FetchDBDataClass

+ (id)sharedManager {
    static FetchDBDataClass *dbManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbManager = [[self alloc] init];
    });
    return dbManager;
}

@end
