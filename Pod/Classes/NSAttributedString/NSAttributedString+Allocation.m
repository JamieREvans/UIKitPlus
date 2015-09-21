//
//  NSAttributedString+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <FoundationPlus/NSString+Manipulation.h>
#import "NSAttributedString+Allocation.h"
#import "NSDictionary+Attributes.h"

#define NSRangeZero NSMakeRange(0, 0)

@implementation NSAttributedString (Allocation)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string font:(UIFont *)font andTextColor:(UIColor *)textColor
{
    return [[self alloc] initWithString:string attributes:[NSAttributes attributesWithFont:font textColor:textColor]];
}

+ (NSMutableAttributedString *)attributedStringWithTextSegments:(NSArray *)textSegments andAttributeSegments:(NSArray *)attributeDictionaries
{
    NSMutableAttributedString *attributedString = [NSMutableAttributedString new];
    
    for(int i = 0; i < MIN(textSegments.count, attributeDictionaries.count); i++)
    {
        [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:textSegments[i] attributes:attributeDictionaries[i]]];
    }
    return attributedString;
}

- (NSMutableAttributedString *)mutable
{
    return (([self isKindOfClass:[NSMutableAttributedString class]] ||
             [self isKindOfClass:NSClassFromString(@"NSConcreteMutableAttributedString")]) ? self : self.mutableCopy);
}

- (instancetype)addAttribute:(id)attribute withTypeName:(NSString *)typeName forRange:(NSRange)range
{
    if(!(range.length + range.location) || range.location == NSNotFound)range = NSMakeRange(0, self.length);
    NSMutableAttributedString *mutableString = self.mutable;
    [mutableString addAttribute:typeName value:attribute range:range];
    return mutableString;
}

- (instancetype)addAttribute:(id)attribute withTypeName:(NSString *)typeName forString:(NSString *)searchString onlyFirstOccurence:(BOOL)onlyFirstOccurence
{
    NSMutableAttributedString *mutableString = self.mutable;
    NSArray *ranges = [self.string rangesOfString:searchString];
    for(int i = 0; ranges.count && i < (onlyFirstOccurence ? : ranges.count); i++)
    {
        [mutableString addAttribute:attribute withTypeName:typeName forRange:[ranges[i] rangeValue]];
    }
    return mutableString;
}

- (instancetype)addFont:(UIFont *)font forRange:(NSRange)range
{
    return [self addAttribute:font withTypeName:NSFontAttributeName forRange:range];
}

- (instancetype)addFont:(UIFont *)font forString:(NSString *)searchString onlyFirstOccurence:(BOOL)onlyFirstOccurence
{
    return [self addAttribute:font withTypeName:NSFontAttributeName forString:searchString onlyFirstOccurence:onlyFirstOccurence];
}

- (instancetype)addColor:(UIColor *)color forRange:(NSRange)range
{
    return [self addAttribute:color withTypeName:NSForegroundColorAttributeName forRange:range];
}

- (instancetype)addColor:(UIColor *)color forString:(NSString *)searchString onlyFirstOccurence:(BOOL)onlyFirstOccurence
{
    return [self addAttribute:color withTypeName:NSForegroundColorAttributeName forString:searchString onlyFirstOccurence:onlyFirstOccurence];
}

- (instancetype)setLineSpacing:(CGFloat)lineSpacing
{
    return [self setLineSpacing:lineSpacing forRange:NSRangeZero];
}

- (instancetype)setLineSpacing:(CGFloat)lineSpacing forRange:(NSRange)range
{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    [paragraphStyle setLineSpacing:lineSpacing];
    return [self addAttribute:paragraphStyle withTypeName:NSParagraphStyleAttributeName forRange:range];
}

@end
