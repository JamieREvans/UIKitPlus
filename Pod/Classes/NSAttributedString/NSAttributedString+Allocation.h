//
//  NSAttributedString+Allocation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (Allocation)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string font:(UIFont *)font andTextColor:(UIColor *)textColor;
+ (NSMutableAttributedString *)attributedStringWithTextSegments:(NSArray *)textSegments andAttributeSegments:(NSArray *)attributeDictionaries;

- (instancetype)addFont:(UIFont *)font forRange:(NSRange)range;
- (instancetype)addFont:(UIFont *)font forString:(NSString *)searchString onlyFirstOccurence:(BOOL)onlyFirstOccurence;
- (instancetype)addColor:(UIColor *)color forRange:(NSRange)range;
- (instancetype)addColor:(UIColor *)color forString:(NSString *)searchString onlyFirstOccurence:(BOOL)onlyFirstOccurence;
- (instancetype)setLineSpacing:(CGFloat)lineSpacing;
- (instancetype)setLineSpacing:(CGFloat)lineSpacing forRange:(NSRange)range;

@end
