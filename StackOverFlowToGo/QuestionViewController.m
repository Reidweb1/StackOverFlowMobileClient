//
//  QuestionViewController.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "QuestionViewController.h"
#import "NetworkControlelr.h"
#import "Question.h"
#import "AppDelegate.h"
#import "QuestionTableCellTableViewCell.h"

@interface QuestionViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NetworkControlelr *networkController;
@property (strong, nonatomic) NSMutableArray *questions;
@property (strong, nonatomic) NSCache *photos;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    UIApplication *application = [UIApplication sharedApplication];
    AppDelegate *appDelegate = application.delegate;
    self.networkController = appDelegate.networkContrtoller;
    self.questions = [[NSMutableArray alloc] init];
    self.photos = [[NSCache alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionTableCellTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL"];
    Question *newQuestion = [[Question alloc] init];
    newQuestion = [self.questions objectAtIndex:indexPath.row];
    cell.questionNameLabel.text = newQuestion.displayName;
    cell.questionBodyLabel.text = newQuestion.questionBodyText;
    NSString *cacheKey = [[NSString alloc] initWithFormat:@"%ld",(long)indexPath.row];
    if (![self.photos objectForKey: cacheKey]) {
        UIImage *questionPhoto = [self.networkController stringToImage:newQuestion.imageURL];
        cell.avatarImageView.image = questionPhoto;
        [self.photos setObject:questionPhoto forKey:cacheKey];
    } else {
        cell.avatarImageView.image = [self.photos objectForKey:cacheKey];
    }
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchText = [[NSString alloc] init];
    self.searchText = self.searchBar.text;
    [SVProgressHUD show];
    [self.networkController postsFetchRequest:self.searchText completionHandler:^(NSError *error, NSMutableArray *questions) {
        if (error == nil) {
            self.questions = questions;
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
