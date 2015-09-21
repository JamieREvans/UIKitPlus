//
//  UILabel+Framing.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UILabel+Framing.h"
#import "UIView+Framing.h"
#import "UIFont+Allocation.h"

@implementation UILabel (Framing)

- (void)setSingleLineAtYPosition:(CGFloat)yPosition
{
    [self setNumberOfLines:0];
    [self setYPosition:yPosition];
}

- (void)centerInHeight:(CGFloat)height forYOffset:(CGFloat)yOffset cleanView:(BOOL)cleanView
{
    UIFont *font = self.font;
    
    CGFloat labelTopPadding = [font ascender] - [font capHeight], labelBottomPadding = [font lineHeight] - [font ascender];
    
    CGRect stampLabelFrame = self.frame;
    if(cleanView)stampLabelFrame.size.height -= floor(labelTopPadding - 3.0f) + floor(labelBottomPadding - 3.0f);
    stampLabelFrame.origin.y = (height - (stampLabelFrame.size.height - ((cleanView) ? 0.0f : floorf(labelBottomPadding - 1.0f))))/2.0f + yOffset;
    [self setFrame:stampLabelFrame];
}

- (void)alignToBaselineOfLabel:(UILabel *)comparisonLabel
{
    [self alignBaselineToYPosition:comparisonLabel.baselineYPosition];
}

- (CGFloat)baselineYPosition
{
    return CGRectGetMaxY(self.frame) + self.font.descender;
}

- (void)alignBaselineToYPosition:(CGFloat)yPosition
{
    const CGFloat scale = [UIScreen mainScreen].scale;
    
    CGRect newFrame = self.frame;
    CGFloat labelBaseline = CGRectGetHeight(self.frame) + self.font.descender;
    newFrame.origin.y = floor((yPosition - labelBaseline) * scale) / scale;
    [self setFrame:newFrame];
}

- (void)alignToXHeightOfLabel:(UILabel *)comparisonLabel
{
    [self alignToBaselineOfLabel:comparisonLabel];
    [self setYPosition:self.frame.origin.y - comparisonLabel.font.xHeight];
}

- (void)cleanFontPadding
{
    UIFont *font = self.font;
    
    CGFloat labelTopPadding = [font ascender] - [font capHeight], labelBottomPadding = [font lineHeight] - [font ascender];
    CGRect stampLabelFrame = self.frame;
    stampLabelFrame.size.height -= floor(labelTopPadding - 2.0f) + floor(labelBottomPadding - 2.0f);
    [self setFrame:stampLabelFrame];
}

- (void)fixHeight
{
    if(self.numberOfLines)[self fixHeightForMaxLines:self.numberOfLines];
    else [self fixHeightForMaxHeight:FLT_MAX];
}

- (void)fixHeightForMaxLines:(NSInteger)maximumNumberOfLines
{
    [self fixHeightForMaxLines:maximumNumberOfLines withLineSpacing:0.0];
}

- (void)fixHeightForMaxLines:(NSInteger)maximumNumberOfLines withLineSpacing:(CGFloat)lineSpacing
{
    [self fixHeightForMaxHeight:(maximumNumberOfLines ? ((self.font.lineHeightCapped + lineSpacing) * maximumNumberOfLines) : FLT_MAX)];
}

- (void)fixHeightForMaxHeight:(CGFloat)maximumHeight
{
    [self setHeight:MIN(ceil([self sizeThatFits:CGSizeMake(self.frame.size.width, maximumHeight)].height), maximumHeight)];
}

- (void)fixWidth
{
    CGFloat oldWidth = self.width;
    [self setWidth:ceil([self sizeThatFits:CGSizeMake(FLT_MAX, self.font.lineHeightCapped)].width)];
    if(self.textAlignment == NSTextAlignmentCenter)[self setXPosition:self.leftSidePosition + (oldWidth - self.width)/2.0f];
    else if(self.textAlignment == NSTextAlignmentRight)[self setXPosition:self.leftSidePosition + (oldWidth - self.width)];
}

@end
