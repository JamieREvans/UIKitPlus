//
//  UILabel+Framing.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Framing)

- (void)setSingleLineAtYPosition:(CGFloat)yPosition;
- (void)centerInHeight:(CGFloat)height forYOffset:(CGFloat)yOffset cleanView:(BOOL)cleanView;
- (void)alignToBaselineOfLabel:(UILabel *)comparisonLabel;
- (CGFloat)baselineYPosition;
- (void)alignBaselineToYPosition:(CGFloat)yPosition;
- (void)alignToXHeightOfLabel:(UILabel *)comparisonLabel;
- (void)cleanFontPadding;

- (void)fixHeight;
- (void)fixHeightForMaxLines:(NSInteger)maximumNumberOfLines;
- (void)fixHeightForMaxLines:(NSInteger)maximumNumberOfLines withLineSpacing:(CGFloat)lineSpacing;
- (void)fixHeightForMaxHeight:(CGFloat)maximumHeight;
- (void)fixWidth;

@end
