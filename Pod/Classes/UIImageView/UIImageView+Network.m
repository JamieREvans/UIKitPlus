//
//  UIImageView+Network.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIImageView+Network.h"
#import "UIImageView+Allocation.h"
#import "UIView+Animation.h"
#import "UIImage+Network.h"
#import "UIImageView+Rendering.h"

@implementation UIImageView (Network)

- (void)setImageWithURLPath:(NSString *)urlPath forPlaceholderImage:(UIImage *)placeholderImage
{
    [self setImageWithURLPath:urlPath forPlaceholderImage:placeholderImage allowsCaching:YES];
}

- (void)setImageWithURLPath:(NSString *)urlPath forPlaceholderImage:(UIImage *)placeholderImage allowsCaching:(BOOL)allowsCaching
{
    @synchronized(self)
    {
        __block NSUInteger localTagIteration = (++self.tag ? : (self.tag = 1));
        
        NSURL *url = [NSURL URLWithString:urlPath];
        
        if(allowsCaching && [UIImage isImageCachedForURLPath:urlPath])
        {
            [self setImage:[UIImage cachedImages][urlPath]];
            return;
        }
        else
        {
            [self setImage:placeholderImage];
        }
        
        [UIImage retreiveImageFromURLPath:url.absoluteString
                            allowsCaching:allowsCaching
                             withCallback:^(UIImage *remoteImage)
         {
             if(remoteImage.isValid)
             {
                 if(remoteImage == self.image || self.tag != localTagIteration)return;
                 
                 UIImageView *fillerImageView = [UIImageView imageViewWithFrame:self.bounds andImage:self.image];
                 [fillerImageView setAlpha:1.0f];
                 [fillerImageView setClipsToBounds:self.clipsToBounds];
                 [fillerImageView.layer setCornerRadius:self.layer.cornerRadius];
                 [self addSubview:fillerImageView];
                 
                 UIImageView *imageView = [UIImageView imageViewWithFrame:self.bounds andImage:remoteImage];
                 [imageView setAlpha:0.0f];
                 [imageView setClipsToBounds:self.clipsToBounds];
                 [imageView.layer setCornerRadius:self.layer.cornerRadius];
                 [self addSubview:imageView];
                 
                 __weak typeof(self) selfBlockReference = self;
                 [UIView crossFadeWithDuration:1.5f
                                animationBlock:^
                  {
                      [fillerImageView setAlpha:0.0f];
                      [imageView setAlpha:1.0f];
                  }
                                    completion:^(BOOL finished)
                  {
                      if(self.tag == localTagIteration)[selfBlockReference setImage:remoteImage maintainsCornerRadius:YES];
                      [fillerImageView removeFromSuperview];
                      [imageView removeFromSuperview];
                  }];
             }
         }];
    }
}

@end
