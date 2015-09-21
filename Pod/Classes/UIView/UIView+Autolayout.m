//
//  UIView+Autolayout.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

#pragma mark - Helper Function -

- (void)applyConstraint:(NSLayoutConstraint *)constraint
{
    if(self.translatesAutoresizingMaskIntoConstraints)
    {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    [self.superview addConstraint:constraint];
}

#pragma mark - Alignment -

- (void)alignToRightOfView:(UIView *)view withPadding:(CGFloat)padding
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0f
                                                        constant:padding]];
}

- (void)alignToLeftOfView:(UIView *)view withPadding:(CGFloat)padding
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1.0f
                                                        constant:-padding]];
}

- (void)alignBelowView:(UIView *)view withPadding:(CGFloat)padding
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeTop
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeBottom
                                                      multiplier:1.0f
                                                        constant:padding]];
}

- (void)alignAboveView:(UIView *)view withPadding:(CGFloat)padding
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeBottom
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeTop
                                                      multiplier:1.0f
                                                        constant:-padding]];
}

#pragma mark - Positioning -

- (void)alignLeftToLayoutPosition:(CGFloat)position
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.superview
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1.0f
                                                        constant:position]];
}

- (void)alignRightToSuperviewWithPadding:(CGFloat)padding
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.superview
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0f
                                                        constant:-padding]];
}

- (void)alignTopToLayoutPosition:(CGFloat)position
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeTop
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.superview
                                                       attribute:NSLayoutAttributeTop
                                                      multiplier:1.0f
                                                        constant:position]];
}

- (void)alignBottomToSuperviewWithPadding:(CGFloat)padding
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeBottom
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.superview
                                                       attribute:NSLayoutAttributeBottom
                                                      multiplier:1.0f
                                                        constant:-padding]];
}

- (void)alignCenterHorizontally
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeCenterX
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.superview
                                                       attribute:NSLayoutAttributeCenterX
                                                      multiplier:1.0f
                                                        constant:0.0f]];
}

- (void)alignCenterVertically
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeCenterY
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.superview
                                                       attribute:NSLayoutAttributeCenterY
                                                      multiplier:1.0f
                                                        constant:0.0f]];
}

- (void)alignCenter
{
    [self alignCenterHorizontally];
    [self alignCenterVertically];
}

#pragma mark - Sizing -

- (void)setLayoutWidth:(CGFloat)layoutWidth
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute:NSLayoutAttributeWidth
                                                      multiplier:0.0f
                                                        constant:layoutWidth]];
}

- (void)matchWidthToView:(UIView *)view withExtension:(CGFloat)extension
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeWidth
                                                      multiplier:1.0f
                                                        constant:extension]];
}

- (void)matchWidthToView:(UIView *)view withPercentage:(CGFloat)viewWidthPercentage
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeWidth
                                                      multiplier:viewWidthPercentage
                                                        constant:0.0f]];
}

- (void)matchWidthToRightOfView:(UIView *)view withExtension:(CGFloat)extension
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0f
                                                        constant:extension]];
}

- (void)setLayoutHeight:(CGFloat)layoutHeight
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute:NSLayoutAttributeHeight
                                                      multiplier:0.0f
                                                        constant:layoutHeight]];
}

- (void)matchHeightToView:(UIView *)view withExtension:(CGFloat)extension
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeHeight
                                                      multiplier:1.0f
                                                        constant:extension]];
}

- (void)matchHeightToView:(UIView *)view withPercentage:(CGFloat)viewHeightPercentage
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeHeight
                                                      multiplier:viewHeightPercentage
                                                        constant:0.0f]];
}

- (void)matchHeightToBottomOfView:(UIView *)view withExtension:(CGFloat)extension
{
    [self applyConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:view
                                                       attribute:NSLayoutAttributeBottom
                                                      multiplier:1.0f
                                                        constant:extension]];
}

@end
