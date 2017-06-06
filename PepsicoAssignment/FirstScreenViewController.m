//
//  FirstScreenViewController.m
//  PepsicoAssignment
//
//  Created by Rajlakshmi on 06/06/17.
//  Copyright © 2017 CTS. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "ServiceClass.h"
#import <CoreData/CoreData.h>
#import "SecondScreenViewController.h"

@interface FirstScreenViewController (){
    UIActivityIndicatorView *activityView;
}

@property (nonatomic,strong) ServiceClass *serviceClass;
@property (nonatomic,strong) NSArray *responseArray;
@end

@implementation FirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    self.responseArray = [[NSArray alloc] init];
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    self.tblView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tblView.layer.borderWidth = 2.0;
    self.tblView.layer.borderColor = [UIColor grayColor].CGColor;
    
    activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityView.center=self.view.center;
    [activityView startAnimating];
    [self.view addSubview:activityView];
    
    
    [self loadUserNameAndEmail];
}

- (void)loadUserNameAndEmail
{

    [[ServiceClass sharedManager] getJsonResponse:@"https://jsonplaceholder.typicode.com/users" success:^(NSArray *responseArry) {
        NSLog(@"%@",responseArry);
        self.responseArray = responseArry;
            NSLog(@"%@", [responseArry[0] valueForKey:@"name"]);
            NSLog(@"%@", [responseArry[0] valueForKey:@"email"]);

        dispatch_async(dispatch_get_main_queue(), ^{
            [activityView stopAnimating];
            [self.tblView reloadData];
        });
            NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
            
            
            NSManagedObject *userDetailObj = [NSEntityDescription insertNewObjectForEntityForName:@"UserDetail" inManagedObjectContext:context];
            [userDetailObj setValue:[responseArry[0] valueForKey:@"name"] forKey:@"name"];
            [userDetailObj setValue:[responseArry[0] valueForKey:@"email"] forKey:@"emailID"];
            NSError *error = nil;
            // Save the object to persistent store
            if (![context save:&error]) {
                NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
            }
            
        
    } failure:^(NSError *error) {
        // error handling here ...
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.responseArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [self.responseArray[indexPath.row] valueForKey:@"name"];
        cell.detailTextLabel.text = [self.responseArray[indexPath.row] valueForKey:@"email"];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondScreenViewController *secondScreenViewController = [[SecondScreenViewController alloc] initWithNibName:@"SecondScreenViewController" bundle:nil];
    [self.navigationController pushViewController:secondScreenViewController animated:YES];
}
- (IBAction)segmentTappedAction:(id)sender {
}
@end
