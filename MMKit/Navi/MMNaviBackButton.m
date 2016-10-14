//
//  BANaviBackButton.m
//  Demo
//
//  Created by zhenyonghou on 15/5/3.
//  Copyright (c) 2015年 hou zhenyong. All rights reserved.
//

#import "MMNaviBackButton.h"
#import "UIView+Protable.h"

@implementation MMNaviBackButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 7.0f, 0.0f, -7.0f)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(1.0f, 0.0f, -1.0f, 0.0f)];
    }
    return self;
}

- (void)setNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage
{
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
    
    [self sizeToFit];
    self.mm_width += 7.f;
}

@end

