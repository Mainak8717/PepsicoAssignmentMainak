//
//  CollectionViewCell.h
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (strong,nonatomic) UILabel *name;
@property (strong,nonatomic) UILabel *email;

@end
