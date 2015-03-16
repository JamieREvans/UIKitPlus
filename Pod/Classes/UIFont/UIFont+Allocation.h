//
//  UIFont+Allocation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    FontTypeRegular = 0,
    FontTypeLight,
    FontTypeUltraLight,
    FontTypeMedium,
    FontTypeBold
} FontType;

@interface UIFont (Allocation)

+ (NSString *)baseFontFamilyName;
+ (void)setBaseFontFamilyName:(NSString *)baseFontFamilyName;

+ (NSString *)fontNameWithType:(FontType)fontType;
+ (UIFont *)fontWithType:(FontType)fontType andSize:(CGFloat)fontSize;

+ (UIFont *)fontForText:(NSString *)textForFont withFontName:(NSString *)fontName maxFontSize:(CGFloat)maxFontSize minFontSize:(CGFloat)minFontSize inWidth:(CGFloat)maxWidth;

- (instancetype)italicized;

- (CGFloat)lineHeightCapped;

@end
