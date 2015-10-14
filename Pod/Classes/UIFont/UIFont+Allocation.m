//
//  UIFont+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIFont+Allocation.h"
#import "NSArray+Allocation.h"

static NSString *baseFontFamilyName = @"HelveticaNeue";

@implementation UIFont (Allocation)

+ (NSString *)baseFontFamilyName{return baseFontFamilyName;}
+ (void)setBaseFontFamilyName:(NSString *)_baseFontFamilyName{baseFontFamilyName = _baseFontFamilyName;}

+ (NSString *)fontExtensionWithType:(FontType)fontType
{
    switch(fontType)
    {
        case FontTypeBase:       return @"";
        case FontTypeRegular:    return @"Regular";
        case FontTypeLight:      return @"Light";
        case FontTypeBold:       return @"Bold";
        case FontTypeMedium:     return @"Medium";
        case FontTypeUltraLight: return @"UltraLight";
        case FontTypeSemiBold:   return @"SemiBold";
        case FontTypeDemiBold:   return @"DemiBold";
        case FontTypeHeavy:      return @"Heavy";
    }
}

+ (NSString *)fontNameWithType:(FontType)fontType
{
    NSString *fontExtension = [self fontExtensionWithType:fontType];

    return [NSString stringWithFormat:@"%@%@%@", [self baseFontFamilyName], (fontExtension.length ? @"-" : @""), fontExtension];
}

+ (UIFont *)fontWithType:(FontType)fontType andSize:(CGFloat)fontSize
{
    return [self fontWithName:[self fontNameWithType:fontType] size:fontSize];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+ (UIFont *)fontForText:(NSString *)text withFontName:(NSString *)fontName maxFontSize:(CGFloat)maxFontSize minFontSize:(CGFloat)minFontSize inWidth:(CGFloat)maxWidth
{
    CGFloat actualFontSize;
    [text sizeWithFont:[self fontWithName:fontName size:maxFontSize] minFontSize:minFontSize actualFontSize:&actualFontSize forWidth:maxWidth lineBreakMode:NSLineBreakByTruncatingTail];
    return [self fontWithName:fontName size:actualFontSize];
    
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
    __block NSUInteger shortestFontNameLength = INT_MAX;
    NSString *fontName = [[[self class] fontNamesForFamilyName:self.familyName] subarrayWithObjectsPassingConstraint:^BOOL(NSObject *object)
     {
         NSString *currentFontName = (NSString *)object;
         if(currentFontName.length < shortestFontNameLength && [currentFontName containsString:self.fontName] && [currentFontName rangeOfString:@"italic" options:NSCaseInsensitiveSearch].location != NSNotFound)
         {
             shortestFontNameLength = currentFontName.length;
             return YES;
         }
         else
         {
             return NO;
         }
     }].lastObject;
    return [UIFont fontWithName:fontName size:self.pointSize];
}

- (CGFloat)lineHeightCapped
{
    return ceil(self.lineHeight);
}

@end
