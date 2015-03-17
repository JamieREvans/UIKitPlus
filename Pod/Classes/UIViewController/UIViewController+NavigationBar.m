//
//  UINavigationController+NavigationBar.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "UIView+Subviews.h"
#import "UIView+Framing.h"

@implementation UIViewController (NavigationBar)

- (UIImageView *)navigationBarShadow
{
    NSArray *singlePixelImageViews = [self.navigationController.navigationBar recursivelySearchForSubviewPassingConstraint:^BOOL(UIView *view)
                                      {
                                          return ([view isKindOfClass:[UIImageView class]] && (view.height <= 1.0f));
                                      }];
    return singlePixelImageViews.firstObject;
}

- (void)showNavigationBarShadowAnimated:(BOOL)animated
{
    __block typeof(self) selfBlockReference = self;
    [UIView animateWithDuration:0.25f * animated
                          delay:0.1f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^
     {
         [selfBlockReference.navigationBarShadow setAlpha:YES];
     }
                     completion:nil];
}

- (void)hideNavigationBarShadowAnimated:(BOOL)animated
{
    __block typeof(self) selfBlockReference = self;
    [UIView animateWithDuration:0.25f * animated
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^
     {
         [selfBlockReference.navigationBarShadow setAlpha:NO];
     }
                     completion:nil];
}

@end
