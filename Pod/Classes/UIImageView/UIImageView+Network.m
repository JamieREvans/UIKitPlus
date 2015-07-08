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
    [self setImageWithURLPath:urlPath forPlaceholderImage:placeholderImage allowsCaching:allowsCaching animated:YES];
}

- (void)setImageWithURLPath:(NSString *)urlPath forPlaceholderImage:(UIImage *)placeholderImage allowsCaching:(BOOL)allowsCaching animated:(BOOL)shouldAnimate
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
                 
                 if(shouldAnimate)
                 {
                     UIImageView *fillerImageView = [UIImageView imageViewWithFrame:self.frame andImage:self.image];
                     [fillerImageView setAlpha:1.0f];
                     [fillerImageView setContentMode:self.contentMode];
                     [fillerImageView setClipsToBounds:self.clipsToBounds];
                     [fillerImageView.layer setCornerRadius:self.layer.cornerRadius];
                     [self.superview addSubview:fillerImageView];
                     
                     [self setImage:remoteImage maintainsCornerRadius:YES];
                     [self setAlpha:0.0f];
                     
                     __weak typeof(self) selfBlockReference = self;
                     [UIView crossFadeWithDuration:1.5f
                                    animationBlock:^
                      {
                          [fillerImageView setAlpha:0.0f];
                          [self setAlpha:1.0f];
                      }
                                        completion:^(BOOL finished)
                      {
                          if(self.tag == localTagIteration)
                          {
                              [selfBlockReference setImage:remoteImage
                                     maintainsCornerRadius:YES
                                             croppingImage:(self.contentMode == UIViewContentModeScaleAspectFill)];
                          }
                          [fillerImageView removeFromSuperview];
                      }];
                 }
                 else
                 {
                     [self setImage:remoteImage maintainsCornerRadius:YES];
                 }
             }
         }];
    }
}

@end
