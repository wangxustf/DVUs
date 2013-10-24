//
//  FirstViewController.h
//  DVUs
//
//  Created by pan Shiyu on 13-9-24.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataCenter.h"
#import "DVBaseVC.h"

@interface MyActivityListVC : DVBaseVC<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)IBOutlet UITableView *actList;

- (IBAction)onAdd;

@end


#pragma mark - message cell

@interface UndoActTableCell : UITableViewCell

@property (nonatomic,weak)DVActivity *refMessage;

@property (nonatomic,strong)IBOutlet UILabel *timeLabel;
@property (nonatomic,strong)IBOutlet UILabel *infoLabel;

@end
