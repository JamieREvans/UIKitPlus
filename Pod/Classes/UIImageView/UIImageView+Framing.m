//
//  UIImageView+Framing.m
//  Pods
//
//  Created by Jamie Evans on 2015-04-05.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UIImageView+Framing.h"
#import "UIView+Framing.h"

@implementation UIImageView (Framing)

- (void)setWidthAndMaintainAspectRatio:(CGFloat)width
{
    [self setWidth:width];
    
    if(self.image)
    {
        CGFloat widthRatio = width/self.image.size.width;
        [self setHeight:self.image.size.height * widthRatio];
    }
}

- (void)setHeightAndMaintainAspectRatio:(CGFloat)height
{
    [self setHeight:height];
    
    if(self.image)
    {
        CGFloat heightRatio = height/self.image.size.height;
        [self setWidth:self.image.size.width * heightRatio];
    }
}

@end
