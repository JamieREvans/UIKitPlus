//
//  UIButton+Touches.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIButton+Touches.h"
#import "UIView+Subviews.h"

@implementation UIButton (Touches)

#define OVERLAY_VIEW_TAG 41

- (void)addHighlightToButton
{
    [self addTarget:self action:@selector(showHighlight) forControlEvents:(UIControlEvents)UIControlEventTouchBegin];
    [self addTarget:self action:@selector(hideHighlight) forControlEvents:(UIControlEvents)UIControlEventTouchEnd];
}

- (void)showHighlight
{
    UIView *overlayView = [[UIView alloc] initWithFrame:self.bounds];
    [overlayView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.2f]];
    [overlayView setTag:OVERLAY_VIEW_TAG];
    [self addSubview:overlayView];
}

- (void)hideHighlight
{
    for(UIView *overlayView in [self subviewsWithTag:OVERLAY_VIEW_TAG])[overlayView removeFromSuperview];
}

@end
