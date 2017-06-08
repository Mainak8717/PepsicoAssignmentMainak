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
#import "CollectionViewCell.h"
#import "FetchDBDataClass.h"

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
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.tblView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tblView.layer.borderWidth = 2.0;
    self.tblView.layer.borderColor = [UIColor grayColor].CGColor;
    
    activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityView.center=self.view.center;
    [activityView startAnimating];
    [self.view addSubview:activityView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];

    
    [self.tblView setHidden:NO];
    [self.collectionView setHidden:YES];
    
    [self.segmentControl setSelectedSegmentIndex:0];
    
    [self loadUserNameAndEmail];
}

- (void)loadUserNameAndEmail
{

    [[ServiceClass sharedManager] getJsonResponse:@"https://jsonplaceholder.typicode.com/users" success:^(NSArray *responseArry) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.responseArray = responseArry;
            [activityView stopAnimating];
            [[FetchDBDataClass sharedManager] insertDataIntoDB:self.responseArray];
            [self.tblView reloadData];
            [self.collectionView reloadData];
        });
    } failure:^(NSError *error) {
        
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
    secondScreenViewController.userID = [self.responseArray[indexPath.row] valueForKey:@"id"];
    [self.navigationController pushViewController:secondScreenViewController animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.responseArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(220, 80);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CELL";
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.name.text = [self.responseArray[indexPath.row] valueForKey:@"name"];
    cell.email.text = [self.responseArray[indexPath.row] valueForKey:@"email"];
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    cell.layer.borderWidth = 2.0f;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SecondScreenViewController *secondScreenViewController = [[SecondScreenViewController alloc] initWithNibName:@"SecondScreenViewController" bundle:nil];
    [self.navigationController pushViewController:secondScreenViewController animated:YES];
}

- (IBAction)segmentTappedAction:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        self.tblView.hidden = false;
        self.collectionView.hidden = true;
    }
    else{
        self.tblView.hidden = true;
        self.collectionView.hidden = false;
    }
}
@end
