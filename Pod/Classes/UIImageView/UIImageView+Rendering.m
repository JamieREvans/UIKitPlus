//
//  UIImageView+Rendering.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIImageView+Rendering.h"
#import "UIView+Framing.h"
#import "UIImage+Framing.h"

@implementation UIImageView (Rendering)

- (void)setImage:(UIImage *)image maintainsCornerRadius:(BOOL)shouldMaintainCornerRadius
{
    [self setImage:image maintainsCornerRadius:shouldMaintainCornerRadius croppingImage:YES];
}

- (void)setImage:(UIImage *)image maintainsCornerRadius:(BOOL)shouldMaintainCornerRadius croppingImage:(BOOL)shouldCrop
{
    CGFloat cornerRadius = (shouldMaintainCornerRadius ? self.layer.cornerRadius : 0.0f);
    if(shouldCrop)
    {
        [self setImage:image croppingToBoundsRespectingScale:YES];
    }
    else
    {
        [self setImage:image];
    }
    [self.layer setCornerRadius:cornerRadius];
}

- (void)setImage:(UIImage *)image automaticallyAdjustsFrame:(BOOL)shouldAutomaticallyAdjustFrame
{
    [self setImage:image automaticallyAdjustsFrame:shouldAutomaticallyAdjustFrame respectingBounds:NO];
}

- (void)setImage:(UIImage *)image automaticallyAdjustsFrame:(BOOL)shouldAutomaticallyAdjustFrame respectingBounds:(BOOL)respectsBounds
{
    CGSize newSize = image.size;
    if(respectsBounds && (newSize.width > self.superview.width || newSize.height > self.superview.height))newSize = self.superview.bounds.size;
    
    CGRect newFrame = self.frame;
    newFrame.origin.x += (newFrame.size.width - newSize.width)/2.0f;
    newFrame.origin.y += (newFrame.size.height - newSize.height)/2.0f;
    newFrame.size = newSize;
    [self setFrame:newFrame];
    
    [self setImage:image];
}

- (void)setImage:(UIImage *)image croppingToBoundsRespectingScale:(BOOL)shouldRespectScreenScale
{
    if(!image)[self setImage:nil];
    else if(image.size.width < self.scaledSizeForImages.width || image.size.height < self.scaledSizeForImages.height)[self setImage:image];
    else [self setImage:[image imageByScalingAndCroppingForSize:(shouldRespectScreenScale ? self.scaledSizeForImages : self.bounds.size)]];
}

@end
