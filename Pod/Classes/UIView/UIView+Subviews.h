//
//  UIView+Subviews.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL (^SubviewConstraint)(UIView *);

@interface UIView (Subviews)

- (id)subviewOfClass:(Class)classToSearchFor;
- (NSArray *)subviewsOfClass:(Class)classToSearchFor;

- (id)subviewConformingToProtocol:(Protocol *)protocol;
- (NSArray *)subviewsConformingToProtocol:(Protocol *)protocol;

- (id)subviewWithTag:(int)tag;
- (NSArray *)subviewsWithTag:(int)tag;

- (id)subviewPassingConstraint:(SubviewConstraint)constraint;
- (NSArray *)subviewsPassingConstraint:(SubviewConstraint)constraint;
- (NSArray *)recursivelySearchForSubviewPassingConstraint:(SubviewConstraint)constraint;

- (id)superviewOfClass:(Class)classToSearchFor;

- (void)removeSubviews;

// Root UIView in UIViewController, otherwise root UIView in view stack not added to the UI
- (UIView *)bottomOfViewStack;

@end
