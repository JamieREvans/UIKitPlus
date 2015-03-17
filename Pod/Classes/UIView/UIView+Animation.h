//
//  UIView+Animation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

// Cross Fade
+ (void)crossFadeWithDuration:(CGFloat)animationDuration animationBlock:(void (^)())animation completion:(void (^)(BOOL))completion;

@end
