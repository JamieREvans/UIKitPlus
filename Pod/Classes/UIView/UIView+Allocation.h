//
//  UIView+Allocation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGPoint CGPointMakeWithXPosition(CGFloat xPosition);
extern CGPoint CGPointMakeWithYPosition(CGFloat yPosition);

@interface UIView (Allocation)

+ (instancetype)viewWithWidth:(CGFloat)width;
+ (instancetype)viewWithWidth:(CGFloat)width atPoint:(CGPoint)originPoint;
+ (instancetype)viewWithHeight:(CGFloat)height;
+ (instancetype)viewWithHeight:(CGFloat)height atPoint:(CGPoint)originPoint;
+ (instancetype)viewWithSize:(CGSize)size;
+ (instancetype)viewWithWidth:(CGFloat)width andHeight:(CGFloat)height;

@end
