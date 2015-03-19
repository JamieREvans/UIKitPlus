//
//  UINavigationController+Buttons.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NavigationButtonType)
{
    NavigationButtonTypeDefault  = 0,
    // Left Side Buttons
    NavigationButtonTypeClose    = 1 << 0,
    NavigationButtonTypeCancel   = 1 << 1,
    // Right Side Buttons
    NavigationButtonTypeMenu     = 1 << 2,
    NavigationButtonTypeSave     = 1 << 3,
    NavigationButtonTypeReset    = 1 << 4,
    // Remove Back Button
    NavigationButtonTypeNoBack   = 1 << 5
};

@protocol NavigationButtonProtocol <NSObject>
@required

// Can pass multiple button types
/*!
 * @discussion Sets the navigation buttons for the UIViewController's navigationBar
 * @param types An NSUInteger that can represent multiple NavigationButtonType's
 */
- (void)setNavigationButtons:(NavigationButtonType)types;

@optional

// Implement if you want to override menu button function
- (void)openNavigationMenu;
// Implement if using NavigationButtonTypeSave
- (void)save;
// Implement if using NavigationButtonTypeReset
- (void)reset;

@end

@interface UIViewController (Buttons) <NavigationButtonProtocol>
@end
