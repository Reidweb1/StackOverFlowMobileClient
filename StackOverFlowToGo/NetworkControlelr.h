//
//  NetworkControlelr.h
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkControlelr : NSObject

@property (strong, nonatomic) NSURLSession *urlSession;
@property (strong, nonatomic) NSString *clientSecret;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *OAUTHDomain;
@property (strong, nonatomic) NSString *clientID;

- (NSMutableArray *) postsFetchRequest: (NSString *) searchTerm completionHandler: (void (^)(NSError* error, NSMutableArray* questions))sucess;
- (NSURL *) buildURL:(NSString *) searchTerm;

@end
