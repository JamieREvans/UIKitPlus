//
//  UIColor+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIColor+Allocation.h"

@implementation UIColor (Allocation)

+ (UIColor *)color256WithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue{return [self color256WithRed:redValue green:greenValue blue:blueValue alpha:COLOR_VALUE_MAX];}
+ (UIColor *)color256WithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue alpha:(CGFloat)alphaValue
{
    return [self colorWithRed:RGBValue(redValue)
                        green:RGBValue(greenValue)
                         blue:RGBValue(blueValue)
                        alpha:RGBValue(alphaValue)];
}

+ (UIColor *)color256WithWhite:(CGFloat)whiteValue{return [self color256WithWhite:whiteValue alpha:COLOR_VALUE_MAX];}
+ (UIColor *)color256WithWhite:(CGFloat)whiteValue alpha:(CGFloat)alphaValue
{
    return [self colorWithWhite:RGBValue(whiteValue)
                          alpha:RGBValue(alphaValue)];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSMutableCharacterSet *invalidCharacters = [NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    [invalidCharacters addCharactersInString:@"#"];

    hexString = [[[hexString stringByTrimmingCharactersInSet:invalidCharacters] uppercaseString] stringByReplacingOccurrencesOfString:@"0X" withString:@""];

    if(hexString.length < 6 || hexString.length % 2)return [self grayColor];


    NSRange range = NSMakeRange(0, 2);
    u_int8_t colorValues[4] = {0};
    for(; range.location + range.length <= hexString.length; range.location += range.length)
    {
        unsigned int colorValue;
        [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&colorValue];
        colorValues[range.location/range.length] = colorValue;
    }

    return [self color256WithRed:colorValues[0]
                           green:colorValues[1]
                            blue:colorValues[2]
                           alpha:colorValues[3] ? : COLOR_VALUE_MAX];
}

@end
