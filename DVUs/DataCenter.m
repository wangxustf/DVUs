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
        _friendList = [NSMutableArray array];
        _shareActList = [NSMutableArray array];
        
        ///fake data
        [_doneList addObject:[DVActivity fakeMessage:YES]];
        [_undoList addObject:[DVActivity fakeMessage:NO]];
        
        for (int i=0; i<5; i++) {
            [_shareActList addObject:[DVActivity fakeShareAct]];
        }
        
        for (int i=0; i<10; i++) {
            DVFriend *tmpFriend = [DVFriend fakeFriendRandomly];
            [_friendList addObject:tmpFriend];
        }
        
    }
    return self;
}

@end


@implementation DVActivity

- (id)initWithTitle:(NSString*)title content:(NSString*)content time:(NSDate*)time {
    self = [super init];
    if (self) {
        _title = title;
        _content = content;
        _time = time;
        _timeStr = [_time yyyyMMddHHmm];
        _friendList = [NSMutableArray array];
        
        _actImgList = [NSMutableArray array];
        
        _isDone = NO;
    }
    return self;
}

+ (id)fakeMessage:(BOOL)isDone {
    
    DVActivity *newMsg = [[DVActivity alloc] initWithTitle:@"测试标题" content:@"testContent" time:[NSDate dateWithDaysFromNow:1]];
    newMsg.isDone = isDone;
    return newMsg;
}

+ (id)emptyMessage {
    DVActivity *newMsg = [[DVActivity alloc] initWithTitle:@"" content:@"" time:[NSDate dateWithDaysFromNow:0]];
    newMsg.isDone = NO;
    return newMsg;
}

+ (id)fakeShareAct {
    DVActivity *newMsg = [[DVActivity alloc] initWithTitle:@"测试标题" content:@"testContent" time:[NSDate dateWithDaysFromNow:1]];
    
    newMsg.actImageName = [self randomImage];
    
    
    for (int i=0; i<5; i++) {
        [newMsg.actImgList addObject:[self randomImage]];
        newMsg.title = [NSString stringWithFormat:@"actTest - %d",i];
    }
    
    return newMsg;
}

+ (NSString*)randomImage {
    int index = arc4random()%3 + 1;
    return [NSString stringWithFormat:@"face%d.png",index];
}

@end

@implementation DVFriend

+ (id)fakeFriendRandomly {
    DVFriend *newFriend = [[DVFriend alloc] init];
    NSArray *names = @[@"张三",@"李四",@"王二",@"麻子"];
    NSArray *pics = @[@"face1",@"face2",@"face3"];
    
    newFriend.name = names[arc4random()%4];
    newFriend.faceImage = pics[arc4random()%3];
    return newFriend;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"Friend name : %@ | face : %@",_name,_faceImage];
}

@end
