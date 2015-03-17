//
//  UIViewController+Navigation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationNotificationExtention <NSObject>
@optional

- (void)viewControllerWasPopped;

@end

@interface UIViewController (Navigation) <NavigationNotificationExtention>

@end
