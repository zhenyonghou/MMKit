//
//  BAUtility.m
//  Adult
//
//  Created by houzhenyong on 14-8-6.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import "MMUtility.h"

@implementation MMUtility

+ (CTFontRef)fontRefFromFont:(UIFont *)font {
    CTFontRef ctfont = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
    return CFAutorelease(ctfont);
}

+ (void)printRect:(CGRect)rect mark:(NSString*)mark
{
    NSLog(@"%@ [%d, %d, %d, %d]", mark, (int32_t)rect.origin.x, (int32_t)rect.origin.y, (int32_t)rect.size.width, (int32_t)rect.size.height);
}

@end
