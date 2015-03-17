//
//  UILabel+Allocation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDictionary+Attributes.h"

@interface UILabel (Allocation)

// NSAttributedString labels - Easy one time allocation
+ (instancetype)labelForAttributedText:(NSAttributedString *)attributedString yPosition:(CGFloat)yPosition xPosition:(CGFloat)xPosition maxWidth:(CGFloat)maxWidth;
+ (instancetype)labelForAttributedText:(NSAttributedString *)attributedString yPosition:(CGFloat)yPosition centeredInWidth:(CGFloat)width xOffset:(CGFloat)xOffset;

// NSString + NSAttributes - Dynamic labels
+ (instancetype)labelForString:(NSString *)string attributes:(NSAttributes *)attributes yPosition:(CGFloat)yPosition xPosition:(CGFloat)xPosition maxWidth:(CGFloat)maxWidth;
+ (instancetype)labelForString:(NSString *)string attributes:(NSAttributes *)attributes yPosition:(CGFloat)yPosition centeredInWidth:(CGFloat)width xOffset:(CGFloat)xOffset;

@end
