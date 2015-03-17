//
//  UIView+Alignment.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIView+Alignment.h"
#import "UIView+Framing.h"

@implementation UIView (Alignment)

+ (void)centerViews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations inHeight:(CGFloat)height withYInset:(CGFloat)yInset
{
    CGFloat totalHeight = [[views valueForKeyPath:@"@sum.height"] doubleValue] + [[verticalSeparations valueForKeyPath:@"@sum.self"] doubleValue];
    CGFloat yOffset = yInset + (height - totalHeight)/2.0f;
    
    UIView *lastView = views.firstObject;
    [lastView setYPosition:yOffset];
    
    for(int index = 1; index < views.count && index <= verticalSeparations.count; index++)
    {
        UIView *currentView = views[index];
        [currentView setYPosition:lastView.bottomOffset + [verticalSeparations[index - 1] doubleValue]];
        lastView = currentView;
    }
}

+ (void)centerViews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations onView:(UIView *)superview
{
    [self centerViews:views withVerticalSeparations:verticalSeparations onView:superview addingViewsToSuperview:NO];
}

+ (void)centerViews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations onView:(UIView *)superview addingViewsToSuperview:(BOOL)shouldAddToSuperview
{
    [self centerViews:views withVerticalSeparations:verticalSeparations inHeight:superview.height withYInset:0.0f];
    if(shouldAddToSuperview)for(UIView *view in views)[superview addSubview:view];
}

+ (void)centerViews:(NSArray *)views withHorizontalSeparations:(NSArray *)horizontalSeparations onView:(UIView *)superview addingViewsToSuperview:(BOOL)shouldAddToSuperview
{
    CGFloat totalWidth = [[views valueForKeyPath:@"@sum.width"] doubleValue] + [[horizontalSeparations valueForKeyPath:@"@sum.self"] doubleValue];
    if(totalWidth > superview.width)[superview setWidth:totalWidth];
    CGFloat xOffset = (superview.width - totalWidth)/2.0f;
    
    void (^addToSuperviewBlock)(UIView *) = ^(UIView *viewToAdd)
    {
        if(shouldAddToSuperview)
        {
            if(viewToAdd.superview != superview)[viewToAdd removeFromSuperview];
            [superview addSubview:viewToAdd];
        }
    };
    
    UIView *lastView = views.firstObject;
    [lastView setXPosition:xOffset];
    addToSuperviewBlock(lastView);
    
    for(int index = 1; index < views.count && index <= horizontalSeparations.count; index++)
    {
        UIView *currentView = views[index];
        [currentView setXPosition:lastView.rightSideOffset + [horizontalSeparations[index - 1] doubleValue]];
        lastView = currentView;
        
        addToSuperviewBlock(currentView);
    }
}

- (void)addSubviews:(NSArray *)views withVerticalSeparations:(NSArray *)verticalSeparations
{
    [UIView centerViews:views withVerticalSeparations:verticalSeparations onView:self addingViewsToSuperview:YES];
}

@end
