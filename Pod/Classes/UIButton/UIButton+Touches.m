//
//  UIButton+Touches.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIButton+Touches.h"
#import "UIView+Subviews.h"
#import "NSObject+Values.h"
#import "UIView+Autolayout.h"

@interface UIButton (HighlightOverlay)

@property (nonatomic) UIView *highlightOverlay;

@end

@implementation UIButton (HighlightOverlay)

- (UIView *)highlightOverlay{ return [self valueForSelector:@selector(highlightOverlay)]; }
- (void)setHighlightOverlay:(UIView *)highlightOverlay
{
    [self setValue:highlightOverlay forSelector:@selector(highlightOverlay)];
}

@end

@implementation UIButton (Touches)

- (void)addHighlightToButton
{
    [self addHighlightToButtonWithOpacity:0.2];
}

- (void)addHighlightToButtonWithOpacity:(CGFloat)opacity
{

    [self addTarget:self action:@selector(showHighlight) forControlEvents:(UIControlEvents)UIControlEventTouchBegin];
    [self addTarget:self action:@selector(hideHighlight) forControlEvents:(UIControlEvents)UIControlEventTouchEnd];

    if(!self.highlightOverlay)
    {
        UIView *overlayView = [[UIView alloc] initWithFrame:self.bounds];
        [overlayView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:opacity]];

        [self setHighlightOverlay:overlayView];
    }
}

- (void)showHighlight
{
    [self addSubview:self.highlightOverlay];

    [self.highlightOverlay alignCenter];
    [self.highlightOverlay matchWidthToView:self withExtension:0.0];
    [self.highlightOverlay matchHeightToView:self withExtension:0.0];
}

- (void)hideHighlight
{
    [self.highlightOverlay removeFromSuperview];
}

@end
