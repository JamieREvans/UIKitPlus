//
//  UIView+Framing.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIView+Framing.h"

@implementation UIView (Framing)

+ (CGFloat)onePixel{return 1.0f/[UIScreen mainScreen].scale;}

- (CGFloat)width{return self.frame.size.width;}
- (CGFloat)height{return self.frame.size.height;}
- (CGFloat)leftSidePosition{return self.frame.origin.x;}
- (CGFloat)topPosition{return self.frame.origin.y;}
- (CGFloat)rightSideOffset{return CGRectGetMaxX(self.frame);}
- (CGFloat)bottomOffset{return CGRectGetMaxY(self.frame);}

- (void)setXPosition:(CGFloat)xPosition
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = xPosition;
    [self setFrame:newFrame];
}

- (void)setYPosition:(CGFloat)yPosition
{
    CGRect newFrame = self.frame;
    newFrame.origin.y = yPosition;
    [self setFrame:newFrame];
}

- (void)setWidth:(CGFloat)width
{
    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    [self setFrame:newFrame];
}

- (void)setHeight:(CGFloat)height
{
    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    [self setFrame:newFrame];
}

- (void)offsetXPosition:(CGFloat)xOffset
{
    [self setXPosition:self.leftSidePosition + xOffset];
}

- (void)offsetYPosition:(CGFloat)yOffset
{
    [self setYPosition:self.topPosition + yOffset];
}

- (void)centerInWidth:(CGFloat)width
{
    [self centerInWidth:width forXOffset:0.0f];
}

- (void)centerInWidth:(CGFloat)width forXOffset:(CGFloat)xOffset
{
    [self setXPosition:(width - self.width)/2.0f + xOffset];
}

- (void)centerInWidth:(CGFloat)width forXOffset:(CGFloat)xOffset subtractingOffset:(BOOL)shouldDiscountOffset
{
    [self setXPosition:((width - (xOffset * shouldDiscountOffset)) - self.width)/2.0f + xOffset];
}

- (void)centerInHeight:(CGFloat)height
{
    [self centerInHeight:height forYOffset:0.0f];
}

- (void)centerInHeight:(CGFloat)height forYOffset:(CGFloat)yOffset
{
    [self centerInHeight:height forYOffset:yOffset subtractingOffset:NO];
}

- (void)centerInHeight:(CGFloat)height forYOffset:(CGFloat)yOffset subtractingOffset:(BOOL)shouldDiscountOffset
{
    [self setYPosition:((height - (yOffset * shouldDiscountOffset)) - self.height)/2.0f + yOffset];
}

- (void)centerInSize:(CGSize)size
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = (size.width - newFrame.size.width)/2;
    newFrame.origin.y = (size.height - newFrame.size.height)/2;
    [self setFrame:newFrame];
}

- (void)centerHorizontallyToView:(UIView *)view
{
    [self centerInWidth:view.width forXOffset:view.leftSidePosition];
}

- (void)centerVerticallyToView:(UIView *)view
{
    [self centerInHeight:view.height forYOffset:view.topPosition];
}

- (void)alignBottomToYPosition:(CGFloat)yPosition
{
    [self setYPosition:yPosition - self.height];
}

- (void)alignRightToXPosition:(CGFloat)xPosition
{
    [self setXPosition:xPosition - self.width];
}

// UIImage Convenience
- (CGSize)scaledSizeForImages{return CGSizeMake(self.width * [UIScreen mainScreen].scale, self.height * [UIScreen mainScreen].scale);}

@end

#pragma mark - CGRect Convenience -

CGRect CGRectExtend(CGRect startRect, CGFloat widthExtention, CGFloat heightExtension)
{
    startRect.size.width += widthExtention;
    startRect.size.height += heightExtension;
    return startRect;
}

CGRect CGRectCrush(CGRect startRect, CGFloat widthCrush, CGFloat heightCrush)
{
    startRect.origin.x += widthCrush;
    startRect.origin.y += heightCrush;
    startRect.size.width -= widthCrush;
    startRect.size.height -= heightCrush;
    return startRect;
}

CGRect CGRectCenterRectInRect(CGRect outerRect, CGRect innerRect)
{
    return CGRectMake((outerRect.size.width - innerRect.size.width)/2.0f, (outerRect.size.height - innerRect.size.height)/2.0f, innerRect.size.width, innerRect.size.height);
}

CGRect CGRectMakeCenteredWithInsets(CGRect startRect, CGFloat horizontalInset, CGFloat verticalInset)
{
    return CGRectMake(horizontalInset, verticalInset, startRect.size.width - horizontalInset * 2.0f, startRect.size.height - verticalInset * 2.0f);
}

CGPoint CGRectGetCenter(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}
