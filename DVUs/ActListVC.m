//
//  ActListVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-27.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "ActListVC.h"
#import "ShareActDetail.h"

@interface ActListVC ()

@end

@implementation ActListVC {
    DVActivity *_actWillSent;
}



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
    _actWillSent = [[DataCenter sharedDataCenter].shareActList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"segueOnShareActDetail" sender:self];
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ShareActDetail *vc = [sb instantiateViewControllerWithIdentifier:@"ShareActDetail"];
//    vc.outMessage = tmpMessage;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DVBaseVC *toVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"segueOnShareActDetail"]) {
        ShareActDetail *vvvc = (ShareActDetail*)toVC;
        vvvc.refAct = _actWillSent;
    }
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
