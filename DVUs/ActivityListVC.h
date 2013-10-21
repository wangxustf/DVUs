//
//  FirstViewController.h
//  DVUs
//
//  Created by pan Shiyu on 13-9-24.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataCenter.h"

@interface ActivityListVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)IBOutlet UITableView *msgList;

- (IBAction)onAdd;


@end


#pragma mark - message cell

@interface DoneMsgTableCell : UITableViewCell
@property (nonatomic,weak)DVActivity *refMessage;
@property (nonatomic,strong)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)IBOutlet UILabel *timeLabel;


@end

@interface UndoMsgTableCell : UITableViewCell

@property (nonatomic,weak)DVActivity *refMessage;

@property (nonatomic,strong)IBOutlet UILabel *timeLabel;
@property (nonatomic,strong)IBOutlet UILabel *infoLabel;

@end
