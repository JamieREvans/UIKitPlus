//
//  UIView+Alignment.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Alignment)

// Alignment
+ (void)centerViews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations inHeight:(CGFloat)height withYInset:(CGFloat)yInset;
+ (void)centerViews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations onView:(UIView *)superview;
+ (void)centerViews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations onView:(UIView *)superview addingViewsToSuperview:(BOOL)shouldAddToSuperview;
+ (void)centerViews:(NSArray *)views withHorizontalSeparations:(NSArray *)horizontalSeparations onView:(UIView *)superview addingViewsToSuperview:(BOOL)shouldAddToSuperview;
- (void)addSubviews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations;

@end
