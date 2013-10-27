//
//  ActListVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-27.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "ActListVC.h"

@interface ActListVC ()

@end

@implementation ActListVC



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_actList reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DataCenter sharedDataCenter].shareActList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tmpCell = nil;
    static NSString *cellIdentifier = @"ShareActTableCell";
    DVActivity *tmpMessage = nil;
    
    tmpMessage = [[DataCenter sharedDataCenter].shareActList objectAtIndex:indexPath.row];
    
    tmpCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tmpCell) {
        tmpCell = [[ShareActTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    ((ShareActTableCell*)tmpCell).refAct = tmpMessage;
    
    return tmpCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DVActivity *tmpMessage = nil;
    tmpMessage = [[DataCenter sharedDataCenter].shareActList objectAtIndex:indexPath.row];
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ActivityDetailVC *vc = [sb instantiateViewControllerWithIdentifier:@"MessageEditVC"];
//    vc.outMessage = tmpMessage;
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
    //segueActDetail
    
}


@end

@implementation ShareActTableCell

- (void)setRefAct:(DVActivity *)refAct {
    _refAct = refAct;
    
    if (_refAct) {
        _titleLabel.text = _refAct.title;
        _timeLabel.text = _refAct.timeStr;
        _actImage.image = [UIImage imageNamed:_refAct.actImageName];
    }
}

@end
