//
//  UIImage+Network.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIImage+Network.h"

#define MAX_IMAGE_DOWNLOAD_THREAD 20

@implementation UIImage (Network)

+ (NSMutableDictionary *)cachedImages
{
    static NSMutableDictionary *cachedImages = nil;
    @synchronized(self)
    {
        return (cachedImages ? : (cachedImages = [NSMutableDictionary new]));
    }
}

+ (NSMutableSet *)imageQueue
{
    static NSMutableSet *imageQueue = nil;
    @synchronized(self)
    {
        return (imageQueue ? : (imageQueue = [NSMutableSet new]));
    }
}

+ (BOOL)isImageCachedForURLPath:(NSString *)urlPath{return !![self cachedImages][urlPath];}

+ (void)retreiveImageFromURLPath:(NSString *)urlPath allowsCaching:(BOOL)allowsCaching withCallback:(void (^)(UIImage *image))callback
{
    @synchronized(self)
    {
        // Prevent nil image or url crash
        if(!urlPath.length)
        {
            callback(nil);
            return;
        }
        
        // Retreive cached image
        if(allowsCaching && [self isImageCachedForURLPath:urlPath])
        {
            UIImage *imageForCallback = [UIImage cachedImages][urlPath];
            if(imageForCallback && callback)callback(imageForCallback);
        }
        // Download and cache image
        else
        {
            static dispatch_once_t onceToken;
            static dispatch_group_t imageGroup = nil;
            dispatch_once(&onceToken, ^
            {
                imageGroup = dispatch_group_create();
            });
            
            static NSUInteger numberOfOpenThreads = 0;
            
            // Prevent too many images from loading at once (causes UI framerate loss)
            if(numberOfOpenThreads < MAX_IMAGE_DOWNLOAD_THREAD && (![[self imageQueue] containsObject:urlPath] && allowsCaching))
            {
                // Add url to queue; preventing downloading the same image twice
                if(allowsCaching)
                {
                    [[self imageQueue] addObject:urlPath];
                }
                // Increment open threads before entering
                numberOfOpenThreads++;
                
                // Enter dispatch group
                dispatch_group_enter(imageGroup);
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^
                               {
                                   UIImage *remoteImage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlPath]
                                                                                                              options:NSDataReadingUncached
                                                                                                                error:nil]];
                                   if(allowsCaching && remoteImage)
                                   {
                                       @synchronized(self)
                                       {
                                           [self cachedImages][urlPath] = remoteImage;
                                       }
                                   }
                                   dispatch_async(dispatch_get_main_queue(), ^
                                                  {
                                                      if([[self imageQueue] containsObject:urlPath])
                                                      {
                                                          [[self imageQueue] removeObject:urlPath];
                                                      }
                                                      
                                                      // Leave dispatch group; notifies dispatch_group_notify if the group is now empty
                                                      dispatch_group_leave(imageGroup);
                                                      if(callback)callback(remoteImage);
                                                  });
                               });
            }
            else
            {
                // If image is in queue or there are too many images loading, this will try to reload the image once the queue is complete
                dispatch_group_notify(imageGroup, dispatch_get_main_queue(), ^
                                      {
                                          numberOfOpenThreads = 0;
                                          [self retreiveImageFromURLPath:urlPath allowsCaching:allowsCaching withCallback:callback];
                                      });
            }
        }
    }
}

+ (void)flushCache
{
    [[self cachedImages] removeAllObjects];
}

+ (void)flushCacheWithKeys:(NSArray *)keys
{
    [[self cachedImages] removeObjectsForKeys:keys];
}

- (BOOL)isValid
{
    return !CGSizeEqualToSize(CGSizeZero, self.size);
}

@end
