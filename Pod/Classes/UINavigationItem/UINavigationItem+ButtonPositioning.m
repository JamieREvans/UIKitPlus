//
//  UINavigationItem+ButtonPositioning.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UINavigationItem+ButtonPositioning.h"

@implementation UINavigationItem (ButtonPositioning)

- (UIBarButtonItem *)paddingButtonItemWithHorizontalPadding:(CGFloat)horizontalPadding
{
    UIBarButtonItem *paddingItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [paddingItem setWidth:horizontalPadding];
    return paddingItem;
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)barButtonItem animated:(BOOL)isAnimated withHorizontalPadding:(CGFloat)horizontalPadding
{
    [self setLeftBarButtonItems:@[[self paddingButtonItemWithHorizontalPadding:horizontalPadding], barButtonItem] animated:isAnimated];
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)barButtonItem animated:(BOOL)isAnimated withHorizontalPadding:(CGFloat)horizontalPadding
{
    [self setRightBarButtonItems:@[[self paddingButtonItemWithHorizontalPadding:horizontalPadding], barButtonItem] animated:isAnimated];
}

@end
