//
//  UILabel+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UILabel+Allocation.h"
#import "UIView+Framing.h"

@implementation UILabel (Allocation)

#define PLACEHOLDER_STRING @"#"

+ (instancetype)labelForAttributedText:(NSAttributedString *)attributedString inWidth:(CGFloat)width
{
    UILabel *label = [self new];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setAttributedText:attributedString];
    [label setNumberOfLines:0];
    
    if(!attributedString.length)
    {
        [label setHeight:[label sizeThatFits:CGSizeMake(FLT_MAX, FLT_MAX)].height];
        [label setWidth:width];
    }
    else
    {
        CGSize sizeThatFits = [label sizeThatFits:CGSizeMake(width, FLT_MAX)];
        [label setFrame:CGRectMake(0.0f, 0.0f, ceil(sizeThatFits.width), ceil(sizeThatFits.height))];
    }
    
    return label;
}

+ (instancetype)labelForAttributedText:(NSAttributedString *)attributedString yPosition:(CGFloat)yPosition xPosition:(CGFloat)xPosition maxWidth:(CGFloat)maxWidth
{
    UILabel *label = [self labelForAttributedText:attributedString inWidth:maxWidth];
    
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    
    CGRect newFrame = label.frame;
    newFrame.origin.x = xPosition;
    newFrame.origin.y = yPosition;
    [label setFrame:newFrame];
    return label;
}

+ (instancetype)labelForAttributedText:(NSAttributedString *)attributedString yPosition:(CGFloat)yPosition centeredInWidth:(CGFloat)width xOffset:(CGFloat)xOffset
{
    UILabel *label = [self labelForAttributedText:attributedString inWidth:width];
    
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    
    CGRect newFrame = label.frame;
    newFrame.origin.x = (width - newFrame.size.width)/2.0f + xOffset;
    newFrame.origin.y = yPosition;
    [label setFrame:newFrame];
    return label;
}

+ (instancetype)labelForString:(NSString *)string attributes:(NSAttributes *)attributes yPosition:(CGFloat)yPosition inWidth:(CGFloat)width
{
    UILabel *label = [self labelForAttributedText:[[NSAttributedString alloc] initWithString:(string.length ? string : PLACEHOLDER_STRING)
                                                                                  attributes:attributes]
                                          inWidth:width];
    if(!string.length)
    {
        [label setText:@""];
        [label setWidth:width];
        [label setHeight:[attributes[NSFontAttributeName] lineHeightCapped]];
    }
    [label setYPosition:yPosition];
    [label setFont:attributes[NSFontAttributeName]];
    [label setTextColor:attributes[NSForegroundColorAttributeName]];
    return label;
}

+ (instancetype)labelForString:(NSString *)string attributes:(NSAttributes *)attributes yPosition:(CGFloat)yPosition xPosition:(CGFloat)xPosition maxWidth:(CGFloat)maxWidth
{
    UILabel *label = [self labelForString:string attributes:attributes yPosition:yPosition inWidth:maxWidth];
    [label setXPosition:xPosition];
    return label;
}

+ (instancetype)labelForString:(NSString *)string attributes:(NSAttributes *)attributes yPosition:(CGFloat)yPosition centeredInWidth:(CGFloat)width xOffset:(CGFloat)xOffset
{
    UILabel *label = [self labelForString:string attributes:attributes yPosition:yPosition inWidth:width];
    [label centerInWidth:width forXOffset:xOffset];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}

@end
