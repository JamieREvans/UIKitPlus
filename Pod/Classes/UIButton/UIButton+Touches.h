//
//  UIButton+Touches.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIControlEventsExtended)
{
    UIControlEventTouchBegin = (UIControlEventTouchDown),
    UIControlEventTouchEnd = (UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchCancel | UIControlEventTouchDragExit)
};

@interface UIButton (Touches)

- (void)addHighlightToButton;
- (void)addHighlightToButtonWithOpacity:(CGFloat)opacity;

@end
