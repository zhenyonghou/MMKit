//
//  COImageEnableSelectGridCell.m
//  LxAsset
//
//  Created by houzhenyong on 14-6-19.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import "MMImageEnableSelectGridCell.h"
#import "MMSkin.h"

@implementation MMImageEnableSelectGridCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUnselectedIcon:SKIN_IMAGE(@"icon_photo_select") selectedIcon:SKIN_IMAGE(@"icon_photo_select_hl")];
    }
    return self;
}

- (void)setSelectedFlag:(BOOL)isSelected animated:(BOOL)animated
{
    MMSwitchButtonState state = isSelected ? MMSwitchButtonStateOn : MMSwitchButtonStateOff;
    self.selectIconButton.switchState = state;
}

@end
