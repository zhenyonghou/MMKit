//
//  MMSkin.m
//  Demo
//
//  Created by zhenyonghou on 15/6/28.
//  Copyright © 2015年 hou zhenyong. All rights reserved.
//

#import "MMSkin.h"

@implementation MMSkinResourceManager {
    NSDictionary *_resourceData;
}

- (id)init
{
    if (self = [super init]) {
        NSString *skinPlistPath = [[NSBundle mainBundle] pathForResource:@"font_color" ofType:@"plist"];
        _resourceData = [NSDictionary dictionaryWithContentsOfFile:skinPlistPath];
    }
    return self;
}

- (id)dataForKey:(NSString *)key
{
    return _resourceData[key];
}

@end

#pragma mark- MMSkin

@implementation MMSkin {
    MMSkinResourceManager *_resourceManager;
}

static MMSkin *instance;
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MMSkin alloc] init];
    });
    return instance;
}

- (id)init {
    if (self = [super init]) {
        _resourceManager = [[MMSkinResourceManager alloc] init];
    }
    return self;
}

- (UIImage *)imageForKey:(NSString*)key
{
    UIImage *image = [UIImage imageNamed:key];
    if (!image) {
        NSLog(@"warning: 图片找不到：%@", key);
    }
    return image;
}

- (UIColor *)colorForKey:(NSString *)key
{
    NSString *colorString = [_resourceManager dataForKey:key];
    NSArray *colorHexStringAndAlpha = [colorString componentsSeparatedByString:@","];
    
    UIColor *color = [UIColor blackColor];
    if ([colorHexStringAndAlpha count] == 1) {
        color = [[self class] colorWithHexString:colorHexStringAndAlpha[0]];
    } else if ([colorHexStringAndAlpha count] == 2) {
        color = [[self class] colorWithHexString:colorHexStringAndAlpha[0] alphaString:colorHexStringAndAlpha[1]];
    } else {
        NSLog(@"warning: 这个颜色找不到：%@", key);
    }
    
    return color;
}

- (UIFont *)fontForKey:(NSString *)key
{
    NSDictionary *fontDictionary = [_resourceManager dataForKey:key];
    
    NSString *name = [fontDictionary objectForKey:@"name"];
    NSInteger size = [[fontDictionary objectForKey:@"size"] integerValue];
    return [UIFont fontWithName:name size:size];
}

#pragma mark- color

+ (void)getRed:(CGFloat*)red green:(CGFloat*)green blue:(CGFloat*)blue fromHexColorString:(NSString*)hexColorString
{
    if ([hexColorString length] < 6){//长度不合法
        return;
    }
    
    NSString *tempString=[hexColorString lowercaseString];
    if ([tempString hasPrefix:@"0x"]){
        tempString = [tempString substringFromIndex:2];
    } else if ([tempString hasPrefix:@"#"]){
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] != 6){
        return;
    }
    //分解三种颜色的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *rString = [tempString substringWithRange:range];
    range.location = 2;
    NSString *gString = [tempString substringWithRange:range];
    range.location = 4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    *red = (float)r / 255.0f;
    *green = (float)g / 255.0f;
    *blue = (float)b / 255.0f;
}

+ (UIColor*)colorWithHexString:(NSString *)hexColorString {
    CGFloat red = 0.f;
    CGFloat green = 0.f;
    CGFloat blue = 0.f;
    
    [[self class] getRed:&red green:&green blue:&blue fromHexColorString:hexColorString];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor*)colorWithHexString:(NSString *)hexColorString alphaString:(NSString *)alphaString
{
    unsigned int a;
    [[NSScanner scannerWithString:alphaString] scanHexInt:&a];
    
    CGFloat red = 0.f;
    CGFloat green = 0.f;
    CGFloat blue = 0.f;
    
    [[self class] getRed:&red green:&green blue:&blue fromHexColorString:hexColorString];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:(float)a/100.f];
}

@end
