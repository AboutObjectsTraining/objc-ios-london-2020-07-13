// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Peeps/Peeps.h>

id initWithFirstName_lastName(id self, SEL _cmd, NSString *aFirstName, NSString *aLastName);

@implementation Person

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    return [[self dog] respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([[self dog] respondsToSelector:aSelector]) {
        return [self dog];
    }
    return [super forwardingTargetForSelector:aSelector];
}

/// Convenience initializer for Person instances.
/// @param aFirstName The Person's first name
/// @param aLastName The Person's last name
- (id)initWithFirstName:(NSString *)aFirstName
               lastName:(NSString *)aLastName {
    return [self initWithFirstName:aFirstName lastName:aLastName age:0];
}

/// Designated initializer for the Person class.
/// @param aFirstName The Person's first name
/// @param aLastName The Person's last name
/// @param anAge The Person's age
- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName age:(NSInteger)anAge {
    self = [super init];
    if (self == nil) return nil;
    
    _firstName = [aFirstName copy];
    _lastName = [aLastName copy];
    _age = anAge;
    
    return self;
}

// Factory method
+ (id)personWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName age:(NSInteger)anAge {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName age:anAge];
}
             
- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

- (Dog *)dog {
    return _dog;
}
- (void)setDog:(Dog *)dog {
    _dog = dog;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, age: %@, class: %@",
            [self fullName], @([self age]), [self class]];
}

- (id)copyWithZone:(NSZone *)zone {
    Person *newPerson = [[Person allocWithZone:zone] init];
    newPerson->_firstName = [self firstName];
    newPerson->_lastName = [self lastName];
    newPerson->_age = [self age];
    return newPerson;
}

@end
