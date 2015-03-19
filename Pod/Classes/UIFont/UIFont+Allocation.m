//
//  UIFont+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIFont+Allocation.h"

static NSString *baseFontFamilyName = @"HelveticaNeue";

@implementation UIFont (Allocation)

+ (NSString *)baseFontFamilyName{return baseFontFamilyName;}
+ (void)setBaseFontFamilyName:(NSString *)_baseFontFamilyName{baseFontFamilyName = _baseFontFamilyName;}

+ (NSString *)fontNameWithType:(FontType)fontType
{
    NSString *fontExtension = nil;
    switch(fontType)
    {
        case FontTypeLight:
        {
            fontExtension = @"Light";
            break;
        }
        case FontTypeUltraLight:
        {
            fontExtension = @"UltraLight";
            break;
        }
        case FontTypeMedium:
        {
            fontExtension = @"Medium";
            break;
        }
        case FontTypeBold:
        {
            fontExtension = @"Bold";
            break;
        }
        default:
        {
            fontExtension = @"";
            break;
        }
    }
    return [NSString stringWithFormat:@"%@%@%@", [self baseFontFamilyName], (fontExtension.length ? @"-" : @""), fontExtension];
}

+ (UIFont *)fontWithType:(FontType)fontType andSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:[self fontNameWithType:fontType] size:fontSize];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+ (UIFont *)fontForText:(NSString *)text withFontName:(NSString *)fontName maxFontSize:(CGFloat)maxFontSize minFontSize:(CGFloat)minFontSize inWidth:(CGFloat)maxWidth
{
    CGFloat actualFontSize;
    [text sizeWithFont:[UIFont fontWithName:fontName size:maxFontSize] minFontSize:minFontSize actualFontSize:&actualFontSize forWidth:maxWidth lineBreakMode:NSLineBreakByTruncatingTail];
    return [UIFont fontWithName:fontName size:actualFontSize];
    
    // Broken in iOS 7
    /*
    NSStringDrawingContext *context = [NSStringDrawingContext new];
    [context setMinimumScaleFactor:(minFontSize/maxFontSize)];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:[UIFont fontWithName:fontName size:maxFontSize]}];
    [attributedString boundingRectWithSize:CGSizeMake(maxWidth, FLT_MAX)
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                   context:context];
    return [UIFont fontWithName:fontName size:maxFontSize * ((context.actualScaleFactor > 0.0f) ? context.actualScaleFactor : 1.0f)];*/
}
#pragma clang diagnostic pop

- (instancetype)italicized
{
    return [UIFont fontWithName:[NSString stringWithFormat:@"%@%@Italic", self.fontName, ([[[self class] fontNameWithType:FontTypeRegular] isEqualToString:self.fontName] ? @"-" : @"")] size:self.pointSize];
}

- (CGFloat)lineHeightCapped
{
    return ceil(self.lineHeight);
}

@end
