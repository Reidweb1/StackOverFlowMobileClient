//
//  Question.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype) init: (NSDictionary *) entryDictionary {
    if (self = [super init]) {
        NSDictionary *userInfo = [[NSDictionary alloc] init];
        userInfo = entryDictionary[@"owner"];
        self.displayName = [userInfo objectForKey:(@"display_name")];
        self.questionBodyText = [entryDictionary objectForKey:(@"title")];
        self.imageURL = [userInfo objectForKey:(@"profile_image")];
    }
    return self;
}

+ (NSMutableArray *) parseJSONFile: (NSData *) results {
    
    NSError *error = [[NSError alloc] init];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData: results options: 0 error: &error];
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    
    itemsArray = [JSONDictionary objectForKey:(@"items")];
    
    if ([itemsArray isKindOfClass:[NSMutableArray class]] == YES) {
        for (int i = 0; i < [itemsArray count]; i++) {
            Question *newQuestion = [[Question alloc] init:([itemsArray objectAtIndex:(i)])];
            [questions addObject:newQuestion];
        }
    }
    
    return questions;
}

@end
