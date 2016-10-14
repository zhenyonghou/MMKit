//
//  MMLeftViewCell.h
//  LibProtable
//
//  Created by houzhenyong on 14-6-21.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import "MMTableViewCell.h"

@interface MMLeftImageViewCell : MMTableViewCell {
}

@property (nonatomic, assign) CGRect imageViewFrame;

@property (nonatomic, strong, readonly) UIImageView *leftImageView;

- (void)setLeftImage:(UIImage*)image imageFrame:(CGRect)frame text:(NSString*)text;

@end
