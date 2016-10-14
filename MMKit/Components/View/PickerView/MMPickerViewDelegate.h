
#import <Foundation/Foundation.h>

@class MMPickerView;

@protocol MMPickerViewDelegate <NSObject>

// 确定选中
- (void)confirmPickerView:(id)pickerView/* andContent:(NSString *)content*/;
// 取消选择
- (void)cancelPickerView:(id)pickerView;

- (NSInteger)pickerView:(MMPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

- (NSString *)pickerView:(MMPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

@optional

- (NSInteger)numberOfComponentsInPickerView:(MMPickerView *)pickerView;

- (void)pickerView:(MMPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end
