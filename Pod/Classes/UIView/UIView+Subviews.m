//
//  UIView+Subviews.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIView+Subviews.h"

@implementation UIView (Subviews)

- (SubviewConstraint)constraintWithClass:(Class)classToSearchFor
{
    return ^BOOL(UIView *subview)
    {
        return [subview isKindOfClass:classToSearchFor];
    };
}

- (SubviewConstraint)constraintWithProtocol:(Protocol *)protocol
{
    return ^BOOL(UIView *subview)
    {
        return [subview conformsToProtocol:protocol];
    };
}

- (SubviewConstraint)constraintWithTag:(int)tag
{
    return ^BOOL(UIView *subview)
    {
        return subview.tag == tag;
    };
}

- (id)subviewOfClass:(Class)classToSearchFor
{
    return [self subviewPassingConstraint:[self constraintWithClass:classToSearchFor]];
}

- (NSArray *)subviewsOfClass:(Class)classToSearchFor
{
    return [self subviewsPassingConstraint:[self constraintWithClass:classToSearchFor]];
}

- (id)subviewConformingToProtocol:(Protocol *)protocol
{
    return [self subviewPassingConstraint:[self constraintWithProtocol:protocol]];
}

- (NSArray *)subviewsConformingToProtocol:(Protocol *)protocol
{
    return [self subviewsPassingConstraint:[self constraintWithProtocol:protocol]];
}

- (id)subviewWithTag:(int)tag
{
    return [self subviewPassingConstraint:[self constraintWithTag:tag]];
}

- (NSArray *)subviewsWithTag:(int)tag
{
    return [self subviewsPassingConstraint:[self constraintWithTag:tag]];
}

- (id)subviewPassingConstraint:(SubviewConstraint)constraint
{
    NSArray *subviews = [self subviewsPassingConstraint:constraint];
    return subviews.firstObject;
}

- (NSArray *)subviewsPassingConstraint:(SubviewConstraint)constraint
{
    NSMutableArray *subviews = [NSMutableArray array];
    for(UIView *subview in self.subviews)if(constraint(subview))[subviews addObject:subview];
    return subviews;
}

- (NSArray *)recursivelySearchForSubviewPassingConstraint:(SubviewConstraint)constraint
{
    NSMutableArray *subviews = [NSMutableArray array];
    for(UIView *subview in self.subviews)
    {
        if(constraint(subview))[subviews addObject:subview];
        NSArray *additionalSubviews = [subview recursivelySearchForSubviewPassingConstraint:constraint];
        if(additionalSubviews.count)[subviews addObjectsFromArray:additionalSubviews];
    }
    return (subviews.count ? subviews : nil);
}

- (id)superviewOfClass:(Class)classToSearchFor
{
    if([self.superview isKindOfClass:classToSearchFor])return self.superview;
    else return [self.superview superviewOfClass:classToSearchFor];
}

- (void)removeSubviews
{
    for(UIView *subview in self.subviews)[subview removeFromSuperview];
}

- (UIView *)bottomOfViewStack
{
    return (self.superview.bottomOfViewStack) ? : self;
}

@end
