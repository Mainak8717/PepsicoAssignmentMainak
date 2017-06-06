//
//  UserDetail+CoreDataProperties.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "UserDetail+CoreDataProperties.h"

@implementation UserDetail (CoreDataProperties)

+ (NSFetchRequest<UserDetail *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserDetail"];
}

@dynamic id;
@dynamic name;
@dynamic username;
@dynamic emailID;
@dynamic phone;
@dynamic website;
@dynamic userAddressRel;
@dynamic userCompanyRel;

@end
