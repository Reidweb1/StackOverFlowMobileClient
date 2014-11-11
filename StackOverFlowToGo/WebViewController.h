//
//  WebViewController.h
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/11/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *clientSecret;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *OAUTHDomain;
@property (strong, nonatomic) NSString *clientID;

@end
