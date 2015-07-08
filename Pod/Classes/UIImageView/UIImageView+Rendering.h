//
//  UIImageView+Rendering.h
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Rendering)

// Defaults shouldCrop to YES
- (void)setImage:(UIImage *)image maintainsCornerRadius:(BOOL)shouldMaintainCornerRadius;
- (void)setImage:(UIImage *)image maintainsCornerRadius:(BOOL)shouldMaintainCornerRadius croppingImage:(BOOL)shouldCrop;
// Defaults respectingBounds to NO
- (void)setImage:(UIImage *)image automaticallyAdjustsFrame:(BOOL)shouldAutomaticallyAdjustFrame;
- (void)setImage:(UIImage *)image automaticallyAdjustsFrame:(BOOL)shouldAutomaticallyAdjustFrame respectingBounds:(BOOL)respectsBounds;
- (void)setImage:(UIImage *)image croppingToBoundsRespectingScale:(BOOL)shouldRespectScreenScale;

@end
