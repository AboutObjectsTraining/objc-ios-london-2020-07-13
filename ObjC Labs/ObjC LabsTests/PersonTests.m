// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <ObjC_Labs/Person.h>

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)testCreatePerson {
    Person *p = [[Person alloc] init];
    
    NSLog(@"%@", p);
}

@end
