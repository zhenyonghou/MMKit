//
//  MMAssetsHelper.h
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef NS_ENUM(NSInteger, MMAssetsHelperPhotoSizeType) {
    MMAssetsHelperPhotoSizeTypeThumbnail    = 0,
    MMAssetsHelperPhotoSizeTypeScreen,
    MMAssetsHelperPhotoSizeTypeResolution
};


@interface MMAssetsHelper : NSObject

@property (nonatomic, strong)   ALAssetsLibrary			*assetsLibrary;
@property (nonatomic, strong)   NSMutableArray          *assetPhotos;
@property (nonatomic, strong)   NSMutableArray          *assetGroups;

@property (readwrite)           BOOL                    bReverse;

+ (MMAssetsHelper *)sharedInstance;

// get album list from asset
- (void)getGroupList:(void (^)(NSArray *))result;

// get photos from specific album with ALAssetsGroup object
- (void)getPhotoListOfGroup:(ALAssetsGroup *)alGroup result:(void (^)(NSArray *))result;

// get photos from specific album with index of album array
- (void)getPhotoListOfGroupByIndex:(NSInteger)nGroupIndex result:(void (^)(NSArray *))result;

// get photos from camera roll
- (void)getSavedPhotoList:(void (^)(NSArray *))result error:(void (^)(NSError *))error;

- (NSInteger)getGroupCount;
- (NSInteger)getPhotoCountOfCurrentGroup;
- (NSDictionary *)getGroupInfo:(NSInteger)nIndex;

- (void)clearData;

// utils

- (UIImage *)getImageAtIndex:(NSInteger)nIndex type:(MMAssetsHelperPhotoSizeType)nType;

- (ALAsset *)getAssetAtIndex:(NSInteger)nIndex;

- (UIImage *)getCroppedImage:(NSURL *)urlImage;

+ (UIImage *)getImageFromAsset:(ALAsset *)asset type:(MMAssetsHelperPhotoSizeType)nType;

@end

