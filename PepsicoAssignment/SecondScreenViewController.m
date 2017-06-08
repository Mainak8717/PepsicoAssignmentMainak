//
//  SecondScreenViewController.m
//  PepsicoAssignment
//
//  Created by Mainak Choudhury on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "SecondScreenViewController.h"
#import "AppDelegate.h"
#import "FetchDBDataClass.h"

@interface SecondScreenViewController ()
@end

@implementation SecondScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self populateData];
    NSLog(@"UserID == %@",self.userID);
    
}

- (void)setupUI{
    
    self.title = @"User Details";
    
    self.lblName = [[UILabel alloc] init];
    [self.lblName.heightAnchor constraintEqualToConstant:50].active = true;
    
    self.lblEmail = [[UILabel alloc] init];
    [self.lblEmail.heightAnchor constraintEqualToConstant:50].active = true;
    
    self.lblPhone = [[UILabel alloc] init];
    [self.lblPhone.heightAnchor constraintEqualToConstant:50].active = true;
    
    self.lblAddressStreet = [[UILabel alloc] init];
    [self.lblAddressStreet.heightAnchor constraintEqualToConstant:50].active = true;
    
    self.lblAddressSuite = [[UILabel alloc] init];
    [self.lblAddressSuite.heightAnchor constraintEqualToConstant:50].active = true;
    
    self.lblAddressCity = [[UILabel alloc] init];
    [self.lblAddressCity.heightAnchor constraintEqualToConstant:50].active = true;
    
    self.lblAddressZip = [[UILabel alloc] init];
    [self.lblAddressZip.heightAnchor constraintEqualToConstant:50].active = true;
    
    self.lblWebsite = [[UILabel alloc] init];
    [self.lblWebsite.heightAnchor constraintEqualToConstant:50].active = true;
    
    
    self.toDoSummaryBtn.layer.cornerRadius = 3.0f;
    self.toDoSummaryBtn.layer.borderWidth = 2.0f;
    self.toDoSummaryBtn.layer.borderColor = [UIColor blueColor].CGColor;
    
    [self.stackView addArrangedSubview:self.lblName];
    [self.stackView addArrangedSubview:self.lblEmail];
    [self.stackView addArrangedSubview:self.lblPhone];
    [self.stackView addArrangedSubview:self.lblAddressStreet];
    [self.stackView addArrangedSubview:self.lblAddressSuite];
    [self.stackView addArrangedSubview:self.lblAddressCity];
    [self.stackView addArrangedSubview:self.lblAddressZip];

}

- (void)populateData{


    
    NSArray *userDetailsArray = [[NSArray alloc] initWithArray:[[FetchDBDataClass sharedManager] fetchUserDetails]];
    NSArray *userAddressArray = [[NSArray alloc] initWithArray:[[FetchDBDataClass sharedManager] fetchUserAddress]];
    NSArray *userCompanyArray = [[NSArray alloc] initWithArray:[[FetchDBDataClass sharedManager] fetchUserCompanyDetails]];
    NSFetchRequest *userAddressRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserAddress"];
    
}
- (IBAction)toDoAction:(id)sender {
    
}
@end
