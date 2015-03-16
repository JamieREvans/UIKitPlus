//
//  NSDictionary+Attributes.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIFont+Allocation.h"

@interface NSAttributes : NSDictionary
@end

@interface NSDictionary (Attributes)

+ (instancetype)attributesWithFontType:(FontType)fontType pointSize:(CGFloat)pointSize andColor:(UIColor *)color;
+ (instancetype)attributesWithFont:(UIFont *)font textColor:(UIColor *)textColor;
+ (instancetype)attributesWithFont:(UIFont *)font textColor:(UIColor *)textColor lineSpacing:(CGFloat)lineSpacing;

@end
