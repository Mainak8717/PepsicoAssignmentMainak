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
- (IBAction)toDoAction:(id)sender;

@end
