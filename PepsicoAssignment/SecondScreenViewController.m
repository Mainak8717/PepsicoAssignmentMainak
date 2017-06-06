//
//  SecondScreenViewController.m
//  PepsicoAssignment
//
//  Created by Mainak Choudhury on 07/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "SecondScreenViewController.h"

@interface SecondScreenViewController ()

@end

@implementation SecondScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"User Details";
    
    UILabel *name = [[UILabel alloc] init];
    name.backgroundColor = [UIColor blueColor];
    [name.heightAnchor constraintEqualToConstant:50].active = true;
    name.text = @"Name: Mainak";
    
    UILabel *email = [[UILabel alloc] init];
    email.backgroundColor = [UIColor redColor];
    [email.heightAnchor constraintEqualToConstant:50].active = true;
    email.text = @"Email: mainak8717@gmail.com";
    
    UILabel *phone = [[UILabel alloc] init];
    phone.backgroundColor = [UIColor yellowColor];
    [phone.heightAnchor constraintEqualToConstant:50].active = true;
    phone.text = @"Phone: +91 7044066268";
    
    UILabel *addressStreet = [[UILabel alloc] init];
    addressStreet.backgroundColor = [UIColor greenColor];
    [addressStreet.heightAnchor constraintEqualToConstant:50].active = true;
    addressStreet.text = @"Street: Kulas Light";
    
    UILabel *addressSuite = [[UILabel alloc] init];
    addressSuite.backgroundColor = [UIColor magentaColor];
    [addressSuite.heightAnchor constraintEqualToConstant:50].active = true;
    addressSuite.text = @"Suite: Apt. 556";
    
    UILabel *addressCity = [[UILabel alloc] init];
    addressCity.backgroundColor = [UIColor greenColor];
    [addressCity.heightAnchor constraintEqualToConstant:50].active = true;
    addressCity.text = @"City: Gwenborough";
    
    UILabel *addressZip = [[UILabel alloc] init];
    addressZip.backgroundColor = [UIColor orangeColor];
    [addressZip.heightAnchor constraintEqualToConstant:50].active = true;
    addressZip.text = @"Zipcode: 92998-3874";
    
    UILabel *website = [[UILabel alloc] init];
    website.backgroundColor = [UIColor cyanColor];
    [website.heightAnchor constraintEqualToConstant:50].active = true;
    website.text = @"www.google.com";
    

    self.toDoSummaryBtn.layer.cornerRadius = 3.0f;
    self.toDoSummaryBtn.layer.borderWidth = 2.0f;
    self.toDoSummaryBtn.layer.borderColor = [UIColor blueColor].CGColor;
    
    [self.stackView addArrangedSubview:name];
    [self.stackView addArrangedSubview:email];
    [self.stackView addArrangedSubview:phone];
    [self.stackView addArrangedSubview:addressStreet];
    [self.stackView addArrangedSubview:addressSuite];
    [self.stackView addArrangedSubview:addressCity];
    [self.stackView addArrangedSubview:addressZip];

    
}

- (IBAction)toDoAction:(id)sender {
    
}
@end
