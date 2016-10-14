//
//  MMSkin.h
//  Demo
//
//  Created by zhenyonghou on 15/6/28.
//  Copyright © 2015年 hou zhenyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MMSkinResourceManager : NSObject

- (id)dataForKey:(NSString *)key;

@end

@interface MMSkin : NSObject

+ (instancetype)sharedInstance;

- (UIImage *)imageForKey:(NSString*)key;

- (UIColor *)colorForKey:(NSString *)key;

- (UIFont *)fontForKey:(NSString *)key;


@end

#define SKIN_IMAGE(key)      [[MMSkin sharedInstance] imageForKey:(key)]
#define SKIN_COLOR(key)      [[MMSkin sharedInstance] colorForKey:(key)]
#define SKIN_FONT(key)       [[MMSkin sharedInstance] fontForKey:(key)]

