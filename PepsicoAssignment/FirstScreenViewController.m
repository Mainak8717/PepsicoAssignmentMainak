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

@interface FirstScreenViewController ()

@property (nonatomic,strong) ServiceClass *serviceClass;
@end

@implementation FirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tblView.delegate = self;
//    self.serviceClass = [ServiceClass sharedManager];
    [self loadUserNameAndEmail];
}

- (void)loadUserNameAndEmail
{
//    [[ServiceClass sharedManager] getUserDetails:^(NSDictionary *dictData){
//        
//        NSDictionary *userData = [[NSDictionary alloc] initWithDictionary:dictData];
//
//    }];
    
    [[ServiceClass sharedManager] getJsonResponse:@"https://jsonplaceholder.typicode.com/users" success:^(NSArray *responseDict) {
        NSLog(@"%@",responseDict);
            NSLog(@"%@", [responseDict[0] valueForKey:@"name"]);
            NSLog(@"%@", [responseDict[0] valueForKey:@"email"]);

            NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
            
            
            NSManagedObject *userDetailObj = [NSEntityDescription insertNewObjectForEntityForName:@"UserDetail" inManagedObjectContext:context];
            [userDetailObj setValue:[responseDict[0] valueForKey:@"name"] forKey:@"name"];
            [userDetailObj setValue:[responseDict[0] valueForKey:@"email"] forKey:@"emailID"];
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

- (IBAction)segmentTappedAction:(id)sender {
}
@end
