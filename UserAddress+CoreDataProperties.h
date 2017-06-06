//
//  UserAddress+CoreDataProperties.h
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "UserAddress+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserAddress (CoreDataProperties)

+ (NSFetchRequest<UserAddress *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userId;
@property (nullable, nonatomic, copy) NSString *street;
@property (nullable, nonatomic, copy) NSString *suite;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *zipCode;
@property (nullable, nonatomic, copy) NSString *latittude;
@property (nullable, nonatomic, copy) NSString *longitude;

@end

NS_ASSUME_NONNULL_END
