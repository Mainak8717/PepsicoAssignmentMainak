//
//  UserDetail+CoreDataProperties.h
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "UserDetail+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserDetail (CoreDataProperties)

+ (NSFetchRequest<UserDetail *> *)fetchRequest;

@property (nonatomic) int16_t id;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *username;
@property (nullable, nonatomic, copy) NSString *emailID;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nullable, nonatomic, copy) NSString *website;
@property (nullable, nonatomic, retain) UserAddress *userAddressRel;
@property (nullable, nonatomic, retain) UserCompanyDetail *userCompanyRel;

@end

NS_ASSUME_NONNULL_END
