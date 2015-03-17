//
//  UIView+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIView+Allocation.h"

CGPoint CGPointMakeWithXPosition(CGFloat xPosition){return CGPointMake(xPosition, 0.0f);}
CGPoint CGPointMakeWithYPosition(CGFloat yPosition){return CGPointMake(0.0f, yPosition);}

@implementation UIView (Allocation)

+ (instancetype)viewWithWidth:(CGFloat)width
{
    return [self viewWithWidth:width atPoint:CGPointZero];
}

+ (instancetype)viewWithWidth:(CGFloat)width atPoint:(CGPoint)originPoint
{
    return [[self alloc] initWithFrame:CGRectMake(originPoint.x, originPoint.y, width, 0.0f)];
}

+ (instancetype)viewWithHeight:(CGFloat)height
{
    return [self viewWithHeight:height atPoint:CGPointZero];
}

+ (instancetype)viewWithHeight:(CGFloat)height atPoint:(CGPoint)originPoint
{
    return [[self alloc] initWithFrame:CGRectMake(originPoint.x, originPoint.y, 0.0f, height)];
}

+ (instancetype)viewWithSize:(CGSize)size
{
    return [self viewWithWidth:size.width andHeight:size.height];
}

+ (instancetype)viewWithWidth:(CGFloat)width andHeight:(CGFloat)height
{
    return [[self alloc] initWithFrame:CGRectMake(0.0f, 0.0f, width, height)];
}

@end
