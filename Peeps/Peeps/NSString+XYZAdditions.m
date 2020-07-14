// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "NSString+XYZAdditions.h"

@implementation NSString (XYZAdditions)

- (void)xyz_sing {
    printf("🎼🎵 %s 🎶🎵\n", [self UTF8String]);
}

@end
