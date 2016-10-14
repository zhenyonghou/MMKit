//
//  BALocationManager.h
//  lxLocation
//
//  Created by hou zhenyong on 14-1-11.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//  note!!! AVAILABLE IOS6.0

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MMAddress : NSObject

@property(nonatomic, copy)NSString* contry;         // 中国
@property(nonatomic, copy)NSString* state;          // 北京   / 河北
@property(nonatomic, copy)NSString* city;          // 北京   / 廊坊
@property(nonatomic, copy)NSString* subLocality;    // 东城区  / 永清（县）
@property(nonatomic, copy)NSString* addressLines;   //

@end


@protocol MMLocationManagerDelegate;

@interface MMLocationManager : NSObject<CLLocationManagerDelegate>

@property (nonatomic, readonly, strong) CLLocationManager* locationManager;

@property (nonatomic, weak) id<MMLocationManagerDelegate> delegate;

- (void)startLocate;
- (void)stopLocate;

- (void)reverseLocation:(CLLocation*)location
              successed:(void (^)(MMAddress* address))successedBlock
                 failed:(void(^)(NSError* error))failedBlock;

@end


@protocol MMLocationManagerDelegate <NSObject>

- (void)locationManager:(MMLocationManager *)manager didUpdateLocation:(CLLocation*)location;

@end
