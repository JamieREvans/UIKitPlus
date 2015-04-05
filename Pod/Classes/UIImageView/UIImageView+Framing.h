//
//  UIImageView+Framing.h
//  Pods
//
//  Created by Jamie Evans on 2015-04-05.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Framing)

/**
 * @discussion Sets the width of the image view and adjusts the height to preserve the aspect ratio of the image view's image. If the image is nil, this method will only set the width.
 */
- (void)setWidthAndMaintainAspectRatio:(CGFloat)width;

/**
 * @discussion Sets the height of the image view and adjusts the width to preserve the aspect ratio of the image view's image. If the image is nil, this method will only set the height.
 */
- (void)setHeightAndMaintainAspectRatio:(CGFloat)height;

@end
