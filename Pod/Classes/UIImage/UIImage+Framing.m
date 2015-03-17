//
//  UIImage+Framing.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIImage+Framing.h"
#import "UIImage+Network.h"

@implementation UIImage (Framing)

- (CGSize)scaledSize
{
    CGFloat scale = [UIScreen mainScreen].scale;
    return CGSizeMake(self.size.width/scale, self.size.height/scale);
}

- (CGRect)frameCenteredInSize:(CGSize)containingViewSize
{
    return CGRectMake((containingViewSize.width - self.size.width)/2.0f, (containingViewSize.height - self.size.height)/2.0f, self.size.width, self.size.height);
}

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0f;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointZero;
    
    if(!CGSizeEqualToSize(self.size, targetSize))
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor)
        {
            scaleFactor = widthFactor;
        }
        else
        {
            scaleFactor = heightFactor;
        }
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // Center the image
        if(widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if(widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [self drawInRect:thumbnailRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(!newImage.isValid)
    {
        NSLog(@"Failed to scale and/or crop the image");
        NSLog(@"From %@ to %@", NSStringFromCGSize(self.size), NSStringFromCGSize(targetSize));
        return self;
    }
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
