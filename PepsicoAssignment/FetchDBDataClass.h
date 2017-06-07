//
//  FetchDBDataClass.h
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FetchDBDataClass : NSObject

+ (id)sharedManager;

- (void) insertDataIntoDB:(NSArray *)arrayOfData;
- (void) fetchUserDetails;
- (void) fetchUserAddress;
- (void) fetchUserCompanyDetails;
@end
