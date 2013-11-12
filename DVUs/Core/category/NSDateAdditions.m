//
//  NSDateAdditions.m
//  DVActivity
//
//  Created by pan Shiyu on 13-4-25.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "NSDateAdditions.h"

#define SECONDS_PER_DAY 86400

@implementation NSDate (format)

- (NSString *)MMddHHmm {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"MM-dd HH:mm"];

    return [formatter stringFromDate:self];
}
- (NSString *)yyyyMMddHHmm {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    return [formatter stringFromDate:self];
}
- (NSString *)yyyyMMdd {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy.MM.dd"];
    
    return [formatter stringFromDate:self];
}
@end


@implementation NSDate (Utils)

+ (NSTimeInterval)timeIntervalCurrentDateStart {
    NSDate *currentDate = [NSDate date];
    long currentDateInterval = [currentDate timeIntervalSince1970];
    long tempBuyTime = currentDateInterval % (24 * 3600);
    currentDateInterval -= tempBuyTime + 8 * 3600;
    
    return currentDateInterval;
}

+ (NSDate *)dateWithDaysFromNow:(NSInteger)days
{
	NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SECONDS_PER_DAY * days;
	NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
	return newDate;
}

- (NSDate *)dateAfter7Days {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    components.day += 8;
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}
@end