//
//  NetworkControlelr.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "NetworkControlelr.h"
#import "Question.h"
#import "User.h"

@implementation NetworkControlelr

- (instancetype) init{
    self.clientSecret = @"HPf)RuUD6Yb*Sj*jXoZmRg((";
    self.key = @"ErfvNInTQQtGe*1gBLcpuw((";
    self.OAUTHDomain = @"https://stackexchange.com/oauth/dialog";
    self.clientID = @"3837";
    self.urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    return self;
}

- (NSMutableArray *) postsFetchRequest: (NSString *) searchTerm completionHandler: (void (^)(NSError* error, NSMutableArray* questions))sucess {
    __block NSMutableArray *results = [[NSMutableArray alloc] init];
    NSURL *url = [[NSURL alloc] init];
    
    url = [self buildURL:searchTerm];
    
    NSURLSessionDataTask *repoTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([response isKindOfClass:[NSHTTPURLResponse class]] == YES) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299) {
                NSLog(@"All Good!");
                results = [Question parseJSONFile: data];
                sucess(nil, results);
            } else {
                NSLog(@"ERROR");
                NSLog(@"%li", (long)httpResponse.statusCode);
            }
        }
    }];
    [repoTask resume];
    return results;
}

- (NSMutableArray *) userFetchRequest: (NSString *) searchTerm completionHandler: (void (^)(NSError* error, NSMutableArray* users))sucess {
    __block NSMutableArray *results = [[NSMutableArray alloc] init];
    NSURL *url = [[NSURL alloc] init];
    
    url = [self userBuildURL:searchTerm];
    
    NSURLSessionDataTask *repoTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([response isKindOfClass:[NSHTTPURLResponse class]] == YES) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299) {
                NSLog(@"All Good!");
                results = [User parseJSONFile: data];
                sucess(nil, results);
            } else {
                NSLog(@"ERROR");
                NSLog(@"%li", (long)httpResponse.statusCode);
            }
        }
    }];
    [repoTask resume];
    return results;
}

- (NSURL *) buildURL:(NSString *) searchTerm {
    NSURL *newURL = [[NSURL alloc] init];
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"token"]) {
        NSString *token = [[NSString alloc] init];
        token = [[NSUserDefaults standardUserDefaults] objectForKey: @"token"];
        NSString *fullURLString = [[NSString alloc] initWithFormat: @"https://api.stackexchange.com/2.2/questions?tagged=%@&site=stackoverflow&token=%@", searchTerm, token];
        newURL = [[NSURL alloc] initWithString:fullURLString];
        NSLog(@"Token Found");
        NSLog(@"%@", fullURLString);
    } else {
        NSString *fullURLString = [[NSString alloc] initWithFormat: @"https://api.stackexchange.com/2.2/questions?site=stackoverflow&%@", searchTerm];
        newURL = [[NSURL alloc] initWithString:fullURLString];
        NSLog(@"Token Not Found");
    }
    return newURL;
}

- (NSURL *) userBuildURL:(NSString *) searchTerm {
    NSURL *newURL = [[NSURL alloc] init];
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"token"]) {
        NSString *token = [[NSString alloc] init];
        token = [[NSUserDefaults standardUserDefaults] objectForKey: @"token"];
        NSString *fullURLString = [[NSString alloc] initWithFormat: @"https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&inname=%@&site=stackoverflow&token=%@", searchTerm, token];
        newURL = [[NSURL alloc] initWithString:fullURLString];
        NSLog(@"Token Found");
        NSLog(@"%@", fullURLString);
    } else {
        NSString *fullURLString = [[NSString alloc] initWithFormat: @"https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&inname=%@&site=stackoverflow", searchTerm];
        newURL = [[NSURL alloc] initWithString:fullURLString];
        NSLog(@"Token Not Found");
    }
    return newURL;
}

- (UIImage *) stringToImage:(NSString *) imageString {
    NSURL *url = [[NSURL alloc] initWithString:(imageString)];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *newImage = [[UIImage alloc] initWithData:data];
    return newImage;
}
                                      
@end
