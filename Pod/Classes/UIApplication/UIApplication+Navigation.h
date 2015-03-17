//
//  UIApplication+Navigation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Navigation)

- (UINavigationController *)navigationController;
- (void)pushController:(UIViewController *)controller;
- (void)popController;
- (void)presentController:(UIViewController *)controller;

@end
