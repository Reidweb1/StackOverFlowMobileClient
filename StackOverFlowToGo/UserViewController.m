//
//  UserViewController.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/13/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "UserViewController.h"
#import "NetworkControlelr.h"
#import "AppDelegate.h"
#import "User.h"
#import "UserTableCell.h"

@interface UserViewController ()

@property (weak, nonatomic) NetworkControlelr *networkController;
@property (strong, nonatomic) NSMutableArray *users;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    UIApplication *application = [UIApplication sharedApplication];
    AppDelegate *appDelegate = application.delegate;
    self.networkController = appDelegate.networkContrtoller;
    self.users = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"USER_CELL"];
    User *selectedUser = [[User alloc] init];
    selectedUser = [self.users objectAtIndex:indexPath.row];
    cell.userNameLabel.text = selectedUser.userName;
    cell.secondaryLabel.text = selectedUser.location;
    cell.avatarImageView.image = [self.networkController stringToImage:selectedUser.imageString];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchText = [[NSString alloc] init];
    self.searchText = self.searchBar.text;
    [SVProgressHUD show];
    [self.networkController userFetchRequest:self.searchText completionHandler:^(NSError *error, NSMutableArray *questions) {
        if (error == nil) {
            self.users = questions;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
                [SVProgressHUD dismiss];
            }];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
