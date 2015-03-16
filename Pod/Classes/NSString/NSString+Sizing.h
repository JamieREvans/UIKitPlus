//
//  NSString+Sizing.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <CoreGraphics/CGGeometry.h>
#import <Foundation/Foundation.h>

@interface NSString (Sizing)

- (CGSize)sizeOnSingleLineWithAttributes:(NSDictionary *)attributes;
- (CGSize)sizeInWidth:(CGFloat)width withAttributes:(NSDictionary *)attributes;

@end
