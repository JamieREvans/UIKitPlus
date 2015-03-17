//
//  UIColor+Allocation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLOR_VALUE_MAX 255.0f
#define RGBValue(x) (x/COLOR_VALUE_MAX)

@interface UIColor (Allocation)

+ (UIColor *)color256WithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue;
+ (UIColor *)color256WithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue alpha:(CGFloat)alphaValue;
+ (UIColor *)color256WithWhite:(CGFloat)whiteValue;
+ (UIColor *)color256WithWhite:(CGFloat)whiteValue alpha:(CGFloat)alphaValue;

+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
