//
//  Question.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id) init: (NSDictionary *) entryDictionary {
    if (self = [super init]) {
        self.displayName = [entryDictionary objectForKey:(@"display_name")];
    }
    return self;
}

+ (NSMutableArray *) parseJSONFile: (NSData *) results {
    
    NSError *error = [[NSError alloc] init];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData: results options: 0 error: &error];
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    
    itemsArray = [JSONDictionary objectForKey:(@"items")];
    
    if ([itemsArray isKindOfClass:[NSDictionary class]] == YES) {
        for (int i = 0; i < [itemsArray count]; i++) {
            Question *newQuestion = [[Question alloc] init:([itemsArray objectAtIndex:(i)])];
            [questions addObject:newQuestion];
        }
    }
    
    return questions;
}

@end
