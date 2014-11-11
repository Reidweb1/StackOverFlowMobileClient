//
//  User.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype) init:(NSDictionary*) userInfo {
    self = [super init];
    if (self) {
        self.userName = [userInfo objectForKey:@"name"];
    }
    return self;
}

@end
