//
//  Question.h
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property NSString *displayName;

+ (NSMutableArray *) parseJSONFile: (NSData *) results;

@end
