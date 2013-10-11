//
//  UIDeviceAdditions.m
//  iMeituan
//
//  Created by  jian jingbao 11-8-8.
//  Copyright 2011年 Sankuai. All rights reserved.
//
// 需要引 SystemConfiguration.framework

#import "UIDeviceAdditions.h"
#include <sys/socket.h> 
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <ifaddrs.h>
#import <sys/utsname.h>
@implementation UIDevice (Hardware)

/* 因为这个方法并不是返回真的mac地址(格式不对)，只为了生成deviceID使用，所以设为Private Method
 */
+ (NSString *)macaddress
{
	int					mib[6];
	size_t				len;
	char				*buf;
	unsigned char		*ptr;
	struct if_msghdr	*ifm;
	struct sockaddr_dl	*sdl;
	
	mib[0] = CTL_NET;
	mib[1] = AF_ROUTE;
	mib[2] = 0;
	mib[3] = AF_LINK;
	mib[4] = NET_RT_IFLIST;
	
	if ((mib[5] = if_nametoindex("en0")) == 0) {
		printf("Error: if_nametoindex error\n");
		return NULL;
	}
	
	if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
		printf("Error: sysctl, take 1\n");
		return NULL;
	}
	
	if ((buf = malloc(len)) == NULL) {
		printf("Could not allocate memory. error!\n");
		return NULL;
	}
	
	if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
		printf("Error: sysctl, take 2");
        free(buf);
		return NULL;
	}
	
	ifm = (struct if_msghdr *)buf;
	sdl = (struct sockaddr_dl *)(ifm + 1);
	ptr = (unsigned char *)LLADDR(sdl);
    // 使用mac地址作为deviceID时，需要把冒号去掉，修改了原始方法
	// NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
	NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
	free(buf);
	return [outstring uppercaseString];
}

+ (NSString *)deviceID
{
    NSString *macAddress = [UIDevice macaddress];
    if (!macAddress || macAddress.length <= 0) { // 预防出错，给个默认值
        macAddress = @"unknow";
    }
        
    return macAddress;
}

+ (NSString *)networkStatus
{    
    NSString *connType = @"None";
    
    struct ifaddrs * addrs;
	const struct ifaddrs * cursor;
	
	if (!getifaddrs(&addrs)) {
		cursor = addrs;
		while (cursor != NULL) {
			// the second test keeps from picking up the loopback address
			if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0) {
				NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                NSLog(@"%@",name);
				if ([name isEqualToString:@"en0"]) {  // Wi-Fi adapter
					connType = @"WiFi";
                } else if ([name isEqualToString:@"lo0"] || [name isEqualToString:@"vmnet1"]) {
                    connType = @"None";
                } else {
                    connType = @"GPRS";
                }
                //break;
			}
			cursor = cursor->ifa_next;
		}
		freeifaddrs(addrs);
	}
	return connType;
}

+ (BOOL)isPad
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

+ (CGFloat)scale {
    if ([UIScreen instancesRespondToSelector:@selector(scale)] && [UIScreen mainScreen].scale>1.0) {
        return [UIScreen mainScreen].scale;
    }
    return 1.0f;
}

+ (BOOL)isRetina
{
    if ([UIScreen instancesRespondToSelector:@selector(scale)] && [UIScreen mainScreen].scale>1.0) {
        return YES;
    }
    return NO;
}
+ (BOOL)isSingleTask
{
	struct utsname name;
	uname(&name);
	float version = [[UIDevice currentDevice].systemVersion floatValue];//判定系统版本。
	if (version < 4.0 || strstr(name.machine, "iPod1,1") != 0 || strstr(name.machine, "iPod2,1") != 0) { 
		return YES;
	} else {
		return NO;
	}
}

+ (NSString *)modelName
{
    return [[UIDevice currentDevice].model stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

+ (NSString *)clientVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)buildVersion {
    NSString *buildNumber = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return [NSString stringWithFormat:@"%@.%@", [UIDevice clientVersion], buildNumber];
}

@end
