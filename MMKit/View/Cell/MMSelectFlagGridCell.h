//
//  SDImageSelectCell.h
//  shuidi2
//
//  Created by houzhenyong on 14-3-4.
//  Copyright (c) 2014年 houzhenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMSwitchButton.h"

@protocol MMSelectFlagGridCellDelegate;

@interface MMSelectFlagGridCell : UICollectionViewCell
{
    CGSize _iconSize;
    UIImageView *_imageView;
}

@property (nonatomic, strong, readonly) MMSwitchButton* selectIconButton;

@property (nonatomic, assign) CGFloat iconRightMargin;
@property (nonatomic, assign) CGFloat iconTopMargin;

@property (nonatomic, weak) id<MMSelectFlagGridCellDelegate> delegate;

- (void)setUnselectedIcon:(UIImage *)unselectedIcon selectedIcon:(UIImage*)selectedIcon;

- (void)setImage:(UIImage*)image;

@end

@protocol MMSelectFlagGridCellDelegate <NSObject>

@optional

- (BOOL)touchedFlagGridCell:(MMSelectFlagGridCell*)selectFlagCell shouldChangeState:(MMSwitchButtonState)select;

@end

