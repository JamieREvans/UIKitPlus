//
//  UIImageView+Allocation.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Allocation)

// Defaults userInteractionEnabled to NO - Set to YES when self or subviews need touches
+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image;
// Defaults isCircle to NO
+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled;
// Defaults optimizingImage to NO
+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled isCircle:(BOOL)isCircle;
+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled isCircle:(BOOL)isCircle withBorderColor:(UIColor *)borderColor;
+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled isCircle:(BOOL)isCircle optimizingImage:(BOOL)shouldOptimizeImage;

@end
