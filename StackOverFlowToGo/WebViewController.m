//
//  WebViewController.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/11/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.clientSecret = @"HPf)RuUD6Yb*Sj*jXoZmRg((";
    self.key = @"ErfvNInTQQtGe*1gBLcpuw((";
    self.OAUTHDomain = @"https://stackexchange.com/oauth/dialog";
    self.clientID = @"3837";
    self.OAUTHRedirect = @"https://stackexchange.com/oauth/login_success";
    
    self.webView.navigationDelegate = self;
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://stackexchange.com/oauth/dialog?client_id=%@&redirect_uri=%@&scope=read_inbox",self.clientID, self.OAUTHRedirect];
    
    NSURL *url = [[NSURL alloc] initWithString:(urlString)];
    NSLog(@"%@", url);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:(request)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    self.webView = [[WKWebView alloc] init];
    self.view = self.webView;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSString *webViewURL = [webView.URL absoluteString];
    if ([webViewURL containsString:@"login_success"]) {
        NSArray *componants = [webViewURL componentsSeparatedByString:@"="];
        if ([componants count] > 1) {
            NSString *token = componants.lastObject;
            NSLog(@"%@", token);
            [[NSUserDefaults standardUserDefaults] setObject: token forKey: @"token"];
        }
    }
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
