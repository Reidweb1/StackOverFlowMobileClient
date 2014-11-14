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
        self.userName = [userInfo objectForKey:@"display_name"];
        self.imageString = [userInfo objectForKey:@"profile_image"];
    }
    return self;
}

+ (NSMutableArray *) parseJSONFile: (NSData *) results {
    
    NSError *error = [[NSError alloc] init];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData: results options: 0 error: &error];
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    itemsArray = [JSONDictionary objectForKey:(@"items")];
    
    if ([itemsArray isKindOfClass:[NSMutableArray class]] == YES) {
        for (int i = 0; i < [itemsArray count]; i++) {
            User *newUser = [[User alloc] init:([itemsArray objectAtIndex:(i)])];
            [users addObject:newUser];
        }
    }
    
    return users;
}

@end
