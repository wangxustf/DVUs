//
//  UIDeviceAdditions.h
//  DVActivity
//
//  Created by pan Shiyu on 13-4-25.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Hardware)

+ (NSString *)deviceID;

+ (NSString *)networkStatus;

+ (BOOL)isPad;
+ (CGFloat)scale;
+ (BOOL)isRetina;
+ (BOOL)isSingleTask;
+ (NSString *)modelName;

+ (NSString *)clientVersion;

+ (NSString *)buildVersion;
@end
