//
//  NSDateAdditions.h
//  iPhone
//
//  Created by spaceli on 11-11-17.
//  Copyright (c) 2011年 diandian.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (format)

/**
 * 变为 MM-dd HH:mm 的格式。如11-17 17:10
 */
- (NSString *)MMddHHmm;

/**
 * 变为 yyyy-MM-dd HH:mm 的格式。如2011-11-17 17:10
 */
- (NSString *)yyyyMMddHHmm;

/**
 * 变为 yyyy.MM.dd 的格式。如2011.11.17
 */
- (NSString *)yyyyMMdd;
@end



@interface NSDate (Utils)
+ (NSTimeInterval)timeIntervalCurrentDateStart;
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;
- (NSDate *)dateAfter7Days;
@end