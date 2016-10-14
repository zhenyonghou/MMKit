//
//  MMAssetsMultiSelectionViewController.h
//  LxAsset
//
//  Created by houzhenyong on 14-6-16.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMAssetsHelper.h"
#import "MMViewController.h"

@protocol MMAssetsMultiSelectionViewControllerDelegate;

@interface MMAssetsMultiSelectionViewController : MMViewController

@property (nonatomic, assign) NSInteger maximumSelect;

@property (nonatomic, weak) id<MMAssetsMultiSelectionViewControllerDelegate> delegate;

- (id)initWithMaximumSelectCount:(NSInteger)maximumSelect;

- (NSArray*)selectedAssets;

/**
 *  从选择队列中删除，并且刷新collectionView
 */
- (void)removeAssetFromSelectedArrayAtIndex:(NSUInteger)index;


@end

@protocol MMAssetsMultiSelectionViewControllerDelegate <NSObject>

- (void)assetsMultiSelectViewControllerWillCancel:(MMAssetsMultiSelectionViewController*)viewController;

- (void)assetsMultiSelectViewController:(MMAssetsMultiSelectionViewController*)viewController willComplete:(NSArray*)assetsArray;

@optional

- (void)assetsMultiSelectViewController:(MMAssetsMultiSelectionViewController*)viewController cameraComplete:(ALAsset*)asset;


@end
