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
            shouldAnimate = NO;
        }
        else
        {
            [self setImage:placeholderImage];
        }

        __weak UIImageView *weakSelf = self;
        [UIImage retreiveImageFromURLPath:url.absoluteString
                            allowsCaching:allowsCaching
                             withCallback:^(UIImage *remoteImage)
         {
             __strong UIImageView *strongSelf = weakSelf;
             if(strongSelf && remoteImage.isValid)
             {
                 if(remoteImage == strongSelf.image || strongSelf.tag != localTagIteration)return;

                 BOOL shouldCrop = (strongSelf.contentMode == UIViewContentModeScaleAspectFill);

                 void (^setImageBlock)() = ^
                 {
                     [strongSelf setImage:remoteImage maintainsCornerRadius:YES croppingImage:shouldCrop];
                 };

                 if(shouldAnimate)
                 {
                     UIImageView *fillerImageView = [[[strongSelf class] alloc] initWithFrame:strongSelf.frame];
                     [fillerImageView setImage:strongSelf.image];
                     [fillerImageView setAlpha:1.0f];
                     [fillerImageView setContentMode:strongSelf.contentMode];
                     [fillerImageView setClipsToBounds:strongSelf.clipsToBounds];
                     [fillerImageView.layer setCornerRadius:strongSelf.layer.cornerRadius];
                     [strongSelf.superview insertSubview:fillerImageView aboveSubview:strongSelf];

                     setImageBlock();
                     [strongSelf setAlpha:0.0f];

                     [UIView crossFadeWithDuration:1.5f
                                    animationBlock:^
                      {
                          [fillerImageView setAlpha:0.0f];
                          [strongSelf setAlpha:1.0f];
                      }
                                        completion:^(BOOL finished)
                      {
                          [fillerImageView removeFromSuperview];
                      }];
                 }
                 else
                 {
                     setImageBlock();
                 }
             }
         }];
    }
}

@end
