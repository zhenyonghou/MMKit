//
//  MMStandardCameraManager.h
//
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef NS_ENUM(NSInteger, MMStandardCameraOrientation) {
    MMStandardCameraOrientationRear = 0,        // 后置摄像头
    MMStandardCameraOrientationFront            // 前置摄像头
};

@protocol MMStandardCameraManagerDelegate;


@interface MMStandardCameraManager : NSObject<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, weak)id<MMStandardCameraManagerDelegate> delegate;
@property(nonatomic, assign)MMStandardCameraOrientation cameraOrientation;

@property(nonatomic, strong, readonly) UIImagePickerController *pickerController;

/**
 * @brief 启动照相机
 * @param controller 启动照相机的controller
 */
- (void)showCameraInViewController:(UIViewController *)controller animated:(BOOL)animated;

- (void)dismissCameraWithAnimated:(BOOL)animated;

@end


@protocol MMStandardCameraManagerDelegate <NSObject>

@optional
- (void)cameraController:(UIViewController *)controller didFinishWithImage:(UIImage *)image;
- (void)cameraControllerDidCancel:(UIViewController *)controller;
- (void)cameraControllerDidFinishSaveMetaData:(UIViewController *)controller asset:(ALAsset*)asset error:(NSError *)error;

@end
