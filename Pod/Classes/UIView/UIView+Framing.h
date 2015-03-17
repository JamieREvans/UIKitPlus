//
//  UIView+Framing.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGRect  CGRectExtend(CGRect startRect, CGFloat widthExtention, CGFloat heightExtension);
extern CGRect  CGRectCrush(CGRect startRect, CGFloat widthCrush, CGFloat heightCrush);
extern CGRect  CGRectCenterRectInRect(CGRect outerRect, CGRect innerRect);
extern CGRect  CGRectMakeCenteredWithInsets(CGRect startRect, CGFloat horizontalInset, CGFloat verticalInset);
extern CGPoint CGRectGetCenter(CGRect rect);

@interface UIView (Framing)

+ (CGFloat)onePixel;

- (CGFloat)width;
- (CGFloat)height;
- (CGFloat)leftSidePosition;
- (CGFloat)topPosition;
- (CGFloat)rightSideOffset;
- (CGFloat)bottomOffset;

- (void)setXPosition:(CGFloat)xPosition;
- (void)setYPosition:(CGFloat)yPosition;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

- (void)offsetXPosition:(CGFloat)xOffset;
- (void)offsetYPosition:(CGFloat)yOffset;

- (void)centerInWidth:(CGFloat)width;
- (void)centerInWidth:(CGFloat)width forXOffset:(CGFloat)xOffset;
- (void)centerInWidth:(CGFloat)width forXOffset:(CGFloat)xOffset subtractingOffset:(BOOL)shouldDiscountOffset;
- (void)centerInHeight:(CGFloat)height;
- (void)centerInHeight:(CGFloat)height forYOffset:(CGFloat)yOffset;
- (void)centerInHeight:(CGFloat)height forYOffset:(CGFloat)yOffset subtractingOffset:(BOOL)shouldDiscountOffset;
- (void)centerInSize:(CGSize)size;
- (void)centerHorizontallyToView:(UIView *)view;
- (void)centerVerticallyToView:(UIView *)view;

- (void)alignBottomToYPosition:(CGFloat)yPosition;
- (void)alignRightToXPosition:(CGFloat)xPosition;

// UIImage Convenience
- (CGSize)scaledSizeForImages;

@end
