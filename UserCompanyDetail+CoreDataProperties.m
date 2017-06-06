//
//  UserCompanyDetail+CoreDataProperties.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "UserCompanyDetail+CoreDataProperties.h"

@implementation UserCompanyDetail (CoreDataProperties)

+ (NSFetchRequest<UserCompanyDetail *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserCompanyDetail"];
}

@dynamic name;
@dynamic catchPhrase;
@dynamic userID;
@dynamic bs;

@end
