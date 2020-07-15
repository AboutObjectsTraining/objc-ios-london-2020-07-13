#import "Person.h"

const NSUInteger MaxRating = 5;

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(int)age
{
    if (!(self = [super init])) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

+ (instancetype)personWithFirstName:(NSString *)firstName
                           lastName:(NSString *)lastName
                                age:(int)age
{
    return [[self alloc] initWithFirstName:firstName
                                  lastName:lastName
                                       age:age];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (void)setRating:(NSUInteger)newValue {
    _rating = newValue > MaxRating ? MaxRating : newValue;
}

- (NSString *)ratingStars {
    if (self.rating == 0)  return @"-";
    return [@"*****" substringToIndex:self.rating];
}

- (void)display {
    printf("%s\n", self.description.UTF8String);
}

- (NSString *)description {
    NSString *stars = self.ratingStars;
    stars = [stars stringByPaddingToLength:MaxRating
                                withString:@" "
                           startingAtIndex:0];
    
    return [NSString stringWithFormat:@"%@  %@", stars, self.fullName];
}


@end
