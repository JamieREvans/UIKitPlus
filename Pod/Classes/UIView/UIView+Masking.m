//
//  UIView+Masking.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIView+Masking.h"

@implementation UIView (Masking)

- (void)maskToRect:(CGRect)rectForMask
{
    [self maskToRects:@[[NSValue valueWithCGRect:rectForMask]]];
}

- (void)maskToRects:(NSArray *)maskValueArray
{
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    
    CGMutablePathRef maskPath = CGPathCreateMutable();
    
    for(NSValue *rectValue in maskValueArray)
    {
        CGRect maskRect = rectValue.CGRectValue;
        
        CGPathAddRect(maskPath, nil, maskRect);
    }
    
    [maskLayer setPath:maskPath];
    
    CGPathRelease(maskPath);
    
    [self.layer setMask:maskLayer];
}

@end
