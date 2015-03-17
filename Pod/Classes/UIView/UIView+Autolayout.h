//
//  UIView+Autolayout.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Autolayout)

// Alignment
- (void)alignToRightOfView:(UIView *)view withPadding:(CGFloat)padding;
- (void)alignToLeftOfView:(UIView *)view withPadding:(CGFloat)padding;
- (void)alignBelowView:(UIView *)view withPadding:(CGFloat)padding;
- (void)alignAboveView:(UIView *)view withPadding:(CGFloat)padding;

// Positioning
- (void)alignLeftToLayoutPosition:(CGFloat)position;
- (void)alignRightToSuperviewWithPadding:(CGFloat)padding;
- (void)alignTopToLayoutPosition:(CGFloat)position;
- (void)alignBottomToSuperviewWithPadding:(CGFloat)padding;

- (void)alignCenterHorizontally;
- (void)alignCenterVertically;
- (void)alignCenter;

// Sizing
- (void)setLayoutWidth:(CGFloat)layoutWidth;
- (void)matchWidthToView:(UIView *)view withExtension:(CGFloat)extension;
// extension: the value added to the width
- (void)matchWidthToView:(UIView *)view withPercentage:(CGFloat)viewWidthPercentage;
// viewWidthPercentage: a value ranging from 0.0f to ∞
- (void)matchWidthToRightOfView:(UIView *)view withExtension:(CGFloat)extension;

- (void)setLayoutHeight:(CGFloat)layoutHeight;
- (void)matchHeightToView:(UIView *)view withExtension:(CGFloat)extension;
// extension: the value added to the height
- (void)matchHeightToView:(UIView *)view withPercentage:(CGFloat)viewHeightPercentage;
// viewWidthPercentage: a value ranging from 0.0f to ∞
- (void)matchHeightToBottomOfView:(UIView *)view withExtension:(CGFloat)extension;

@end
