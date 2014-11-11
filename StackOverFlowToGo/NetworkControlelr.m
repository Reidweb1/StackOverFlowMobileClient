//
//  NetworkControlelr.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "NetworkControlelr.h"
#import "Question.h"

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
    NSURL *url = [[NSURL alloc] initWithString:@"https://api.stackexchange.com/2.2/questions?site=stackoverflow"];
    // self.urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
                       
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
                                      
@end
