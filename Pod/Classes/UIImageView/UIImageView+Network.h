//
//  UIImageView+Network.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Network)

- (void)setImageWithURLPath:(NSString *)urlPath forPlaceholderImage:(UIImage *)placeholderImage;
- (void)setImageWithURLPath:(NSString *)urlPath forPlaceholderImage:(UIImage *)placeholderImage allowsCaching:(BOOL)allowsCaching;

@end
