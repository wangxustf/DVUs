//
//  HomeVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-22.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "HomeVC.h"
#import "DVBaseVC.h"
#import "DataCenter.h"

@implementation HomeVC {
    float pophideTop;
    float popShowTop;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view addSubview:_popoverView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBackground)];
    [self.view addGestureRecognizer:tap];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    pophideTop = self.view.frame.size.height - 44;
    popShowTop = self.view.frame.size.height - _popoverView.frame.size.height;
    
    [self hidePopViewAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTapBackground {
    if (_popoverView.frame.origin.y == popShowTop) {
        [self hidePopViewAnimated:YES];
    }
}

- (void)showPopViewAnimated:(BOOL)animated {
    if (!animated) {
        [self setPopoverTop:popShowTop];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            [self setPopoverTop:popShowTop];
        }];
    }
}

- (void)hidePopViewAnimated:(BOOL)animated {
    if (!animated) {
        [self setPopoverTop:pophideTop];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            [self setPopoverTop:pophideTop];
        }];
    }
}

- (void)setPopoverTop:(float)top {
    CGRect popRect = _popoverView.frame;
    _popoverView.frame = CGRectMake(popRect.origin.x, top, popRect.size.width, popRect.size.height);
}

#pragma mark - 

- (IBAction)onDate {
    NSLog(@"onDate");
    [self performSegueWithIdentifier:@"sugueOnDate" sender:self];
}

- (IBAction)onShare {
    NSLog(@"onShare");
    [self performSegueWithIdentifier:@"segueOnShare" sender:self];
}

- (IBAction)onSetting {
    NSLog(@"onSetting");
//    [self performSegueWithIdentifier:@"segueOnSetting" sender:self];
    
    
}

- (IBAction)onMessageList {
    NSLog(@"onMessageList");
    [self showPopViewAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    DVBaseVC *toVC = segue.destinationViewController;
//    if ([segue.identifier isEqualToString:@"sugueOnDate"]) {
//        toVC.enableSwipeBack = YES;
//    }
}


@end

#pragma mark - 

@implementation PopView

- (void)reloadInviteList {
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DataCenter sharedDataCenter].inviteList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PopCell";
    PopCell *tmpCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tmpCell) {
        tmpCell = [[PopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    DVInvite *tmpInvite = [[DataCenter sharedDataCenter].inviteList objectAtIndex:indexPath.row];
    ((PopCell*)tmpCell).refInvite = tmpInvite;
    
    return tmpCell;
}

@end

@implementation PopCell

- (void)setRefInvite:(DVInvite *)refInvite {
    _refInvite = refInvite;
    if (_refInvite) {
        _timeLabel.text = _refInvite.timeStr;
        _infoLabel.text = _refInvite.title;
    }
}

- (IBAction)onConfirm {
    [[DataCenter sharedDataCenter].inviteList removeObject:_refInvite];
//    [((PopView*)self.superview.superview) reloadInviteList];
    NSLog(@"onConfirm");
}

- (IBAction)onDismiss {
    [[DataCenter sharedDataCenter].inviteList removeObject:_refInvite];
//    [((PopView*)self.superview.superview) reloadInviteList];
    NSLog(@"onDismiss");
}

@end
