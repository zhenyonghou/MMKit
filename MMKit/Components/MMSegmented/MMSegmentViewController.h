//
//  MMSegmentViewController.h
//
//  Created by mumuhou on 15/7/14.
//  Copyright (c) 2015年 The Third Rock Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMSegmentedControl.h"

@protocol MMSegmentSubViewControllerProtocol <NSObject>

- (void)segmentedPageShown:(BOOL)shown;

@end

@interface MMSegmentViewController : UIViewController

@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) MMSegmentedControl *segmentedControl;

@property (nonatomic, strong, readonly) NSArray *pageControllers;

@property (nonatomic, strong, readonly) UIViewController *currentController;


- (void)setPageTitles:(NSArray *)pageTitles controllers:(NSArray *)controllers;

- (void)setTitleNormalAttributes:(NSDictionary *)normalAttributes titleSelectedAttributes:(NSDictionary *)selectedAttributes;

- (void)segmentedSelectedPageShown:(NSInteger)index;

- (void)onSegmentedSelectedChanged:(MMSegmentedControl *)segmentedControl;

@end
