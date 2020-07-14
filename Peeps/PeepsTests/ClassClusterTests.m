// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ClassClusterTests : XCTestCase
@end

@implementation ClassClusterTests

- (void)testStringClassCluster {
    NSString *s1 = [NSString alloc];
    NSString *s2 = [NSString alloc];
    NSString *s3 = [NSString alloc];
    NSMutableString *s4 = [NSMutableString alloc];
    
    s1 = [s1 initWithFormat:@"%@ %@", @"Hello", @"World!"];
    s2 = [s2 initWithUTF8String:"Whee!"];
    s3 = [s3 initWithString:@"Wow!"];
    s4 = [s4 initWithFormat:@"%@ %@", @"Hello", @"World!"];
    
    NSLog(@"%@", s1);
    NSLog(@"%@", s2);
    NSLog(@"%@", s3);
    NSLog(@"%@", s4);
    
//    id foo = [[NSString alloc] init];
//    [foo setString:@"Yay!"];
//    NSLog(@"%@", foo);
}

@end
