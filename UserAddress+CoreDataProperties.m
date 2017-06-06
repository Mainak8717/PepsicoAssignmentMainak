//
//  UserAddress+CoreDataProperties.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "UserAddress+CoreDataProperties.h"

@implementation UserAddress (CoreDataProperties)

+ (NSFetchRequest<UserAddress *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserAddress"];
}

@dynamic userId;
@dynamic street;
@dynamic suite;
@dynamic city;
@dynamic zipCode;
@dynamic latittude;
@dynamic longitude;

@end
