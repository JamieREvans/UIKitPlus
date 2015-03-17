//
//  UIImage+Network.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Network)

+ (NSMutableDictionary *)cachedImages;
+ (BOOL)isImageCachedForURLPath:(NSString *)urlPath;
+ (void)retreiveImageFromURLPath:(NSString *)urlPath allowsCaching:(BOOL)allowsCaching withCallback:(void (^)(UIImage *image))callback;
+ (void)flushCache;
+ (void)flushCacheWithKeys:(NSArray *)keys;

- (BOOL)isValid;

@end
