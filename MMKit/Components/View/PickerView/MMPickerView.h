//
//  BAPickerView.h


#import <UIKit/UIKit.h>
#import "MMPickerViewDelegate.h"

@interface MMPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource> {
}

- (id)initWithDelegate:(id<MMPickerViewDelegate>)delegate;

- (void)showInView:(UIView *)view;
- (void)hidePickerWithAnimation;

@property (nonatomic, assign, readonly) BOOL isShowing;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, weak) id<MMPickerViewDelegate> delegate;

@end

