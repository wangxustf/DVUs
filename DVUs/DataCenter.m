//
//  DataCenter.m
//  DVTest
//
//  Created by psy on 13-10-8.
//  Copyright (c) 2013年 psy. All rights reserved.
//

#import "DataCenter.h"
#import "CMCommonCategory.h"

@implementation DataCenter

+(DataCenter*)sharedDataCenter {
    static DataCenter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataCenter alloc] init];
    });
    return instance;
}

- (id) init{
    self = [super init];
    if (self) {
        _doneList = [NSMutableArray array];
        _undoList = [NSMutableArray array];
        
        ///fake data
        [_doneList addObject:[DVMessage fakeMessage:YES]];
        [_undoList addObject:[DVMessage fakeMessage:NO]];
    }
    return self;
}

@end


@implementation DVMessage

- (id)initWithTitle:(NSString*)title content:(NSString*)content time:(NSDate*)time {
    self = [super init];
    if (self) {
        _title = title;
        _content = content;
        _time = time;
        
        _timeStr = [_time yyyyMMddHHmm];
        
        _isDone = NO;
        
    }
    return self;
}

+ (id)fakeMessage:(BOOL)isDone {
    
    DVMessage *newMsg = [[DVMessage alloc] initWithTitle:@"测试标题" content:@"testContent" time:[NSDate dateWithDaysFromNow:1]];
    newMsg.isDone = isDone;
    return newMsg;
}

@end
