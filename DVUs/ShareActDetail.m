//
//  ShareActDetail.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-27.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "ShareActDetail.h"

@implementation ShareActDetail

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _titlelabel.text = [NSString stringWithFormat:@"%@ %@",_refAct.title,_refAct.timeStr];
    [_imagesList reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _refAct.actImgList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tmpCell = nil;
    static NSString *cellIdentifier = @"ShareActDetailTableCell";
    NSString* imgstr = [_refAct.actImgList objectAtIndex:indexPath.row];
    
    tmpCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tmpCell) {
        tmpCell = [[ShareActDetailTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [((ShareActDetailTableCell*)tmpCell) setImage:imgstr info:@"test"];
    
    return tmpCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end



@implementation ShareActDetailTableCell

- (void)setImage:(NSString*)imgName info:(NSString*)info {
    _imageName = imgName;
    _info = info;
    
    self.actImageView.image = [UIImage imageNamed:_imageName];
    self.infoLabel.text = info;
    
}

- (IBAction) onVote {
    _voteButton.highlighted = YES;
}

@end