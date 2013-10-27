//
//  ShareActDetail.h
//  DVUs
//
//  Created by pan Shiyu on 13-10-27.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "DVBaseVC.h"
#import "DataCenter.h"

@interface ShareActDetail : DVBaseVC<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)DVActivity *refAct;
@property (nonatomic,strong)IBOutlet UITableView *imagesList;

@property (nonatomic,strong)IBOutlet UILabel *titlelabel;

@end


@interface ShareActDetailTableCell : UITableViewCell

@property (nonatomic,copy)NSString *imageName;
@property (nonatomic,copy)NSString *info;

@property (nonatomic,strong)IBOutlet UIButton *voteButton;
@property (nonatomic,strong)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)IBOutlet UIImageView *actImageView;

- (void)setImage:(NSString*)imgName info:(NSString*)info;
- (IBAction) onVote;

@end