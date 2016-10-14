//
//  BAPickerViewWithSwitch.h
//  Pregnancy
//
//  Created by houzhenyong on 14-6-8.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import "MMMaskPickerView.h"
#import "MMSwitchButton.h"

@interface MMPickerViewWithSwitch : MMMaskPickerView

//for subclass
@property (nonatomic, weak) MMSwitchButton *switchButton;

- (void)setObserverForSwitchButton:(MMSwitchButton*)switchButton;

- (void)removeObserverForSwitchButton;

@end
