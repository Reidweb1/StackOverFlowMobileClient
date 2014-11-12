//
//  JSONTest.m
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/12/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question.h"
#import "Question.m"

@interface JSONTest : XCTestCase

@end

@implementation JSONTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) testParseJSON {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sampleStackOverflow" ofType:@"json"];
    NSData *JSONFile = [[NSData alloc] initWithContentsOfFile: filePath];
    XCTAssertNotNil(JSONFile);
    
    NSArray *questions = [Question parseJSONFile:JSONFile];
    
    XCTAssertEqual(questions.count, 30, @"question count didnt match 30");
    
    Question *firstQuestion = questions.firstObject;
    NSLog(@"%@", firstQuestion.displayName);
    XCTAssertEqualObjects(firstQuestion.displayName, @"Robert B");
}

@end
