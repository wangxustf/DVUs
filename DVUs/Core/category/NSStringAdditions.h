//
//  NSStringAdditions.h
//  DVActivity
//
//  Created by pan Shiyu on 13-4-25.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Commen)
- (NSString *)append:(NSString *)string;
- (long)longValue;
@end

@interface NSString (Parse)
+ (NSString *)urlParameterWithDictionary:(NSDictionary *)params;
+ (NSDictionary *)parseInfoFromURLString:(NSString *)pagramsInfoString;//instead by:- (NSDictionary *)parseURLParams; 
- (NSDictionary *)parseURLParams;//把url中的参数转成NSDictionary
- (NSString*)encodeAsURIComponent;
//+ (NSString *)urldecString:(NSString *)orgString;
+ (NSArray *)phoneNumberArrayFromString:(NSString*)phoneStr;
- (BOOL)isMobilePhoneNumber;

+ (NSString *)stringFromNumber:(NSNumber *)number;// 此函数作用在于确保number转为string ,只保留两位小数
+ (NSString *)moneyStringWithNumber:(NSNumber *)floatNumber;// 将价格变成字符串，前面加人民币符号

+ (NSString *)stringWithFloat:(float)number;
+ (NSString *)moneyStringWithFloat:(float)number;

- (NSString*)MD5;
- (NSString *)addString:(NSString *)string every:(NSInteger)charCount;

@end

@interface NSString (OAURLEncodingAdditions)

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

@end


@interface NSString (drawing)

- (float)heightWithFont:(UIFont *)font limitByWidth:(float)width;
- (int)linesWithFont:(UIFont *)font limitByWidth:(float)width;
- (int)totalLinesWithFont:(UIFont *)font limitByWidth:(float)width;

@end


@interface NSString (VersionCompare)
- (NSComparisonResult)versionStringCompare:(NSString *)other;
@end

