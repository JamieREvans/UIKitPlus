//
//  UIApplication+Navigation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIApplication+Navigation.h"

@implementation UIApplication (Navigation)

- (UINavigationController *)navigationController
{
    UIViewController *controller = ([[self keyWindow] rootViewController] ? : [[self windows].firstObject rootViewController]);
    if([controller isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)controller;
        UIViewController *visibleController = navigationController.visibleViewController;
        if(visibleController.navigationController)return visibleController.navigationController;
        else if(visibleController.presentingViewController.navigationController)return visibleController.presentingViewController.navigationController;
        return navigationController;
    }
    else return nil;
}

- (void)pushController:(UIViewController *)controller
{
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)popController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)presentController:(UIViewController *)controller
{
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}

@end
