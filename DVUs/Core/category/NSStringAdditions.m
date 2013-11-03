//
//  NSStringAdditions.m
//  iMeituan
//
//  Created by jianjingbao on 11-7-12.
//  Copyright 2011年 Sankuai. All rights reserved.
//

#import "NSStringAdditions.h"
#import "UIFontAdditions.h"
@implementation NSString (Commen)

- (NSString *)append:(NSString *)string {
    return [NSString stringWithFormat:@"%@%@",self,string];
}

- (long)longValue {
    return (long)[self longLongValue];
}
@end

@implementation NSString (Parse)

+ (NSString *)urlParameterWithDictionary:(NSDictionary *)params {
    NSMutableArray *mutableQueryStringComponents = [NSMutableArray array];
    NSArray *keysArray = [params allKeys];
    for (int index = 0; index < [keysArray count]; index ++) {
        NSString *key = [keysArray objectAtIndex:index];
        NSString *keyValue = [params objectForKey:key];
        if (key && keyValue) {
            NSString *component = [NSString stringWithFormat:@"%@=%@",key,keyValue];
            [mutableQueryStringComponents addObject:component];
        }
    }
    NSString *urlParameter = [mutableQueryStringComponents componentsJoinedByString:@"&"];
    
    return urlParameter;
}

+ (NSDictionary *)parseInfoFromURLString:(NSString *)pagramsInfoString {
    
    NSMutableDictionary *paragrmsDict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray *pagramArray = [pagramsInfoString componentsSeparatedByString:@"&"];
    for (NSString *pagramString in pagramArray) {
        NSArray *pagramValueAndName = [pagramString componentsSeparatedByString:@"="];
        if ([pagramValueAndName count] >= 2) {
            NSString *name = [pagramValueAndName objectAtIndex:0];
            NSString *value = [pagramValueAndName objectAtIndex:1];
            
            if (name && value) {
                [paragrmsDict setObject:value forKey:name];
            }
        }
    }
    
    return paragrmsDict;
}

- (NSDictionary *)parseURLParams {
    NSMutableDictionary *paragrmsDict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray *pagramArray = [self componentsSeparatedByString:@"&"];
    for (NSString *pagramString in pagramArray) {
        NSArray *pagramValueAndName = [pagramString componentsSeparatedByString:@"="];
        if ([pagramValueAndName count] >= 2) {
            NSString *name = [pagramValueAndName objectAtIndex:0];
            NSString *value = [pagramValueAndName objectAtIndex:1];
            
            if (name && value) {
                [paragrmsDict setObject:value forKey:name];
            }
        }
    }
    
    return paragrmsDict;
}

// 应对以下类型的串儿
// "010-56145687/82816399"
// "景区电话：010-84378963票务咨询：010-85696688"
+ (NSArray *)phoneNumberArrayFromString:(NSString*)phoneStr {
    if (phoneStr == nil) {
        return nil;
    }
    
    NSMutableString *mutablePhoneStr = [phoneStr mutableCopy];
    [mutablePhoneStr replaceOccurrencesOfString:@"－" withString:@"-" options:0 range:NSMakeRange(0, [mutablePhoneStr length])];
    
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^0-9/-]+" options:0 error:&error];
    if (!error) {
        [regex replaceMatchesInString:mutablePhoneStr options:0 range:NSMakeRange(0, [mutablePhoneStr length]) withTemplate:@"/"];
    }
    
    NSArray* phoneNumberArray = [mutablePhoneStr componentsSeparatedByString:@"/"];
    NSMutableArray* finalPhoneNumberArray = [NSMutableArray array];
    
    for (NSString *phoneNumber in phoneNumberArray) {
        if ([phoneNumber length] >= 3) {
            [finalPhoneNumberArray addObject:phoneNumber];
        }
    }
    
    return finalPhoneNumberArray;
}

- (BOOL)isMobilePhoneNumber {
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^1\\d{10}$"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    if (numberOfMatches == 1)
        return TRUE;
    
    return FALSE;
}

- (NSString*)encodeAsURIComponent {
	const char* p = [self UTF8String];
	NSMutableString* result = [NSMutableString string];
	
	for (;*p ;p++) {
		unsigned char c = *p;
		if (('0' <= c && c <= '9') || ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || (c == '-' || c == '_')) {
			[result appendFormat:@"%c", c];
		} else {
			[result appendFormat:@"%%%02X", c];
		}
	}
	return result;
}

// 此函数作用在于确保number转为string ,只保留两位小数
+ (NSString *)stringFromNumber:(NSNumber *)number {
    
    CGFloat floatValue = [number floatValue];
    NSString *result = [number stringValue];
    NSRange pointRange = [result rangeOfString:@"."];
    if (pointRange.length > 0 && pointRange.location < result.length -2) {
        result = [NSString stringWithFormat:@"%.2f",floatValue];
    }
    
    return result;
}
+ (NSString *)moneyStringWithNumber:(NSNumber *)floatNumber {// 将价格变成字符串，前面加人民币符号
    return [@"￥" append:[NSString stringFromNumber:floatNumber]];
}

