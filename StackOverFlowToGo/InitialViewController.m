//
//  InitialViewController.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/12/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "InitialViewController.h"
#import "WebViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.helloLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Hello", nil)];
    
}

- (void)viewDidAppear:(BOOL)animated {
    if (![[NSUserDefaults standardUserDefaults] valueForKey:@"token"]) {
        WebViewController *presentationVC = [[WebViewController alloc] init];
        presentationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WEB_VIEW"];
        [self presentViewController:presentationVC animated: true completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
