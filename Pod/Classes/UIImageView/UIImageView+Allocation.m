//
//  UIImageView+Allocation.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIImageView+Allocation.h"
#import "UIView+Framing.h"
#import "UIImageView+Rendering.h"

@implementation UIImageView (Allocation)

+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    return [self imageViewWithFrame:frame andImage:image userInteractionEnabled:NO];
}

+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled
{
    return [self imageViewWithFrame:frame andImage:image userInteractionEnabled:userInteractionEnabled isCircle:NO];
}

+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled isCircle:(BOOL)isCircle
{
    return [self imageViewWithFrame:frame andImage:image userInteractionEnabled:userInteractionEnabled isCircle:isCircle optimizingImage:YES];
}

+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled isCircle:(BOOL)isCircle withBorderColor:(UIColor *)borderColor
{
    UIImageView *imageView = [self imageViewWithFrame:frame andImage:image userInteractionEnabled:userInteractionEnabled isCircle:isCircle optimizingImage:NO];
    [imageView.layer setBorderColor:borderColor.CGColor];
    [imageView.layer setBorderWidth:[UIView onePixel]];
    return imageView;
}

+ (instancetype)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled isCircle:(BOOL)isCircle optimizingImage:(BOOL)shouldOptimizeImage
{
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setClipsToBounds:YES];
    if(shouldOptimizeImage)[imageView setImage:image croppingToBoundsRespectingScale:YES];
    else [imageView setImage:image];
    [imageView setUserInteractionEnabled:userInteractionEnabled];
    if(isCircle)
    {
        [imageView.layer setCornerRadius:frame.size.width/2.0f];
        [imageView.layer setMasksToBounds:YES];
    }
    return imageView;
}

@end
