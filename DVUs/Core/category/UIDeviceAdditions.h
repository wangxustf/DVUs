//
//  UIDeviceAdditions.h
//  iMeituan
//
//  Created by  jian jingbao 11-8-8.
//  Copyright 2011年 Sankuai. All rights reserved.
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
