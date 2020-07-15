#import <Foundation/Foundation.h>

// PART 2
@class Dog;

@protocol DogDelegate <NSObject>

- (void)dogDidHearDoorbell:(Dog *)dog;
- (BOOL)dogShouldBark:(Dog *)dog;
- (BOOL)dogShouldWagTail:(Dog *)dog;

@end
////////


@interface Dog : NSObject

- (id)initWithName:(NSString *)name;

@property (readonly, nonatomic) NSString *name;
@property (weak, nonatomic) id<DogDelegate> delegate;

- (void)doorbellDidRing;
- (void)sit;

@end