+ (NSString *)stringWithFloat:(float)number {
    NSNumber *floatNumber = [NSNumber numberWithFloat:number];
    return [NSString stringFromNumber:floatNumber];
}

+ (NSString *)moneyStringWithFloat:(float)number{
    NSNumber *floatNumber = [NSNumber numberWithFloat:number];
    return [NSString moneyStringWithNumber:floatNumber];
}

// 计算字符串MD5值
- (NSString*)MD5
{
	// Create pointer to the string as UTF8
	const char* ptr = [self UTF8String];
    
	// Create byte array of unsigned chars
	unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
	// Create 16 byte MD5 hash value, store in buffer
	CC_MD5(ptr, strlen(ptr), md5Buffer);
    
	// Convert MD5 value in the buffer to NSString of hex values
	NSMutableString* output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[output appendFormat:@"%02x",md5Buffer[i]];
	}
    
	return output;
}

- (NSString *)addString:(NSString *)string every:(NSInteger)charCount {
    NSMutableString *newString = [NSMutableString string];
    int i;
    for (i=1; i<self.length/charCount; i++) {
        [newString appendString:[self substringWithRange:NSMakeRange(charCount*(i-1), charCount)]];
        [newString appendString:string];
    }
    [newString appendString:[self substringFromIndex:charCount*(i-1)]];
    return newString;
}


@end




@implementation NSString (drawing)

- (float)heightWithFont:(UIFont *)font limitByWidth:(float)width {
    if ([NSThread isMainThread]) {
        return [self sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByTruncatingTail].height;
    } else {
        float __block height = 0;
        dispatch_sync(dispatch_get_main_queue(), ^{
            height = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByTruncatingTail].height;
        });
        return height;
    }

}

- (int)totalLinesWithFont:(UIFont *)font limitByWidth:(float)width{
    NSString *tmpStr = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    int lines = 0;
    NSArray *strArray = [tmpStr componentsSeparatedByString:@"\n"];
    if ([strArray count] > 1) {
        for (NSString *str in strArray) {
            lines = lines + [str linesWithFont:font limitByWidth:width];
        }
    }else {
        lines = [self linesWithFont:font limitByWidth:width];
    }
    return lines;
}

- (int)linesWithFont:(UIFont *)font limitByWidth:(float)width {
//    int lines = ceil([self sizeWithFont:font].width/width);
//    return lines;
    float he = [self heightWithFont:font limitByWidth:width];
    int lines = ceil(he/font.singleLineHeight);
    return lines;
}

@end

@implementation NSString (OAURLEncodingAdditions)

- (NSString *)URLEncodedString 
{
    CFStringRef result = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           NULL,
																		   CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingUTF8);
    NSString *tmpResult = CFBridgingRelease(result);
	return tmpResult;
}

- (NSString*)URLDecodedString
{
	CFStringRef result = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
																						   (CFStringRef)self,
																						   CFSTR(""),
																						   kCFStringEncodingUTF8);

	NSString *tmpResult = CFBridgingRelease(result);
	return tmpResult;
}

@end

@implementation NSString (VersionCompare)

- (NSComparisonResult)versionStringCompare:(NSString *)other {
    NSArray *oneComponents = [self componentsSeparatedByString:@"."];
    NSArray *twoComponents = [other componentsSeparatedByString:@"."];
    
    //比较主版本号
    int one = [[oneComponents objectAtIndex:0] intValue];
    int two = [[twoComponents objectAtIndex:0] intValue];
    if (one < two) {
        return NSOrderedAscending;
    }else if (one > two) {
        return NSOrderedDescending;
    }
    
    //比较次版本号
    one = [[oneComponents objectAtIndex:1] intValue];
    two = [[twoComponents objectAtIndex:1] intValue];
    if (one < two) {
        return NSOrderedAscending;
    }else if (one > two) {
        return NSOrderedDescending;
    }
    
    //比较长度
    if ([oneComponents count] < [twoComponents count]) {
        return NSOrderedAscending;        
    } else if ([oneComponents count] > [twoComponents count]) {
        return NSOrderedDescending;        
    } 
    
    if (oneComponents.count == 2) {//版本号只有两位
        return NSOrderedSame;
    }else {//版本号有三位，比较第三位
        one = [[oneComponents objectAtIndex:2] intValue];
        two = [[twoComponents objectAtIndex:2] intValue];
        if (one < two) {
            return NSOrderedAscending;
        }else if (one > two) {
            return NSOrderedDescending;
        }
    }    
    return NSOrderedSame;
}

@end
