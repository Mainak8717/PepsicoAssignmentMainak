//
//  CollectionViewCell.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.name = [[UILabel alloc] init];
    [self.name.heightAnchor constraintEqualToConstant:35].active = true;
    
    self.email = [[UILabel alloc] init];
    [self.email.heightAnchor constraintEqualToConstant:35].active = true;
    
    [self.stackView addArrangedSubview:(self.name)];
    [self.stackView addArrangedSubview:(self.email)];

}

@end
