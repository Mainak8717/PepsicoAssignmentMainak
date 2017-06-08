//
//  FetchDBDataClass.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "FetchDBDataClass.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation FetchDBDataClass

+ (id)sharedManager {
    static FetchDBDataClass *dbManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbManager = [[self alloc] init];
    });
    return dbManager;
}

- (void)insertDataIntoDB:(NSArray *)arrayOfData{
    
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSError *error = nil;
    
    for (int i = 0; i<arrayOfData.count; i++) {
        
        NSManagedObject *userDetailObj = [NSEntityDescription insertNewObjectForEntityForName:@"UserDetail" inManagedObjectContext:context];
        
        [userDetailObj setValue:[arrayOfData[i] valueForKey:@"name"] forKey:@"name"];
        [userDetailObj setValue:[arrayOfData[i]  valueForKey:@"email"] forKey:@"emailId"];
        [userDetailObj setValue:[arrayOfData[i]  valueForKey:@"id"] forKey:@"id"];
        [userDetailObj setValue:[arrayOfData[i]  valueForKey:@"phone"] forKey:@"phone"];
        [userDetailObj setValue:[arrayOfData[i]  valueForKey:@"website"] forKey:@"website"];
        [userDetailObj setValue:[arrayOfData[i]  valueForKey:@"username"] forKey:@"username"];
        
        NSManagedObject *userAddressObj = [NSEntityDescription insertNewObjectForEntityForName:@"UserAddress" inManagedObjectContext:context];
        
        [userAddressObj setValue:[[arrayOfData[i] valueForKey:@"address"] valueForKey:@"street"] forKey:@"street"];
        [userAddressObj setValue:[[arrayOfData[i] valueForKey:@"address"] valueForKey:@"suite"] forKey:@"suite"];
        [userAddressObj setValue:[[arrayOfData[i] valueForKey:@"address"] valueForKey:@"city"] forKey:@"city"];
        [userAddressObj setValue:[[arrayOfData[i] valueForKey:@"address"] valueForKey:@"zipCode"] forKey:@"zipCode"];
        [userAddressObj setValue:[[arrayOfData[i] valueForKey:@"address"] valueForKey:@"latitude"] forKey:@"latitude"];
        [userAddressObj setValue:[[arrayOfData[i] valueForKey:@"address"] valueForKey:@"longitude"] forKey:@"longitude"];
        [userAddressObj setValue:[arrayOfData[i]  valueForKey:@"id"] forKey:@"userId"];
        
        NSManagedObject *userCompanyDetailObj = [NSEntityDescription insertNewObjectForEntityForName:@"UserCompanyDetail" inManagedObjectContext:context];
        
        [userCompanyDetailObj setValue:[[arrayOfData[i] valueForKey:@"company"] valueForKey:@"name"] forKey:@"name"];
        [userCompanyDetailObj setValue:[[arrayOfData[i] valueForKey:@"company"] valueForKey:@"catchPhrase"] forKey:@"catchPhrase"];
        [userCompanyDetailObj setValue:[[arrayOfData[i] valueForKey:@"company"] valueForKey:@"bs"] forKey:@"bs"];
        [userCompanyDetailObj setValue:[arrayOfData[i]  valueForKey:@"id"] forKey:@"userId"];
        
        
        if (![context save:&error]) {
            NSLog(@"Unable to Save! %@ %@", error, [error localizedDescription]);
        }
    }
}
- (NSArray *)fetchUserDetails{
    
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSError *error = nil;
    
    NSFetchRequest *userDetailRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserDetail"];
    
    NSArray *userDetailReqResult = [context executeFetchRequest:userDetailRequest error:&error];
    if (!userDetailReqResult) {
        NSLog(@"Error fetching User Details: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return userDetailReqResult;
}
- (NSArray *)fetchUserAddress{
    
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSError *error = nil;
    
    NSFetchRequest *userAddressRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserAddress"];
    
    NSArray *userAddressReqResult = [context executeFetchRequest:userAddressRequest error:&error];
    if (!userAddressReqResult) {
        NSLog(@"Error fetching User Address: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return userAddressReqResult;
}
- (NSArray *)fetchUserCompanyDetails{
    
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSError *error = nil;
    NSFetchRequest *userCompanyDetailsRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserCompanyDetail"];
    
    NSArray *userCompanyDetailsReqResult = [context executeFetchRequest:userCompanyDetailsRequest error:&error];
    if (!userCompanyDetailsReqResult) {
        NSLog(@"Error fetching User Address: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return userCompanyDetailsReqResult;
}


@end
