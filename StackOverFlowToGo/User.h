//
//  User.h
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/10/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *location;

+ (NSMutableArray *) parseJSONFile: (NSData *) results;

@end
