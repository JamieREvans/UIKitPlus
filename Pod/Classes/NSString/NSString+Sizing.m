//
//  NSString+Sizing.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "NSString+Sizing.h"

@implementation NSString (Sizing)

- (CGSize)sizeOnSingleLineWithAttributes:(NSDictionary *)attributes
{
    return [self sizeInWidth:FLT_MAX withAttributes:attributes];
}

- (CGSize)sizeInWidth:(CGFloat)width withAttributes:(NSDictionary *)attributes
{
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, FLT_MAX)
                                     options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                  attributes:attributes
                                     context:nil].size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

@end
