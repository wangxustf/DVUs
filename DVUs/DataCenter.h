//
//  DataCenter.h
//  DVTest
//
//  Created by psy on 13-10-8.
//  Copyright (c) 2013年 psy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DVMessage;
@interface DataCenter : NSObject
@property (nonatomic,strong)NSMutableArray *undoList;
@property (nonatomic,strong)NSMutableArray *doneList;

@property (nonatomic,strong)NSMutableArray *friendList;

@property (nonatomic,weak)DVMessage *activeMessage;

+(DataCenter*)sharedDataCenter;

@end


#pragma mark - 数据单元

@interface DVMessage : NSObject

@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *content;
@property (nonatomic,strong)NSDate *time;
@property (nonatomic,strong)NSString *timeStr;
@property (nonatomic,assign)BOOL isDone;

@property (nonatomic,strong)NSMutableArray *friendList;

- (id)initWithTitle:(NSString*)title content:(NSString*)content time:(NSDate*)time;

+ (id)fakeMessage:(BOOL)isDone;
+ (id)emptyMessage;
@end


@interface DVFriend : NSObject

@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *faceImage;
@property (nonatomic,strong)NSArray *strsArray;

+ (id)fakeFriendRandomly;

@end
