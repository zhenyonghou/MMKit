//
//  UIAssetsSingleSelectViewController.h
//  LxAsset
//
//  Created by houzhenyong on 14-6-26.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMAssetsHelper.h"
#import "MMViewController.h"

@protocol MMAssetsSingleSelectionViewControllerDelegate;

@interface MMAssetsSingleSelectionViewController : MMViewController

@property (nonatomic, weak) id<MMAssetsSingleSelectionViewControllerDelegate> delegate;

@end


@protocol MMAssetsSingleSelectionViewControllerDelegate <NSObject>

- (void)assetsSingleSelectViewControllerWillCancel:(MMAssetsSingleSelectionViewController*)viewController;

- (void)assetsSingleSelectViewController:(MMAssetsSingleSelectionViewController*)viewController willComplete:(ALAsset*)selectedAsset;

- (void)assetsSingleSelectViewController:(MMAssetsSingleSelectionViewController*)viewController cameraComplete:(ALAsset*)asset;

@end
