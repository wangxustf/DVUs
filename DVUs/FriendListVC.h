//
//  SecondViewController.h
//  DVUs
//
//  Created by pan Shiyu on 13-9-24.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataCenter.h"

@interface FriendListVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)IBOutlet UITableView *friendList;

@property (nonatomic,assign) BOOL isModeAddFriend;

@property (nonatomic,strong)DVMessage *refMessage;

@end


@interface FriendTableCell : UITableViewCell

@property (nonatomic,weak)DVFriend *refFriend;
@property (nonatomic,strong)IBOutlet UILabel *nameLabel;
@property (nonatomic,strong)IBOutlet UIImageView *faceImageview;

@end