//
//  UIButton+Allocation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Allocation)

+ (instancetype)buttonWithImage:(UIImage *)image yPosition:(CGFloat)yPosition xPosition:(CGFloat)xPosition;
+ (instancetype)buttonWithImage:(UIImage *)image yPosition:(CGFloat)yPosition centeredInWidth:(CGFloat)width xOffset:(CGFloat)xOffset;

@end
