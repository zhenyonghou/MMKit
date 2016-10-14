//
//  UIAssetsSingleSelectViewController.m
//  LxAsset
//
//  Created by houzhenyong on 14-6-26.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import "MMAssetsSingleSelectionViewController.h"
#import "MMImageGridCell.h"
#import "MMAssetsHelper.h"
#import "MMStandardCameraManager.h"
#import "MMSkin.h"
#import "MMCommonDefines.h"

static NSString* kCellID = @"cell_lalzkzkausd8f";

@interface MMAssetsSingleSelectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MMStandardCameraManagerDelegate> {
    UICollectionView *_collectionView;
    
    MMStandardCameraManager *_cameraManager;
}


@end

@implementation MMAssetsSingleSelectionViewController

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onApplicationWillEnterForground:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"全部照片";
    
    UIBarButtonItem * cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(onCancel)];
    self.navigationItem.leftBarButtonItem = cancelButton;

    [self loadSavedPhotos];
}

- (void)loadSavedPhotos
{
    [[MMAssetsHelper sharedInstance] getSavedPhotoList:^(NSArray *array) {
        [self buildCollectionView];
    } error:^(NSError *err) {
        NSLog(@"加载失败"); // TODO:
    }];
}

- (void)buildCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.allowsMultipleSelection = NO;
        [_collectionView registerClass:[MMImageGridCell class] forCellWithReuseIdentifier:kCellID];
        [self.view addSubview:_collectionView];
        
//        if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
//            _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);    // top:PHONE_NAVIGATIONBAR_HEIGHT + PHONE_STATUSBAR_HEIGHT
//        }
    }
    [_collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onCancel
{
    [self.delegate assetsSingleSelectViewControllerWillCancel:self];
    [self dismiss];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onShowCamera
{
    _cameraManager = [[MMStandardCameraManager alloc] init];
    _cameraManager.delegate = self;
    
    [_cameraManager showCameraInViewController:self animated:YES];
}

#pragma mark- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[MMAssetsHelper sharedInstance].assetPhotos count] + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MMImageGridCell *cameraButtonCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
        [cameraButtonCell setImage:SKIN_IMAGE(@"take_photo")];
        return cameraButtonCell;
    } else {
        MMImageGridCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
        ALAsset *asset = [[MMAssetsHelper sharedInstance] getAssetAtIndex:indexPath.row - 1];
        [photoCell setImage:[MMAssetsHelper getImageFromAsset:asset type:MMAssetsHelperPhotoSizeTypeThumbnail]];
        return photoCell;
    }
}

#pragma mark- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemWidth = (SCREEN_WIDTH - 2 * 3) / 4;
    return CGSizeMake(itemWidth, itemWidth);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self onShowCamera];
    } else {
        ALAsset *asset = [[MMAssetsHelper sharedInstance] getAssetAtIndex:indexPath.row - 1];
        [self.delegate assetsSingleSelectViewController:self willComplete:asset];
        
        [self dismiss];
    }
}

#pragma mark- XCStandardCameraManagerDelegate

- (void)cameraController:(UIViewController *)controller didFinishWithImage:(UIImage *)image
{
    //    self.cameraManager.pickerController
    NSLog(@"%s", __func__);
}

- (void)cameraControllerDidCancel:(UIViewController *)controller
{
    [_cameraManager dismissCameraWithAnimated:NO];
}

- (void)cameraControllerDidFinishSaveMetaData:(UIViewController *)controller asset:(ALAsset*)asset error:(NSError *)error
{
    [_cameraManager dismissCameraWithAnimated:NO];
    [self dismiss];
    
    [self.delegate assetsSingleSelectViewController:self cameraComplete:asset];
}

#pragma mark- notification

- (void)onApplicationWillEnterForground:(NSNotification *)notification
{
    [self refreshSavedPhotos];
}

- (void)refreshSavedPhotos
{
    [self loadSavedPhotos];
}

@end
