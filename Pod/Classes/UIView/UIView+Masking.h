//
//  UIView+Masking.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masking)

// Masking - Passed rect will be the shown content
- (void)maskToRect:(CGRect)rectForMask;
- (void)maskToRects:(NSArray *)maskValueArray; // <NSValue> of CGRect

@end
