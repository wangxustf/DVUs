//
//  DVNetwork.h
//  DVUs
//
//  Created by pan Shiyu on 13-11-11.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface DVNetwork : NSObject

+ (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSDictionary *result, NSData *responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(NSDictionary *result))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
