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

@end
