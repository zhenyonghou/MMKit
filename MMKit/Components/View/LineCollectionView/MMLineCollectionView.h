//
//  BALineCollectionView.h
//  lxLineCollectionView
//
//  Created by hou zhenyong on 14-1-17.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCollectionViewLineLayout.h"

@protocol MMLineCollectionViewDelegate;

@interface MMLineCollectionView : UIView <UICollectionViewDataSource, UICollectionViewDelegate>
{
    MMCollectionViewLineLayout* _lineLayout;
}

@property (nonatomic, weak) id<MMLineCollectionViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withRegisterCellClass:(Class)cellClass;

- (void)reloadData;

- (id)dequeueReusableCellForIndexPath:(NSIndexPath *)indexPath;

@end


@protocol MMLineCollectionViewDelegate <NSObject>

- (NSInteger)numberOfItemsForLineCollectionView:(MMLineCollectionView*)lineCollectionView;

- (UICollectionViewCell*)lineCollectionView:(MMLineCollectionView*)collectionView
                            cellIndentifier:(NSString*)cellIdentifier
                            cellAtIndexPath:(NSIndexPath *)indexPath;

// layout 相关
- (CGSize)itemSizeForLineCollectionView:(MMLineCollectionView *)lineCollectionView;

- (UIEdgeInsets)edgeInsetsForLineCollectionView:(MMLineCollectionView *)lineCollectionView;

- (CGFloat)interitemSpacingForLineCollectionView:(MMLineCollectionView *)lineCollectionView;

@optional
- (void)lineCollectionView:(MMLineCollectionView *)collectionView didSelectItemAtIndex:(NSInteger)index;

@end
