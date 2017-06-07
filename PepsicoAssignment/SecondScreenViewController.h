//
//  SecondScreenViewController.h
//  PepsicoAssignment
//
//  Created by Mainak Choudhury on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIButton *toDoSummaryBtn;

@property (nonatomic, strong) UILabel *lblName;
@property (nonatomic, strong) UILabel *lblEmail;
@property (nonatomic, strong) UILabel *lblPhone;
@property (nonatomic, strong) UILabel *lblAddressStreet;
@property (nonatomic, strong) UILabel *lblAddressSuite;
@property (nonatomic, strong) UILabel *lblAddressCity;
@property (nonatomic, strong) UILabel *lblAddressZip;
@property (nonatomic, strong) UILabel *lblWebsite;

@property (nonatomic, strong) NSString *userID;

- (IBAction)toDoAction:(id)sender;

@end
