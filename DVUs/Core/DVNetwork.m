//
//  DVNetwork.m
//  DVUs
//
//  Created by pan Shiyu on 13-11-11.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "DVNetwork.h"

static NSString * const AFAppDotNetAPIBaseURLString = @"https://alpha-api.app.net/";

@interface AFAppDotNetAPIClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end;



@implementation AFAppDotNetAPIClient
+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    });
    
    return _sharedClient;
}
@end

@implementation DVNetwork


+ (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSDictionary *result, NSData *responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [[AFAppDotNetAPIClient sharedClient] GET:path
                                  parameters:parameters
                                     success:^(NSURLSessionDataTask *task, id responseObject) {
                                         //做初步的验证
                                     } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                         failure(nil,error);
                                     }];
}

+ (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(NSDictionary *result))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [[AFAppDotNetAPIClient sharedClient] POST:path
                                   parameters:parameters
                                      success:^(NSURLSessionDataTask *task, id responseObject) {
                                          //做初级的验证
                                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                          failure(nil,error);
                                      }];
}

@end
