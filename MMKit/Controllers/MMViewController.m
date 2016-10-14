//
//  BAViewController.m
//  Summer
//
//  Created by houzhenyong on 14-5-3.
//  Copyright (c) 2014年 houzhenyong. All rights reserved.
//

#import "MMViewController.h"
#import "MMSkin.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = SKIN_COLOR(@"color_vc_view_bg");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [MobClick event:NSStringFromClass([self class]) label:@"show"];
//
//    [MobClick beginLogPageView:NSStringFromClass([self class])];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

//    [MobClick endLogPageView:NSStringFromClass([self class])];
}

- (BOOL)isVisible
{
    return (self.view.window && [self isViewLoaded]);
}

@end
