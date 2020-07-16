// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface BlockLiteralTests : XCTestCase
@property (copy, nonatomic) NSString *text;
@end

void sayHelloWithX(int x) {
    printf("Hello %d!\n", x);
}

void sayGoodbyeWithX(int x) {
    printf("Bye %d!\n", x);
}

void sayHello(void) {
    printf("Hello!\n");
}

void doSomethingNTimes(int count, void (*thingToDo)(void)) {
    for (int i = 0; i < count; i++) {
        thingToDo();
    }
}

void doSomethingBlockishNTimes(int count, void (^someBlock)(void)) {
    for (int i = 0; i < count; i++) {
        someBlock();
    }
}

@implementation BlockLiteralTests

- (void)setUp {
    self.text = @"The weather is cloudy.";
}

- (void)testFunctionPointers {
    void (*myPtr)(int);
    
    myPtr = sayHelloWithX;
    myPtr(42);
    myPtr = sayGoodbyeWithX;
    myPtr(99);
    
    doSomethingNTimes(3, sayHello);
}

- (void)testBlockLiterals {
    void (^myBlock)(void) = nil;
    
    myBlock = ^{
        printf("Hello from my block!\n");
    };
    
    myBlock();
    
    doSomethingBlockishNTimes(2, myBlock);
    doSomethingBlockishNTimes(1, ^{
        printf("Woohoo!");
    });
}

- (void)testCapturingState {
    NSString *message = @"The weather is sunny!";
    
    doSomethingBlockishNTimes(2, ^{
        printf("Hey there! %s\n", message.UTF8String);
    });
}

- (void)testCapturingSelf {
    typeof(self) __weak weakSelf = self;
    doSomethingBlockishNTimes(2, ^{
        printf("Hey there! %s\n", weakSelf.text.UTF8String);
    });
}

@end
