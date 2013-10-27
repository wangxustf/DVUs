//
//  ActListVC.h
//  DVUs
//
//  Created by pan Shiyu on 13-10-27.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "DVBaseVC.h"
#import "DataCenter.h"
@interface ActListVC : DVBaseVC<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)IBOutlet UITableView *actList;


@end

@interface ShareActTableCell : UITableViewCell

@property (nonatomic,weak)DVActivity *refAct;
@property (nonatomic,strong)IBOutlet UIImageView *actImage;
@property (nonatomic,strong)IBOutlet UILabel *timeLabel;
@property (nonatomic,strong)IBOutlet UILabel *titleLabel;

@end
