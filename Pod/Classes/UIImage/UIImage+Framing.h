//
//  UIImage+Framing.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Framing)

- (CGSize)scaledSize;
- (CGRect)frameCenteredInSize:(CGSize)containingViewSize;

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
