//
//  DataCenter.h
//  DVTest
//
//  Created by psy on 13-10-8.
//  Copyright (c) 2013年 psy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DVActivity;
@interface DataCenter : NSObject
@property (nonatomic,strong)NSMutableArray *undoList;//未做
@property (nonatomic,strong)NSMutableArray *doneList;//已经做
@property (nonatomic,strong)NSMutableArray *shareActList;//分享的活动列表
@property (nonatomic,strong)NSMutableArray *inviteList;//收到的邀请列表
@property (nonatomic,strong)NSMutableArray *friendList;

@property (nonatomic,weak)DVActivity *activeMessage;

+(DataCenter*)sharedDataCenter;

@end


#pragma mark - 数据单元

@interface DVActivity : NSObject

@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *content;
@property (nonatomic,strong)NSDate *time;
@property (nonatomic,strong)NSString *timeStr;
@property (nonatomic,assign)BOOL isDone;

@property (nonatomic,strong)NSMutableArray *friendList;

@property (nonatomic,copy)NSString *actImageName;//tmp image
@property (nonatomic,strong)NSMutableArray *actImgList; //tmp image list

- (id)initWithTitle:(NSString*)title content:(NSString*)content time:(NSDate*)time;

+ (id)fakeMessage:(BOOL)isDone;
+ (id)emptyMessage;

+ (id)fakeShareAct;

@end

@interface DVFriend : NSObject

@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *faceImage;
@property (nonatomic,strong)NSArray *strsArray;

+ (id)fakeFriendRandomly;

@end


typedef enum {
    DVInviteStatusUnread = 0, //未读
    DVInviteStatusConfirm,//确认参与
    DVInviteStatusRefuse,//拒绝
    DVInviteStatusDismiss,//忽略
}DVInviteStatus;

@interface DVInvite : NSObject

@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)NSString *timeStr;
@property (nonatomic,strong)NSDate *time;

@property (nonatomic,assign)DVInviteStatus status;

+ (id)fakeInvitation;

@end



