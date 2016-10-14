//
//  MMRoundCornerImageView.h
//  Demo
//
//  Created by mumuhou on 15/7/28.
//  Copyright (c) 2015年 hou zhenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMRoundCornerImageView : UIImageView

@property (nonatomic, strong, readonly) UIImageView *coverImageView;

- (void)setCoverNormalImage:(UIImage *)coverNormalImage highlightedImage:(UIImage *)highlightedImage;

@end
