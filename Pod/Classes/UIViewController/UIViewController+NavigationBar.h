//
//  UINavigationController+NavigationBar.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBar)

- (UIImageView *)navigationBarShadow;
- (void)showNavigationBarShadowAnimated:(BOOL)animated;
- (void)hideNavigationBarShadowAnimated:(BOOL)animated;

@end
