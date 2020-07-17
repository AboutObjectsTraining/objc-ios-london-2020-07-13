// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "UIStoryboardSegue+RELAdditions.h"

@implementation UIStoryboardSegue (RELAdditions)

- (UIViewController *)rel_destinationViewController {
    UIViewController *controller = self.destinationViewController;
    BOOL isNavController = [controller isKindOfClass:UINavigationController.class];
    return isNavController ? controller.childViewControllers.firstObject : controller;
}

@end
