//  Created by houzhenyong on 14-3-8.
//  Copyright (c) 2014年 shuidi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Protable)

- (NSString*)MD5;

- (NSString *)trim;

- (CGSize)calculateSizeWithFont:(UIFont*)font maximumWidth:(CGFloat)maximumWidth;
- (CGSize)calculateSizeWithFont:(UIFont*)font maximumWidth:(CGFloat)maximumWidth numberOfLines:(NSUInteger)numberOfLines;

@end
