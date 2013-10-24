//
//  HomeVC.h
//  DVUs
//
//  Created by pan Shiyu on 13-10-22.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVBaseVC.h"
@interface HomeVC : DVBaseVC

@property (nonatomic,strong)IBOutlet UILabel *numLabel;

- (IBAction)onDate;
- (IBAction)onShare;
- (IBAction)onSetting;

- (IBAction)onMessageList;

@end
