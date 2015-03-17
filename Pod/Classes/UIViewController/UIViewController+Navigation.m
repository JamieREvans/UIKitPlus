//
//  UIViewController+Navigation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIViewController+Navigation.h"
#import <FoundationPlus/NSObject+Swizzle.h>

@implementation UIViewController (Navigation)

+ (void)load
{
    [self swizzleSelector:@selector(checkIfPopping:) withLocalSelector:@selector(viewWillDisappear:)];
}

- (void)checkIfPopping:(BOOL)animated
{
    NSUInteger controllerIndex = [self.navigationController.viewControllers indexOfObject:self];
    if(controllerIndex == NSNotFound)
    {
        // View is disappearing because it was popped from the stack
        if([self respondsToSelector:@selector(viewControllerWasPopped)])[self viewControllerWasPopped];
    }
    else
    {
        // View is disappearing because a new view controller was pushed onto the stack
    }
    
    [self checkIfPopping:animated];
}

@end
