//
//  UINavigationItem+ButtonPositioning.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (ButtonPositioning)

- (void)setLeftBarButtonItem:(UIBarButtonItem *)barButtonItem animated:(BOOL)isAnimated withHorizontalPadding:(CGFloat)horizontalPadding;
- (void)setRightBarButtonItem:(UIBarButtonItem *)barButtonItem animated:(BOOL)isAnimated withHorizontalPadding:(CGFloat)horizontalPadding;

@end
