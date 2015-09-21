//
//  UIButton+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIButton+Allocation.h"

//#define EXTRA_BUTTON_TOUCH_AREA 15.0f

@implementation UIButton (Allocation)

+ (instancetype)buttonWithImage:(UIImage *)image yPosition:(CGFloat)yPosition xPosition:(CGFloat)xPosition
{
    UIButton *button = [[self alloc] initWithFrame:CGRectMake(xPosition, yPosition, image.size.width, image.size.height)];
    [button setImage:image forState:UIControlStateNormal];
    // TODO: Is it possible to extend the touch area on a UIButton through contentEdgeInsets?
    //[button setContentEdgeInsets:UIEdgeInsetsMake(EXTRA_BUTTON_TOUCH_AREA, EXTRA_BUTTON_TOUCH_AREA, EXTRA_BUTTON_TOUCH_AREA, EXTRA_BUTTON_TOUCH_AREA)];
    return button;
}

+ (instancetype)buttonWithImage:(UIImage *)image yPosition:(CGFloat)yPosition centeredInWidth:(CGFloat)width xOffset:(CGFloat)xOffset
{
    return [self buttonWithImage:image yPosition:yPosition xPosition:(xOffset + (width - image.size.width)/2.0f)];
}

@end
