//
//  testXCTestTests.m
//  testXCTestTests
//
//  Created by fei huang on 2019/8/16.
//  Copyright © 2019 fei huang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface testXCTestTests : XCTestCase

@end

@implementation testXCTestTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"test start");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"test end");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.@property (nonatomic, copy) NSString *string;
    NSLog(@"testing function");
    ViewController *vc = [[ViewController alloc] init];
    NSString *md5Result = [vc string2md5:@"123456"];
    XCTAssert(md5Result.length < 64, "字符串必须小于32");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    NSLog(@"性能测试");
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        ViewController *vc = [[ViewController alloc] init];
        [vc performanceExample:1000000];
    }];
}

@end
