//
//  UserCompanyDetail+CoreDataProperties.h
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "UserCompanyDetail+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserCompanyDetail (CoreDataProperties)

+ (NSFetchRequest<UserCompanyDetail *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *catchPhrase;
@property (nullable, nonatomic, copy) NSString *userID;
@property (nullable, nonatomic, copy) NSString *bs;

@end

NS_ASSUME_NONNULL_END
