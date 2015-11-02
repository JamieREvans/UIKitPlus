//
//  UIViewController+Navigation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIViewController+Navigation.h"
#import "NSObject+Values.h"
#import <FoundationPlus/NSObject+Swizzle.h>
#import <objc/runtime.h>

@interface UIViewController (NavigationPrivate)

@property (nonatomic, weak) UINavigationController *oldNavigationController;

@end

@implementation UIViewController (Navigation)

+ (void)load
{
    [self swizzleSelector:@selector(checkIfPopping:) withLocalSelector:@selector(viewWillDisappear:)];
    [self swizzleSelector:@selector(checkIfPopped:) withLocalSelector:@selector(viewDidDisappear:)];
}

- (UINavigationController *)oldNavigationController {
    
    return [self valueForSelector:@selector(oldNavigationController)];
}

- (void)setOldNavigationController:(UINavigationController *)oldNavigationController {
    
    objc_setAssociatedObject(self, @selector(oldNavigationController), oldNavigationController, OBJC_ASSOCIATION_ASSIGN);
}

- (void)checkIfPopping:(BOOL)animated
{
    NSUInteger controllerIndex = [self.navigationController.viewControllers indexOfObject:self];
    if(controllerIndex == NSNotFound)
    {
        // View is disappearing because it was popped from the stack
        [self viewWillPop];
    }
    else
    {
        // View is disappearing because a new view controller was pushed onto the stack
    }
    
    self.oldNavigationController = self.navigationController;
    
    [self checkIfPopping:animated];
}

- (void)checkIfPopped:(BOOL)animated
{
    __strong UINavigationController *oldNavigationController = self.oldNavigationController;
    if(oldNavigationController)
    {
        NSUInteger controllerIndex = [oldNavigationController.viewControllers indexOfObject:self];
        if(controllerIndex == NSNotFound)
        {
            // View did disappear because it was popped from the stack
            [self viewDidPop];
        }
        else
        {
            // View did disappear because a new view controller was pushed onto the stack
        }
    }
    
    [self checkIfPopped:animated];
}

- (void)viewWillPop
{
    // Always implement the method when swizzling and call super in overrides
}

- (void)viewDidPop
{
    // Always implement the method when swizzling and call super in overrides
}

@end
