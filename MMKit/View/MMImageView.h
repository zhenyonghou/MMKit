//  Created by hou zhenyong on 14-3-31.
//  推荐使用MMRoundCornerImageView，效率更高

#import <UIKit/UIKit.h>

@interface MMImageView : UIImageView {
    UITapGestureRecognizer *_tapGestureRecognizer;
}

@property (nonatomic, assign) BOOL enableTouch;     // default NO

@property (nonatomic, copy) void (^touchedBlock)(id sender);

- (void)setCornerRadius:(CGFloat)cornerRadius;

- (void)setImageUrl:(NSString*)avatarUrl placeholderImage:(UIImage*)placeholderImage;

@end

