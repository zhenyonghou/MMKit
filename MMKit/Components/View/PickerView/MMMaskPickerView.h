//
//  MaskPickerView.h
//  Pregnancy
//
//  Created by houzhenyong on 14-6-8.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.

//  3层view self/contentview/pickerview
//  这个类不能直接实例化对象

#import <UIKit/UIKit.h>

@protocol MMMaskPickerViewDelegate;

@interface MMMaskPickerView : UIView {

@protected
    UIView *_contentView;
    UIView *_pickerView;
}

@property (nonatomic, weak) id<MMMaskPickerViewDelegate> delegate;

//for subclass
@property (nonatomic, weak) UIView *parentView;


- (id)initWithParentView:(UIView*)parentView;

- (void)show:(BOOL)isShow;

// 下列方法实例化类必须实现的
- (UIView*)viewForPicker;

- (CGRect)pickerViewFrameWhenShow;

- (CGRect)pickerViewFrameWhenHidden;

- (void)pickerViewReloadData;

@end


@protocol MMMaskPickerViewDelegate <NSObject>

- (void)cancelPickerView:(MMMaskPickerView*)maskPickerView;

@end

