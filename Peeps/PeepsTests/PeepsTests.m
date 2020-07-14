// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PeepsTests : XCTestCase
@end

@implementation PeepsTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    [fred setAge:33];
    
    NSLog(@"%@", [fred description]);
}

- (void)testInitializePerson {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith"];
    [fred setAge:29];
    NSLog(@"%@", fred);
}

- (void)testDesignatedInitializer {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith" age:27];
    NSLog(@"%@", fred);
    XCTAssertEqualObjects([fred firstName], @"Fred");
    XCTAssert([[fred firstName] isEqualToString:@"Fred"]);
}

- (void)testFactoryMethod {
    Person *fred = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:30];
    NSLog(@"%@", fred);
}

- (void)testMessageForwarding {
    id fred = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:30];
    [fred setDog:[[Dog alloc] init]];
    
    if ([fred respondsToSelector:@selector(bark)]) {
        [fred bark];
    } else {
        printf("Bark not supported\n");
    }
}

- (void)testCopying {
    Person *fred = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:30];
    Person *cloneOfFred = [fred copy];
    NSLog(@"%@", cloneOfFred);
}

- (void)testSinging {
    Person *fred = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:30];
    [[fred description] xyz_sing];
    [@"Hello World!" xyz_sing];
}

@end
