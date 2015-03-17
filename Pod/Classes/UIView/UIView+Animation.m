//
//  UIView+Animation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

+ (void)crossFadeWithDuration:(CGFloat)animationDuration animationBlock:(void (^)())animation completion:(void (^)(BOOL))completion
{
    [UIView animateWithDuration:animationDuration
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionCrossDissolve
                     animations:animation
                     completion:completion];
}

@end
