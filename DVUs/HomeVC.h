//
//  HomeVC.h
//  DVUs
//
//  Created by pan Shiyu on 13-10-22.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVBaseVC.h"
@class PopView;
@interface HomeVC : DVBaseVC

@property (nonatomic,strong)IBOutlet UILabel *numLabel;
@property (strong, nonatomic) IBOutlet PopView *popoverView;

- (IBAction)onDate;
- (IBAction)onShare;
- (IBAction)onSetting;

- (IBAction)onMessageList;

@end


@interface PopView : UIView

@property (nonatomic,strong)IBOutlet UITableView *tableView;

@end

@interface PopCell : UITableViewCell

@property (nonatomic,strong)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)IBOutlet UILabel *timeLabel;

- (void)setTime:(NSString*)time info:(NSString*)info;

- (IBAction)onConfirm;
- (IBAction)onDismiss;

@end